from flask import Flask, jsonify, request
from flask_cors import CORS
import pymysql
import json

app = Flask(__name__)
CORS(app)

DB_HOST = "localhost"
DB_USER = "root"
DB_PASSWORD = "21aucs017"
DB_NAME = "tourist_mgmt"

def get_db_connection():
    return pymysql.connect(host=DB_HOST, user=DB_USER, password=DB_PASSWORD, database=DB_NAME, cursorclass=pymysql.cursors.DictCursor)

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

        cursor.execute("SELECT id FROM user WHERE username = %s AND password = %s", (username, password))
        user = cursor.fetchone()

        cursor.close()
        conn.close()

        if user:
            return jsonify({"message": "Login successful"}), 200
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




if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000, debug=True)
