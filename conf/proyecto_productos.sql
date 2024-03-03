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
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `ProID` int(11) NOT NULL AUTO_INCREMENT,
  `ProNombre` varchar(250) NOT NULL,
  `ProDescripcion` text,
  `ProPrecio` decimal(10,2) NOT NULL,
  `ProCategoria` varchar(50) DEFAULT NULL,
  `ProPublicacion` date DEFAULT NULL,
  PRIMARY KEY (`ProID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,'LECHE','DESLACTOSADA',3000.00,'LACTEOS','2023-08-16'),(2,'CARNE','FRESCA',12000.00,'CARNICOS','2023-08-28'),(3,'CREMA','MENTA',3000.00,'HACEO PERSONAL','2023-08-28'),(4,'CUADERNO','100 HOJAS',3000.00,'ESCOLAR','2023-08-29'),(5,'LENTEJAS','425 GR',4000.00,'LEGUNBRES','2023-08-28'),(6,'xcgsdfg','dfgdfgdfgdfgdffg',13213.00,'dfgdfgdfg','2000-11-15');
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER auditoria_InsertarProductos
AFTER INSERT ON productos
FOR EACH ROW
BEGIN
    INSERT INTO auditoria_PRODUCTOS (
        audi_nombreAnterior, audi_DescripcionAnterior,
        audi_PrecioAnterior, audi_CategoriaAnterior,
        audi_PublicacionAnterior, audi_nombreNuevo,
        audi_DescripcionNuevo, audi_PrecioNuevo,
        audi_CategoriaNuevo, audi_PublicacionNuevo,
        audi_usuario, audi_FechaModificacion,
        audi_ProID, audi_Accion
    )
    VALUES (
        NULL, NULL, NULL, NULL, NULL,
        NEW.ProNombre, NEW.ProDescripcion,
        NEW.ProPrecio, NEW.ProCategoria,
        NEW.ProPublicacion, CURRENT_USER(),
        NOW(), NEW.ProID, 'Inserción'
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER auditoria_ActualizarProductos
AFTER UPDATE ON productos
FOR EACH ROW
BEGIN
    INSERT INTO auditoria_PRODUCTOS (
        audi_nombreAnterior, audi_DescripcionAnterior,
        audi_PrecioAnterior, audi_CategoriaAnterior,
        audi_PublicacionAnterior, audi_nombreNuevo,
        audi_DescripcionNuevo, audi_PrecioNuevo,
        audi_CategoriaNuevo, audi_PublicacionNuevo,
        audi_usuario, audi_FechaModificacion,
        audi_ProID, audi_Accion
    )
    VALUES (
        OLD.ProNombre, OLD.ProDescripcion,
        OLD.ProPrecio, OLD.ProCategoria,
        OLD.ProPublicacion, NEW.ProNombre,
        NEW.ProDescripcion, NEW.ProPrecio,
        NEW.ProCategoria, NEW.ProPublicacion,
        CURRENT_USER(), NOW(),
        NEW.ProID, 'Actualización'
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER auditoria_EliminarProductos
AFTER DELETE ON productos
FOR EACH ROW
BEGIN
    INSERT INTO auditoria_PRODUCTOS (
        audi_nombreAnterior, audi_DescripcionAnterior,
        audi_PrecioAnterior, audi_CategoriaAnterior,
        audi_PublicacionAnterior, audi_nombreNuevo,
        audi_DescripcionNuevo, audi_PrecioNuevo,
        audi_CategoriaNuevo, audi_PublicacionNuevo,
        audi_usuario, audi_FechaModificacion,
        audi_ProID, audi_Accion
    )
    VALUES (
        OLD.ProNombre, OLD.ProDescripcion,
        OLD.ProPrecio, OLD.ProCategoria,
        OLD.ProPublicacion, NULL, NULL,
        NULL, NULL, NULL,
        CURRENT_USER(), NOW(),
        OLD.ProID, 'Eliminación'
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
