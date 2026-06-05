/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.11.15-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: userservice
-- ------------------------------------------------------
-- Server version	10.11.15-MariaDB-ubu2204

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES
('3c170abd-e072-4e87-91f3-99935c2c0da5',NULL,NULL,NULL,'enc.IFXG63TZNVXXK4ZNGE3TOMZUGIYTINBWGA3TK...','3c170abd-e072-4e87-91f3-99935c2c0da5@beratungcaritas.de',NULL,'@anonymous-1773421446075:91.99.183.160',1,'2026-03-13 17:04:11','2026-03-13 17:04:11','de','','2026-03-13 17:04:11','2026-03-13 17:04:11',NULL,0,NULL,'z9OpwXsc',0),
('b3c2623d-6659-4e3d-a24b-dd1a7637687e',NULL,NULL,NULL,'enc.ONUGC6TJMF2XGZLS','b3c2623d-6659-4e3d-a24b-dd1a7637687e@beratungcaritas.de',NULL,'@shaziauser:91.99.183.160',1,'2026-03-13 17:00:40','2026-03-13 17:00:40','de','','2026-03-13 17:00:40','2026-03-13 17:00:41',NULL,0,NULL,'@User12345',0),
('caritas_admin',NULL,NULL,NULL,'caritas_admin','caritas_admin@caritas.local',NULL,'@caritas_admin:oriso.org',0,NULL,NULL,'de','','2025-12-27 08:33:16','2025-12-27 08:33:16',NULL,0,'','@CaritasAdmin2025!',0),
('group-chat-system',NULL,NULL,NULL,'group-chat-system','group-chat-system@caritas.local',NULL,'@group-chat-system:oriso.org',0,NULL,NULL,'de','','2025-12-27 08:33:16','2025-12-27 08:33:16',NULL,0,'','@GroupChatSystem2025!',0),
('oriso_call_admin',NULL,NULL,NULL,'oriso_call_admin','oriso_call_admin@caritas.local',NULL,'@oriso_call_admin:oriso.org',0,NULL,NULL,'de','','2025-12-27 08:33:16','2025-12-27 08:33:16',NULL,0,'','@OrisoCallAdmin2025!',0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`userservice`@`%`*/ /*!50003 TRIGGER `userservice`.`user_update` BEFORE UPDATE ON `userservice`.`user` FOR EACH ROW BEGIN
set new.update_date=utc_timestamp();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping data for table `consultant`
--

LOCK TABLES `consultant` WRITE;
/*!40000 ALTER TABLE `consultant` DISABLE KEYS */;
INSERT INTO `consultant` VALUES
('1c48b204-5a90-4edd-8e20-a6dd2dc57c73',1,'enc.ONUGC6TJMFRW63TTOVWHIYLOOQZA....','shazia','consultant2','shaziaconsultant2@gmail.com',0,0,0,NULL,'dummy-rc','@shaziaconsultant2:91.99.183.160',1,'2026-03-13 17:04:43','2026-03-13 17:04:43','de','','','','CREATED',1,NULL,NULL,'2026-03-13 16:58:37','2026-03-13 17:04:43',1,'{\"initialEnquiryNotificationEnabled\":true,\"newChatMessageNotificationEnabled\":true,\"reassignmentNotificationEnabled\":true,\"appointmentNotificationEnabled\":true}','@Consultant12345',NULL,0),
('837d8c0a-18ed-4e8e-90b7-8375317b3be8',1,'enc.ONUGC6TJMFRW63TTOVWHIYLOOQYQ....','shazia','consultant1','shaziaconsultant1@gmail.com',0,0,0,NULL,'dummy-rc','@enc.onugc6tjmfrw63ttovwhiylooqyq....:91.99.183.160',1,'2026-03-13 17:01:26','2026-03-13 17:01:26','de','','','','CREATED',1,NULL,NULL,'2026-03-13 16:54:43','2026-03-13 17:02:04',1,'{\"initialEnquiryNotificationEnabled\":true,\"newChatMessageNotificationEnabled\":true,\"reassignmentNotificationEnabled\":true,\"appointmentNotificationEnabled\":true}','@Consultant12345',NULL,0);
/*!40000 ALTER TABLE `consultant` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`userservice`@`%`*/ /*!50003 TRIGGER `userservice`.`consultant_update` BEFORE UPDATE ON `userservice`.`consultant` FOR EACH ROW BEGIN
set new.update_date=utc_timestamp();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping data for table `session`
--

LOCK TABLES `session` WRITE;
/*!40000 ALTER TABLE `session` DISABLE KEYS */;
INSERT INTO `session` VALUES
(102314,NULL,'b3c2623d-6659-4e3d-a24b-dd1a7637687e','837d8c0a-18ed-4e8e-90b7-8375317b3be8',1,'REGISTERED',NULL,'2026-03-13 17:02:03','12345',236,'de',NULL,2,0,'\0','2026-03-13 17:00:41','2026-03-13 17:02:03',3,NULL,NULL,NULL,NULL,'!tdxjKUzlsrDsPEwAYH:91.99.183.160'),
(102315,NULL,'3c170abd-e072-4e87-91f3-99935c2c0da5','1c48b204-5a90-4edd-8e20-a6dd2dc57c73',1,'REGISTERED',NULL,'2026-03-13 17:04:47','00000',236,'de',NULL,2,0,'\0','2026-03-13 17:04:11','2026-03-13 17:04:47',3,NULL,NULL,NULL,NULL,'!NSMbecrDPFlFtAzjpU:91.99.183.160');
/*!40000 ALTER TABLE `session` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`userservice`@`%`*/ /*!50003 TRIGGER `userservice`.`session_update` BEFORE UPDATE ON `userservice`.`session` FOR EACH ROW BEGIN
set new.update_date=utc_timestamp();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`userservice`@`%`*/ /*!50003 TRIGGER `userservice`.`assign_date_update` BEFORE UPDATE ON `userservice`.`session` FOR EACH ROW BEGIN
    IF OLD.assign_date IS NULL AND OLD.status = 1 AND NEW.status = 2 THEN
        SET NEW.assign_date=utc_timestamp();
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping data for table `session_data`
--

LOCK TABLES `session_data` WRITE;
/*!40000 ALTER TABLE `session_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `session_data` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`userservice`@`%`*/ /*!50003 TRIGGER `userservice`.`session_data_update` BEFORE UPDATE ON `userservice`.`session_data` FOR EACH ROW BEGIN
set new.update_date=utc_timestamp();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping data for table `session_topic`
--

LOCK TABLES `session_topic` WRITE;
/*!40000 ALTER TABLE `session_topic` DISABLE KEYS */;
/*!40000 ALTER TABLE `session_topic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `session_supervisor`
--

LOCK TABLES `session_supervisor` WRITE;
/*!40000 ALTER TABLE `session_supervisor` DISABLE KEYS */;
/*!40000 ALTER TABLE `session_supervisor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `consultant_agency`
--

LOCK TABLES `consultant_agency` WRITE;
/*!40000 ALTER TABLE `consultant_agency` DISABLE KEYS */;
INSERT INTO `consultant_agency` VALUES
(100809,1,'1c48b204-5a90-4edd-8e20-a6dd2dc57c73',236,'2026-03-13 16:58:37','2026-03-13 16:58:37',NULL,'CREATED'),
(100810,1,'837d8c0a-18ed-4e8e-90b7-8375317b3be8',236,'2026-03-13 16:59:40','2026-03-13 16:59:40',NULL,'CREATED');
/*!40000 ALTER TABLE `consultant_agency` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`userservice`@`%`*/ /*!50003 TRIGGER `userservice`.`consultant_agency_update` BEFORE UPDATE ON `userservice`.`consultant_agency` FOR EACH ROW BEGIN
set new.update_date=utc_timestamp();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping data for table `consultant_mobile_token`
--

LOCK TABLES `consultant_mobile_token` WRITE;
/*!40000 ALTER TABLE `consultant_mobile_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `consultant_mobile_token` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`userservice`@`%`*/ /*!50003 TRIGGER `userservice`.`consultant_mobile_token_update`
    BEFORE UPDATE ON `userservice`.`consultant_mobile_token`
    FOR EACH ROW BEGIN set new.update_date=utc_timestamp();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping data for table `language`
--

LOCK TABLES `language` WRITE;
/*!40000 ALTER TABLE `language` DISABLE KEYS */;
/*!40000 ALTER TABLE `language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `appointment`
--

LOCK TABLES `appointment` WRITE;
/*!40000 ALTER TABLE `appointment` DISABLE KEYS */;
/*!40000 ALTER TABLE `appointment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `user_agency`
--

LOCK TABLES `user_agency` WRITE;
/*!40000 ALTER TABLE `user_agency` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_agency` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`userservice`@`%`*/ /*!50003 TRIGGER `userservice`.`user_agency_update` BEFORE UPDATE ON `userservice`.`user_agency` FOR EACH ROW BEGIN
set new.update_date=utc_timestamp();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping data for table `user_mobile_token`
--

LOCK TABLES `user_mobile_token` WRITE;
/*!40000 ALTER TABLE `user_mobile_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_mobile_token` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`userservice`@`%`*/ /*!50003 TRIGGER `userservice`.`user_mobile_token_update`
    BEFORE UPDATE ON `userservice`.`user_mobile_token`
    FOR EACH ROW BEGIN set new.update_date=utc_timestamp();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping data for table `user_chat`
--

LOCK TABLES `user_chat` WRITE;
/*!40000 ALTER TABLE `user_chat` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_chat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `draft_message`
--

LOCK TABLES `draft_message` WRITE;
/*!40000 ALTER TABLE `draft_message` DISABLE KEYS */;
INSERT INTO `draft_message` VALUES
(39,'b3c2623d-6659-4e3d-a24b-dd1a7637687e','scope:__draft-index__|thread:main','{}',NULL,NULL,NULL,NULL,NULL,'2026-03-13 17:00:52','2026-03-13 17:04:27',NULL),
(41,'837d8c0a-18ed-4e8e-90b7-8375317b3be8','scope:__draft-index__|thread:main','{}',NULL,NULL,NULL,NULL,NULL,'2026-03-13 17:02:07','2026-03-13 17:08:18',NULL),
(42,'3c170abd-e072-4e87-91f3-99935c2c0da5','scope:__draft-index__|thread:main','{}',NULL,NULL,NULL,NULL,NULL,'2026-03-13 17:04:18','2026-03-13 17:12:34',NULL),
(44,'1c48b204-5a90-4edd-8e20-a6dd2dc57c73','scope:__draft-index__|thread:main','{}',NULL,NULL,NULL,NULL,NULL,'2026-03-13 17:04:50','2026-03-13 17:07:09',NULL);
/*!40000 ALTER TABLE `draft_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `event_notification`
--

LOCK TABLES `event_notification` WRITE;
/*!40000 ALTER TABLE `event_notification` DISABLE KEYS */;
INSERT INTO `event_notification` VALUES
(108,'b3c2623d-6659-4e3d-a24b-dd1a7637687e','inquiry.accepted','system','Inquiry accepted','Your request was accepted by shazia consultant1. Chat is now active.','/sessions/user/view/!tdxjKUzlsrDsPEwAYH:91.99.183.160/102314',102314,NULL,'2026-03-13 17:02:04',NULL),
(109,'3c170abd-e072-4e87-91f3-99935c2c0da5','inquiry.accepted','system','Inquiry accepted','Your request was accepted by shazia consultant2. Chat is now active.','/sessions/user/view/!NSMbecrDPFlFtAzjpU:91.99.183.160/102315',102315,NULL,'2026-03-13 17:04:48',NULL);
/*!40000 ALTER TABLE `event_notification` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-13 17:17:10
