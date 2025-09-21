from flask import Flask, jsonify, request
from flask_cors import CORS
import pymysql
import json

app = Flask(__name__)
CORS(app)

DB_HOST = "localhost"
DB_USER = "root"
DB_PASSWORD = ""
DB_NAME = "tourist_mgmt"

def get_db_connection():
    return pymysql.connect(
        host=DB_HOST, 
        user=DB_USER, 
        password=DB_PASSWORD,
        database=DB_NAME, 
        cursorclass=pymysql.cursors.DictCursor
    )

@app.route("/districts", methods=["GET"])
def get_districts():
    conn = get_db_connection()
    cursor = conn.cursor()
    query = "SELECT name, image_url FROM districts"
    cursor.execute(query)
    districts = cursor.fetchall()
    cursor.close()
    conn.close()
    return jsonify(districts)

@app.route("/login", methods=["POST"])
def login():
    try:
        data = request.get_json()
        username = data.get("username", "").strip()
        password = data.get("password", "").strip()

        if not username or not password:
            return jsonify({"error": "Username and password are required"}), 400

        conn = get_db_connection()
        cursor = conn.cursor()
        cursor.execute("SELECT id, user_type FROM user WHERE username = %s AND password = %s", (username, password))
        user = cursor.fetchone()
        cursor.close()
        conn.close()

        if user:
            return jsonify({"message": "Login successful", "user_id": user["id"], "user_type": user["user_type"]}), 200
        else:
            return jsonify({"error": "Invalid username or password"}), 401

    except Exception as e:
        return jsonify({"error": str(e)}), 500

@app.route("/spots", methods=["GET"])
def get_spots():
    conn = get_db_connection()
    cursor = conn.cursor()
    query = "SELECT district, spots_json FROM spots"
    cursor.execute(query)
    spots = cursor.fetchall()
    cursor.close()
    conn.close()

    formatted_spots = {spot['district']: json.loads(spot['spots_json']) for spot in spots}
    return jsonify(formatted_spots)

@app.route("/drivers", methods=["GET"])
def get_drivers():
    district = request.args.get("district", "")
    if not district:
        return jsonify({"error": "District parameter is required"}), 400

    conn = get_db_connection()
    cursor = conn.cursor()
    query = "SELECT id, name, phone, taxi_number FROM drivers WHERE district = %s AND is_available = 1"
    cursor.execute(query, (district,))
    drivers = cursor.fetchall()
    cursor.close()
    conn.close()
    return jsonify(drivers)

@app.route("/book_taxi", methods=["POST"])
def book_taxi():
    try:
        data = request.get_json()
        user_id = data.get("user_id")
        driver_id = data.get("driver_id")
        pickup = data.get("pickup_location")
        destination = data.get("destination")
        booking_time = data.get("booking_time")  # ISO8601 string expected

        if not all([user_id, driver_id, pickup, destination, booking_time]):
            return jsonify({"error": "Missing booking information"}), 400

        conn = get_db_connection()
        cursor = conn.cursor()

        try:
            conn.begin()  # start transaction

            cursor.execute("""
                INSERT INTO bookings (user_id, driver_id, pickup_location, destination, booking_time, status)
                VALUES (%s, %s, %s, %s, %s, %s)
            """, (user_id, driver_id, pickup, destination, booking_time, "booked"))

            cursor.execute("UPDATE drivers SET is_available = 0 WHERE id = %s", (driver_id,))

            conn.commit()
        except Exception as e:
            conn.rollback()
            raise e

        cursor.close()
        conn.close()

        return jsonify({"message": "Taxi booking successful"}), 201

    except Exception as e:
        return jsonify({"error": str(e)}), 500


#### Admin APIs - Full CRUD ####

# Users
@app.route("/admin/users", methods=["GET"])
def get_all_users():
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("SELECT id, username, user_type FROM user")
    users = cursor.fetchall()
    cursor.close()
    conn.close()
    return jsonify(users)

@app.route("/admin/users", methods=["POST"])
def add_user():
    try:
        data = request.get_json()
        username = data.get("username", "").strip()
        user_type = data.get("user_type", "").strip()
        password = data.get("password", "").strip()


        if not username or not user_type or not password:
            return jsonify({"error": "Username and user_type and password are required"}), 400

        conn = get_db_connection()
        cursor = conn.cursor()
        cursor.execute("INSERT INTO user (username, user_type, password) VALUES (%s, %s, %s)", (username, user_type, password))
        conn.commit()
        user_id = cursor.lastrowid
        cursor.close()
        conn.close()
        return jsonify({"message": "User added", "id": user_id}), 201
    except Exception as e:
        return jsonify({"error": str(e)}), 500

@app.route("/admin/users/<int:user_id>", methods=["PUT"])
def update_user(user_id):
    try:
        data = request.get_json()
        username = data.get("username", "").strip()
        user_type = data.get("user_type", "").strip()

        if not username or not user_type:
            return jsonify({"error": "Username and user_type are required"}), 400

        conn = get_db_connection()
        cursor = conn.cursor()
        cursor.execute("UPDATE user SET username = %s, user_type = %s WHERE id = %s", (username, user_type, user_id))
        conn.commit()
        cursor.close()
        conn.close()
        return jsonify({"message": "User updated"}), 200
    except Exception as e:
        return jsonify({"error": str(e)}), 500

@app.route("/admin/users/<int:user_id>", methods=["DELETE"])
def delete_user(user_id):
    try:
        conn = get_db_connection()
        cursor = conn.cursor()
        cursor.execute("DELETE FROM user WHERE id = %s", (user_id,))
        conn.commit()
        cursor.close()
        conn.close()
        return jsonify({"message": "User deleted"}), 200
    except Exception as e:
        return jsonify({"error": str(e)}), 500

# Drivers
@app.route("/admin/drivers", methods=["GET"])
def get_all_drivers():
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("SELECT id, name, phone, taxi_number, district, is_available FROM drivers")
    drivers = cursor.fetchall()
    cursor.close()
    conn.close()
    return jsonify(drivers)

@app.route("/admin/drivers", methods=["POST"])
def add_driver():
    try:
        data = request.get_json()
        user_id = data.get("user_id")
        name = data.get("name", "").strip()
        phone = data.get("phone", "").strip()
        taxi_number = data.get("taxi_number", "").strip()
        district = data.get("district", "").strip()
        is_available = data.get("is_available", 1)

        if not user_id:
            return jsonify({"error": "User ID is required"}), 400
        if not name or not phone or not district:
            return jsonify({"error": "Name, phone, and district are required"}), 400

        conn = get_db_connection()
        cursor = conn.cursor()
        cursor.execute(
            "INSERT INTO drivers (user_id, name, phone, taxi_number, district, is_available) VALUES (%s, %s, %s, %s, %s, %s)",
            (user_id, name, phone, taxi_number, district, is_available)
        )
        conn.commit()
        driver_id = cursor.lastrowid
        cursor.close()
        conn.close()
        return jsonify({"message": "Driver added", "id": driver_id}), 201
    except Exception as e:
        return jsonify({"error": str(e)}), 500


@app.route("/admin/drivers/<int:driver_id>", methods=["PUT"])
def update_driver(driver_id):
    try:
        data = request.get_json()
        name = data.get("name", "").strip()
        phone = data.get("phone", "").strip()
        taxi_number = data.get("taxi_number", "").strip()
        district = data.get("district", "").strip()
        is_available = data.get("is_available", 1)

        if not name or not phone or not district:
            return jsonify({"error": "Name, phone, and district are required"}), 400

        conn = get_db_connection()
        cursor = conn.cursor()
        cursor.execute(
            "UPDATE drivers SET name=%s, phone=%s, taxi_number=%s, district=%s, is_available=%s WHERE id=%s",
            (name, phone, taxi_number, district, is_available, driver_id)
        )
        conn.commit()
        cursor.close()
        conn.close()
        return jsonify({"message": "Driver updated"}), 200
    except Exception as e:
        return jsonify({"error": str(e)}), 500

@app.route("/admin/drivers/<int:driver_id>", methods=["DELETE"])
def delete_driver(driver_id):
    try:
        conn = get_db_connection()
        cursor = conn.cursor()
        cursor.execute("DELETE FROM drivers WHERE id = %s", (driver_id,))
        conn.commit()
        cursor.close()
        conn.close()
        return jsonify({"message": "Driver deleted"}), 200
    except Exception as e:
        return jsonify({"error": str(e)}), 500

# Bookings
@app.route("/admin/bookings", methods=["GET"])
def get_all_bookings():
    conn = get_db_connection()
    cursor = conn.cursor()
    query = """
        SELECT b.id, b.user_id, u.username, b.driver_id, d.name AS driver_name,
               d.phone AS driver_phone, d.taxi_number, b.pickup_location,
               b.destination, b.booking_time, b.status
        FROM bookings b
        LEFT JOIN user u ON b.user_id = u.id
        LEFT JOIN drivers d ON b.driver_id = d.id
        ORDER BY b.booking_time DESC
    """
    cursor.execute(query)
    bookings = cursor.fetchall()
    cursor.close()
    conn.close()
    return jsonify(bookings)


@app.route("/admin/bookings", methods=["POST"])
def add_booking():
    try:
        data = request.get_json()
        user_id = data.get("user_id")
        driver_id = data.get("driver_id")
        pickup_location = data.get("pickup_location")
        destination = data.get("destination")
        booking_time = data.get("booking_time")

        if not all([user_id, driver_id, pickup_location, destination, booking_time]):
            return jsonify({"error": "Missing booking information"}), 400

        conn = get_db_connection()
        cursor = conn.cursor()

        try:
            conn.begin()
            cursor.execute(
                "INSERT INTO bookings (user_id, driver_id, pickup_location, destination, booking_time) VALUES (%s,%s,%s,%s,%s)",
                (user_id, driver_id, pickup_location, destination, booking_time)
            )
            cursor.execute("UPDATE drivers SET is_available = 0 WHERE id = %s", (driver_id,))
            conn.commit()
            booking_id = cursor.lastrowid
        except Exception as e:
            conn.rollback()
            cursor.close()
            conn.close()
            raise e

        cursor.close()
        conn.close()
        return jsonify({"message": "Booking added", "id": booking_id}), 201
    except Exception as e:
        return jsonify({"error": str(e)}), 500

@app.route("/admin/bookings/<int:booking_id>", methods=["PUT"])
def update_booking(booking_id):
    try:
        data = request.get_json()
        user_id = data.get("user_id")
        driver_id = data.get("driver_id")
        pickup_location = data.get("pickup_location")
        destination = data.get("destination")
        booking_time = data.get("booking_time")

        if not all([user_id, driver_id, pickup_location, destination, booking_time]):
            return jsonify({"error": "Missing booking information"}), 400

        conn = get_db_connection()
        cursor = conn.cursor()
        cursor.execute(
            "UPDATE bookings SET user_id=%s, driver_id=%s, pickup_location=%s, destination=%s, booking_time=%s WHERE id=%s",
            (user_id, driver_id, pickup_location, destination, booking_time, booking_id)
        )
        conn.commit()
        cursor.close()
        conn.close()
        return jsonify({"message": "Booking updated"}), 200
    except Exception as e:
        return jsonify({"error": str(e)}), 500

@app.route("/admin/bookings/<int:booking_id>", methods=["DELETE"])
def delete_booking(booking_id):
    try:
        conn = get_db_connection()
        cursor = conn.cursor()
        cursor.execute("DELETE FROM bookings WHERE id = %s", (booking_id,))
        conn.commit()
        cursor.close()
        conn.close()
        return jsonify({"message": "Booking deleted"}), 200
    except Exception as e:
        return jsonify({"error": str(e)}), 500
    
@app.route("/bookings", methods=["GET"])
def get_bookings_by_user():
    user_id = request.args.get("user_id")
    if not user_id:
        return jsonify({"error": "user_id query parameter is required"}), 400

    try:
        conn = get_db_connection()
        cursor = conn.cursor()
        query = """
            SELECT b.id, b.user_id, b.driver_id, b.pickup_location, b.destination,b.status, b.booking_time,
                   d.name AS driver_name, d.phone AS driver_phone, d.taxi_number 
            FROM bookings b
            LEFT JOIN drivers d ON b.driver_id = d.id
            WHERE b.user_id = %s
            ORDER BY b.booking_time DESC
        """
        cursor.execute(query, (user_id,))
        bookings = cursor.fetchall()
        cursor.close()
        conn.close()
        return jsonify(bookings), 200
    except Exception as e:
        return jsonify({"error": str(e)}), 500
    

@app.route("/bookings_drivers", methods=["GET"])
def get_bookings_by_driver():
    user_id = request.args.get("driver_id")
    if not user_id:
        return jsonify({"error": "driver_id query parameter is required"}), 400

    try:
        conn = get_db_connection()
        cursor = conn.cursor()

        # Find the driver id from the drivers table using user_id
        cursor.execute("SELECT id FROM drivers WHERE user_id = %s", (user_id,))
        result = cursor.fetchone()
        if not result:
            cursor.close()
            conn.close()
            return jsonify({"error": "No driver found for given user_id"}), 404

        driver_db_id = result['id']

        # Fetch bookings for the driver db id
        query = """
            SELECT b.id, b.user_id, u.username, b.driver_id, d.name AS driver_name,
                   d.phone AS driver_phone, d.taxi_number, b.pickup_location,
                   b.destination, b.booking_time, b.status
            FROM bookings b
            LEFT JOIN user u ON b.user_id = u.id
            LEFT JOIN drivers d ON b.driver_id = d.id
            WHERE b.driver_id = %s
            ORDER BY b.booking_time DESC
        """

        cursor.execute(query, (driver_db_id,))
        bookings = cursor.fetchall()

        cursor.close()
        conn.close()

        return jsonify(bookings), 200

    except Exception as e:
        return jsonify({"error": str(e)}), 500

@app.route('/admin/bookings/<int:booking_id>/complete', methods=['POST'])
def complete_booking(booking_id):
    try:
        conn = get_db_connection()
        cursor = conn.cursor()
        cursor.execute("UPDATE bookings SET status = 'completed' WHERE id = %s", (booking_id,))
        conn.commit()
        cursor.close()
        conn.close()
        return jsonify({"message": "Booking marked as completed"}), 200
    except Exception as e:
        return jsonify({"error": str(e)}), 500




if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000, debug=True)
