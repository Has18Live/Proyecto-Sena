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
-- Table structure for table `tienda`
--

DROP TABLE IF EXISTS `tienda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tienda` (
  `TieID` int(11) NOT NULL AUTO_INCREMENT,
  `TieNombre` varchar(100) NOT NULL,
  `TieDescripcion` text,
  `TieDireccion` text,
  `PubID` int(11) DEFAULT NULL,
  `AdmIdentificacion` char(10) DEFAULT NULL,
  PRIMARY KEY (`TieID`),
  KEY `PubID` (`PubID`),
  KEY `AdmIdentificacion` (`AdmIdentificacion`),
  CONSTRAINT `tienda_ibfk_1` FOREIGN KEY (`PubID`) REFERENCES `publicar` (`PubID`),
  CONSTRAINT `tienda_ibfk_2` FOREIGN KEY (`AdmIdentificacion`) REFERENCES `administrador` (`AdmIdentificacion`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tienda`
--

LOCK TABLES `tienda` WRITE;
/*!40000 ALTER TABLE `tienda` DISABLE KEYS */;
INSERT INTO `tienda` VALUES (2,'surti todo','los mejores productos para ti','cl 18 #13-45',NULL,NULL),(3,'pro aceo','productos de haceo eco','cr 12 #9-50',NULL,NULL),(4,'ModaÉtnica','Una boutique de ropa que se especializa en prendas únicas','cr 11 #12-69',NULL,NULL),(5,'LibroManía',' Una librería acogedora donde los amantes de la lectura pueden explorar','cr 28-d3 #72-77',NULL,NULL),(6,'NaturalezaViva','Una tienda de jardinería y plantas que ofrece una variedad de especies','cr 28 #72-72',NULL,NULL),(8,'dfgdfgdf','dfgdfgdgdf','dfgdfgdfg',1,'656565');
/*!40000 ALTER TABLE `tienda` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER auditoria_InsertarTienda
AFTER INSERT ON tienda
FOR EACH ROW
BEGIN
    INSERT INTO auditoria_Tienda (
        audi_nombreAnterior, audi_DescripcionAnterior,
        audi_DireccionAnterior, audi_nombreNuevo,
        audi_DescripcionNuevo, audi_DireccionNuevo,
        audi_usuario, audi_FechaModificacion,
        audi_TieID, audi_Accion
    )
    VALUES (
        NULL, NULL, NULL,
        NEW.TieNombre, NEW.TieDescripcion,
        NEW.TieDireccion, CURRENT_USER(),
        NOW(), NEW.TieID, 'Inserción'
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER auditoria_ActualizarTienda
AFTER UPDATE ON tienda
FOR EACH ROW
BEGIN
    INSERT INTO auditoria_Tienda (
        audi_nombreAnterior, audi_DescripcionAnterior,
        audi_DireccionAnterior, audi_nombreNuevo,
        audi_DescripcionNuevo, audi_DireccionNuevo,
        audi_usuario, audi_FechaModificacion,
        audi_TieID, audi_Accion
    )
    VALUES (
        OLD.TieNombre, OLD.TieDescripcion,
        OLD.TieDireccion, NEW.TieNombre,
        NEW.TieDescripcion, NEW.TieDireccion,
        CURRENT_USER(), NOW(), NEW.TieID,
        'Actualización'
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER auditoria_EliminarTienda
AFTER DELETE ON tienda
FOR EACH ROW
BEGIN
    INSERT INTO auditoria_Tienda (
        audi_nombreAnterior, audi_DescripcionAnterior,
        audi_DireccionAnterior, audi_nombreNuevo,
        audi_DescripcionNuevo, audi_DireccionNuevo,
        audi_usuario, audi_FechaModificacion,
        audi_TieID, audi_Accion
    )
    VALUES (
        OLD.TieNombre, OLD.TieDescripcion,
        OLD.TieDireccion, NULL, NULL, NULL,
        CURRENT_USER(), NOW(), OLD.TieID,
        'Eliminación'
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

-- Dump completed on 2024-02-19 16:05:52
