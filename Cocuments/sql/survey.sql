-- MySQL dump 10.13  Distrib 8.0.20, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: survey
-- ------------------------------------------------------
-- Server version	8.0.20-0ubuntu0.20.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2019_08_19_000000_create_failed_jobs_table',1),(4,'2020_07_25_070342_create_surveys_table',2),(5,'2020_07_25_070742_create_survey_questions_table',2),(6,'2020_07_25_105859_create_survey_answers_table',3),(7,'2020_07_25_110526_create_survey_responses_table',4),(8,'2020_07_25_110951_add_column_survey_response_id_to_survey_answers',4),(9,'2020_07_25_155616_add_first_name_to_users',5);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `survey_answers`
--

DROP TABLE IF EXISTS `survey_answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `survey_answers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `survey_instance_id` bigint unsigned NOT NULL,
  `question_id` bigint unsigned NOT NULL,
  `answer` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `survey_answers_question_id_foreign` (`question_id`),
  KEY `survey_answers_survey_response_id_foreign` (`survey_instance_id`),
  CONSTRAINT `survey_answers_question_id_foreign` FOREIGN KEY (`question_id`) REFERENCES `survey_questions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `survey_answers_survey_response_id_foreign` FOREIGN KEY (`survey_instance_id`) REFERENCES `survey_instances` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `survey_answers`
--

LOCK TABLES `survey_answers` WRITE;
/*!40000 ALTER TABLE `survey_answers` DISABLE KEYS */;
INSERT INTO `survey_answers` VALUES (1,3,1,'Ahmad','2020-07-25 06:58:29','2020-07-25 10:07:50'),(2,3,3,'1','2020-07-25 06:58:29','2020-07-25 06:58:29'),(3,3,4,'[\"1\",\"2\",\"3\"]','2020-07-25 06:58:29','2020-07-25 10:07:50'),(4,3,5,'khdkashd','2020-07-25 06:58:29','2020-07-25 10:07:50'),(5,3,2,'2','2020-07-25 07:00:51','2020-07-25 07:00:51'),(6,4,1,'Muhammad Amir','2020-07-25 11:08:15','2020-07-25 11:08:15'),(7,4,2,'1','2020-07-25 11:08:15','2020-07-25 11:08:15'),(8,4,3,'1','2020-07-25 11:08:15','2020-07-25 11:08:15'),(9,4,4,'[\"1\",\"2\",\"3\",\"4\",\"5\",\"5\"]','2020-07-25 11:08:15','2020-07-25 11:08:15'),(10,4,5,'I am Muhammad Amir.','2020-07-25 11:08:15','2020-07-25 11:08:15'),(11,7,1,'Muhammad Yasir','2020-07-25 12:08:47','2020-07-25 12:08:47'),(12,7,2,'4','2020-07-25 12:08:47','2020-07-25 12:08:47'),(13,7,3,'1','2020-07-25 12:08:47','2020-07-25 12:08:47'),(14,7,4,'[\"1\",\"2\",\"4\"]','2020-07-25 12:08:47','2020-07-25 12:08:47'),(15,7,5,'afsaf','2020-07-25 12:08:47','2020-07-25 12:08:47'),(16,8,7,'Muhammad Ya','2020-07-25 22:56:24','2020-07-25 22:56:24'),(17,8,8,'28','2020-07-25 22:56:24','2020-07-25 22:56:24'),(18,8,10,'1','2020-07-25 22:56:24','2020-07-25 22:56:24'),(19,8,12,'[\"1\",\"5\"]','2020-07-25 23:09:49','2020-07-25 23:13:10'),(20,8,9,'1','2020-07-25 23:12:36','2020-07-25 23:12:36'),(21,8,11,'Test','2020-07-25 23:12:52','2020-07-25 23:12:52'),(22,9,7,'Muhammad Yasir','2020-07-25 23:18:21','2020-07-25 23:18:21'),(23,9,12,'[\"3\",\"4\"]','2020-07-25 23:20:52','2020-07-25 23:20:52');
/*!40000 ALTER TABLE `survey_answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `survey_instances`
--

DROP TABLE IF EXISTS `survey_instances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `survey_instances` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `survey_id` bigint unsigned NOT NULL,
  `status` tinyint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `survey_responses_user_id_foreign` (`user_id`),
  KEY `survey_responses_survey_id_foreign` (`survey_id`),
  CONSTRAINT `survey_responses_survey_id_foreign` FOREIGN KEY (`survey_id`) REFERENCES `surveys` (`id`) ON DELETE CASCADE,
  CONSTRAINT `survey_responses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `survey_instances`
--

LOCK TABLES `survey_instances` WRITE;
/*!40000 ALTER TABLE `survey_instances` DISABLE KEYS */;
INSERT INTO `survey_instances` VALUES (3,1,1,2,'2020-07-25 06:58:29','2020-07-25 10:07:51'),(4,3,1,2,'2020-07-25 11:08:15','2020-07-25 11:08:15'),(7,2,1,2,'2020-07-25 12:08:47','2020-07-25 12:08:47'),(8,3,2,2,'2020-07-25 22:56:24','2020-07-25 23:13:10'),(9,2,2,1,'2020-07-25 23:18:21','2020-07-25 23:18:21');
/*!40000 ALTER TABLE `survey_instances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `survey_questions`
--

DROP TABLE IF EXISTS `survey_questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `survey_questions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `survey_id` bigint unsigned NOT NULL,
  `field_type` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `question` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `survey_questions_survey_id_foreign` (`survey_id`),
  CONSTRAINT `survey_questions_survey_id_foreign` FOREIGN KEY (`survey_id`) REFERENCES `surveys` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `survey_questions`
--

LOCK TABLES `survey_questions` WRITE;
/*!40000 ALTER TABLE `survey_questions` DISABLE KEYS */;
INSERT INTO `survey_questions` VALUES (1,1,'input','Name',NULL,'2020-07-25 07:16:47','2020-07-25 07:16:50'),(2,1,'dropdown','Province','{\"values\":[{\"id\":1,\"value\":\"Punjab\"},{\"id\":2,\"value\":\"KPK\"},{\"id\":3,\"value\":\"Sindh\"},{\"id\":4,\"value\":\"Balochistan\"}]}','2020-07-25 07:17:20','2020-07-25 07:17:23'),(3,1,'radio','Gender','{\"values\":[{\"id\":0,\"value\":\"Female\"},{\"id\":1,\"value\":\"Male\"}]}','2020-07-25 07:17:57','2020-07-25 07:18:00'),(4,1,'checkbox','Interests','{\"values\":[{\"id\":1,\"value\":\"Art\"},{\"id\":2,\"value\":\"Religion\"},{\"id\":3,\"value\":\"Movies\"},{\"id\":4,\"value\":\"Politics\"},{\"id\":5,\"value\":\"Science\"},{\"id\":5,\"value\":\"Maths\"}]}','2020-07-25 07:18:32','2020-07-25 07:18:35'),(5,1,'textarea','Biography',NULL,'2020-07-25 07:19:01','2020-07-25 07:19:04'),(7,2,'input','What is your name?',NULL,'2020-07-26 03:48:41','2020-07-26 03:48:45'),(8,2,'input','What is your age?',NULL,'2020-07-26 03:49:14','2020-07-26 03:49:16'),(9,2,'dropdown','Province','{\"values\":[{\"id\":1,\"value\":\"Punjab\"},{\"id\":2,\"value\":\"KPK\"},{\"id\":3,\"value\":\"Sindh\"},{\"id\":4,\"value\":\"Balochistan\"}]}','2020-07-26 03:50:04','2020-07-26 03:50:06'),(10,2,'radio','Your favourite political party','{\"values\":[{\"id\":1,\"value\":\"PTI\"},{\"id\":2,\"value\":\"PMLN\"},{\"id\":3,\"value\":\"PPP\"},{\"id\":4,\"value\":\"Jamat-e-Islami\"},{\"id\":5,\"value\":\"Other\"}]}','2020-07-26 03:53:42','2020-07-26 03:53:45'),(11,2,'textarea','Reason',NULL,'2020-07-26 03:54:10','2020-07-26 03:54:07'),(12,2,'checkbox','Interests','{\"values\":[{\"id\":1,\"value\":\"Art\"},{\"id\":2,\"value\":\"Religion\"},{\"id\":3,\"value\":\"Movies\"},{\"id\":4,\"value\":\"Politics\"},{\"id\":5,\"value\":\"Science\"},{\"id\":5,\"value\":\"Maths\"}]}','2020-07-26 04:09:20','2020-07-26 04:09:22');
/*!40000 ALTER TABLE `survey_questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `surveys`
--

DROP TABLE IF EXISTS `surveys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `surveys` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `surveys`
--

LOCK TABLES `surveys` WRITE;
/*!40000 ALTER TABLE `surveys` DISABLE KEYS */;
INSERT INTO `surveys` VALUES (1,'First Survey','First Survey for testing','2020-07-25 07:15:50','2020-07-25 07:15:55'),(2,'Political Interest','The purpose of this survey is to know the political interest of peoples','2020-07-26 03:48:02','2020-07-26 03:48:06');
/*!40000 ALTER TABLE `surveys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'','','Muhammad Yasir','survey@admin.com',NULL,'$2y$10$NmJ.jO9I7SAGqXbb7caR7e//4Tzci/S3aaJixzQGwbeiLt/aUz3C6','5YF7A7pblMcOUQZsuvXg0Ep0AXxFFUCV3eNBhoVVJYgPcYNOdSyKOD5zXztc','2020-07-25 01:55:54','2020-07-25 01:55:54'),(2,'Muhammad','Yasir','Muhammad Yasir','yasir9398@gmail.com',NULL,'$2y$10$er8Yar67OhxurkPbghMvoeJW0OxShUOsq6/3nFI77LUR05gWFbo5C','Rctlr8Vy8AmUixNathR0E9bzrNLLJEGgPv2QDEUzSsu9wYzvEcGJn4WPuQRo','2020-07-25 11:00:26','2020-07-25 11:00:26'),(3,'Muhammad','Amir','Muhammad Amir','amir@gmail.com',NULL,'$2y$10$8FB03GzFDV6mVElun4TzhOCmX9qJ4f.ND5fhL5VEb86zPEye/bblW',NULL,'2020-07-25 11:04:46','2020-07-25 11:04:46');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-07-26 10:30:45
