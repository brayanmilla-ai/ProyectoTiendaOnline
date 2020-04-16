CREATE DATABASE  IF NOT EXISTS `db_tiendaonline` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `db_tiendaonline`;
-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: localhost    Database: db_tiendaonline
-- ------------------------------------------------------
-- Server version	5.7.29-log

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
-- Table structure for table `bitacora`
--

DROP TABLE IF EXISTS `bitacora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bitacora` (
  `bitacoracod` int(11) NOT NULL AUTO_INCREMENT,
  `bitacorafch` datetime DEFAULT NULL,
  `bitprograma` varchar(15) DEFAULT NULL,
  `bitdescripcion` varchar(255) DEFAULT NULL,
  `bitobservacion` mediumtext,
  `bitTipo` char(3) DEFAULT NULL,
  `bitusuario` bigint(18) DEFAULT NULL,
  PRIMARY KEY (`bitacoracod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bitacora`
--

LOCK TABLES `bitacora` WRITE;
/*!40000 ALTER TABLE `bitacora` DISABLE KEYS */;
/*!40000 ALTER TABLE `bitacora` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carretilla`
--

DROP TABLE IF EXISTS `carretilla`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carretilla` (
  `usercod` bigint(10) NOT NULL,
  `codprd` bigint(18) NOT NULL,
  `crrctd` int(5) NOT NULL,
  `crrprc` decimal(12,2) NOT NULL,
  `crrfching` datetime NOT NULL,
  PRIMARY KEY (`usercod`,`codprd`),
  KEY `codprd_idx` (`codprd`),
  CONSTRAINT `carretilla_prd_key` FOREIGN KEY (`codprd`) REFERENCES `productos` (`codprd`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `carretilla_user_key` FOREIGN KEY (`usercod`) REFERENCES `usuario` (`usercod`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carretilla`
--

LOCK TABLES `carretilla` WRITE;
/*!40000 ALTER TABLE `carretilla` DISABLE KEYS */;
/*!40000 ALTER TABLE `carretilla` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carretillaanon`
--

DROP TABLE IF EXISTS `carretillaanon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carretillaanon` (
  `anoncod` varchar(128) NOT NULL,
  `codprd` bigint(18) NOT NULL,
  `crrctd` int(5) NOT NULL,
  `crrprc` decimal(12,2) NOT NULL,
  `crrfching` datetime NOT NULL,
  PRIMARY KEY (`anoncod`,`codprd`),
  KEY `codprd_idx` (`codprd`),
  CONSTRAINT `carretillaanon_prd_key` FOREIGN KEY (`codprd`) REFERENCES `productos` (`codprd`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carretillaanon`
--

LOCK TABLES `carretillaanon` WRITE;
/*!40000 ALTER TABLE `carretillaanon` DISABLE KEYS */;
/*!40000 ALTER TABLE `carretillaanon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias` (
  `ctgcod` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ctgdsc` varchar(70) NOT NULL,
  `ctgest` char(3) NOT NULL DEFAULT 'ACT',
  PRIMARY KEY (`ctgcod`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
REPLACE INTO `categorias` VALUES (3,'Salud','ACT'),(4,'Tecnologia','ACT');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factura`
--

DROP TABLE IF EXISTS `factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `factura` (
  `fctcod` bigint(18) NOT NULL AUTO_INCREMENT,
  `fctfch` datetime DEFAULT NULL,
  `userCode` varchar(128) DEFAULT NULL,
  `fctEst` char(3) DEFAULT NULL,
  `fctMonto` decimal(13,2) DEFAULT NULL,
  `fctIva` decimal(13,2) DEFAULT NULL,
  `fctShip` decimal(13,2) DEFAULT NULL,
  `fctTotal` decimal(13,2) DEFAULT NULL,
  `fctPayRef` varchar(255) DEFAULT NULL,
  `fctShpAddr` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`fctcod`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura`
--

LOCK TABLES `factura` WRITE;
/*!40000 ALTER TABLE `factura` DISABLE KEYS */;
REPLACE INTO `factura` VALUES (30,'2020-04-15 14:26:37','2','APR',145.00,0.00,0.00,145.00,'',''),(31,'2020-04-15 14:37:06','15869829771151','APR',145.00,0.00,0.00,145.00,'',''),(32,'2020-04-15 16:23:28','15869893002247','APR',145.00,0.00,0.00,145.00,'',''),(33,'2020-04-15 17:04:35','1','APR',900.00,0.00,0.00,900.00,'','');
/*!40000 ALTER TABLE `factura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factura_detalle`
--

DROP TABLE IF EXISTS `factura_detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `factura_detalle` (
  `fctcod` bigint(18) NOT NULL,
  `codprd` bigint(18) NOT NULL,
  `fctDsc` varchar(70) DEFAULT NULL,
  `fctCtd` int(5) DEFAULT NULL,
  `fctPrc` decimal(12,2) DEFAULT NULL,
  PRIMARY KEY (`fctcod`,`codprd`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura_detalle`
--

LOCK TABLES `factura_detalle` WRITE;
/*!40000 ALTER TABLE `factura_detalle` DISABLE KEYS */;
REPLACE INTO `factura_detalle` VALUES (30,1,'Guantes',1,80.00),(30,3,'Mascarilla',1,65.00),(31,1,'Guantes',1,80.00),(31,3,'Mascarilla',1,65.00),(32,1,'Guantes',1,80.00),(32,3,'Mascarilla',1,65.00),(33,4,'Computadora',1,900.00);
/*!40000 ALTER TABLE `factura_detalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factura_forma_pago`
--

DROP TABLE IF EXISTS `factura_forma_pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `factura_forma_pago` (
  `fctcod` bigint(18) NOT NULL,
  `fctfrmpago` varchar(45) NOT NULL,
  `fctfrmdata` mediumtext,
  PRIMARY KEY (`fctcod`,`fctfrmpago`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura_forma_pago`
--

LOCK TABLES `factura_forma_pago` WRITE;
/*!40000 ALTER TABLE `factura_forma_pago` DISABLE KEYS */;
REPLACE INTO `factura_forma_pago` VALUES (30,'PAYPAL','{\"id\":\"PAYID-L2LW3PQ5MH92879011915723\",\"intent\":\"sale\",\"state\":\"approved\",\"cart\":\"83264580CX043680J\",\"payer\":{\"payment_method\":\"paypal\",\"status\":\"VERIFIED\",\"payer_info\":{\"email\":\"sb-c6gqw1449255@personal.example.com\",\"first_name\":\"John\",\"last_name\":\"Doe\",\"payer_id\":\"EL6ZMAUPPVC2J\",\"shipping_address\":{\"recipient_name\":\"John Doe\",\"line1\":\"Free Trade Zone\",\"city\":\"Tegucigalpa\",\"state\":\"Tegucigalpa\",\"postal_code\":\"12345\",\"country_code\":\"HN\"},\"phone\":\"5046444234\",\"country_code\":\"HN\"}},\"transactions\":[{\"amount\":{\"total\":\"145.00\",\"currency\":\"USD\",\"details\":{\"subtotal\":\"145.00\",\"shipping\":\"0.00\",\"insurance\":\"0.00\",\"handling_fee\":\"0.00\",\"shipping_discount\":\"0.00\"}},\"payee\":{\"merchant_id\":\"LPY776683DQWS\",\"email\":\"sb-hzdhd687909@business.example.com\"},\"description\":\"Guantes\",\"note_to_payee\":\"Orden de Compra\",\"item_list\":{\"items\":[{\"name\":\"Guantes\",\"sku\":\"SKU1\",\"price\":\"80.00\",\"currency\":\"USD\",\"tax\":\"0.00\",\"quantity\":1},{\"name\":\"Mascarilla\",\"sku\":\"SKU2\",\"price\":\"65.00\",\"currency\":\"USD\",\"tax\":\"0.00\",\"quantity\":1}],\"shipping_address\":{\"recipient_name\":\"John Doe\",\"line1\":\"Free Trade Zone\",\"city\":\"Tegucigalpa\",\"state\":\"Tegucigalpa\",\"postal_code\":\"12345\",\"country_code\":\"HN\"}},\"related_resources\":[{\"sale\":{\"id\":\"2H7982749V0420709\",\"state\":\"completed\",\"amount\":{\"total\":\"145.00\",\"currency\":\"USD\",\"details\":{\"subtotal\":\"145.00\",\"shipping\":\"0.00\",\"insurance\":\"0.00\",\"handling_fee\":\"0.00\",\"shipping_discount\":\"0.00\"}},\"payment_mode\":\"INSTANT_TRANSFER\",\"protection_eligibility\":\"ELIGIBLE\",\"protection_eligibility_type\":\"ITEM_NOT_RECEIVED_ELIGIBLE,UNAUTHORIZED_PAYMENT_ELIGIBLE\",\"transaction_fee\":{\"value\":\"7.41\",\"currency\":\"USD\"},\"parent_payment\":\"PAYID-L2LW3PQ5MH92879011915723\",\"create_time\":\"2020-04-15T20:26:26Z\",\"update_time\":\"2020-04-15T20:26:26Z\",\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v1/payments/sale/2H7982749V0420709\",\"rel\":\"self\",\"method\":\"GET\"},{\"href\":\"https://api.sandbox.paypal.com/v1/payments/sale/2H7982749V0420709/refund\",\"rel\":\"refund\",\"method\":\"POST\"},{\"href\":\"https://api.sandbox.paypal.com/v1/payments/payment/PAYID-L2LW3PQ5MH92879011915723\",\"rel\":\"parent_payment\",\"method\":\"GET\"}]}}]}],\"create_time\":\"2020-04-15T20:25:34Z\",\"update_time\":\"2020-04-15T20:26:26Z\",\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v1/payments/payment/PAYID-L2LW3PQ5MH92879011915723\",\"rel\":\"self\",\"method\":\"GET\"}]}'),(31,'PAYPAL','{\"id\":\"PAYID-L2LXAVQ91681733XJ480634A\",\"intent\":\"sale\",\"state\":\"approved\",\"cart\":\"7UH18004E6494704L\",\"payer\":{\"payment_method\":\"paypal\",\"status\":\"VERIFIED\",\"payer_info\":{\"email\":\"sb-c6gqw1449255@personal.example.com\",\"first_name\":\"John\",\"last_name\":\"Doe\",\"payer_id\":\"EL6ZMAUPPVC2J\",\"shipping_address\":{\"recipient_name\":\"John Doe\",\"line1\":\"Free Trade Zone\",\"city\":\"Tegucigalpa\",\"state\":\"Tegucigalpa\",\"postal_code\":\"12345\",\"country_code\":\"HN\"},\"phone\":\"5046444234\",\"country_code\":\"HN\"}},\"transactions\":[{\"amount\":{\"total\":\"145.00\",\"currency\":\"USD\",\"details\":{\"subtotal\":\"145.00\",\"shipping\":\"0.00\",\"insurance\":\"0.00\",\"handling_fee\":\"0.00\",\"shipping_discount\":\"0.00\"}},\"payee\":{\"merchant_id\":\"LPY776683DQWS\",\"email\":\"sb-hzdhd687909@business.example.com\"},\"description\":\"Guantes\",\"note_to_payee\":\"Orden de Compra\",\"item_list\":{\"items\":[{\"name\":\"Guantes\",\"sku\":\"SKU1\",\"price\":\"80.00\",\"currency\":\"USD\",\"tax\":\"0.00\",\"quantity\":1},{\"name\":\"Mascarilla\",\"sku\":\"SKU2\",\"price\":\"65.00\",\"currency\":\"USD\",\"tax\":\"0.00\",\"quantity\":1}],\"shipping_address\":{\"recipient_name\":\"John Doe\",\"line1\":\"Free Trade Zone\",\"city\":\"Tegucigalpa\",\"state\":\"Tegucigalpa\",\"postal_code\":\"12345\",\"country_code\":\"HN\"}},\"related_resources\":[{\"sale\":{\"id\":\"3YF83323MR935754Y\",\"state\":\"completed\",\"amount\":{\"total\":\"145.00\",\"currency\":\"USD\",\"details\":{\"subtotal\":\"145.00\",\"shipping\":\"0.00\",\"insurance\":\"0.00\",\"handling_fee\":\"0.00\",\"shipping_discount\":\"0.00\"}},\"payment_mode\":\"INSTANT_TRANSFER\",\"protection_eligibility\":\"ELIGIBLE\",\"protection_eligibility_type\":\"ITEM_NOT_RECEIVED_ELIGIBLE,UNAUTHORIZED_PAYMENT_ELIGIBLE\",\"transaction_fee\":{\"value\":\"7.41\",\"currency\":\"USD\"},\"parent_payment\":\"PAYID-L2LXAVQ91681733XJ480634A\",\"create_time\":\"2020-04-15T20:37:02Z\",\"update_time\":\"2020-04-15T20:37:02Z\",\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v1/payments/sale/3YF83323MR935754Y\",\"rel\":\"self\",\"method\":\"GET\"},{\"href\":\"https://api.sandbox.paypal.com/v1/payments/sale/3YF83323MR935754Y/refund\",\"rel\":\"refund\",\"method\":\"POST\"},{\"href\":\"https://api.sandbox.paypal.com/v1/payments/payment/PAYID-L2LXAVQ91681733XJ480634A\",\"rel\":\"parent_payment\",\"method\":\"GET\"}]}}]}],\"create_time\":\"2020-04-15T20:36:38Z\",\"update_time\":\"2020-04-15T20:37:02Z\",\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v1/payments/payment/PAYID-L2LXAVQ91681733XJ480634A\",\"rel\":\"self\",\"method\":\"GET\"}]}'),(32,'PAYPAL','{\"id\":\"PAYID-L2LYSJI75P07999JT844064H\",\"intent\":\"sale\",\"state\":\"approved\",\"cart\":\"4KJ50729F6795633X\",\"payer\":{\"payment_method\":\"paypal\",\"status\":\"VERIFIED\",\"payer_info\":{\"email\":\"sb-c6gqw1449255@personal.example.com\",\"first_name\":\"John\",\"last_name\":\"Doe\",\"payer_id\":\"EL6ZMAUPPVC2J\",\"shipping_address\":{\"recipient_name\":\"John Doe\",\"line1\":\"Free Trade Zone\",\"city\":\"Tegucigalpa\",\"state\":\"Tegucigalpa\",\"postal_code\":\"12345\",\"country_code\":\"HN\"},\"phone\":\"5046444234\",\"country_code\":\"HN\"}},\"transactions\":[{\"amount\":{\"total\":\"145.00\",\"currency\":\"USD\",\"details\":{\"subtotal\":\"145.00\",\"shipping\":\"0.00\",\"insurance\":\"0.00\",\"handling_fee\":\"0.00\",\"shipping_discount\":\"0.00\"}},\"payee\":{\"merchant_id\":\"LPY776683DQWS\",\"email\":\"sb-hzdhd687909@business.example.com\"},\"description\":\"Guantes\",\"note_to_payee\":\"Orden de Compra\",\"item_list\":{\"items\":[{\"name\":\"Guantes\",\"sku\":\"SKU1\",\"price\":\"80.00\",\"currency\":\"USD\",\"tax\":\"0.00\",\"quantity\":1},{\"name\":\"Mascarilla\",\"sku\":\"SKU2\",\"price\":\"65.00\",\"currency\":\"USD\",\"tax\":\"0.00\",\"quantity\":1}],\"shipping_address\":{\"recipient_name\":\"John Doe\",\"line1\":\"Free Trade Zone\",\"city\":\"Tegucigalpa\",\"state\":\"Tegucigalpa\",\"postal_code\":\"12345\",\"country_code\":\"HN\"}},\"related_resources\":[{\"sale\":{\"id\":\"44P370436V2985000\",\"state\":\"completed\",\"amount\":{\"total\":\"145.00\",\"currency\":\"USD\",\"details\":{\"subtotal\":\"145.00\",\"shipping\":\"0.00\",\"insurance\":\"0.00\",\"handling_fee\":\"0.00\",\"shipping_discount\":\"0.00\"}},\"payment_mode\":\"INSTANT_TRANSFER\",\"protection_eligibility\":\"ELIGIBLE\",\"protection_eligibility_type\":\"ITEM_NOT_RECEIVED_ELIGIBLE,UNAUTHORIZED_PAYMENT_ELIGIBLE\",\"transaction_fee\":{\"value\":\"7.41\",\"currency\":\"USD\"},\"parent_payment\":\"PAYID-L2LYSJI75P07999JT844064H\",\"create_time\":\"2020-04-15T22:23:22Z\",\"update_time\":\"2020-04-15T22:23:22Z\",\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v1/payments/sale/44P370436V2985000\",\"rel\":\"self\",\"method\":\"GET\"},{\"href\":\"https://api.sandbox.paypal.com/v1/payments/sale/44P370436V2985000/refund\",\"rel\":\"refund\",\"method\":\"POST\"},{\"href\":\"https://api.sandbox.paypal.com/v1/payments/payment/PAYID-L2LYSJI75P07999JT844064H\",\"rel\":\"parent_payment\",\"method\":\"GET\"}]}}]}],\"create_time\":\"2020-04-15T22:22:29Z\",\"update_time\":\"2020-04-15T22:23:22Z\",\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v1/payments/payment/PAYID-L2LYSJI75P07999JT844064H\",\"rel\":\"self\",\"method\":\"GET\"}]}'),(33,'PAYPAL','{\"id\":\"PAYID-L2LZFZQ69U63171259370114\",\"intent\":\"sale\",\"state\":\"created\",\"cart\":\"5NV88440LG277831P\",\"payer\":{\"payment_method\":\"paypal\",\"status\":\"VERIFIED\",\"payer_info\":{\"email\":\"sb-c6gqw1449255@personal.example.com\",\"first_name\":\"John\",\"last_name\":\"Doe\",\"payer_id\":\"EL6ZMAUPPVC2J\",\"shipping_address\":{\"recipient_name\":\"John Doe\",\"line1\":\"Free Trade Zone\",\"city\":\"Tegucigalpa\",\"state\":\"Tegucigalpa\",\"postal_code\":\"12345\",\"country_code\":\"HN\"},\"country_code\":\"HN\"}},\"transactions\":[{\"amount\":{\"total\":\"900.00\",\"currency\":\"USD\"},\"payee\":{\"merchant_id\":\"LPY776683DQWS\",\"email\":\"sb-hzdhd687909@business.example.com\"},\"note_to_payee\":\"Orden de Compra\",\"item_list\":{\"items\":[{\"name\":\"Computadora\",\"sku\":\"PRD3\",\"price\":\"900.00\",\"currency\":\"USD\",\"quantity\":1}],\"shipping_address\":{\"recipient_name\":\"John Doe\",\"line1\":\"Free Trade Zone\",\"city\":\"Tegucigalpa\",\"state\":\"Tegucigalpa\",\"postal_code\":\"12345\",\"country_code\":\"HN\"}},\"related_resources\":[],\"notify_url\":\"http://127.0.0.1:83/proyectosbrayanmilla/simplePHPMVC-nw202001NO/index.php?page=confirm\"}],\"redirect_urls\":{\"return_url\":\"http://127.0.0.1:83/tiendaOnline/index.php?page=respuesta&tocken=5f420a640e158640b7b5bd3bb6b47734&paymentId=PAYID-L2LZFZQ69U63171259370114\",\"cancel_url\":\"http://127.0.0.1:83/tiendaOnline/index.php?page=checkoutcnl\"},\"create_time\":\"2020-04-15T23:04:05Z\",\"update_time\":\"2020-04-15T23:04:36Z\",\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v1/payments/payment/PAYID-L2LZFZQ69U63171259370114\",\"rel\":\"self\",\"method\":\"GET\"},{\"href\":\"https://api.sandbox.paypal.com/v1/payments/payment/PAYID-L2LZFZQ69U63171259370114/execute\",\"rel\":\"execute\",\"method\":\"POST\"},{\"href\":\"https://www.sandbox.paypal.com/cgi-bin/webscr?cmd=_express-checkout&token=EC-5NV88440LG277831P\",\"rel\":\"approval_url\",\"method\":\"REDIRECT\"}]}');
/*!40000 ALTER TABLE `factura_forma_pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funciones`
--

DROP TABLE IF EXISTS `funciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `funciones` (
  `fncod` varchar(15) NOT NULL,
  `fndsc` varchar(45) DEFAULT NULL,
  `fnest` char(3) DEFAULT NULL,
  `fntyp` char(3) DEFAULT NULL,
  PRIMARY KEY (`fncod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funciones`
--

LOCK TABLES `funciones` WRITE;
/*!40000 ALTER TABLE `funciones` DISABLE KEYS */;
REPLACE INTO `funciones` VALUES ('cartauth','cartauth','ACT','PRG'),('cartauthClient','Carrito compras cliente','ACT','PGR'),('categorias','categorias','ACT','PRG'),('checkoutapr','Aprobación de pago','ACT','PGR'),('checkoutcnl','Cancelación de pago','ACT','PGR'),('confir_pago_cli','Confirmacion autenticado','ACT','PGR'),('dashboard','Menu Principal de Administración','ACT','PGR'),('historialAnon','Historial Anonimo','ACT','PGR'),('historialUser','Historia Usuario','ACT','PGR'),('parametros','parametros','ACT','PRG'),('productimg','productimg','ACT','PRG'),('producto','producto','ACT','PRG'),('productos','productos','ACT','PRG'),('programa','Función','ACT','PGR'),('programas','Trabajar con Funciones','ACT','PGR'),('rol','Rol','ACT','PGR'),('roles','Trabajar con Roles','ACT','PGR'),('security','security','ACT','PRG'),('user','Usuario','ACT','PGR'),('users','Trabajar con Usuarios','ACT','PGR');
/*!40000 ALTER TABLE `funciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funciones_roles`
--

DROP TABLE IF EXISTS `funciones_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `funciones_roles` (
  `rolescod` varchar(15) NOT NULL,
  `fncod` varchar(15) NOT NULL,
  `fnrolest` char(3) DEFAULT NULL,
  `fnexp` datetime DEFAULT NULL,
  PRIMARY KEY (`rolescod`,`fncod`),
  KEY `rol_funcion_key_idx` (`fncod`),
  CONSTRAINT `funcion_rol_key` FOREIGN KEY (`rolescod`) REFERENCES `roles` (`rolescod`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `rol_funcion_key` FOREIGN KEY (`fncod`) REFERENCES `funciones` (`fncod`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funciones_roles`
--

LOCK TABLES `funciones_roles` WRITE;
/*!40000 ALTER TABLE `funciones_roles` DISABLE KEYS */;
REPLACE INTO `funciones_roles` VALUES ('ADM','cartauth','ACT',NULL),('ADM','cartauthClient','ACT',NULL),('ADM','categorias','ACT',NULL),('ADM','checkoutapr','ACT',NULL),('ADM','checkoutcnl','ACT',NULL),('ADM','confir_pago_cli','ACT',NULL),('ADM','dashboard','ACT',NULL),('ADM','historialUser','ACT',NULL),('ADM','parametros','ACT',NULL),('ADM','productimg','ACT',NULL),('ADM','producto','ACT',NULL),('ADM','productos','ACT',NULL),('ADM','programa','ACT',NULL),('ADM','programas','ACT',NULL),('ADM','rol','ACT',NULL),('ADM','roles','ACT',NULL),('ADM','security','ACT',NULL),('ADM','user','ACT',NULL),('ADM','users','ACT',NULL),('CLT','cartauthClient','ACT',NULL),('CLT','checkoutapr','ACT',NULL),('CLT','checkoutcnl','ACT',NULL),('CLT','confir_pago_cli','ACT',NULL),('CLT','historialUser','ACT',NULL);
/*!40000 ALTER TABLE `funciones_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `codprd` bigint(18) NOT NULL AUTO_INCREMENT,
  `dscprd` varchar(70) NOT NULL,
  `sdscprd` varchar(255) NOT NULL,
  `ldscprd` text,
  `skuprd` varchar(128) NOT NULL,
  `bcdprd` varchar(128) NOT NULL,
  `stkprd` int(11) NOT NULL,
  `typprd` char(3) NOT NULL,
  `prcprd` decimal(12,2) NOT NULL,
  `urlprd` varchar(255) DEFAULT NULL,
  `urlthbprd` varchar(255) DEFAULT NULL,
  `estprd` char(3) NOT NULL,
  `productoscol` varchar(45) DEFAULT NULL,
  `ctgcod` int(10) DEFAULT NULL,
  PRIMARY KEY (`codprd`),
  UNIQUE KEY `skuprd_UNIQUE` (`skuprd`),
  UNIQUE KEY `bcdprd_UNIQUE` (`bcdprd`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
REPLACE INTO `productos` VALUES (1,'Guantes','Guantes de latex','Guantes de latex para enfermeria','SKU1','0001',47,'RTL',80.00,'public/prods/1_guantesLatex.jpg','public/prods/1_guantesLatex.jpg','ACT',NULL,3),(3,'Mascarilla','Mascarilla proteccion','Mascarilla proteccion total','SKU2','0002',47,'RTL',65.00,'public/prods/3_mascarilla.jpg','public/prods/3_mascarilla.jpg','ACT',NULL,3),(4,'Computadora','Laptop','Laptop xyz','PRD3','003',49,'RTL',900.00,'public/prods/4_laptop.jpg','public/prods/4_laptop.jpg','ACT',NULL,4);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `rolescod` varchar(15) NOT NULL,
  `rolesdsc` varchar(45) DEFAULT NULL,
  `rolesest` char(3) DEFAULT NULL,
  PRIMARY KEY (`rolescod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
REPLACE INTO `roles` VALUES ('ADM','Administrador','ACT'),('CLT','Cliente','ACT');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles_usuarios`
--

DROP TABLE IF EXISTS `roles_usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles_usuarios` (
  `usercod` bigint(10) NOT NULL,
  `rolescod` varchar(15) NOT NULL,
  `roleuserest` char(3) DEFAULT NULL,
  `roleuserfch` datetime DEFAULT NULL,
  `roleuserexp` datetime DEFAULT NULL,
  PRIMARY KEY (`usercod`,`rolescod`),
  KEY `rol_usuario_key_idx` (`rolescod`),
  CONSTRAINT `rol_usuario_key` FOREIGN KEY (`rolescod`) REFERENCES `roles` (`rolescod`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `usuario_rol_key` FOREIGN KEY (`usercod`) REFERENCES `usuario` (`usercod`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles_usuarios`
--

LOCK TABLES `roles_usuarios` WRITE;
/*!40000 ALTER TABLE `roles_usuarios` DISABLE KEYS */;
REPLACE INTO `roles_usuarios` VALUES (1,'ADM','ACT','2020-04-14 19:59:58',NULL),(2,'CLT','ACT','2020-04-14 19:59:36',NULL);
/*!40000 ALTER TABLE `roles_usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `usercod` bigint(10) NOT NULL AUTO_INCREMENT,
  `useremail` varchar(80) DEFAULT NULL,
  `username` varchar(80) DEFAULT NULL,
  `userpswd` varchar(128) DEFAULT NULL,
  `userfching` datetime DEFAULT NULL,
  `userpswdest` char(3) DEFAULT NULL,
  `userpswdexp` datetime DEFAULT NULL,
  `userest` char(3) DEFAULT NULL,
  `useractcod` varchar(128) DEFAULT NULL,
  `userpswdchg` varchar(128) DEFAULT NULL,
  `usertipo` char(3) DEFAULT NULL COMMENT 'Tipo de Usuario, Normal, Consultor o Cliente',
  PRIMARY KEY (`usercod`),
  UNIQUE KEY `useremail_UNIQUE` (`useremail`),
  KEY `usertipo` (`usertipo`,`useremail`,`usercod`,`userest`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
REPLACE INTO `usuario` VALUES (1,'admin@demo.com','Administrador','6a35dc054828037a8c4518070d1e8867','2020-04-02 23:05:16','VGT',NULL,'ACT','',NULL,'ADM'),(2,'nilsonvcm@gmail.com','Nilson Bladimir Claros Mejia','5f56611890860defb7523dcc981c4db8','2020-04-06 19:20:13','VGT',NULL,'ACT','',NULL,'CLT');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'db_tiendaonline'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-15 17:06:17
