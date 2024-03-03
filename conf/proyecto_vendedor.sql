-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: proyecto
-- ------------------------------------------------------
-- Server version	5.6.51-log

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
-- Table structure for table `vendedor`
--

DROP TABLE IF EXISTS `vendedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendedor` (
  `VenIdentificacion` int(10) NOT NULL,
  `VenNombre` varchar(50) NOT NULL,
  `VenApellido` varchar(50) NOT NULL,
  `VenTelefono` int(10) NOT NULL,
  `VenCorreo` varchar(50) NOT NULL,
  PRIMARY KEY (`VenIdentificacion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendedor`
--

LOCK TABLES `vendedor` WRITE;
/*!40000 ALTER TABLE `vendedor` DISABLE KEYS */;
INSERT INTO `vendedor` VALUES (35635465,'KHGUHV','YGIHGB',564695468,'UIHGUIG'),(1254879652,'Sofia ','Rodríguez',325478945,'sofia.rodriguez22@example.com'),(1545284562,'Alejandro ','García',324487812,'alejandro.garcia87@example.com'),(1546545465,'Emma',' Williams',325455454,'emma.williams99@example.com'),(1646546546,'Amir',' Khan',316548432,'amir.khan55@example.com'),(1656551546,'Javier',' Lopez',321456987,'javier.lopez73@example.com');
/*!40000 ALTER TABLE `vendedor` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER auditoria_InsertarVendedor
AFTER INSERT ON vendedor
FOR EACH ROW
BEGIN
    INSERT INTO auditoria_vendedor (
        audi_nombreAnterior, audi_ApellidoAnterior,
        audi_TelefonoAnterior, audi_CorreoAnterior,
        audi_nombreNuevo, audi_ApellidoNuevo,
        audi_TelefonoNuevo, audi_CorreoNuevo,
        audi_usuario, audi_FechaModificacion,
        audi_VenIdentificacion, audi_Accion
    )
    VALUES (
        NULL, NULL, NULL, NULL,
        NEW.VenNombre, NEW.VenApellido,
        NEW.VenTelefono, NEW.VenCorreo,
        CURRENT_USER(), NOW(),
        NEW.VenIdentificacion, 'Inserción'
    );
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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER auditoria_ActualizarVendedor
AFTER UPDATE ON vendedor
FOR EACH ROW
BEGIN
    INSERT INTO auditoria_Tienda (
        audi_nombreAnterior, audi_ApellidoAnterior,
        audi_TelefonoAnterior, audi_CorreoAnterior,
        audi_nombreNuevo, audi_ApellidoNuevo,
        audi_TelefonoNuevo, audi_CorreoNuevo,
        audi_usuario, audi_FechaModificacion,
        audi_VenIdentificacion, audi_Accion
    )
    VALUES (
        OLD.VenNombre, OLD.VenApellido,
        OLD.VenTelefono, OLD.VenCorreo,
        NEW.VenNombre, NEW.VenApellido,
        NEW.VenTelefono, NEW.VenCorreo,
        CURRENT_USER(), NOW(),
        NEW.VenIdentificacion, 'Actualización'
    );
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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER auditoria_EliminarVendedor
AFTER DELETE ON vendedor
FOR EACH ROW
BEGIN
    INSERT INTO auditoria_Tienda (
        audi_nombreAnterior, audi_ApellidoAnterior,
        audi_TelefonoAnterior, audi_CorreoAnterior,
        audi_nombreNuevo, audi_ApellidoNuevo,
        audi_TelefonoNuevo, audi_CorreoNuevo,
        audi_usuario, audi_FechaModificacion,
        audi_VenIdentificacion, audi_Accion
    )
    VALUES (
        OLD.VenNombre, OLD.VenApellido,
        OLD.VenTelefono, OLD.VenCorreo,
        NULL, NULL, NULL, NULL,
        CURRENT_USER(), NOW(),
        OLD.VenIdentificacion, 'Eliminación'
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-19 16:05:56
