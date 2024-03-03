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
-- Table structure for table `administrador`
--

DROP TABLE IF EXISTS `administrador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `administrador` (
  `AdmIdentificacion` char(10) NOT NULL,
  `AdmNombre` varchar(50) NOT NULL,
  `AdmApellido` varchar(50) NOT NULL,
  `AdmTelefono` varchar(10) NOT NULL,
  `AdmCorreo` varchar(50) NOT NULL,
  PRIMARY KEY (`AdmIdentificacion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrador`
--

LOCK TABLES `administrador` WRITE;
/*!40000 ALTER TABLE `administrador` DISABLE KEYS */;
INSERT INTO `administrador` VALUES ('1231354654','Carlos','Rodríguez','3215165153','carlos.rodriguez@example.com'),('1245478954','María','González','3321516554','maria.gonzalez@example.com'),('1354654268','Laura ','Martinez','3365465156','laura.martinez@example.com'),('1456987521','Raul','vasquez','3124587627','vasquezraulq@examplel.com'),('1654686846','Andrés','López','3216516524','andres.lopez@example.com'),('3132313','adfsadf','sdfsf','36354654','slfhlskndfl'),('656565','sdgdfg','sdjkfb','13213232','dgrgdgdfgg');
/*!40000 ALTER TABLE `administrador` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER auditoria_InsertarAdministrador
AFTER INSERT ON administrador
FOR EACH ROW
BEGIN
    INSERT INTO auditoria_administrador (
        audi_NombreAnterior, audi_ApellidoAnterior,
        audi_TelefonoAnterior, audi_CorreoAnterior,
        audi_NombreNuevo, audi_ApellidoNuevo,
        audi_TelefonoNuevo, audi_CorreoNuevo,
        audi_usuario, audi_FechaModificacion,
        audi_AdmIdentificacion, audi_Accion
    )
    VALUES (
        NULL, NULL, NULL, NULL,
        NEW.AdmNombre, NEW.AdmApellido,
        NEW.AdmTelefono, NEW.AdmCorreo,
        CURRENT_USER(), NOW(),
        NEW.AdmIdentificacion, 'Inserción'
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER auditoria_ActualizarAdministrador
AFTER UPDATE ON administrador
FOR EACH ROW
BEGIN
    INSERT INTO auditoria_administrador (
        audi_NombreAnterior, audi_ApellidoAnterior,
        audi_TelefonoAnterior, audi_CorreoAnterior,
        audi_NombreNuevo, audi_ApellidoNuevo,
        audi_TelefonoNuevo, audi_CorreoNuevo,
        audi_usuario, audi_FechaModificacion,
        audi_AdmIdentificacion, audi_Accion
    )
    VALUES (
        OLD.AdmNombre, OLD.AdmApellido,
        OLD.AdmTelefono, OLD.AdmCorreo,
        NEW.AdmNombre, NEW.AdmApellido,
        NEW.AdmTelefono, NEW.AdmCorreo,
        CURRENT_USER(), NOW(),
        NEW.AdmIdentificacion, 'Actualización'
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER auditoria_EliminarAdministrador
AFTER DELETE ON administrador
FOR EACH ROW
BEGIN
    INSERT INTO auditoria_administrador (
        audi_NombreAnterior, audi_ApellidoAnterior,
        audi_TelefonoAnterior, audi_CorreoAnterior,
        audi_NombreNuevo, audi_ApellidoNuevo,
        audi_TelefonoNuevo, audi_CorreoNuevo,
        audi_usuario, audi_FechaModificacion,
        audi_AdmIdentificacion, audi_Accion
    )
    VALUES (
        OLD.AdmNombre, OLD.AdmApellido,
        OLD.AdmTelefono, OLD.AdmCorreo,
        NULL, NULL, NULL, NULL,
        CURRENT_USER(), NOW(),
        OLD.AdmIdentificacion, 'Eliminación'
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

-- Dump completed on 2024-02-19 16:05:55
