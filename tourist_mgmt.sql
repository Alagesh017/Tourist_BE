-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 21, 2025 at 07:16 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tourist_mgmt`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `driver_id` int(11) DEFAULT NULL,
  `pickup_location` varchar(255) DEFAULT NULL,
  `destination` varchar(255) DEFAULT NULL,
  `booking_time` datetime DEFAULT NULL,
  `status` varchar(20) DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`id`, `user_id`, `driver_id`, `pickup_location`, `destination`, `booking_time`, `status`) VALUES
(1, 5, 7, 'Place1', 'Place2', '2025-09-22 19:31:00', 'booked'),
(2, 5, 7, 'Place 1', 'Place 2', '2025-09-21 18:40:00', 'booked');

-- --------------------------------------------------------

--
-- Table structure for table `districts`
--

CREATE TABLE `districts` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `image_url` varchar(400) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `districts`
--

INSERT INTO `districts` (`id`, `name`, `image_url`) VALUES
(1, 'Chennai', 'assets/chennai.png'),
(2, 'Coimbatore', 'assets/coimbatore.png'),
(3, 'Madurai', 'assets/madurai.png'),
(4, 'Tiruchirappalli', 'assets/thiru.png'),
(5, 'Salem', 'assets/salem.png'),
(6, 'Tenkasi', 'assets/thenkasi.png'),
(7, 'Theni', 'assets/theni.png'),
(8, 'Virudhunagar', 'assets/vnr.png');

-- --------------------------------------------------------

--
-- Table structure for table `drivers`
--

CREATE TABLE `drivers` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `taxi_number` varchar(20) NOT NULL,
  `district` varchar(100) DEFAULT NULL,
  `is_available` tinyint(1) DEFAULT 1,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `drivers`
--

INSERT INTO `drivers` (`id`, `name`, `phone`, `taxi_number`, `district`, `is_available`, `user_id`) VALUES
(1, 'Rajesh Kumars', '9840012345', 'TN-01-AB-1234', 'Chennai', 1, 9),
(2, 'Suresh Reddy', '9840012346', 'TN-01-AB-1235', 'Chennai', 1, 10),
(3, 'Vijay Gandhi', '9840012347', 'TN-01-AB-1236', 'Chennai', 1, 11),
(4, 'Karthik Subramanian', '9840012348', 'TN-01-AB-1237', 'Chennai', 1, 12),
(5, 'Arun Prakash', '9840012349', 'TN-01-AB-1238', 'Chennai', 1, 13),
(6, 'Ramesh Iyer', '9780011122', 'TN-02-CD-5678', 'Coimbatore', 1, 14),
(7, 'Mani Shankar', '9780011123', 'TN-02-CD-5679', 'Coimbatore', 0, 15),
(8, 'Hari Krishna', '9780011124', 'TN-02-CD-5680', 'Coimbatore', 1, 16),
(9, 'Prakash Raju', '9780011125', 'TN-02-CD-5681', 'Coimbatore', 0, 17),
(10, 'Sundar Raj', '9780011126', 'TN-02-CD-5682', 'Coimbatore', 1, 18),
(11, 'Deepak Rajan', '9760019988', 'TN-03-EF-2345', 'Madurai', 1, 19),
(12, 'Murugan Nair', '9760019989', 'TN-03-EF-2346', 'Madurai', 1, 20),
(13, 'Anand Balan', '9760019990', 'TN-03-EF-2347', 'Madurai', 1, 21),
(14, 'Senthil Kumar', '9760019991', 'TN-03-EF-2348', 'Madurai', 1, 22),
(15, 'Venkatesh Yadav', '9760019992', 'TN-03-EF-2349', 'Madurai', 1, 23),
(16, 'Balaji Narayanan', '9750012233', 'TN-04-GH-9876', 'Tiruchirappalli', 1, 24),
(17, 'Govindasamy Rao', '9750012234', 'TN-04-GH-9877', 'Tiruchirappalli', 1, 25),
(18, 'Kumaravel Raj', '9750012235', 'TN-04-GH-9878', 'Tiruchirappalli', 1, 26),
(19, 'Sathish Iyer', '9750012236', 'TN-04-GH-9879', 'Tiruchirappalli', 1, 27),
(20, 'Jayaprakash Selvan', '9750012237', 'TN-04-GH-9880', 'Tiruchirappalli', 1, 28),
(21, 'Rajendran Pillai', '9730013344', 'TN-05-IJ-4321', 'Salem', 1, 29),
(22, 'Muthukumar Reddy', '9730013345', 'TN-05-IJ-4322', 'Salem', 1, 30),
(23, 'Gopalakrishnan Nair', '9730013346', 'TN-05-IJ-4323', 'Salem', 1, 31),
(24, 'Vijayan Mani', '9730013347', 'TN-05-IJ-4324', 'Salem', 1, 32),
(25, 'Ragavan Kumar', '9730013348', 'TN-05-IJ-4325', 'Salem', 1, 33),
(26, 'Aravindh Subramanium', '9720014455', 'TN-06-KL-1357', 'Tenkasi', 1, NULL),
(27, 'Kannan Ram', '9720014456', 'TN-06-KL-1358', 'Tenkasi', 1, NULL),
(28, 'Sekar Mohan', '9720014457', 'TN-06-KL-1359', 'Tenkasi', 1, NULL),
(29, 'Vadivel Rajan', '9720014458', 'TN-06-KL-1360', 'Tenkasi', 1, NULL),
(30, 'Praveen Narayan', '9720014459', 'TN-06-KL-1361', 'Tenkasi', 1, NULL),
(31, 'Ashok Veerasamy', '9710015566', 'TN-07-MN-9753', 'Theni', 1, NULL),
(32, 'Shankar Iyer', '9710015567', 'TN-07-MN-9754', 'Theni', 1, NULL),
(33, 'Rajkumar Sundar', '9710015568', 'TN-07-MN-9755', 'Theni', 1, NULL),
(34, 'Balu Narayanan', '9710015569', 'TN-07-MN-9756', 'Theni', 1, NULL),
(35, 'Vimal Kumar', '9710015570', 'TN-07-MN-9757', 'Theni', 1, NULL),
(36, 'Krishna Venkat', '9700016677', 'TN-08-OP-8642', 'Virudhunagar', 1, NULL),
(37, 'Selvam Rajan', '9700016678', 'TN-08-OP-8643', 'Virudhunagar', 1, NULL),
(38, 'Sathya Narayanan', '9700016679', 'TN-08-OP-8644', 'Virudhunagar', 1, NULL),
(39, 'Prakash Kumar', '9700016680', 'TN-08-OP-8645', 'Virudhunagar', 1, NULL),
(40, 'Manoj Reddy', '9700016681', 'TN-08-OP-8646', 'Virudhunagar', 1, NULL),
(44, 'Sathiya', '6381854728', 'TN 67 9999', 'Chennai', 1, 35);

-- --------------------------------------------------------

--
-- Table structure for table `spots`
--

CREATE TABLE `spots` (
  `id` int(11) NOT NULL,
  `district` varchar(45) DEFAULT NULL,
  `spots_json` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`spots_json`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `spots`
--

INSERT INTO `spots` (`id`, `district`, `spots_json`) VALUES
(1, 'Chennai', '[{\"name\": \"Marina Beach\", \"image\": \"assets/marina.png\", \"mapUrl\": \"Marina Beach, Chennai\", \"description\": \"One of the longest urban beaches in the world, famous for its sunrises and bustling atmosphere.\"}, {\"name\": \"Kapaleeshwarar Temple\", \"image\": \"assets/kapaleeswarar.png\", \"mapUrl\": \"Kapaleeshwarar Temple, Chennai\", \"description\": \"A historic Dravidian-style temple dedicated to Lord Shiva, known for its intricate sculptures.\"}, {\"name\": \"Fort St. George\", \"image\": \"assets/fort.png\", \"mapUrl\": \"Fort St. George, Chennai\", \"description\": \"Built by the British in 1644, this fort houses a museum showcasing colonial artifacts.\"}, {\"name\": \"Santhome Basilica\", \"image\": \"assets/santhome.png\", \"mapUrl\": \"Santhome Basilica, Chennai\", \"description\": \"A beautiful neo-Gothic church built over the tomb of St. Thomas, one of Jesus apostles.\"}, {\"name\": \"Guindy National Park\", \"image\": \"assets/marudhamalai.png\", \"mapUrl\": \"Guindy National Park, Chennai\", \"description\": \"One of the few national parks within a city, home to deer, blackbucks, and various bird species.\"}]'),
(2, 'Coimbatore', '[{\"name\": \"Marudhamalai Temple\", \"image\": \"assets/marudhamalai.png\", \"mapUrl\": \"Marudhamalai Temple, Coimbatore\", \"description\": \"A famous hilltop temple dedicated to Lord Murugan, offering a serene atmosphere and panoramic views.\"}, {\"name\": \"VOC Park & Zoo\", \"image\": \"assets/voc.png\", \"mapUrl\": \"VOC Park & Zoo, Coimbatore\", \"description\": \"A popular park and zoo in the heart of Coimbatore, great for family outings and picnics.\"}, {\"name\": \"Dhyanalinga Temple\", \"image\": \"assets/dhyanalinga.png\", \"mapUrl\": \"Dhyanalinga Temple, Coimbatore\", \"description\": \"A unique meditation center and spiritual space created by Sadhguru, known for its tranquil ambiance.\"}, {\"name\": \"Siruvani Waterfalls\", \"image\": \"assets/siruvani.png\", \"mapUrl\": \"Siruvani Waterfalls, Coimbatore\", \"description\": \"A scenic waterfall located near the Siruvani Hills, famous for its crystal-clear water and lush surroundings.\"}, {\"name\": \"Gass Forest Museum\", \"image\": \"assets/gass.png\", \"mapUrl\": \"Gass Forest Museum, Coimbatore\", \"description\": \"A unique museum showcasing forest-related artifacts, wildlife specimens, and ecological exhibits.\"}]'),
(3, 'Madurai', '[{\"name\": \"Meenakshi Amman Temple\", \"image\": \"assets/meenakshi.png\", \"mapUrl\": \"Meenakshi Amman Temple, Madurai\", \"description\": \"One of the most famous temples in India, dedicated to Goddess Meenakshi and Lord Sundareswarar, known for its stunning Dravidian architecture.\"}, {\"name\": \"Thirumalai Nayakkar Mahal\", \"image\": \"assets/thiru.png\", \"mapUrl\": \"Thirumalai Nayakkar Mahal, Madurai\", \"description\": \"A 17th-century palace built by King Thirumalai Nayak, showcasing Indo-Saracenic architecture and grand interiors.\"}, {\"name\": \"Gandhi Memorial Museum\", \"image\": \"assets/gandhi.png\", \"mapUrl\": \"Gandhi Memorial Museum, Madurai\", \"description\": \"A museum dedicated to Mahatma Gandhi, featuring historical artifacts, letters, and exhibitions on Indias freedom struggle.\"}, {\"name\": \"Alagar Kovil\", \"image\": \"assets/alagar.png\", \"mapUrl\": \"Alagar Kovil, Madurai\", \"description\": \"A beautiful hilltop temple dedicated to Lord Vishnu, surrounded by lush greenery and scenic views.\"}, {\"name\": \"Vaigai Dam\", \"image\": \"assets/vaigai.png\", \"mapUrl\": \"Vaigai Dam, Madurai\", \"description\": \"A massive dam built across the Vaigai River, serving as a vital water source and a picturesque picnic spot.\"}]'),
(4, 'Tiruchirappalli', '[{\"name\": \"Rockfort Temple\", \"image\": \"assets/rock.png\", \"mapUrl\": \"Rockfort Temple, Tiruchirappalli\", \"description\": \"A historic temple complex perched atop a massive rock, offering breathtaking views of Trichy and featuring ancient Hindu shrines.\"}, {\"name\": \"Sri Ranganathaswamy Temple\", \"image\": \"assets/sriranga.png\", \"mapUrl\": \"Sri Ranganathaswamy Temple, Tiruchirappalli\", \"description\": \"One of the largest functioning Hindu temples, dedicated to Lord Vishnu, known for its magnificent architecture and religious significance.\"}, {\"name\": \"Kallanai Dam\", \"image\": \"assets/kallanai.png\", \"mapUrl\": \"Kallanai Dam, Tiruchirappalli\", \"description\": \"An ancient dam built by the Chola dynasty over the Kaveri River, still in use today for irrigation purposes.\"}, {\"name\": \"St. Joseph Church\", \"image\": \"assets/st.png\", \"mapUrl\": \"St. Joseph Church, Tiruchirappalli\", \"description\": \"A beautiful colonial-era church known for its European-style architecture and serene ambiance.\"}, {\"name\": \"Butterfly Park\", \"image\": \"assets/butterfly.png\", \"mapUrl\": \"Butterfly Park, Tiruchirappalli\", \"description\": \"A scenic park home to numerous species of butterflies, offering a relaxing nature experience with lush greenery and vibrant flowers.\"}]'),
(5, 'Salem', '[{\"name\": \"Yercaud Hills\", \"image\": \"assets/yercaud.png\", \"mapUrl\": \"Yercaud Hills, Salem\", \"description\": \"A picturesque hill station known for its coffee plantations, scenic views, and pleasant climate, perfect for a relaxing getaway.\"}, {\"name\": \"Kottai Mariamman Temple\", \"image\": \"assets/kotta.png\", \"mapUrl\": \"Kottai Mariamman Temple, Salem\", \"description\": \"A historic temple dedicated to Goddess Mariamman, known for its grand architecture and annual festival that attracts thousands of devotees.\"}, {\"name\": \"Mettur Dam\", \"image\": \"assets/mettur.png\", \"mapUrl\": \"Mettur Dam, Salem\", \"description\": \"One of the largest dams in India, built across the Kaveri River, offering breathtaking views and serving as a major irrigation source.\"}, {\"name\": \"1008 Lingam Temple\", \"image\": \"assets/1008.png\", \"mapUrl\": \"1008 Lingam Temple, Salem\", \"description\": \"A unique Shiva temple featuring 1008 lingams arranged beautifully across a hill, attracting devotees and spiritual seekers.\"}, {\"name\": \"Poiman Karadu\", \"image\": \"assets/poiman.png\", \"mapUrl\": \"Poiman Karadu, Salem\", \"description\": \"A scenic viewpoint known for its illusionary rock formations resembling a deer, offering a perfect spot for photography and relaxation.\"}]'),
(6, 'Tenkasi', '[{\"name\": \"Coutrallam Falls\", \"image\": \"assets/cutralam.png\", \"mapUrl\": \"Coutrallam Falls, Tenkasi\", \"description\": \"Also known as Spa of South India, these waterfalls are famous for their therapeutic benefits and scenic beauty.\"}, {\"name\": \"Sivasailam Temple\", \"image\": \"assets/siva.png\", \"mapUrl\": \"Sivasailam Temple, Tenkasi\", \"description\": \"An ancient temple dedicated to Lord Shiva, surrounded by lush greenery and known for its peaceful atmosphere.\"}, {\"name\": \"Thirumalai Kovil\", \"image\": \"assets/thirumalai1.png\", \"mapUrl\": \"Thirumalai Kovil, Tenkasi\", \"description\": \"A Murugan temple situated on a hilltop, offering breathtaking views of the surrounding landscape and a spiritual retreat.\"}, {\"name\": \"Aintharuvi Waterfalls\", \"image\": \"assets/5falls.png\", \"mapUrl\": \"Aintharuvi Waterfalls, Tenkasi\", \"description\": \"A stunning set of five waterfalls flowing down rocky terrains, perfect for a refreshing dip and scenic nature views.\"}, {\"name\": \"Papanasam Dam\", \"image\": \"assets/papanasam.png\", \"mapUrl\": \"Papanasam Dam, Tenkasi\", \"description\": \"A massive dam built across the Thamirabarani River, known for its scenic reservoir and boating activities.\"}]'),
(7, 'Theni', '[{\"name\": \"Meghamalai\", \"image\": \"assets/megamalai.jpeg\", \"mapUrl\": \"Meghamalai, Theni\", \"description\": \"Also known as the High Wavy Mountains, this serene hill station is covered with tea plantations, rich wildlife, and misty landscapes.\"}, {\"name\": \"Suruli Falls\", \"image\": \"assets/suruli.png\", \"mapUrl\": \"Suruli Falls, Theni\", \"description\": \"A picturesque 2-stage waterfall located in the dense forest area, famous for its medicinal water properties.\"}, {\"name\": \"Thekkady\", \"image\": \"assets/thekadi.png\", \"mapUrl\": \"Thekkady, Theni\", \"description\": \"A nature lover’s paradise, Thekkady is home to Periyar Wildlife Sanctuary, famous for its rich biodiversity and boating in Periyar Lake.\"}, {\"name\": \"Vaigai Dam\", \"image\": \"assets/vaigai.png\", \"mapUrl\": \"Vaigai Dam, Theni\", \"description\": \"A massive dam built across the Vaigai River, offering scenic views, lush gardens, and picnic spots.\"}, {\"name\": \"Bodi Mettu\", \"image\": \"assets/vaigai.png\", \"mapUrl\": \"Bodi Mettu, Theni\", \"description\": \"A beautiful hill station at the Tamil Nadu-Kerala border, providing panoramic views, trekking trails, and a cool climate.\"}]'),
(8, 'Virudhunagar', '[{\"name\": \"Ayyanar Falls\", \"image\": \"assets/ayyanar.png\", \"mapUrl\": \"Ayyanar Falls, Virudhunagar\", \"description\": \"A serene waterfall located in the Western Ghats, offering breathtaking views and a refreshing natural pool for visitors.\"}, {\"name\": \"Sathuragiri Hills\", \"image\": \"assets/sathuragiri.png\", \"mapUrl\": \"Sathuragiri Hills, Virudhunagar\", \"description\": \"A sacred hill known for its spiritual significance and trekking trails, home to the famous Sundara Mahalingam Temple.\"}, {\"name\": \"Pilavakkal Dam\", \"image\": \"assets/plovakal.png\", \"mapUrl\": \"Pilavakkal Dam, Virudhunagar\", \"description\": \"A scenic reservoir providing water to nearby areas, featuring lush green surroundings and a peaceful atmosphere.\"}, {\"name\": \"Srivilliputhur Andal Temple\", \"image\": \"assets/andal.png\", \"mapUrl\": \"Srivilliputhur Andal Temple, Virudhunagar\", \"description\": \"One of the 108 Divya Desams, this temple is dedicated to Goddess Andal and showcases stunning Dravidian architecture.\"}, {\"name\": \"Kamarajar Memorial House\", \"image\": \"assets/kamaraj.png\", \"mapUrl\": \"Kamarajar Memorial House, Virudhunagar\", \"description\": \"A historical house-turned-museum dedicated to the former Chief Minister K. Kamaraj, displaying his personal belongings and achievements.\"}]');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `user_type` varchar(20) NOT NULL DEFAULT 'normal'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `user_type`) VALUES
(1, 'admin1', 'admin123', 'admin'),
(5, 'user1', 'user1', 'normal'),
(6, 'user_sneha', 'userpass2', 'normal'),
(7, 'user_mani', 'userpass3', 'normal'),
(9, 'RajeshKumar', 'hashed_password1', 'driver'),
(10, 'SureshReddy', 'hashed_password2', 'driver'),
(11, 'VijayGandhi', 'hashed_password3', 'driver'),
(12, 'KarthikSubramanian', 'hashed_password4', 'driver'),
(13, 'ArunPrakash', 'hashed_password5', 'driver'),
(14, 'RameshIyer', 'hashed_password6', 'driver'),
(15, '12345', '12345', 'driver'),
(16, 'HariKrishna', 'hashed_password8', 'driver'),
(17, 'PrakashRaju', 'hashed_password9', 'driver'),
(18, 'SundarRaj', 'hashed_password10', 'driver'),
(19, 'DeepakRajan', 'hashed_password11', 'driver'),
(20, 'MuruganNair', 'hashed_password12', 'driver'),
(21, 'AnandBalan', 'hashed_password13', 'driver'),
(22, 'SenthilKumar', 'hashed_password14', 'driver'),
(23, 'VenkateshYadav', 'hashed_password15', 'driver'),
(24, 'BalajiNarayanan', 'hashed_password16', 'driver'),
(25, 'GovindasamyRao', 'hashed_password17', 'driver'),
(26, 'KumaravelRaj', 'hashed_password18', 'driver'),
(27, 'SathishIyer', 'hashed_password19', 'driver'),
(28, 'JayaprakashSelvan', 'hashed_password20', 'driver'),
(29, 'RajendranPillai', 'hashed_password21', 'driver'),
(30, 'MuthukumarReddy', 'hashed_password22', 'driver'),
(31, 'GopalakrishnanNair', 'hashed_password23', 'driver'),
(32, 'VijayanMani', 'hashed_password24', 'driver'),
(33, 'RagavanKumar', 'hashed_password25', 'driver'),
(35, 'Sathiya', 'Sathiya@13', 'driver'),
(36, 'user23', 'user223', 'normal');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `driver_id` (`driver_id`);

--
-- Indexes for table `districts`
--
ALTER TABLE `districts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `drivers`
--
ALTER TABLE `drivers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `spots`
--
ALTER TABLE `spots`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `districts`
--
ALTER TABLE `districts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `drivers`
--
ALTER TABLE `drivers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `spots`
--
ALTER TABLE `spots`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `bookings_ibfk_2` FOREIGN KEY (`driver_id`) REFERENCES `drivers` (`id`);

--
-- Constraints for table `drivers`
--
ALTER TABLE `drivers`
  ADD CONSTRAINT `fk_user_driver` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
