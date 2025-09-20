-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: tourist_mgmt
-- ------------------------------------------------------
-- Server version	8.0.40

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `districts`
--

DROP TABLE IF EXISTS `districts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `districts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `image_url` varchar(400) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `districts`
--

LOCK TABLES `districts` WRITE;
/*!40000 ALTER TABLE `districts` DISABLE KEYS */;
INSERT INTO `districts` VALUES (1,'Chennai','assets/chennai.png'),(2,'Coimbatore','assets/coimbatore.png'),(3,'Madurai','assets/madurai.png'),(4,'Tiruchirappalli','assets/thiru.png'),(5,'Salem','assets/salem.png'),(6,'Tenkasi','assets/thenkasi.png'),(7,'Theni','assets/theni.png'),(8,'Virudhunagar','assets/vnr.png');
/*!40000 ALTER TABLE `districts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spots`
--

DROP TABLE IF EXISTS `spots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `spots` (
  `id` int NOT NULL AUTO_INCREMENT,
  `district` varchar(45) DEFAULT NULL,
  `spots_json` json DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spots`
--

LOCK TABLES `spots` WRITE;
/*!40000 ALTER TABLE `spots` DISABLE KEYS */;
INSERT INTO `spots` VALUES (1,'Chennai','[{\"name\": \"Marina Beach\", \"image\": \"assets/marina.png\", \"mapUrl\": \"Marina Beach, Chennai\", \"description\": \"One of the longest urban beaches in the world, famous for its sunrises and bustling atmosphere.\"}, {\"name\": \"Kapaleeshwarar Temple\", \"image\": \"assets/kapaleeswarar.png\", \"mapUrl\": \"Kapaleeshwarar Temple, Chennai\", \"description\": \"A historic Dravidian-style temple dedicated to Lord Shiva, known for its intricate sculptures.\"}, {\"name\": \"Fort St. George\", \"image\": \"assets/fort.png\", \"mapUrl\": \"Fort St. George, Chennai\", \"description\": \"Built by the British in 1644, this fort houses a museum showcasing colonial artifacts.\"}, {\"name\": \"Santhome Basilica\", \"image\": \"assets/santhome.png\", \"mapUrl\": \"Santhome Basilica, Chennai\", \"description\": \"A beautiful neo-Gothic church built over the tomb of St. Thomas, one of Jesus apostles.\"}, {\"name\": \"Guindy National Park\", \"image\": \"assets/marudhamalai.png\", \"mapUrl\": \"Guindy National Park, Chennai\", \"description\": \"One of the few national parks within a city, home to deer, blackbucks, and various bird species.\"}]'),(2,'Coimbatore','[{\"name\": \"Marudhamalai Temple\", \"image\": \"assets/marudhamalai.png\", \"mapUrl\": \"Marudhamalai Temple, Coimbatore\", \"description\": \"A famous hilltop temple dedicated to Lord Murugan, offering a serene atmosphere and panoramic views.\"}, {\"name\": \"VOC Park & Zoo\", \"image\": \"assets/voc.png\", \"mapUrl\": \"VOC Park & Zoo, Coimbatore\", \"description\": \"A popular park and zoo in the heart of Coimbatore, great for family outings and picnics.\"}, {\"name\": \"Dhyanalinga Temple\", \"image\": \"assets/dhyanalinga.png\", \"mapUrl\": \"Dhyanalinga Temple, Coimbatore\", \"description\": \"A unique meditation center and spiritual space created by Sadhguru, known for its tranquil ambiance.\"}, {\"name\": \"Siruvani Waterfalls\", \"image\": \"assets/siruvani.png\", \"mapUrl\": \"Siruvani Waterfalls, Coimbatore\", \"description\": \"A scenic waterfall located near the Siruvani Hills, famous for its crystal-clear water and lush surroundings.\"}, {\"name\": \"Gass Forest Museum\", \"image\": \"assets/gass.png\", \"mapUrl\": \"Gass Forest Museum, Coimbatore\", \"description\": \"A unique museum showcasing forest-related artifacts, wildlife specimens, and ecological exhibits.\"}]'),(3,'Madurai','[{\"name\": \"Meenakshi Amman Temple\", \"image\": \"assets/meenakshi.png\", \"mapUrl\": \"Meenakshi Amman Temple, Madurai\", \"description\": \"One of the most famous temples in India, dedicated to Goddess Meenakshi and Lord Sundareswarar, known for its stunning Dravidian architecture.\"}, {\"name\": \"Thirumalai Nayakkar Mahal\", \"image\": \"assets/thiru.png\", \"mapUrl\": \"Thirumalai Nayakkar Mahal, Madurai\", \"description\": \"A 17th-century palace built by King Thirumalai Nayak, showcasing Indo-Saracenic architecture and grand interiors.\"}, {\"name\": \"Gandhi Memorial Museum\", \"image\": \"assets/gandhi.png\", \"mapUrl\": \"Gandhi Memorial Museum, Madurai\", \"description\": \"A museum dedicated to Mahatma Gandhi, featuring historical artifacts, letters, and exhibitions on Indias freedom struggle.\"}, {\"name\": \"Alagar Kovil\", \"image\": \"assets/alagar.png\", \"mapUrl\": \"Alagar Kovil, Madurai\", \"description\": \"A beautiful hilltop temple dedicated to Lord Vishnu, surrounded by lush greenery and scenic views.\"}, {\"name\": \"Vaigai Dam\", \"image\": \"assets/vaigai.png\", \"mapUrl\": \"Vaigai Dam, Madurai\", \"description\": \"A massive dam built across the Vaigai River, serving as a vital water source and a picturesque picnic spot.\"}]'),(4,'Tiruchirappalli','[{\"name\": \"Rockfort Temple\", \"image\": \"assets/rock.png\", \"mapUrl\": \"Rockfort Temple, Tiruchirappalli\", \"description\": \"A historic temple complex perched atop a massive rock, offering breathtaking views of Trichy and featuring ancient Hindu shrines.\"}, {\"name\": \"Sri Ranganathaswamy Temple\", \"image\": \"assets/sriranga.png\", \"mapUrl\": \"Sri Ranganathaswamy Temple, Tiruchirappalli\", \"description\": \"One of the largest functioning Hindu temples, dedicated to Lord Vishnu, known for its magnificent architecture and religious significance.\"}, {\"name\": \"Kallanai Dam\", \"image\": \"assets/kallanai.png\", \"mapUrl\": \"Kallanai Dam, Tiruchirappalli\", \"description\": \"An ancient dam built by the Chola dynasty over the Kaveri River, still in use today for irrigation purposes.\"}, {\"name\": \"St. Joseph Church\", \"image\": \"assets/st.png\", \"mapUrl\": \"St. Joseph Church, Tiruchirappalli\", \"description\": \"A beautiful colonial-era church known for its European-style architecture and serene ambiance.\"}, {\"name\": \"Butterfly Park\", \"image\": \"assets/butterfly.png\", \"mapUrl\": \"Butterfly Park, Tiruchirappalli\", \"description\": \"A scenic park home to numerous species of butterflies, offering a relaxing nature experience with lush greenery and vibrant flowers.\"}]'),(5,'Salem','[{\"name\": \"Yercaud Hills\", \"image\": \"assets/yercaud.png\", \"mapUrl\": \"Yercaud Hills, Salem\", \"description\": \"A picturesque hill station known for its coffee plantations, scenic views, and pleasant climate, perfect for a relaxing getaway.\"}, {\"name\": \"Kottai Mariamman Temple\", \"image\": \"assets/kotta.png\", \"mapUrl\": \"Kottai Mariamman Temple, Salem\", \"description\": \"A historic temple dedicated to Goddess Mariamman, known for its grand architecture and annual festival that attracts thousands of devotees.\"}, {\"name\": \"Mettur Dam\", \"image\": \"assets/mettur.png\", \"mapUrl\": \"Mettur Dam, Salem\", \"description\": \"One of the largest dams in India, built across the Kaveri River, offering breathtaking views and serving as a major irrigation source.\"}, {\"name\": \"1008 Lingam Temple\", \"image\": \"assets/1008.png\", \"mapUrl\": \"1008 Lingam Temple, Salem\", \"description\": \"A unique Shiva temple featuring 1008 lingams arranged beautifully across a hill, attracting devotees and spiritual seekers.\"}, {\"name\": \"Poiman Karadu\", \"image\": \"assets/poiman.png\", \"mapUrl\": \"Poiman Karadu, Salem\", \"description\": \"A scenic viewpoint known for its illusionary rock formations resembling a deer, offering a perfect spot for photography and relaxation.\"}]'),(6,'Tenkasi','[{\"name\": \"Coutrallam Falls\", \"image\": \"assets/cutralam.png\", \"mapUrl\": \"Coutrallam Falls, Tenkasi\", \"description\": \"Also known as Spa of South India, these waterfalls are famous for their therapeutic benefits and scenic beauty.\"}, {\"name\": \"Sivasailam Temple\", \"image\": \"assets/siva.png\", \"mapUrl\": \"Sivasailam Temple, Tenkasi\", \"description\": \"An ancient temple dedicated to Lord Shiva, surrounded by lush greenery and known for its peaceful atmosphere.\"}, {\"name\": \"Thirumalai Kovil\", \"image\": \"assets/thirumalai1.png\", \"mapUrl\": \"Thirumalai Kovil, Tenkasi\", \"description\": \"A Murugan temple situated on a hilltop, offering breathtaking views of the surrounding landscape and a spiritual retreat.\"}, {\"name\": \"Aintharuvi Waterfalls\", \"image\": \"assets/5falls.png\", \"mapUrl\": \"Aintharuvi Waterfalls, Tenkasi\", \"description\": \"A stunning set of five waterfalls flowing down rocky terrains, perfect for a refreshing dip and scenic nature views.\"}, {\"name\": \"Papanasam Dam\", \"image\": \"assets/papanasam.png\", \"mapUrl\": \"Papanasam Dam, Tenkasi\", \"description\": \"A massive dam built across the Thamirabarani River, known for its scenic reservoir and boating activities.\"}]'),(7,'Theni','[{\"name\": \"Meghamalai\", \"image\": \"assets/megamalai.jpeg\", \"mapUrl\": \"Meghamalai, Theni\", \"description\": \"Also known as the High Wavy Mountains, this serene hill station is covered with tea plantations, rich wildlife, and misty landscapes.\"}, {\"name\": \"Suruli Falls\", \"image\": \"assets/suruli.png\", \"mapUrl\": \"Suruli Falls, Theni\", \"description\": \"A picturesque 2-stage waterfall located in the dense forest area, famous for its medicinal water properties.\"}, {\"name\": \"Thekkady\", \"image\": \"assets/thekadi.png\", \"mapUrl\": \"Thekkady, Theni\", \"description\": \"A nature lover’s paradise, Thekkady is home to Periyar Wildlife Sanctuary, famous for its rich biodiversity and boating in Periyar Lake.\"}, {\"name\": \"Vaigai Dam\", \"image\": \"assets/vaigai.png\", \"mapUrl\": \"Vaigai Dam, Theni\", \"description\": \"A massive dam built across the Vaigai River, offering scenic views, lush gardens, and picnic spots.\"}, {\"name\": \"Bodi Mettu\", \"image\": \"assets/vaigai.png\", \"mapUrl\": \"Bodi Mettu, Theni\", \"description\": \"A beautiful hill station at the Tamil Nadu-Kerala border, providing panoramic views, trekking trails, and a cool climate.\"}]'),(8,'Virudhunagar','[{\"name\": \"Ayyanar Falls\", \"image\": \"assets/ayyanar.png\", \"mapUrl\": \"Ayyanar Falls, Virudhunagar\", \"description\": \"A serene waterfall located in the Western Ghats, offering breathtaking views and a refreshing natural pool for visitors.\"}, {\"name\": \"Sathuragiri Hills\", \"image\": \"assets/sathuragiri.png\", \"mapUrl\": \"Sathuragiri Hills, Virudhunagar\", \"description\": \"A sacred hill known for its spiritual significance and trekking trails, home to the famous Sundara Mahalingam Temple.\"}, {\"name\": \"Pilavakkal Dam\", \"image\": \"assets/plovakal.png\", \"mapUrl\": \"Pilavakkal Dam, Virudhunagar\", \"description\": \"A scenic reservoir providing water to nearby areas, featuring lush green surroundings and a peaceful atmosphere.\"}, {\"name\": \"Srivilliputhur Andal Temple\", \"image\": \"assets/andal.png\", \"mapUrl\": \"Srivilliputhur Andal Temple, Virudhunagar\", \"description\": \"One of the 108 Divya Desams, this temple is dedicated to Goddess Andal and showcases stunning Dravidian architecture.\"}, {\"name\": \"Kamarajar Memorial House\", \"image\": \"assets/kamaraj.png\", \"mapUrl\": \"Kamarajar Memorial House, Virudhunagar\", \"description\": \"A historical house-turned-museum dedicated to the former Chief Minister K. Kamaraj, displaying his personal belongings and achievements.\"}]');
/*!40000 ALTER TABLE `spots` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin','admin');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-31 19:22:05
