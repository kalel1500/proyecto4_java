-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-03-2019 a las 20:26:37
-- Versión del servidor: 10.1.21-MariaDB
-- Versión de PHP: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bd_proyecto_4`
--
DROP DATABASE IF EXISTS bd_proyecto_4;
CREATE DATABASE IF NOT EXISTS `bd_proyecto_4` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `bd_proyecto_4`;

-- --------------------------------------------------------
-- Estructura de tabla para la tabla `tbl_usuario`

DROP TABLE IF EXISTS `tbl_usuario`;
CREATE TABLE IF NOT EXISTS `tbl_usuario` (
	`id_usuario` int(11) NOT NULL AUTO_INCREMENT,
	`email_usuario` varchar(255) NOT NULL,
	`password_usuario` varchar(255) NOT NULL,
	`nombre_usuario` varchar(255) DEFAULT NULL,
	`apellido_usuario` varchar(255) DEFAULT NULL,
	`grupo_usuario` enum('usuario','administrador') DEFAULT NULL,
	PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------
-- Estructura de tabla para la tabla `tbl_lloc`

DROP TABLE IF EXISTS `tbl_lloc`;
CREATE TABLE IF NOT EXISTS `tbl_lloc` (
	`lloc_id` int(11) NOT NULL AUTO_INCREMENT,
	`lloc_bloc` enum('Bloc 1','Bloc 2','Bloc 3','Bloc 4','Bloc 5','Bloc 6','Bloc 7','Bloc 8') COLLATE utf8_unicode_ci NOT NULL,
	`lloc_passadis` enum('Passadis 1','Passadis 2','Passadis 3','Passadis 4','Passadis 5','Passadis 6','Passadis 7','Passadis 8','Passadis 9','Passadis 10','Passadis 11','Passadis 12') COLLATE utf8_unicode_ci NOT NULL,
	`lloc_lleixa` enum('Lleixa 1','Lleixa 2','Lleixa 3','Lleixa 4','Lleixa 5','Lleixa 6','Lleixa 7','Lleixa 8') COLLATE utf8_unicode_ci NOT NULL,
	PRIMARY KEY (`lloc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- --------------------------------------------------------
-- Estructura de tabla para la tabla `tbl_estoc`

DROP TABLE IF EXISTS `tbl_estoc`;
CREATE TABLE IF NOT EXISTS `tbl_estoc` (
	`estoc_id` int(11) NOT NULL AUTO_INCREMENT,
	`estoc_quantitat` int(5) NOT NULL,
	`estoc_maxim` int(5) NOT NULL,
	`estoc_minim` int(5) NOT NULL,
	`producte_id` int(11)  NULL,
	`lloc_id` int(11)  NULL,
	PRIMARY KEY (`estoc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- --------------------------------------------------------
-- Estructura de tabla para la tabla `tbl_proveidor`

/*DROP TABLE IF EXISTS `tbl_proveidor`;
CREATE TABLE IF NOT EXISTS `tbl_proveidor` (
	`proveidor_id` int(11) NOT NULL AUTO_INCREMENT,
	`proveidor_nom` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
	`proveidor_adre` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
	`proveidor_email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
	PRIMARY KEY (`proveidor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;*/


-- --------------------------------------------------------
-- Estructura de tabla para la tabla `tbl_categoria`

DROP TABLE IF EXISTS `tbl_categoria`;
CREATE TABLE IF NOT EXISTS `tbl_categoria`(
	`categoria_id` int(11) NOT NULL AUTO_INCREMENT,
	`categoria_nom` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
	PRIMARY KEY (`categoria_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- --------------------------------------------------------
-- Estructura de tabla para la tabla `tbl_serie`

DROP TABLE IF EXISTS `tbl_serie`;
CREATE TABLE IF NOT EXISTS `tbl_serie` (
	`serie_id` int(11) NOT NULL AUTO_INCREMENT,
	`serie_nom` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
	`categoria_id` int(11) NULL,
	PRIMARY KEY (`serie_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- --------------------------------------------------------
-- Estructura de tabla para la tabla `tbl_producte`

DROP TABLE IF EXISTS `tbl_producte`;
CREATE TABLE IF NOT EXISTS `tbl_producte` (
	`producte_id` int(11) NOT NULL AUTO_INCREMENT,
	`producte_nom` varchar(30) COLLATE utf8_unicode_ci NOT NULL UNIQUE KEY,
	`producte_fotoRuta` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
	`producte_fotoNom` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
	`producte_fotoExt` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
	`producte_preu` DOUBLE COLLATE utf8_unicode_ci NOT NULL,
	`producte_descripcio` text COLLATE utf8_unicode_ci NULL,
	`producte_descompte` int(3) NULL,
	`serie_id` int(11) NULL,
	PRIMARY KEY (`producte_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



-- --------------------------------------------------------
-- Estructura de tabla para la tabla `tbl_comanda`

/*DROP TABLE IF EXISTS `tbl_comanda`;
CREATE TABLE IF NOT EXISTS `tbl_comanda` (
	`comanda_id` int(11) NOT NULL AUTO_INCREMENT,
	`comanda_data` date NOT NULL,
	`proveidor_id` int(11)  NULL,
	PRIMARY KEY (`comanda_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;*/


-- --------------------------------------------------------
-- Estructura de tabla para la tabla `tbl_detall_comandaanda`

/*DROP TABLE IF EXISTS `tbl_detall_comanda`;
CREATE TABLE IF NOT EXISTS `tbl_detall_comanda` (
	`detallComanda_id` int(11) NOT NULL AUTO_INCREMENT,
	`detallComanda_quantitat` int(5) NOT NULL,
	`comanda_id` int(11) NOT NULL,
	`producte_id` int(11)  NULL,
	PRIMARY KEY (`detallComanda_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;*/




-- -------------------------------------------------------
-- RELACIONES PARA LAS TABLAS 
-- ---------------------------------------------------

-- `tbl_serie` `tbl_categoria`:
ALTER TABLE `tbl_serie`
	ADD CONSTRAINT `FK_serie_categoria` FOREIGN KEY (categoria_id) REFERENCES `tbl_categoria`(categoria_id);
-- ---------------------------------------------------

-- `tbl_producte`  `tbl_serie`:
ALTER TABLE `tbl_producte`
	ADD CONSTRAINT `FK_prod_serie` FOREIGN KEY (serie_id) REFERENCES `tbl_serie`(serie_id);
-- ---------------------------------------------------
/*
-- `tbl_detall_comandaanda` `tbl_producte`:
ALTER TABLE `tbl_detall_comanda`
	ADD CONSTRAINT `FK_detallComanda_producte` FOREIGN KEY (producte_id) REFERENCES `tbl_producte`(producte_id);
-- ---------------------------------------------------

-- `tbl_detall_comandaanda` `tbl_comanda`:
ALTER TABLE `tbl_detall_comanda`
	ADD CONSTRAINT `FK_detall_com_comanda` FOREIGN KEY (comanda_id) REFERENCES `tbl_comanda`(comanda_id);
-- ---------------------------------------------------

-- `tbl_comanda` `tbl_proveidor`:
ALTER TABLE `tbl_comanda`
	ADD CONSTRAINT `FK_comanda_prov` FOREIGN KEY (prov_id) REFERENCES `tbl_proveidor`(prov_id);
-- ---------------------------------------------------
*/

-- `tbl_estoc` `tbl_producte`:
ALTER TABLE `tbl_estoc`
	ADD CONSTRAINT `FK_estoc_producte` FOREIGN KEY (producte_id) REFERENCES `tbl_producte`(producte_id);
-- ---------------------------------------------------

-- `tbl_estoc `tbl_lloc`:
ALTER TABLE `tbl_estoc`
	ADD CONSTRAINT `FK_estoc_lloc` FOREIGN KEY (lloc_id) REFERENCES `tbl_lloc`(lloc_id);
-- ----------------------------------------


-- -------------------------------------------------------
-- DATOS DE LAS TABLAS 
-- ---------------------------------------------------

-- TRUNCATE TABLE `tbl_usuario`;
INSERT INTO `tbl_usuario` (`nombre_usuario`,`apellido_usuario`,`password_usuario`,`email_usuario`,`grupo_usuario`) VALUES
('Admin',		'Empresa',	'1234',	'admin@gmail.com','administrador'),
('Stefan',		'Salvatore','1234',	'usu01@gmail.com','usuario'),
('Damon',		'Salvatore','1234',	'usu02@gmail.com','usuario'),
('Elena',		'Gilbert',	'1234',	'usu03@gmail.com','usuario'),
('Jeremy',		'Gilbert',	'1234',	'usu04@gmail.com','usuario'),
('Bonnie',		'Bennett',	'1234',	'usu05@gmail.com','usuario'),
('Caroline',	'Forbes',	'1234',	'usu06@gmail.com','usuario'),
('Matt',		'Donovan',	'1234',	'usu07@gmail.com','usuario'),
('Tyler',		'Lockwood',	'1234',	'usu08@gmail.com','usuario'),
('Alaric',		'Saltzman',	'1234',	'usu09@gmail.com','usuario'),
('Katherine',	'Pierce',	'1234',	'usu11@gmail.com','usuario'),
('Kai',			'Parker',	'1234',	'usu12@gmail.com','usuario'),
('Niklaus',		'Mikaelson','1234',	'usu13@gmail.com','usuario'),
('Elijah',		'Mikaelson','1234',	'usu14@gmail.com','usuario'),
('Rebekah ',	'Mikaelson','1234',	'usu15@gmail.com','usuario'),
('Cole',		'Mikaelson','1234',	'usu16@gmail.com','usuario'),
('Fin',			'Mikaelson','1234',	'usu17@gmail.com','usuario'),
('Freya',		'Mikaelson','1234',	'usu18@gmail.com','usuario');


-- TRUNCATE TABLE `tbl_categoria`;
INSERT INTO `tbl_categoria` (`categoria_nom`) VALUES
('Luz de interior'),
('Luz de exterior'),
('Lamparas'),
('LED'),
('Control Alumbrado');


-- TRUNCATE TABLE `tbl_serie`;
INSERT INTO `tbl_serie` (`serie_nom`,`categoria_id`) VALUES
('Suspendida',			(SELECT `categoria_id` FROM `tbl_categoria` WHERE `categoria_nom` = 'Luz de interior')),
('Empotrables',			(SELECT `categoria_id` FROM `tbl_categoria` WHERE `categoria_nom` = 'Luz de interior')),
('Apliques',			(SELECT `categoria_id` FROM `tbl_categoria` WHERE `categoria_nom` = 'Luz de interior')),
('Downlights',			(SELECT `categoria_id` FROM `tbl_categoria` WHERE `categoria_nom` = 'Luz de interior')),
('Alumbrado Publico',	(SELECT `categoria_id` FROM `tbl_categoria` WHERE `categoria_nom` = 'Luz de exterior')),
('Proyectores',			(SELECT `categoria_id` FROM `tbl_categoria` WHERE `categoria_nom` = 'Luz de exterior')),
('Tuneles',				(SELECT `categoria_id` FROM `tbl_categoria` WHERE `categoria_nom` = 'Luz de exterior')),
('Grandes Superficies',	(SELECT `categoria_id` FROM `tbl_categoria` WHERE `categoria_nom` = 'Luz de exterior')),
('Halogenas',			(SELECT `categoria_id` FROM `tbl_categoria` WHERE `categoria_nom` = 'Lamparas')),
('Fluorescentes',		(SELECT `categoria_id` FROM `tbl_categoria` WHERE `categoria_nom` = 'Lamparas')),
('Compactas',			(SELECT `categoria_id` FROM `tbl_categoria` WHERE `categoria_nom` = 'Lamparas')),
('Incandescentes',		(SELECT `categoria_id` FROM `tbl_categoria` WHERE `categoria_nom` = 'Lamparas')),
('Tubos',				(SELECT `categoria_id` FROM `tbl_categoria` WHERE `categoria_nom` = 'LED')),
('Focos',				(SELECT `categoria_id` FROM `tbl_categoria` WHERE `categoria_nom` = 'LED')),
('HID',					(SELECT `categoria_id` FROM `tbl_categoria` WHERE `categoria_nom` = 'LED')),
('Velas y Reflejo',		(SELECT `categoria_id` FROM `tbl_categoria` WHERE `categoria_nom` = 'LED')),
('User Interface',		(SELECT `categoria_id` FROM `tbl_categoria` WHERE `categoria_nom` = 'Control Alumbrado')),
('Sensors',				(SELECT `categoria_id` FROM `tbl_categoria` WHERE `categoria_nom` = 'Control Alumbrado')),
('Relay Controllers',	(SELECT `categoria_id` FROM `tbl_categoria` WHERE `categoria_nom` = 'Control Alumbrado')),
('Reguladores',			(SELECT `categoria_id` FROM `tbl_categoria` WHERE `categoria_nom` = 'Control Alumbrado'));


-- TRUNCATE TABLE `tbl_producte`;
INSERT INTO `tbl_producte` (`producte_nom`,`producte_fotoRuta`,`producte_fotoNom`,`producte_fotoExt`,`producte_preu`, `producte_descompte`,`serie_id`,`producte_descripcio`) VALUES
('SP534P',				'img/productos/',	'1_SP534P',				'.jpg',	22.5,	5,		(SELECT `serie_id` FROM `tbl_serie` WHERE `serie_nom` = 'Suspendida'),			'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed quis commodo lacus, vel molestie augue. Fusce a blandit sem, ac auctor enim. Nam ut augue tristique purus fringilla facilisis sit amet ac eros. Nulla sit amet tortor gravida, molestie nibh faucibus, interdum ex. Donec eget dui neque. Pellentesque eu libero dignissim, lobortis est ac, rhoncus lacus. Vivamus a turpis quis sapien maximus iaculis ac ac dui. In mollis lorem volutpat placerat egestas.'),
('PT570P',				'img/productos/',	'2_PT570P',				'.jpg',	17.24,	NULL,	(SELECT `serie_id` FROM `tbl_serie` WHERE `serie_nom` = 'Suspendida'),			'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed quis commodo lacus, vel molestie augue. Fusce a blandit sem, ac auctor enim. Nam ut augue tristique purus fringilla facilisis sit amet ac eros. Nulla sit amet tortor gravida, molestie nibh faucibus, interdum ex. Donec eget dui neque. Pellentesque eu libero dignissim, lobortis est ac, rhoncus lacus. Vivamus a turpis quis sapien maximus iaculis ac ac dui. In mollis lorem volutpat placerat egestas.'),
('RC132V',				'img/productos/',	'3_RC132V',				'.jpg',	6.23,	5,		(SELECT `serie_id` FROM `tbl_serie` WHERE `serie_nom` = 'Empotrables'),			'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed quis commodo lacus, vel molestie augue. Fusce a blandit sem, ac auctor enim. Nam ut augue tristique purus fringilla facilisis sit amet ac eros. Nulla sit amet tortor gravida, molestie nibh faucibus, interdum ex. Donec eget dui neque. Pellentesque eu libero dignissim, lobortis est ac, rhoncus lacus. Vivamus a turpis quis sapien maximus iaculis ac ac dui. In mollis lorem volutpat placerat egestas.'),
('RC464B',				'img/productos/',	'4_RC464B',				'.jpg',	23.05,	5,		(SELECT `serie_id` FROM `tbl_serie` WHERE `serie_nom` = 'Empotrables'),			'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed quis commodo lacus, vel molestie augue. Fusce a blandit sem, ac auctor enim. Nam ut augue tristique purus fringilla facilisis sit amet ac eros. Nulla sit amet tortor gravida, molestie nibh faucibus, interdum ex. Donec eget dui neque. Pellentesque eu libero dignissim, lobortis est ac, rhoncus lacus. Vivamus a turpis quis sapien maximus iaculis ac ac dui. In mollis lorem volutpat placerat egestas.'),
('WL130V',				'img/productos/',	'5_WL130V',				'.jpg',	20.5,	NULL,	(SELECT `serie_id` FROM `tbl_serie` WHERE `serie_nom` = 'Apliques'),			'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed quis commodo lacus, vel molestie augue. Fusce a blandit sem, ac auctor enim. Nam ut augue tristique purus fringilla facilisis sit amet ac eros. Nulla sit amet tortor gravida, molestie nibh faucibus, interdum ex. Donec eget dui neque. Pellentesque eu libero dignissim, lobortis est ac, rhoncus lacus. Vivamus a turpis quis sapien maximus iaculis ac ac dui. In mollis lorem volutpat placerat egestas.'),
('WL060V',				'img/productos/',	'6_WL060V',				'.jpg',	5.45,	5,		(SELECT `serie_id` FROM `tbl_serie` WHERE `serie_nom` = 'Apliques'),			'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed quis commodo lacus, vel molestie augue. Fusce a blandit sem, ac auctor enim. Nam ut augue tristique purus fringilla facilisis sit amet ac eros. Nulla sit amet tortor gravida, molestie nibh faucibus, interdum ex. Donec eget dui neque. Pellentesque eu libero dignissim, lobortis est ac, rhoncus lacus. Vivamus a turpis quis sapien maximus iaculis ac ac dui. In mollis lorem volutpat placerat egestas.'),
('DN060B',				'img/productos/',	'7_DN060B',				'.jpg',	15.67,	5,		(SELECT `serie_id` FROM `tbl_serie` WHERE `serie_nom` = 'Downlights'),			'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed quis commodo lacus, vel molestie augue. Fusce a blandit sem, ac auctor enim. Nam ut augue tristique purus fringilla facilisis sit amet ac eros. Nulla sit amet tortor gravida, molestie nibh faucibus, interdum ex. Donec eget dui neque. Pellentesque eu libero dignissim, lobortis est ac, rhoncus lacus. Vivamus a turpis quis sapien maximus iaculis ac ac dui. In mollis lorem volutpat placerat egestas.'),
('RS060B',				'img/productos/',	'8_RS060B',				'.jpg',	45.65,	5,		(SELECT `serie_id` FROM `tbl_serie` WHERE `serie_nom` = 'Downlights'),			'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed quis commodo lacus, vel molestie augue. Fusce a blandit sem, ac auctor enim. Nam ut augue tristique purus fringilla facilisis sit amet ac eros. Nulla sit amet tortor gravida, molestie nibh faucibus, interdum ex. Donec eget dui neque. Pellentesque eu libero dignissim, lobortis est ac, rhoncus lacus. Vivamus a turpis quis sapien maximus iaculis ac ac dui. In mollis lorem volutpat placerat egestas.'),
('BSP791',				'img/productos/',	'9_BSP791',				'.jpg',	20,		NULL,	(SELECT `serie_id` FROM `tbl_serie` WHERE `serie_nom` = 'Alumbrado Publico'),	'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed quis commodo lacus, vel molestie augue. Fusce a blandit sem, ac auctor enim. Nam ut augue tristique purus fringilla facilisis sit amet ac eros. Nulla sit amet tortor gravida, molestie nibh faucibus, interdum ex. Donec eget dui neque. Pellentesque eu libero dignissim, lobortis est ac, rhoncus lacus. Vivamus a turpis quis sapien maximus iaculis ac ac dui. In mollis lorem volutpat placerat egestas.'),
('SGS253',				'img/productos/',	'10_SGS253',			'.jpg',	23.32,	75,		(SELECT `serie_id` FROM `tbl_serie` WHERE `serie_nom` = 'Alumbrado Publico'),	'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed quis commodo lacus, vel molestie augue. Fusce a blandit sem, ac auctor enim. Nam ut augue tristique purus fringilla facilisis sit amet ac eros. Nulla sit amet tortor gravida, molestie nibh faucibus, interdum ex. Donec eget dui neque. Pellentesque eu libero dignissim, lobortis est ac, rhoncus lacus. Vivamus a turpis quis sapien maximus iaculis ac ac dui. In mollis lorem volutpat placerat egestas.'),
('MVF404',				'img/productos/',	'11_MVF404',			'.jpg',	17.32,	3,		(SELECT `serie_id` FROM `tbl_serie` WHERE `serie_nom` = 'Proyectores'),			'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed quis commodo lacus, vel molestie augue. Fusce a blandit sem, ac auctor enim. Nam ut augue tristique purus fringilla facilisis sit amet ac eros. Nulla sit amet tortor gravida, molestie nibh faucibus, interdum ex. Donec eget dui neque. Pellentesque eu libero dignissim, lobortis est ac, rhoncus lacus. Vivamus a turpis quis sapien maximus iaculis ac ac dui. In mollis lorem volutpat placerat egestas.'),
('BVP525',				'img/productos/',	'12_BVP525',			'.jpg',	5.25,	99,		(SELECT `serie_id` FROM `tbl_serie` WHERE `serie_nom` = 'Proyectores'),			'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed quis commodo lacus, vel molestie augue. Fusce a blandit sem, ac auctor enim. Nam ut augue tristique purus fringilla facilisis sit amet ac eros. Nulla sit amet tortor gravida, molestie nibh faucibus, interdum ex. Donec eget dui neque. Pellentesque eu libero dignissim, lobortis est ac, rhoncus lacus. Vivamus a turpis quis sapien maximus iaculis ac ac dui. In mollis lorem volutpat placerat egestas.'),
('BGP360',				'img/productos/',	'13_BGP360',			'.jpg',	35,		15,		(SELECT `serie_id` FROM `tbl_serie` WHERE `serie_nom` = 'Tuneles'),				'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed quis commodo lacus, vel molestie augue. Fusce a blandit sem, ac auctor enim. Nam ut augue tristique purus fringilla facilisis sit amet ac eros. Nulla sit amet tortor gravida, molestie nibh faucibus, interdum ex. Donec eget dui neque. Pellentesque eu libero dignissim, lobortis est ac, rhoncus lacus. Vivamus a turpis quis sapien maximus iaculis ac ac dui. In mollis lorem volutpat placerat egestas.'),
('GX10MR6',				'img/productos/',	'14_GX10MR6',			'.jpg',	9.99,	NULL,	(SELECT `serie_id` FROM `tbl_serie` WHERE `serie_nom` = 'Tuneles'),				'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed quis commodo lacus, vel molestie augue. Fusce a blandit sem, ac auctor enim. Nam ut augue tristique purus fringilla facilisis sit amet ac eros. Nulla sit amet tortor gravida, molestie nibh faucibus, interdum ex. Donec eget dui neque. Pellentesque eu libero dignissim, lobortis est ac, rhoncus lacus. Vivamus a turpis quis sapien maximus iaculis ac ac dui. In mollis lorem volutpat placerat egestas.'),
('BVP425',				'img/productos/',	'15_BVP425',			'.jpg',	35.5,	20,		(SELECT `serie_id` FROM `tbl_serie` WHERE `serie_nom` = 'Grandes Superficies'),	'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed quis commodo lacus, vel molestie augue. Fusce a blandit sem, ac auctor enim. Nam ut augue tristique purus fringilla facilisis sit amet ac eros. Nulla sit amet tortor gravida, molestie nibh faucibus, interdum ex. Donec eget dui neque. Pellentesque eu libero dignissim, lobortis est ac, rhoncus lacus. Vivamus a turpis quis sapien maximus iaculis ac ac dui. In mollis lorem volutpat placerat egestas.'),
('BVP651',				'img/productos/',	'16_BVP651',			'.jpg',	45.99,	NULL,	(SELECT `serie_id` FROM `tbl_serie` WHERE `serie_nom` = 'Grandes Superficies'),	'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed quis commodo lacus, vel molestie augue. Fusce a blandit sem, ac auctor enim. Nam ut augue tristique purus fringilla facilisis sit amet ac eros. Nulla sit amet tortor gravida, molestie nibh faucibus, interdum ex. Donec eget dui neque. Pellentesque eu libero dignissim, lobortis est ac, rhoncus lacus. Vivamus a turpis quis sapien maximus iaculis ac ac dui. In mollis lorem volutpat placerat egestas.'),
('MASTERLINE111',		'img/productos/',	'17_MASTERLINE111',		'.jpg',	15,		25,		(SELECT `serie_id` FROM `tbl_serie` WHERE `serie_nom` = 'Halogenas'),			'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed quis commodo lacus, vel molestie augue. Fusce a blandit sem, ac auctor enim. Nam ut augue tristique purus fringilla facilisis sit amet ac eros. Nulla sit amet tortor gravida, molestie nibh faucibus, interdum ex. Donec eget dui neque. Pellentesque eu libero dignissim, lobortis est ac, rhoncus lacus. Vivamus a turpis quis sapien maximus iaculis ac ac dui. In mollis lorem volutpat placerat egestas.'),
('MR16G60',				'img/productos/',	'18_MR16G60',			'.jpg',	12.99,	5,		(SELECT `serie_id` FROM `tbl_serie` WHERE `serie_nom` = 'Halogenas'),			'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed quis commodo lacus, vel molestie augue. Fusce a blandit sem, ac auctor enim. Nam ut augue tristique purus fringilla facilisis sit amet ac eros. Nulla sit amet tortor gravida, molestie nibh faucibus, interdum ex. Donec eget dui neque. Pellentesque eu libero dignissim, lobortis est ac, rhoncus lacus. Vivamus a turpis quis sapien maximus iaculis ac ac dui. In mollis lorem volutpat placerat egestas.'),
('E27-230-240V',		'img/productos/',	'19_E27-230-240V',		'.jpg',	7.85,	NULL,	(SELECT `serie_id` FROM `tbl_serie` WHERE `serie_nom` = 'Fluorescentes'),		'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed quis commodo lacus, vel molestie augue. Fusce a blandit sem, ac auctor enim. Nam ut augue tristique purus fringilla facilisis sit amet ac eros. Nulla sit amet tortor gravida, molestie nibh faucibus, interdum ex. Donec eget dui neque. Pellentesque eu libero dignissim, lobortis est ac, rhoncus lacus. Vivamus a turpis quis sapien maximus iaculis ac ac dui. In mollis lorem volutpat placerat egestas.'),
('Tornado-High-Lumen',	'img/productos/',	'20_Tornado-High-Lumen','.jpg',	12.25,	30,		(SELECT `serie_id` FROM `tbl_serie` WHERE `serie_nom` = 'Fluorescentes'),		'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed quis commodo lacus, vel molestie augue. Fusce a blandit sem, ac auctor enim. Nam ut augue tristique purus fringilla facilisis sit amet ac eros. Nulla sit amet tortor gravida, molestie nibh faucibus, interdum ex. Donec eget dui neque. Pellentesque eu libero dignissim, lobortis est ac, rhoncus lacus. Vivamus a turpis quis sapien maximus iaculis ac ac dui. In mollis lorem volutpat placerat egestas.'),
('PL-R-Eco4',			'img/productos/',	'21_PL-R-Eco4',			'.jpg',	9.99,	5,		(SELECT `serie_id` FROM `tbl_serie` WHERE `serie_nom` = 'Compactas'),			'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed quis commodo lacus, vel molestie augue. Fusce a blandit sem, ac auctor enim. Nam ut augue tristique purus fringilla facilisis sit amet ac eros. Nulla sit amet tortor gravida, molestie nibh faucibus, interdum ex. Donec eget dui neque. Pellentesque eu libero dignissim, lobortis est ac, rhoncus lacus. Vivamus a turpis quis sapien maximus iaculis ac ac dui. In mollis lorem volutpat placerat egestas.'),
('PL-L4',				'img/productos/',	'22_PL-L4',				'.jpg',	5.45,	NULL,	(SELECT `serie_id` FROM `tbl_serie` WHERE `serie_nom` = 'Compactas'),			'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed quis commodo lacus, vel molestie augue. Fusce a blandit sem, ac auctor enim. Nam ut augue tristique purus fringilla facilisis sit amet ac eros. Nulla sit amet tortor gravida, molestie nibh faucibus, interdum ex. Donec eget dui neque. Pellentesque eu libero dignissim, lobortis est ac, rhoncus lacus. Vivamus a turpis quis sapien maximus iaculis ac ac dui. In mollis lorem volutpat placerat egestas.'),
('CDM-T-Elite',			'img/productos/',	'23_CDM-T-Elite',		'.jpg',	25.75,	10,		(SELECT `serie_id` FROM `tbl_serie` WHERE `serie_nom` = 'Incandescentes'),		'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed quis commodo lacus, vel molestie augue. Fusce a blandit sem, ac auctor enim. Nam ut augue tristique purus fringilla facilisis sit amet ac eros. Nulla sit amet tortor gravida, molestie nibh faucibus, interdum ex. Donec eget dui neque. Pellentesque eu libero dignissim, lobortis est ac, rhoncus lacus. Vivamus a turpis quis sapien maximus iaculis ac ac dui. In mollis lorem volutpat placerat egestas.'),
('CDM-R-Elite',			'img/productos/',	'24_CDM-R-Elite',		'.jpg',	8.7,	NULL,	(SELECT `serie_id` FROM `tbl_serie` WHERE `serie_nom` = 'Incandescentes'),		'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed quis commodo lacus, vel molestie augue. Fusce a blandit sem, ac auctor enim. Nam ut augue tristique purus fringilla facilisis sit amet ac eros. Nulla sit amet tortor gravida, molestie nibh faucibus, interdum ex. Donec eget dui neque. Pellentesque eu libero dignissim, lobortis est ac, rhoncus lacus. Vivamus a turpis quis sapien maximus iaculis ac ac dui. In mollis lorem volutpat placerat egestas.'),
('MASTER-LEDtube-T5',	'img/productos/',	'25_MASTER-LEDtube-T5',	'.jpg',	15.3,	80,		(SELECT `serie_id` FROM `tbl_serie` WHERE `serie_nom` = 'Tubos'),				'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed quis commodo lacus, vel molestie augue. Fusce a blandit sem, ac auctor enim. Nam ut augue tristique purus fringilla facilisis sit amet ac eros. Nulla sit amet tortor gravida, molestie nibh faucibus, interdum ex. Donec eget dui neque. Pellentesque eu libero dignissim, lobortis est ac, rhoncus lacus. Vivamus a turpis quis sapien maximus iaculis ac ac dui. In mollis lorem volutpat placerat egestas.'),
('Tubulares-LED',		'img/productos/',	'26_Tubulares-LED',		'.jpg',	3.45,	5,		(SELECT `serie_id` FROM `tbl_serie` WHERE `serie_nom` = 'Tubos'),				'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed quis commodo lacus, vel molestie augue. Fusce a blandit sem, ac auctor enim. Nam ut augue tristique purus fringilla facilisis sit amet ac eros. Nulla sit amet tortor gravida, molestie nibh faucibus, interdum ex. Donec eget dui neque. Pellentesque eu libero dignissim, lobortis est ac, rhoncus lacus. Vivamus a turpis quis sapien maximus iaculis ac ac dui. In mollis lorem volutpat placerat egestas.'),
('AR111',				'img/productos/',	'27_AR111',				'.jpg',	15.3,	15,		(SELECT `serie_id` FROM `tbl_serie` WHERE `serie_nom` = 'Focos'),				'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed quis commodo lacus, vel molestie augue. Fusce a blandit sem, ac auctor enim. Nam ut augue tristique purus fringilla facilisis sit amet ac eros. Nulla sit amet tortor gravida, molestie nibh faucibus, interdum ex. Donec eget dui neque. Pellentesque eu libero dignissim, lobortis est ac, rhoncus lacus. Vivamus a turpis quis sapien maximus iaculis ac ac dui. In mollis lorem volutpat placerat egestas.'),
('LEDspotMV',			'img/productos/',	'28_LEDspotMV',			'.jpg',	7.25,	50,		(SELECT `serie_id` FROM `tbl_serie` WHERE `serie_nom` = 'Focos'),				'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed quis commodo lacus, vel molestie augue. Fusce a blandit sem, ac auctor enim. Nam ut augue tristique purus fringilla facilisis sit amet ac eros. Nulla sit amet tortor gravida, molestie nibh faucibus, interdum ex. Donec eget dui neque. Pellentesque eu libero dignissim, lobortis est ac, rhoncus lacus. Vivamus a turpis quis sapien maximus iaculis ac ac dui. In mollis lorem volutpat placerat egestas.'),
('HPL-SON',				'img/productos/',	'29_HPL-SON',			'.jpg',	3.5,	20,		(SELECT `serie_id` FROM `tbl_serie` WHERE `serie_nom` = 'HID'),					'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed quis commodo lacus, vel molestie augue. Fusce a blandit sem, ac auctor enim. Nam ut augue tristique purus fringilla facilisis sit amet ac eros. Nulla sit amet tortor gravida, molestie nibh faucibus, interdum ex. Donec eget dui neque. Pellentesque eu libero dignissim, lobortis est ac, rhoncus lacus. Vivamus a turpis quis sapien maximus iaculis ac ac dui. In mollis lorem volutpat placerat egestas.'),
('HPI-SON-HPL',			'img/productos/',	'30_HPI-SON-HPL',		'.jpg',	2.75,	75,		(SELECT `serie_id` FROM `tbl_serie` WHERE `serie_nom` = 'HID'),					'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed quis commodo lacus, vel molestie augue. Fusce a blandit sem, ac auctor enim. Nam ut augue tristique purus fringilla facilisis sit amet ac eros. Nulla sit amet tortor gravida, molestie nibh faucibus, interdum ex. Donec eget dui neque. Pellentesque eu libero dignissim, lobortis est ac, rhoncus lacus. Vivamus a turpis quis sapien maximus iaculis ac ac dui. In mollis lorem volutpat placerat egestas.'),
('CLA-LUSTER34',		'img/productos/',	'31_CLA-LUSTER34',		'.jpg',	6.75,	50,		(SELECT `serie_id` FROM `tbl_serie` WHERE `serie_nom` = 'Velas y Reflejo'),		'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed quis commodo lacus, vel molestie augue. Fusce a blandit sem, ac auctor enim. Nam ut augue tristique purus fringilla facilisis sit amet ac eros. Nulla sit amet tortor gravida, molestie nibh faucibus, interdum ex. Donec eget dui neque. Pellentesque eu libero dignissim, lobortis est ac, rhoncus lacus. Vivamus a turpis quis sapien maximus iaculis ac ac dui. In mollis lorem volutpat placerat egestas.'),
('5-32W-BA35',			'img/productos/',	'32_5-32W-BA35',		'.jpg',	5,		2,		(SELECT `serie_id` FROM `tbl_serie` WHERE `serie_nom` = 'Velas y Reflejo'),		'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed quis commodo lacus, vel molestie augue. Fusce a blandit sem, ac auctor enim. Nam ut augue tristique purus fringilla facilisis sit amet ac eros. Nulla sit amet tortor gravida, molestie nibh faucibus, interdum ex. Donec eget dui neque. Pellentesque eu libero dignissim, lobortis est ac, rhoncus lacus. Vivamus a turpis quis sapien maximus iaculis ac ac dui. In mollis lorem volutpat placerat egestas.'),
('DACM-DyNet',			'img/productos/',	'33_DACM-DyNet',		'.jpg',	65.99,	1,		(SELECT `serie_id` FROM `tbl_serie` WHERE `serie_nom` = 'User Interface'),		'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed quis commodo lacus, vel molestie augue. Fusce a blandit sem, ac auctor enim. Nam ut augue tristique purus fringilla facilisis sit amet ac eros. Nulla sit amet tortor gravida, molestie nibh faucibus, interdum ex. Donec eget dui neque. Pellentesque eu libero dignissim, lobortis est ac, rhoncus lacus. Vivamus a turpis quis sapien maximus iaculis ac ac dui. In mollis lorem volutpat placerat egestas.'),
('PABPE-MA-X',			'img/productos/',	'34_PABPE-MA-X',		'.jpg',	40.35,	20,		(SELECT `serie_id` FROM `tbl_serie` WHERE `serie_nom` = 'User Interface'),		'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed quis commodo lacus, vel molestie augue. Fusce a blandit sem, ac auctor enim. Nam ut augue tristique purus fringilla facilisis sit amet ac eros. Nulla sit amet tortor gravida, molestie nibh faucibus, interdum ex. Donec eget dui neque. Pellentesque eu libero dignissim, lobortis est ac, rhoncus lacus. Vivamus a turpis quis sapien maximus iaculis ac ac dui. In mollis lorem volutpat placerat egestas.'),
('DUS90AHB-DALI',		'img/productos/',	'35_DUS90AHB-DALI',		'.jpg',	25.5,	NULL,	(SELECT `serie_id` FROM `tbl_serie` WHERE `serie_nom` = 'Sensors'),				'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed quis commodo lacus, vel molestie augue. Fusce a blandit sem, ac auctor enim. Nam ut augue tristique purus fringilla facilisis sit amet ac eros. Nulla sit amet tortor gravida, molestie nibh faucibus, interdum ex. Donec eget dui neque. Pellentesque eu libero dignissim, lobortis est ac, rhoncus lacus. Vivamus a turpis quis sapien maximus iaculis ac ac dui. In mollis lorem volutpat placerat egestas.'),
('DUS90CS',				'img/productos/',	'36_DUS90CS',			'.jpg',	15.75,	NULL,	(SELECT `serie_id` FROM `tbl_serie` WHERE `serie_nom` = 'Sensors'),				'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed quis commodo lacus, vel molestie augue. Fusce a blandit sem, ac auctor enim. Nam ut augue tristique purus fringilla facilisis sit amet ac eros. Nulla sit amet tortor gravida, molestie nibh faucibus, interdum ex. Donec eget dui neque. Pellentesque eu libero dignissim, lobortis est ac, rhoncus lacus. Vivamus a turpis quis sapien maximus iaculis ac ac dui. In mollis lorem volutpat placerat egestas.'),
('DDRC810DT-GL',		'img/productos/',	'37_DDRC810DT-GL',		'.jpg',	22.33,	20,		(SELECT `serie_id` FROM `tbl_serie` WHERE `serie_nom` = 'Relay Controllers'),	'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed quis commodo lacus, vel molestie augue. Fusce a blandit sem, ac auctor enim. Nam ut augue tristique purus fringilla facilisis sit amet ac eros. Nulla sit amet tortor gravida, molestie nibh faucibus, interdum ex. Donec eget dui neque. Pellentesque eu libero dignissim, lobortis est ac, rhoncus lacus. Vivamus a turpis quis sapien maximus iaculis ac ac dui. In mollis lorem volutpat placerat egestas.'),
('DDRC420FR',			'img/productos/',	'38_DDRC420FR',			'.jpg',	65.8,	20,		(SELECT `serie_id` FROM `tbl_serie` WHERE `serie_nom` = 'Relay Controllers'),	'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed quis commodo lacus, vel molestie augue. Fusce a blandit sem, ac auctor enim. Nam ut augue tristique purus fringilla facilisis sit amet ac eros. Nulla sit amet tortor gravida, molestie nibh faucibus, interdum ex. Donec eget dui neque. Pellentesque eu libero dignissim, lobortis est ac, rhoncus lacus. Vivamus a turpis quis sapien maximus iaculis ac ac dui. In mollis lorem volutpat placerat egestas.'),
('DMBC110',				'img/productos/',	'39_DMBC110',			'.jpg',	22.35,	NULL,	(SELECT `serie_id` FROM `tbl_serie` WHERE `serie_nom` = 'Reguladores'),			'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed quis commodo lacus, vel molestie augue. Fusce a blandit sem, ac auctor enim. Nam ut augue tristique purus fringilla facilisis sit amet ac eros. Nulla sit amet tortor gravida, molestie nibh faucibus, interdum ex. Donec eget dui neque. Pellentesque eu libero dignissim, lobortis est ac, rhoncus lacus. Vivamus a turpis quis sapien maximus iaculis ac ac dui. In mollis lorem volutpat placerat egestas.'),
('DBC905W',				'img/productos/',	'40_DBC905W',			'.jpg',	20,		NULL,	(SELECT `serie_id` FROM `tbl_serie` WHERE `serie_nom` = 'Reguladores'),			'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed quis commodo lacus, vel molestie augue. Fusce a blandit sem, ac auctor enim. Nam ut augue tristique purus fringilla facilisis sit amet ac eros. Nulla sit amet tortor gravida, molestie nibh faucibus, interdum ex. Donec eget dui neque. Pellentesque eu libero dignissim, lobortis est ac, rhoncus lacus. Vivamus a turpis quis sapien maximus iaculis ac ac dui. In mollis lorem volutpat placerat egestas.'),
('producto41',			'img/productos/',	'41_producto41',		'.jpg', 25,		4,		(SELECT `serie_id` FROM `tbl_serie` WHERE `serie_nom` = 'Suspendida'),			'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed quis commodo lacus, vel molestie augue. Fusce a blandit sem, ac auctor enim. Nam ut augue tristique purus fringilla facilisis sit amet ac eros. Nulla sit amet tortor gravida, molestie nibh faucibus, interdum ex. Donec eget dui neque. Pellentesque eu libero dignissim, lobortis est ac, rhoncus lacus. Vivamus a turpis quis sapien maximus iaculis ac ac dui. In mollis lorem volutpat placerat egestas.'),
('producto42',			'img/productos/',	'42_producto42',		'.jpg', 123,	94,		(SELECT `serie_id` FROM `tbl_serie` WHERE `serie_nom` = 'Suspendida'), 			'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed quis commodo lacus, vel molestie augue. Fusce a blandit sem, ac auctor enim. Nam ut augue tristique purus fringilla facilisis sit amet ac eros. Nulla sit amet tortor gravida, molestie nibh faucibus, interdum ex. Donec eget dui neque. Pellentesque eu libero dignissim, lobortis est ac, rhoncus lacus. Vivamus a turpis quis sapien maximus iaculis ac ac dui. In mollis lorem volutpat placerat egestas.'),
('producto43',			'img/productos/',	'43_producto43',		'.jpg', 23,		99,		(SELECT `serie_id` FROM `tbl_serie` WHERE `serie_nom` = 'Empotrables'), 		'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed quis commodo lacus, vel molestie augue. Fusce a blandit sem, ac auctor enim. Nam ut augue tristique purus fringilla facilisis sit amet ac eros. Nulla sit amet tortor gravida, molestie nibh faucibus, interdum ex. Donec eget dui neque. Pellentesque eu libero dignissim, lobortis est ac, rhoncus lacus. Vivamus a turpis quis sapien maximus iaculis ac ac dui. In mollis lorem volutpat placerat egestas.'),
('producto44',			'img/productos/',	'44_producto44',		'.jpg', 33.43,	33,		(SELECT `serie_id` FROM `tbl_serie` WHERE `serie_nom` = 'Empotrables'), 		'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed quis commodo lacus, vel molestie augue. Fusce a blandit sem, ac auctor enim. Nam ut augue tristique purus fringilla facilisis sit amet ac eros. Nulla sit amet tortor gravida, molestie nibh faucibus, interdum ex. Donec eget dui neque. Pellentesque eu libero dignissim, lobortis est ac, rhoncus lacus. Vivamus a turpis quis sapien maximus iaculis ac ac dui. In mollis lorem volutpat placerat egestas.'),
('producto45',			'img/productos/',	'45_producto45',		'.jpg', 155,	33,		(SELECT `serie_id` FROM `tbl_serie` WHERE `serie_nom` = 'Apliques'), 			'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed quis commodo lacus, vel molestie augue. Fusce a blandit sem, ac auctor enim. Nam ut augue tristique purus fringilla facilisis sit amet ac eros. Nulla sit amet tortor gravida, molestie nibh faucibus, interdum ex. Donec eget dui neque. Pellentesque eu libero dignissim, lobortis est ac, rhoncus lacus. Vivamus a turpis quis sapien maximus iaculis ac ac dui. In mollis lorem volutpat placerat egestas.'),
('producto46',			'img/productos/',	'default',				'.jpg', 25.45,	NULL,	(SELECT `serie_id` FROM `tbl_serie` WHERE `serie_nom` = 'Apliques'), 			'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed quis commodo lacus, vel molestie augue. Fusce a blandit sem, ac auctor enim. Nam ut augue tristique purus fringilla facilisis sit amet ac eros. Nulla sit amet tortor gravida, molestie nibh faucibus, interdum ex. Donec eget dui neque. Pellentesque eu libero dignissim, lobortis est ac, rhoncus lacus. Vivamus a turpis quis sapien maximus iaculis ac ac dui. In mollis lorem volutpat placerat egestas.'),
('producto47',			'img/productos/',	'default',				'.jpg', 35,		2,		(SELECT `serie_id` FROM `tbl_serie` WHERE `serie_nom` = 'Downlights'), 			'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed quis commodo lacus, vel molestie augue. Fusce a blandit sem, ac auctor enim. Nam ut augue tristique purus fringilla facilisis sit amet ac eros. Nulla sit amet tortor gravida, molestie nibh faucibus, interdum ex. Donec eget dui neque. Pellentesque eu libero dignissim, lobortis est ac, rhoncus lacus. Vivamus a turpis quis sapien maximus iaculis ac ac dui. In mollis lorem volutpat placerat egestas.'),
('producto48',			'img/productos/',	'default',				'.jpg', 300,	10,		(SELECT `serie_id` FROM `tbl_serie` WHERE `serie_nom` = 'Downlights'), 			'Foco ultra led super iluminador');


-- TRUNCATE TABLE `tbl_lloc`;
INSERT INTO `tbl_lloc` (`lloc_bloc`,`lloc_passadis`,`lloc_lleixa`) VALUES
('Bloc 1',	'Passadis 1',	'Lleixa 1'),
('Bloc 1',	'Passadis 1',	'Lleixa 2'),
('Bloc 1',	'Passadis 1',	'Lleixa 3'),
('Bloc 1',	'Passadis 1',	'Lleixa 4'),
('Bloc 1',	'Passadis 1',	'Lleixa 5'),
('Bloc 1',	'Passadis 1',	'Lleixa 6'),
('Bloc 1',	'Passadis 1',	'Lleixa 7'),
('Bloc 1',	'Passadis 1',	'Lleixa 8'),

('Bloc 1',	'Passadis 2',	'Lleixa 1'),
('Bloc 1',	'Passadis 2',	'Lleixa 2'),
('Bloc 1',	'Passadis 2',	'Lleixa 3'),
('Bloc 1',	'Passadis 2',	'Lleixa 4'),
('Bloc 1',	'Passadis 2',	'Lleixa 5'),
('Bloc 1',	'Passadis 2',	'Lleixa 6'),
('Bloc 1',	'Passadis 2',	'Lleixa 7'),
('Bloc 1',	'Passadis 2',	'Lleixa 8'),

('Bloc 1',	'Passadis 3',	'Lleixa 1'),
('Bloc 1',	'Passadis 3',	'Lleixa 2'),
('Bloc 1',	'Passadis 3',	'Lleixa 3'),
('Bloc 1',	'Passadis 3',	'Lleixa 4'),
('Bloc 1',	'Passadis 3',	'Lleixa 5'),
('Bloc 1',	'Passadis 3',	'Lleixa 6'),
('Bloc 1',	'Passadis 3',	'Lleixa 7'),
('Bloc 1',	'Passadis 3',	'Lleixa 8'),

('Bloc 1',	'Passadis 4',	'Lleixa 1'),
('Bloc 1',	'Passadis 4',	'Lleixa 2'),
('Bloc 1',	'Passadis 4',	'Lleixa 3'),
('Bloc 1',	'Passadis 4',	'Lleixa 4'),
('Bloc 1',	'Passadis 4',	'Lleixa 5'),
('Bloc 1',	'Passadis 4',	'Lleixa 6'),
('Bloc 1',	'Passadis 4',	'Lleixa 7'),
('Bloc 1',	'Passadis 4',	'Lleixa 8'),

('Bloc 1',	'Passadis 5',	'Lleixa 1'),
('Bloc 1',	'Passadis 5',	'Lleixa 2'),
('Bloc 1',	'Passadis 5',	'Lleixa 3'),
('Bloc 1',	'Passadis 5',	'Lleixa 4'),
('Bloc 1',	'Passadis 5',	'Lleixa 5'),
('Bloc 1',	'Passadis 5',	'Lleixa 6'),
('Bloc 1',	'Passadis 5',	'Lleixa 7'),
('Bloc 1',	'Passadis 5',	'Lleixa 8'),

('Bloc 1',	'Passadis 6',	'Lleixa 1'),
('Bloc 1',	'Passadis 6',	'Lleixa 2'),
('Bloc 1',	'Passadis 6',	'Lleixa 3'),
('Bloc 1',	'Passadis 6',	'Lleixa 4'),
('Bloc 1',	'Passadis 6',	'Lleixa 5'),
('Bloc 1',	'Passadis 6',	'Lleixa 6'),
('Bloc 1',	'Passadis 6',	'Lleixa 7'),
('Bloc 1',	'Passadis 6',	'Lleixa 8'),

('Bloc 1',	'Passadis 7',	'Lleixa 1'),
('Bloc 1',	'Passadis 7',	'Lleixa 2'),
('Bloc 1',	'Passadis 7',	'Lleixa 3'),
('Bloc 1',	'Passadis 7',	'Lleixa 4'),
('Bloc 1',	'Passadis 7',	'Lleixa 5'),
('Bloc 1',	'Passadis 7',	'Lleixa 6'),
('Bloc 1',	'Passadis 7',	'Lleixa 7'),
('Bloc 1',	'Passadis 7',	'Lleixa 8'),

('Bloc 1',	'Passadis 8',	'Lleixa 1'),
('Bloc 1',	'Passadis 8',	'Lleixa 2'),
('Bloc 1',	'Passadis 8',	'Lleixa 3'),
('Bloc 1',	'Passadis 8',	'Lleixa 4'),
('Bloc 1',	'Passadis 8',	'Lleixa 5'),
('Bloc 1',	'Passadis 8',	'Lleixa 6'),
('Bloc 1',	'Passadis 8',	'Lleixa 7'),
('Bloc 1',	'Passadis 8',	'Lleixa 8'),

('Bloc 1',	'Passadis 9',	'Lleixa 1'),
('Bloc 1',	'Passadis 9',	'Lleixa 2'),
('Bloc 1',	'Passadis 9',	'Lleixa 3'),
('Bloc 1',	'Passadis 9',	'Lleixa 4'),
('Bloc 1',	'Passadis 9',	'Lleixa 5'),
('Bloc 1',	'Passadis 9',	'Lleixa 6'),
('Bloc 1',	'Passadis 9',	'Lleixa 7'),
('Bloc 1',	'Passadis 9',	'Lleixa 8'),

('Bloc 1',	'Passadis 10',	'Lleixa 1'),
('Bloc 1',	'Passadis 10',	'Lleixa 2'),
('Bloc 1',	'Passadis 10',	'Lleixa 3'),
('Bloc 1',	'Passadis 10',	'Lleixa 4'),
('Bloc 1',	'Passadis 10',	'Lleixa 5'),
('Bloc 1',	'Passadis 10',	'Lleixa 6'),
('Bloc 1',	'Passadis 10',	'Lleixa 7'),
('Bloc 1',	'Passadis 10',	'Lleixa 8'),

('Bloc 1',	'Passadis 11',	'Lleixa 1'),
('Bloc 1',	'Passadis 11',	'Lleixa 2'),
('Bloc 1',	'Passadis 11',	'Lleixa 3'),
('Bloc 1',	'Passadis 11',	'Lleixa 4'),
('Bloc 1',	'Passadis 11',	'Lleixa 5'),
('Bloc 1',	'Passadis 11',	'Lleixa 6'),
('Bloc 1',	'Passadis 11',	'Lleixa 7'),
('Bloc 1',	'Passadis 11',	'Lleixa 8'),

('Bloc 1',	'Passadis 12',	'Lleixa 1'),
('Bloc 1',	'Passadis 12',	'Lleixa 2'),
('Bloc 1',	'Passadis 12',	'Lleixa 3'),
('Bloc 1',	'Passadis 12',	'Lleixa 4'),
('Bloc 1',	'Passadis 12',	'Lleixa 5'),
('Bloc 1',	'Passadis 12',	'Lleixa 6'),
('Bloc 1',	'Passadis 12',	'Lleixa 7'),
('Bloc 1',	'Passadis 12',	'Lleixa 8'),

/* --2-------------------------------------------------------------------------------------- */
/* --2-------------------------------------------------------------------------------------- */

('Bloc 2',	'Passadis 1',	'Lleixa 1'),
('Bloc 2',	'Passadis 1',	'Lleixa 2'),
('Bloc 2',	'Passadis 1',	'Lleixa 3'),
('Bloc 2',	'Passadis 1',	'Lleixa 4'),
('Bloc 2',	'Passadis 1',	'Lleixa 5'),
('Bloc 2',	'Passadis 1',	'Lleixa 6'),
('Bloc 2',	'Passadis 1',	'Lleixa 7'),
('Bloc 2',	'Passadis 1',	'Lleixa 8'),

('Bloc 2',	'Passadis 2',	'Lleixa 1'),
('Bloc 2',	'Passadis 2',	'Lleixa 2'),
('Bloc 2',	'Passadis 2',	'Lleixa 3'),
('Bloc 2',	'Passadis 2',	'Lleixa 4'),
('Bloc 2',	'Passadis 2',	'Lleixa 5'),
('Bloc 2',	'Passadis 2',	'Lleixa 6'),
('Bloc 2',	'Passadis 2',	'Lleixa 7'),
('Bloc 2',	'Passadis 2',	'Lleixa 8'),

('Bloc 2',	'Passadis 3',	'Lleixa 1'),
('Bloc 2',	'Passadis 3',	'Lleixa 2'),
('Bloc 2',	'Passadis 3',	'Lleixa 3'),
('Bloc 2',	'Passadis 3',	'Lleixa 4'),
('Bloc 2',	'Passadis 3',	'Lleixa 5'),
('Bloc 2',	'Passadis 3',	'Lleixa 6'),
('Bloc 2',	'Passadis 3',	'Lleixa 7'),
('Bloc 2',	'Passadis 3',	'Lleixa 8'),

('Bloc 2',	'Passadis 4',	'Lleixa 1'),
('Bloc 2',	'Passadis 4',	'Lleixa 2'),
('Bloc 2',	'Passadis 4',	'Lleixa 3'),
('Bloc 2',	'Passadis 4',	'Lleixa 4'),
('Bloc 2',	'Passadis 4',	'Lleixa 5'),
('Bloc 2',	'Passadis 4',	'Lleixa 6'),
('Bloc 2',	'Passadis 4',	'Lleixa 7'),
('Bloc 2',	'Passadis 4',	'Lleixa 8'),

('Bloc 2',	'Passadis 5',	'Lleixa 1'),
('Bloc 2',	'Passadis 5',	'Lleixa 2'),
('Bloc 2',	'Passadis 5',	'Lleixa 3'),
('Bloc 2',	'Passadis 5',	'Lleixa 4'),
('Bloc 2',	'Passadis 5',	'Lleixa 5'),
('Bloc 2',	'Passadis 5',	'Lleixa 6'),
('Bloc 2',	'Passadis 5',	'Lleixa 7'),
('Bloc 2',	'Passadis 5',	'Lleixa 8'),

('Bloc 2',	'Passadis 6',	'Lleixa 1'),
('Bloc 2',	'Passadis 6',	'Lleixa 2'),
('Bloc 2',	'Passadis 6',	'Lleixa 3'),
('Bloc 2',	'Passadis 6',	'Lleixa 4'),
('Bloc 2',	'Passadis 6',	'Lleixa 5'),
('Bloc 2',	'Passadis 6',	'Lleixa 6'),
('Bloc 2',	'Passadis 6',	'Lleixa 7'),
('Bloc 2',	'Passadis 6',	'Lleixa 8'),

('Bloc 2',	'Passadis 7',	'Lleixa 1'),
('Bloc 2',	'Passadis 7',	'Lleixa 2'),
('Bloc 2',	'Passadis 7',	'Lleixa 3'),
('Bloc 2',	'Passadis 7',	'Lleixa 4'),
('Bloc 2',	'Passadis 7',	'Lleixa 5'),
('Bloc 2',	'Passadis 7',	'Lleixa 6'),
('Bloc 2',	'Passadis 7',	'Lleixa 7'),
('Bloc 2',	'Passadis 7',	'Lleixa 8'),

('Bloc 2',	'Passadis 8',	'Lleixa 1'),
('Bloc 2',	'Passadis 8',	'Lleixa 2'),
('Bloc 2',	'Passadis 8',	'Lleixa 3'),
('Bloc 2',	'Passadis 8',	'Lleixa 4'),
('Bloc 2',	'Passadis 8',	'Lleixa 5'),
('Bloc 2',	'Passadis 8',	'Lleixa 6'),
('Bloc 2',	'Passadis 8',	'Lleixa 7'),
('Bloc 2',	'Passadis 8',	'Lleixa 8'),

('Bloc 2',	'Passadis 9',	'Lleixa 1'),
('Bloc 2',	'Passadis 9',	'Lleixa 2'),
('Bloc 2',	'Passadis 9',	'Lleixa 3'),
('Bloc 2',	'Passadis 9',	'Lleixa 4'),
('Bloc 2',	'Passadis 9',	'Lleixa 5'),
('Bloc 2',	'Passadis 9',	'Lleixa 6'),
('Bloc 2',	'Passadis 9',	'Lleixa 7'),
('Bloc 2',	'Passadis 9',	'Lleixa 8'),

('Bloc 2',	'Passadis 10',	'Lleixa 1'),
('Bloc 2',	'Passadis 10',	'Lleixa 2'),
('Bloc 2',	'Passadis 10',	'Lleixa 3'),
('Bloc 2',	'Passadis 10',	'Lleixa 4'),
('Bloc 2',	'Passadis 10',	'Lleixa 5'),
('Bloc 2',	'Passadis 10',	'Lleixa 6'),
('Bloc 2',	'Passadis 10',	'Lleixa 7'),
('Bloc 2',	'Passadis 10',	'Lleixa 8'),

('Bloc 2',	'Passadis 11',	'Lleixa 1'),
('Bloc 2',	'Passadis 11',	'Lleixa 2'),
('Bloc 2',	'Passadis 11',	'Lleixa 3'),
('Bloc 2',	'Passadis 11',	'Lleixa 4'),
('Bloc 2',	'Passadis 11',	'Lleixa 5'),
('Bloc 2',	'Passadis 11',	'Lleixa 6'),
('Bloc 2',	'Passadis 11',	'Lleixa 7'),
('Bloc 2',	'Passadis 11',	'Lleixa 8'),

('Bloc 2',	'Passadis 12',	'Lleixa 1'),
('Bloc 2',	'Passadis 12',	'Lleixa 2'),
('Bloc 2',	'Passadis 12',	'Lleixa 3'),
('Bloc 2',	'Passadis 12',	'Lleixa 4'),
('Bloc 2',	'Passadis 12',	'Lleixa 5'),
('Bloc 2',	'Passadis 12',	'Lleixa 6'),
('Bloc 2',	'Passadis 12',	'Lleixa 7'),
('Bloc 2',	'Passadis 12',	'Lleixa 8'),

/* --3-------------------------------------------------------------------------------------- */
/* --3-------------------------------------------------------------------------------------- */

('Bloc 3',	'Passadis 1',	'Lleixa 1'),
('Bloc 3',	'Passadis 1',	'Lleixa 2'),
('Bloc 3',	'Passadis 1',	'Lleixa 3'),
('Bloc 3',	'Passadis 1',	'Lleixa 4'),
('Bloc 3',	'Passadis 1',	'Lleixa 5'),
('Bloc 3',	'Passadis 1',	'Lleixa 6'),
('Bloc 3',	'Passadis 1',	'Lleixa 7'),
('Bloc 3',	'Passadis 1',	'Lleixa 8'),

('Bloc 3',	'Passadis 2',	'Lleixa 1'),
('Bloc 3',	'Passadis 2',	'Lleixa 2'),
('Bloc 3',	'Passadis 2',	'Lleixa 3'),
('Bloc 3',	'Passadis 2',	'Lleixa 4'),
('Bloc 3',	'Passadis 2',	'Lleixa 5'),
('Bloc 3',	'Passadis 2',	'Lleixa 6'),
('Bloc 3',	'Passadis 2',	'Lleixa 7'),
('Bloc 3',	'Passadis 2',	'Lleixa 8'),

('Bloc 3',	'Passadis 3',	'Lleixa 1'),
('Bloc 3',	'Passadis 3',	'Lleixa 2'),
('Bloc 3',	'Passadis 3',	'Lleixa 3'),
('Bloc 3',	'Passadis 3',	'Lleixa 4'),
('Bloc 3',	'Passadis 3',	'Lleixa 5'),
('Bloc 3',	'Passadis 3',	'Lleixa 6'),
('Bloc 3',	'Passadis 3',	'Lleixa 7'),
('Bloc 3',	'Passadis 3',	'Lleixa 8'),

('Bloc 3',	'Passadis 4',	'Lleixa 1'),
('Bloc 3',	'Passadis 4',	'Lleixa 2'),
('Bloc 3',	'Passadis 4',	'Lleixa 3'),
('Bloc 3',	'Passadis 4',	'Lleixa 4'),
('Bloc 3',	'Passadis 4',	'Lleixa 5'),
('Bloc 3',	'Passadis 4',	'Lleixa 6'),
('Bloc 3',	'Passadis 4',	'Lleixa 7'),
('Bloc 3',	'Passadis 4',	'Lleixa 8'),

('Bloc 3',	'Passadis 5',	'Lleixa 1'),
('Bloc 3',	'Passadis 5',	'Lleixa 2'),
('Bloc 3',	'Passadis 5',	'Lleixa 3'),
('Bloc 3',	'Passadis 5',	'Lleixa 4'),
('Bloc 3',	'Passadis 5',	'Lleixa 5'),
('Bloc 3',	'Passadis 5',	'Lleixa 6'),
('Bloc 3',	'Passadis 5',	'Lleixa 7'),
('Bloc 3',	'Passadis 5',	'Lleixa 8'),

('Bloc 3',	'Passadis 6',	'Lleixa 1'),
('Bloc 3',	'Passadis 6',	'Lleixa 2'),
('Bloc 3',	'Passadis 6',	'Lleixa 3'),
('Bloc 3',	'Passadis 6',	'Lleixa 4'),
('Bloc 3',	'Passadis 6',	'Lleixa 5'),
('Bloc 3',	'Passadis 6',	'Lleixa 6'),
('Bloc 3',	'Passadis 6',	'Lleixa 7'),
('Bloc 3',	'Passadis 6',	'Lleixa 8'),

('Bloc 3',	'Passadis 7',	'Lleixa 1'),
('Bloc 3',	'Passadis 7',	'Lleixa 2'),
('Bloc 3',	'Passadis 7',	'Lleixa 3'),
('Bloc 3',	'Passadis 7',	'Lleixa 4'),
('Bloc 3',	'Passadis 7',	'Lleixa 5'),
('Bloc 3',	'Passadis 7',	'Lleixa 6'),
('Bloc 3',	'Passadis 7',	'Lleixa 7'),
('Bloc 3',	'Passadis 7',	'Lleixa 8'),

('Bloc 3',	'Passadis 8',	'Lleixa 1'),
('Bloc 3',	'Passadis 8',	'Lleixa 2'),
('Bloc 3',	'Passadis 8',	'Lleixa 3'),
('Bloc 3',	'Passadis 8',	'Lleixa 4'),
('Bloc 3',	'Passadis 8',	'Lleixa 5'),
('Bloc 3',	'Passadis 8',	'Lleixa 6'),
('Bloc 3',	'Passadis 8',	'Lleixa 7'),
('Bloc 3',	'Passadis 8',	'Lleixa 8'),

('Bloc 3',	'Passadis 9',	'Lleixa 1'),
('Bloc 3',	'Passadis 9',	'Lleixa 2'),
('Bloc 3',	'Passadis 9',	'Lleixa 3'),
('Bloc 3',	'Passadis 9',	'Lleixa 4'),
('Bloc 3',	'Passadis 9',	'Lleixa 5'),
('Bloc 3',	'Passadis 9',	'Lleixa 6'),
('Bloc 3',	'Passadis 9',	'Lleixa 7'),
('Bloc 3',	'Passadis 9',	'Lleixa 8'),

('Bloc 3',	'Passadis 10',	'Lleixa 1'),
('Bloc 3',	'Passadis 10',	'Lleixa 2'),
('Bloc 3',	'Passadis 10',	'Lleixa 3'),
('Bloc 3',	'Passadis 10',	'Lleixa 4'),
('Bloc 3',	'Passadis 10',	'Lleixa 5'),
('Bloc 3',	'Passadis 10',	'Lleixa 6'),
('Bloc 3',	'Passadis 10',	'Lleixa 7'),
('Bloc 3',	'Passadis 10',	'Lleixa 8'),

('Bloc 3',	'Passadis 11',	'Lleixa 1'),
('Bloc 3',	'Passadis 11',	'Lleixa 2'),
('Bloc 3',	'Passadis 11',	'Lleixa 3'),
('Bloc 3',	'Passadis 11',	'Lleixa 4'),
('Bloc 3',	'Passadis 11',	'Lleixa 5'),
('Bloc 3',	'Passadis 11',	'Lleixa 6'),
('Bloc 3',	'Passadis 11',	'Lleixa 7'),
('Bloc 3',	'Passadis 11',	'Lleixa 8'),

('Bloc 3',	'Passadis 12',	'Lleixa 1'),
('Bloc 3',	'Passadis 12',	'Lleixa 2'),
('Bloc 3',	'Passadis 12',	'Lleixa 3'),
('Bloc 3',	'Passadis 12',	'Lleixa 4'),
('Bloc 3',	'Passadis 12',	'Lleixa 5'),
('Bloc 3',	'Passadis 12',	'Lleixa 6'),
('Bloc 3',	'Passadis 12',	'Lleixa 7'),
('Bloc 3',	'Passadis 12',	'Lleixa 8'),

/* --4-------------------------------------------------------------------------------------- */
/* --4-------------------------------------------------------------------------------------- */

('Bloc 4',	'Passadis 1',	'Lleixa 1'),
('Bloc 4',	'Passadis 1',	'Lleixa 2'),
('Bloc 4',	'Passadis 1',	'Lleixa 3'),
('Bloc 4',	'Passadis 1',	'Lleixa 4'),
('Bloc 4',	'Passadis 1',	'Lleixa 5'),
('Bloc 4',	'Passadis 1',	'Lleixa 6'),
('Bloc 4',	'Passadis 1',	'Lleixa 7'),
('Bloc 4',	'Passadis 1',	'Lleixa 8'),

('Bloc 4',	'Passadis 2',	'Lleixa 1'),
('Bloc 4',	'Passadis 2',	'Lleixa 2'),
('Bloc 4',	'Passadis 2',	'Lleixa 3'),
('Bloc 4',	'Passadis 2',	'Lleixa 4'),
('Bloc 4',	'Passadis 2',	'Lleixa 5'),
('Bloc 4',	'Passadis 2',	'Lleixa 6'),
('Bloc 4',	'Passadis 2',	'Lleixa 7'),
('Bloc 4',	'Passadis 2',	'Lleixa 8'),

('Bloc 4',	'Passadis 3',	'Lleixa 1'),
('Bloc 4',	'Passadis 3',	'Lleixa 2'),
('Bloc 4',	'Passadis 3',	'Lleixa 3'),
('Bloc 4',	'Passadis 3',	'Lleixa 4'),
('Bloc 4',	'Passadis 3',	'Lleixa 5'),
('Bloc 4',	'Passadis 3',	'Lleixa 6'),
('Bloc 4',	'Passadis 3',	'Lleixa 7'),
('Bloc 4',	'Passadis 3',	'Lleixa 8'),

('Bloc 4',	'Passadis 4',	'Lleixa 1'),
('Bloc 4',	'Passadis 4',	'Lleixa 2'),
('Bloc 4',	'Passadis 4',	'Lleixa 3'),
('Bloc 4',	'Passadis 4',	'Lleixa 4'),
('Bloc 4',	'Passadis 4',	'Lleixa 5'),
('Bloc 4',	'Passadis 4',	'Lleixa 6'),
('Bloc 4',	'Passadis 4',	'Lleixa 7'),
('Bloc 4',	'Passadis 4',	'Lleixa 8'),

('Bloc 4',	'Passadis 5',	'Lleixa 1'),
('Bloc 4',	'Passadis 5',	'Lleixa 2'),
('Bloc 4',	'Passadis 5',	'Lleixa 3'),
('Bloc 4',	'Passadis 5',	'Lleixa 4'),
('Bloc 4',	'Passadis 5',	'Lleixa 5'),
('Bloc 4',	'Passadis 5',	'Lleixa 6'),
('Bloc 4',	'Passadis 5',	'Lleixa 7'),
('Bloc 4',	'Passadis 5',	'Lleixa 8'),

('Bloc 4',	'Passadis 6',	'Lleixa 1'),
('Bloc 4',	'Passadis 6',	'Lleixa 2'),
('Bloc 4',	'Passadis 6',	'Lleixa 3'),
('Bloc 4',	'Passadis 6',	'Lleixa 4'),
('Bloc 4',	'Passadis 6',	'Lleixa 5'),
('Bloc 4',	'Passadis 6',	'Lleixa 6'),
('Bloc 4',	'Passadis 6',	'Lleixa 7'),
('Bloc 4',	'Passadis 6',	'Lleixa 8'),

('Bloc 4',	'Passadis 7',	'Lleixa 1'),
('Bloc 4',	'Passadis 7',	'Lleixa 2'),
('Bloc 4',	'Passadis 7',	'Lleixa 3'),
('Bloc 4',	'Passadis 7',	'Lleixa 4'),
('Bloc 4',	'Passadis 7',	'Lleixa 5'),
('Bloc 4',	'Passadis 7',	'Lleixa 6'),
('Bloc 4',	'Passadis 7',	'Lleixa 7'),
('Bloc 4',	'Passadis 7',	'Lleixa 8'),

('Bloc 4',	'Passadis 8',	'Lleixa 1'),
('Bloc 4',	'Passadis 8',	'Lleixa 2'),
('Bloc 4',	'Passadis 8',	'Lleixa 3'),
('Bloc 4',	'Passadis 8',	'Lleixa 4'),
('Bloc 4',	'Passadis 8',	'Lleixa 5'),
('Bloc 4',	'Passadis 8',	'Lleixa 6'),
('Bloc 4',	'Passadis 8',	'Lleixa 7'),
('Bloc 4',	'Passadis 8',	'Lleixa 8'),

('Bloc 4',	'Passadis 9',	'Lleixa 1'),
('Bloc 4',	'Passadis 9',	'Lleixa 2'),
('Bloc 4',	'Passadis 9',	'Lleixa 3'),
('Bloc 4',	'Passadis 9',	'Lleixa 4'),
('Bloc 4',	'Passadis 9',	'Lleixa 5'),
('Bloc 4',	'Passadis 9',	'Lleixa 6'),
('Bloc 4',	'Passadis 9',	'Lleixa 7'),
('Bloc 4',	'Passadis 9',	'Lleixa 8'),

('Bloc 4',	'Passadis 10',	'Lleixa 1'),
('Bloc 4',	'Passadis 10',	'Lleixa 2'),
('Bloc 4',	'Passadis 10',	'Lleixa 3'),
('Bloc 4',	'Passadis 10',	'Lleixa 4'),
('Bloc 4',	'Passadis 10',	'Lleixa 5'),
('Bloc 4',	'Passadis 10',	'Lleixa 6'),
('Bloc 4',	'Passadis 10',	'Lleixa 7'),
('Bloc 4',	'Passadis 10',	'Lleixa 8'),

('Bloc 4',	'Passadis 11',	'Lleixa 1'),
('Bloc 4',	'Passadis 11',	'Lleixa 2'),
('Bloc 4',	'Passadis 11',	'Lleixa 3'),
('Bloc 4',	'Passadis 11',	'Lleixa 4'),
('Bloc 4',	'Passadis 11',	'Lleixa 5'),
('Bloc 4',	'Passadis 11',	'Lleixa 6'),
('Bloc 4',	'Passadis 11',	'Lleixa 7'),
('Bloc 4',	'Passadis 11',	'Lleixa 8'),

('Bloc 4',	'Passadis 12',	'Lleixa 1'),
('Bloc 4',	'Passadis 12',	'Lleixa 2'),
('Bloc 4',	'Passadis 12',	'Lleixa 3'),
('Bloc 4',	'Passadis 12',	'Lleixa 4'),
('Bloc 4',	'Passadis 12',	'Lleixa 5'),
('Bloc 4',	'Passadis 12',	'Lleixa 6'),
('Bloc 4',	'Passadis 12',	'Lleixa 7'),
('Bloc 4',	'Passadis 12',	'Lleixa 8'),

/* --5-------------------------------------------------------------------------------------- */
/* --5-------------------------------------------------------------------------------------- */

('Bloc 5',	'Passadis 1',	'Lleixa 1'),
('Bloc 5',	'Passadis 1',	'Lleixa 2'),
('Bloc 5',	'Passadis 1',	'Lleixa 3'),
('Bloc 5',	'Passadis 1',	'Lleixa 4'),
('Bloc 5',	'Passadis 1',	'Lleixa 5'),
('Bloc 5',	'Passadis 1',	'Lleixa 6'),
('Bloc 5',	'Passadis 1',	'Lleixa 7'),
('Bloc 5',	'Passadis 1',	'Lleixa 8'),

('Bloc 5',	'Passadis 2',	'Lleixa 1'),
('Bloc 5',	'Passadis 2',	'Lleixa 2'),
('Bloc 5',	'Passadis 2',	'Lleixa 3'),
('Bloc 5',	'Passadis 2',	'Lleixa 4'),
('Bloc 5',	'Passadis 2',	'Lleixa 5'),
('Bloc 5',	'Passadis 2',	'Lleixa 6'),
('Bloc 5',	'Passadis 2',	'Lleixa 7'),
('Bloc 5',	'Passadis 2',	'Lleixa 8'),

('Bloc 5',	'Passadis 3',	'Lleixa 1'),
('Bloc 5',	'Passadis 3',	'Lleixa 2'),
('Bloc 5',	'Passadis 3',	'Lleixa 3'),
('Bloc 5',	'Passadis 3',	'Lleixa 4'),
('Bloc 5',	'Passadis 3',	'Lleixa 5'),
('Bloc 5',	'Passadis 3',	'Lleixa 6'),
('Bloc 5',	'Passadis 3',	'Lleixa 7'),
('Bloc 5',	'Passadis 3',	'Lleixa 8'),

('Bloc 5',	'Passadis 4',	'Lleixa 1'),
('Bloc 5',	'Passadis 4',	'Lleixa 2'),
('Bloc 5',	'Passadis 4',	'Lleixa 3'),
('Bloc 5',	'Passadis 4',	'Lleixa 4'),
('Bloc 5',	'Passadis 4',	'Lleixa 5'),
('Bloc 5',	'Passadis 4',	'Lleixa 6'),
('Bloc 5',	'Passadis 4',	'Lleixa 7'),
('Bloc 5',	'Passadis 4',	'Lleixa 8'),

('Bloc 5',	'Passadis 5',	'Lleixa 1'),
('Bloc 5',	'Passadis 5',	'Lleixa 2'),
('Bloc 5',	'Passadis 5',	'Lleixa 3'),
('Bloc 5',	'Passadis 5',	'Lleixa 4'),
('Bloc 5',	'Passadis 5',	'Lleixa 5'),
('Bloc 5',	'Passadis 5',	'Lleixa 6'),
('Bloc 5',	'Passadis 5',	'Lleixa 7'),
('Bloc 5',	'Passadis 5',	'Lleixa 8'),

('Bloc 5',	'Passadis 6',	'Lleixa 1'),
('Bloc 5',	'Passadis 6',	'Lleixa 2'),
('Bloc 5',	'Passadis 6',	'Lleixa 3'),
('Bloc 5',	'Passadis 6',	'Lleixa 4'),
('Bloc 5',	'Passadis 6',	'Lleixa 5'),
('Bloc 5',	'Passadis 6',	'Lleixa 6'),
('Bloc 5',	'Passadis 6',	'Lleixa 7'),
('Bloc 5',	'Passadis 6',	'Lleixa 8'),

('Bloc 5',	'Passadis 7',	'Lleixa 1'),
('Bloc 5',	'Passadis 7',	'Lleixa 2'),
('Bloc 5',	'Passadis 7',	'Lleixa 3'),
('Bloc 5',	'Passadis 7',	'Lleixa 4'),
('Bloc 5',	'Passadis 7',	'Lleixa 5'),
('Bloc 5',	'Passadis 7',	'Lleixa 6'),
('Bloc 5',	'Passadis 7',	'Lleixa 7'),
('Bloc 5',	'Passadis 7',	'Lleixa 8'),

('Bloc 5',	'Passadis 8',	'Lleixa 1'),
('Bloc 5',	'Passadis 8',	'Lleixa 2'),
('Bloc 5',	'Passadis 8',	'Lleixa 3'),
('Bloc 5',	'Passadis 8',	'Lleixa 4'),
('Bloc 5',	'Passadis 8',	'Lleixa 5'),
('Bloc 5',	'Passadis 8',	'Lleixa 6'),
('Bloc 5',	'Passadis 8',	'Lleixa 7'),
('Bloc 5',	'Passadis 8',	'Lleixa 8'),

('Bloc 5',	'Passadis 9',	'Lleixa 1'),
('Bloc 5',	'Passadis 9',	'Lleixa 2'),
('Bloc 5',	'Passadis 9',	'Lleixa 3'),
('Bloc 5',	'Passadis 9',	'Lleixa 4'),
('Bloc 5',	'Passadis 9',	'Lleixa 5'),
('Bloc 5',	'Passadis 9',	'Lleixa 6'),
('Bloc 5',	'Passadis 9',	'Lleixa 7'),
('Bloc 5',	'Passadis 9',	'Lleixa 8'),

('Bloc 5',	'Passadis 10',	'Lleixa 1'),
('Bloc 5',	'Passadis 10',	'Lleixa 2'),
('Bloc 5',	'Passadis 10',	'Lleixa 3'),
('Bloc 5',	'Passadis 10',	'Lleixa 4'),
('Bloc 5',	'Passadis 10',	'Lleixa 5'),
('Bloc 5',	'Passadis 10',	'Lleixa 6'),
('Bloc 5',	'Passadis 10',	'Lleixa 7'),
('Bloc 5',	'Passadis 10',	'Lleixa 8'),

('Bloc 5',	'Passadis 11',	'Lleixa 1'),
('Bloc 5',	'Passadis 11',	'Lleixa 2'),
('Bloc 5',	'Passadis 11',	'Lleixa 3'),
('Bloc 5',	'Passadis 11',	'Lleixa 4'),
('Bloc 5',	'Passadis 11',	'Lleixa 5'),
('Bloc 5',	'Passadis 11',	'Lleixa 6'),
('Bloc 5',	'Passadis 11',	'Lleixa 7'),
('Bloc 5',	'Passadis 11',	'Lleixa 8'),

('Bloc 5',	'Passadis 12',	'Lleixa 1'),
('Bloc 5',	'Passadis 12',	'Lleixa 2'),
('Bloc 5',	'Passadis 12',	'Lleixa 3'),
('Bloc 5',	'Passadis 12',	'Lleixa 4'),
('Bloc 5',	'Passadis 12',	'Lleixa 5'),
('Bloc 5',	'Passadis 12',	'Lleixa 6'),
('Bloc 5',	'Passadis 12',	'Lleixa 7'),
('Bloc 5',	'Passadis 12',	'Lleixa 8'),

/* --6-------------------------------------------------------------------------------------- */
/* --6-------------------------------------------------------------------------------------- */

('Bloc 6',	'Passadis 1',	'Lleixa 1'),
('Bloc 6',	'Passadis 1',	'Lleixa 2'),
('Bloc 6',	'Passadis 1',	'Lleixa 3'),
('Bloc 6',	'Passadis 1',	'Lleixa 4'),
('Bloc 6',	'Passadis 1',	'Lleixa 5'),
('Bloc 6',	'Passadis 1',	'Lleixa 6'),
('Bloc 6',	'Passadis 1',	'Lleixa 7'),
('Bloc 6',	'Passadis 1',	'Lleixa 8'),

('Bloc 6',	'Passadis 2',	'Lleixa 1'),
('Bloc 6',	'Passadis 2',	'Lleixa 2'),
('Bloc 6',	'Passadis 2',	'Lleixa 3'),
('Bloc 6',	'Passadis 2',	'Lleixa 4'),
('Bloc 6',	'Passadis 2',	'Lleixa 5'),
('Bloc 6',	'Passadis 2',	'Lleixa 6'),
('Bloc 6',	'Passadis 2',	'Lleixa 7'),
('Bloc 6',	'Passadis 2',	'Lleixa 8'),

('Bloc 6',	'Passadis 3',	'Lleixa 1'),
('Bloc 6',	'Passadis 3',	'Lleixa 2'),
('Bloc 6',	'Passadis 3',	'Lleixa 3'),
('Bloc 6',	'Passadis 3',	'Lleixa 4'),
('Bloc 6',	'Passadis 3',	'Lleixa 5'),
('Bloc 6',	'Passadis 3',	'Lleixa 6'),
('Bloc 6',	'Passadis 3',	'Lleixa 7'),
('Bloc 6',	'Passadis 3',	'Lleixa 8'),

('Bloc 6',	'Passadis 4',	'Lleixa 1'),
('Bloc 6',	'Passadis 4',	'Lleixa 2'),
('Bloc 6',	'Passadis 4',	'Lleixa 3'),
('Bloc 6',	'Passadis 4',	'Lleixa 4'),
('Bloc 6',	'Passadis 4',	'Lleixa 5'),
('Bloc 6',	'Passadis 4',	'Lleixa 6'),
('Bloc 6',	'Passadis 4',	'Lleixa 7'),
('Bloc 6',	'Passadis 4',	'Lleixa 8'),

('Bloc 6',	'Passadis 5',	'Lleixa 1'),
('Bloc 6',	'Passadis 5',	'Lleixa 2'),
('Bloc 6',	'Passadis 5',	'Lleixa 3'),
('Bloc 6',	'Passadis 5',	'Lleixa 4'),
('Bloc 6',	'Passadis 5',	'Lleixa 5'),
('Bloc 6',	'Passadis 5',	'Lleixa 6'),
('Bloc 6',	'Passadis 5',	'Lleixa 7'),
('Bloc 6',	'Passadis 5',	'Lleixa 8'),

('Bloc 6',	'Passadis 6',	'Lleixa 1'),
('Bloc 6',	'Passadis 6',	'Lleixa 2'),
('Bloc 6',	'Passadis 6',	'Lleixa 3'),
('Bloc 6',	'Passadis 6',	'Lleixa 4'),
('Bloc 6',	'Passadis 6',	'Lleixa 5'),
('Bloc 6',	'Passadis 6',	'Lleixa 6'),
('Bloc 6',	'Passadis 6',	'Lleixa 7'),
('Bloc 6',	'Passadis 6',	'Lleixa 8'),

('Bloc 6',	'Passadis 7',	'Lleixa 1'),
('Bloc 6',	'Passadis 7',	'Lleixa 2'),
('Bloc 6',	'Passadis 7',	'Lleixa 3'),
('Bloc 6',	'Passadis 7',	'Lleixa 4'),
('Bloc 6',	'Passadis 7',	'Lleixa 5'),
('Bloc 6',	'Passadis 7',	'Lleixa 6'),
('Bloc 6',	'Passadis 7',	'Lleixa 7'),
('Bloc 6',	'Passadis 7',	'Lleixa 8'),

('Bloc 6',	'Passadis 8',	'Lleixa 1'),
('Bloc 6',	'Passadis 8',	'Lleixa 2'),
('Bloc 6',	'Passadis 8',	'Lleixa 3'),
('Bloc 6',	'Passadis 8',	'Lleixa 4'),
('Bloc 6',	'Passadis 8',	'Lleixa 5'),
('Bloc 6',	'Passadis 8',	'Lleixa 6'),
('Bloc 6',	'Passadis 8',	'Lleixa 7'),
('Bloc 6',	'Passadis 8',	'Lleixa 8'),

('Bloc 6',	'Passadis 9',	'Lleixa 1'),
('Bloc 6',	'Passadis 9',	'Lleixa 2'),
('Bloc 6',	'Passadis 9',	'Lleixa 3'),
('Bloc 6',	'Passadis 9',	'Lleixa 4'),
('Bloc 6',	'Passadis 9',	'Lleixa 5'),
('Bloc 6',	'Passadis 9',	'Lleixa 6'),
('Bloc 6',	'Passadis 9',	'Lleixa 7'),
('Bloc 6',	'Passadis 9',	'Lleixa 8'),

('Bloc 6',	'Passadis 10',	'Lleixa 1'),
('Bloc 6',	'Passadis 10',	'Lleixa 2'),
('Bloc 6',	'Passadis 10',	'Lleixa 3'),
('Bloc 6',	'Passadis 10',	'Lleixa 4'),
('Bloc 6',	'Passadis 10',	'Lleixa 5'),
('Bloc 6',	'Passadis 10',	'Lleixa 6'),
('Bloc 6',	'Passadis 10',	'Lleixa 7'),
('Bloc 6',	'Passadis 10',	'Lleixa 8'),

('Bloc 6',	'Passadis 11',	'Lleixa 1'),
('Bloc 6',	'Passadis 11',	'Lleixa 2'),
('Bloc 6',	'Passadis 11',	'Lleixa 3'),
('Bloc 6',	'Passadis 11',	'Lleixa 4'),
('Bloc 6',	'Passadis 11',	'Lleixa 5'),
('Bloc 6',	'Passadis 11',	'Lleixa 6'),
('Bloc 6',	'Passadis 11',	'Lleixa 7'),
('Bloc 6',	'Passadis 11',	'Lleixa 8'),

('Bloc 6',	'Passadis 12',	'Lleixa 1'),
('Bloc 6',	'Passadis 12',	'Lleixa 2'),
('Bloc 6',	'Passadis 12',	'Lleixa 3'),
('Bloc 6',	'Passadis 12',	'Lleixa 4'),
('Bloc 6',	'Passadis 12',	'Lleixa 5'),
('Bloc 6',	'Passadis 12',	'Lleixa 6'),
('Bloc 6',	'Passadis 12',	'Lleixa 7'),
('Bloc 6',	'Passadis 12',	'Lleixa 8'),

/* --7-------------------------------------------------------------------------------------- */
/* --7-------------------------------------------------------------------------------------- */

('Bloc 7',	'Passadis 1',	'Lleixa 1'),
('Bloc 7',	'Passadis 1',	'Lleixa 2'),
('Bloc 7',	'Passadis 1',	'Lleixa 3'),
('Bloc 7',	'Passadis 1',	'Lleixa 4'),
('Bloc 7',	'Passadis 1',	'Lleixa 5'),
('Bloc 7',	'Passadis 1',	'Lleixa 6'),
('Bloc 7',	'Passadis 1',	'Lleixa 7'),
('Bloc 7',	'Passadis 1',	'Lleixa 8'),

('Bloc 7',	'Passadis 2',	'Lleixa 1'),
('Bloc 7',	'Passadis 2',	'Lleixa 2'),
('Bloc 7',	'Passadis 2',	'Lleixa 3'),
('Bloc 7',	'Passadis 2',	'Lleixa 4'),
('Bloc 7',	'Passadis 2',	'Lleixa 5'),
('Bloc 7',	'Passadis 2',	'Lleixa 6'),
('Bloc 7',	'Passadis 2',	'Lleixa 7'),
('Bloc 7',	'Passadis 2',	'Lleixa 8'),

('Bloc 7',	'Passadis 3',	'Lleixa 1'),
('Bloc 7',	'Passadis 3',	'Lleixa 2'),
('Bloc 7',	'Passadis 3',	'Lleixa 3'),
('Bloc 7',	'Passadis 3',	'Lleixa 4'),
('Bloc 7',	'Passadis 3',	'Lleixa 5'),
('Bloc 7',	'Passadis 3',	'Lleixa 6'),
('Bloc 7',	'Passadis 3',	'Lleixa 7'),
('Bloc 7',	'Passadis 3',	'Lleixa 8'),

('Bloc 7',	'Passadis 4',	'Lleixa 1'),
('Bloc 7',	'Passadis 4',	'Lleixa 2'),
('Bloc 7',	'Passadis 4',	'Lleixa 3'),
('Bloc 7',	'Passadis 4',	'Lleixa 4'),
('Bloc 7',	'Passadis 4',	'Lleixa 5'),
('Bloc 7',	'Passadis 4',	'Lleixa 6'),
('Bloc 7',	'Passadis 4',	'Lleixa 7'),
('Bloc 7',	'Passadis 4',	'Lleixa 8'),

('Bloc 7',	'Passadis 5',	'Lleixa 1'),
('Bloc 7',	'Passadis 5',	'Lleixa 2'),
('Bloc 7',	'Passadis 5',	'Lleixa 3'),
('Bloc 7',	'Passadis 5',	'Lleixa 4'),
('Bloc 7',	'Passadis 5',	'Lleixa 5'),
('Bloc 7',	'Passadis 5',	'Lleixa 6'),
('Bloc 7',	'Passadis 5',	'Lleixa 7'),
('Bloc 7',	'Passadis 5',	'Lleixa 8'),

('Bloc 7',	'Passadis 6',	'Lleixa 1'),
('Bloc 7',	'Passadis 6',	'Lleixa 2'),
('Bloc 7',	'Passadis 6',	'Lleixa 3'),
('Bloc 7',	'Passadis 6',	'Lleixa 4'),
('Bloc 7',	'Passadis 6',	'Lleixa 5'),
('Bloc 7',	'Passadis 6',	'Lleixa 6'),
('Bloc 7',	'Passadis 6',	'Lleixa 7'),
('Bloc 7',	'Passadis 6',	'Lleixa 8'),

('Bloc 7',	'Passadis 7',	'Lleixa 1'),
('Bloc 7',	'Passadis 7',	'Lleixa 2'),
('Bloc 7',	'Passadis 7',	'Lleixa 3'),
('Bloc 7',	'Passadis 7',	'Lleixa 4'),
('Bloc 7',	'Passadis 7',	'Lleixa 5'),
('Bloc 7',	'Passadis 7',	'Lleixa 6'),
('Bloc 7',	'Passadis 7',	'Lleixa 7'),
('Bloc 7',	'Passadis 7',	'Lleixa 8'),

('Bloc 7',	'Passadis 8',	'Lleixa 1'),
('Bloc 7',	'Passadis 8',	'Lleixa 2'),
('Bloc 7',	'Passadis 8',	'Lleixa 3'),
('Bloc 7',	'Passadis 8',	'Lleixa 4'),
('Bloc 7',	'Passadis 8',	'Lleixa 5'),
('Bloc 7',	'Passadis 8',	'Lleixa 6'),
('Bloc 7',	'Passadis 8',	'Lleixa 7'),
('Bloc 7',	'Passadis 8',	'Lleixa 8'),

('Bloc 7',	'Passadis 9',	'Lleixa 1'),
('Bloc 7',	'Passadis 9',	'Lleixa 2'),
('Bloc 7',	'Passadis 9',	'Lleixa 3'),
('Bloc 7',	'Passadis 9',	'Lleixa 4'),
('Bloc 7',	'Passadis 9',	'Lleixa 5'),
('Bloc 7',	'Passadis 9',	'Lleixa 6'),
('Bloc 7',	'Passadis 9',	'Lleixa 7'),
('Bloc 7',	'Passadis 9',	'Lleixa 8'),

('Bloc 7',	'Passadis 10',	'Lleixa 1'),
('Bloc 7',	'Passadis 10',	'Lleixa 2'),
('Bloc 7',	'Passadis 10',	'Lleixa 3'),
('Bloc 7',	'Passadis 10',	'Lleixa 4'),
('Bloc 7',	'Passadis 10',	'Lleixa 5'),
('Bloc 7',	'Passadis 10',	'Lleixa 6'),
('Bloc 7',	'Passadis 10',	'Lleixa 7'),
('Bloc 7',	'Passadis 10',	'Lleixa 8'),

('Bloc 7',	'Passadis 11',	'Lleixa 1'),
('Bloc 7',	'Passadis 11',	'Lleixa 2'),
('Bloc 7',	'Passadis 11',	'Lleixa 3'),
('Bloc 7',	'Passadis 11',	'Lleixa 4'),
('Bloc 7',	'Passadis 11',	'Lleixa 5'),
('Bloc 7',	'Passadis 11',	'Lleixa 6'),
('Bloc 7',	'Passadis 11',	'Lleixa 7'),
('Bloc 7',	'Passadis 11',	'Lleixa 8'),

('Bloc 7',	'Passadis 12',	'Lleixa 1'),
('Bloc 7',	'Passadis 12',	'Lleixa 2'),
('Bloc 7',	'Passadis 12',	'Lleixa 3'),
('Bloc 7',	'Passadis 12',	'Lleixa 4'),
('Bloc 7',	'Passadis 12',	'Lleixa 5'),
('Bloc 7',	'Passadis 12',	'Lleixa 6'),
('Bloc 7',	'Passadis 12',	'Lleixa 7'),
('Bloc 7',	'Passadis 12',	'Lleixa 8'),

/* --8-------------------------------------------------------------------------------------- */
/* --8-------------------------------------------------------------------------------------- */

('Bloc 8',	'Passadis 1',	'Lleixa 1'),
('Bloc 8',	'Passadis 1',	'Lleixa 2'),
('Bloc 8',	'Passadis 1',	'Lleixa 3'),
('Bloc 8',	'Passadis 1',	'Lleixa 4'),
('Bloc 8',	'Passadis 1',	'Lleixa 5'),
('Bloc 8',	'Passadis 1',	'Lleixa 6'),
('Bloc 8',	'Passadis 1',	'Lleixa 7'),
('Bloc 8',	'Passadis 1',	'Lleixa 8'),

('Bloc 8',	'Passadis 2',	'Lleixa 1'),
('Bloc 8',	'Passadis 2',	'Lleixa 2'),
('Bloc 8',	'Passadis 2',	'Lleixa 3'),
('Bloc 8',	'Passadis 2',	'Lleixa 4'),
('Bloc 8',	'Passadis 2',	'Lleixa 5'),
('Bloc 8',	'Passadis 2',	'Lleixa 6'),
('Bloc 8',	'Passadis 2',	'Lleixa 7'),
('Bloc 8',	'Passadis 2',	'Lleixa 8'),

('Bloc 8',	'Passadis 3',	'Lleixa 1'),
('Bloc 8',	'Passadis 3',	'Lleixa 2'),
('Bloc 8',	'Passadis 3',	'Lleixa 3'),
('Bloc 8',	'Passadis 3',	'Lleixa 4'),
('Bloc 8',	'Passadis 3',	'Lleixa 5'),
('Bloc 8',	'Passadis 3',	'Lleixa 6'),
('Bloc 8',	'Passadis 3',	'Lleixa 7'),
('Bloc 8',	'Passadis 3',	'Lleixa 8'),

('Bloc 8',	'Passadis 4',	'Lleixa 1'),
('Bloc 8',	'Passadis 4',	'Lleixa 2'),
('Bloc 8',	'Passadis 4',	'Lleixa 3'),
('Bloc 8',	'Passadis 4',	'Lleixa 4'),
('Bloc 8',	'Passadis 4',	'Lleixa 5'),
('Bloc 8',	'Passadis 4',	'Lleixa 6'),
('Bloc 8',	'Passadis 4',	'Lleixa 7'),
('Bloc 8',	'Passadis 4',	'Lleixa 8'),

('Bloc 8',	'Passadis 5',	'Lleixa 1'),
('Bloc 8',	'Passadis 5',	'Lleixa 2'),
('Bloc 8',	'Passadis 5',	'Lleixa 3'),
('Bloc 8',	'Passadis 5',	'Lleixa 4'),
('Bloc 8',	'Passadis 5',	'Lleixa 5'),
('Bloc 8',	'Passadis 5',	'Lleixa 6'),
('Bloc 8',	'Passadis 5',	'Lleixa 7'),
('Bloc 8',	'Passadis 5',	'Lleixa 8'),

('Bloc 8',	'Passadis 6',	'Lleixa 1'),
('Bloc 8',	'Passadis 6',	'Lleixa 2'),
('Bloc 8',	'Passadis 6',	'Lleixa 3'),
('Bloc 8',	'Passadis 6',	'Lleixa 4'),
('Bloc 8',	'Passadis 6',	'Lleixa 5'),
('Bloc 8',	'Passadis 6',	'Lleixa 6'),
('Bloc 8',	'Passadis 6',	'Lleixa 7'),
('Bloc 8',	'Passadis 6',	'Lleixa 8'),

('Bloc 8',	'Passadis 7',	'Lleixa 1'),
('Bloc 8',	'Passadis 7',	'Lleixa 2'),
('Bloc 8',	'Passadis 7',	'Lleixa 3'),
('Bloc 8',	'Passadis 7',	'Lleixa 4'),
('Bloc 8',	'Passadis 7',	'Lleixa 5'),
('Bloc 8',	'Passadis 7',	'Lleixa 6'),
('Bloc 8',	'Passadis 7',	'Lleixa 7'),
('Bloc 8',	'Passadis 7',	'Lleixa 8'),

('Bloc 8',	'Passadis 8',	'Lleixa 1'),
('Bloc 8',	'Passadis 8',	'Lleixa 2'),
('Bloc 8',	'Passadis 8',	'Lleixa 3'),
('Bloc 8',	'Passadis 8',	'Lleixa 4'),
('Bloc 8',	'Passadis 8',	'Lleixa 5'),
('Bloc 8',	'Passadis 8',	'Lleixa 6'),
('Bloc 8',	'Passadis 8',	'Lleixa 7'),
('Bloc 8',	'Passadis 8',	'Lleixa 8'),

('Bloc 8',	'Passadis 9',	'Lleixa 1'),
('Bloc 8',	'Passadis 9',	'Lleixa 2'),
('Bloc 8',	'Passadis 9',	'Lleixa 3'),
('Bloc 8',	'Passadis 9',	'Lleixa 4'),
('Bloc 8',	'Passadis 9',	'Lleixa 5'),
('Bloc 8',	'Passadis 9',	'Lleixa 6'),
('Bloc 8',	'Passadis 9',	'Lleixa 7'),
('Bloc 8',	'Passadis 9',	'Lleixa 8'),

('Bloc 8',	'Passadis 10',	'Lleixa 1'),
('Bloc 8',	'Passadis 10',	'Lleixa 2'),
('Bloc 8',	'Passadis 10',	'Lleixa 3'),
('Bloc 8',	'Passadis 10',	'Lleixa 4'),
('Bloc 8',	'Passadis 10',	'Lleixa 5'),
('Bloc 8',	'Passadis 10',	'Lleixa 6'),
('Bloc 8',	'Passadis 10',	'Lleixa 7'),
('Bloc 8',	'Passadis 10',	'Lleixa 8'),

('Bloc 8',	'Passadis 11',	'Lleixa 1'),
('Bloc 8',	'Passadis 11',	'Lleixa 2'),
('Bloc 8',	'Passadis 11',	'Lleixa 3'),
('Bloc 8',	'Passadis 11',	'Lleixa 4'),
('Bloc 8',	'Passadis 11',	'Lleixa 5'),
('Bloc 8',	'Passadis 11',	'Lleixa 6'),
('Bloc 8',	'Passadis 11',	'Lleixa 7'),
('Bloc 8',	'Passadis 11',	'Lleixa 8'),

('Bloc 8',	'Passadis 12',	'Lleixa 1'),
('Bloc 8',	'Passadis 12',	'Lleixa 2'),
('Bloc 8',	'Passadis 12',	'Lleixa 3'),
('Bloc 8',	'Passadis 12',	'Lleixa 4'),
('Bloc 8',	'Passadis 12',	'Lleixa 5'),
('Bloc 8',	'Passadis 12',	'Lleixa 6'),
('Bloc 8',	'Passadis 12',	'Lleixa 7'),
('Bloc 8',	'Passadis 12',	'Lleixa 8');


-- TRUNCATE TABLE `tbl_estoc`;
INSERT INTO `tbl_estoc` (`estoc_quantitat`,`estoc_maxim`,`estoc_minim`,`producte_id`,`lloc_id`) VALUES
(23,50,10,(SELECT `producte_id` FROM `tbl_producte` WHERE `producte_nom` = 'SP534P'),				1),
/*(60,100,10,(SELECT `producte_id` FROM `tbl_producte` WHERE `producte_nom` = 'SP534P'),			41),*/
(24,50,10,(SELECT `producte_id` FROM `tbl_producte` WHERE `producte_nom` = 'PT570P'),				2),
(45,50,10,(SELECT `producte_id` FROM `tbl_producte` WHERE `producte_nom` = 'RC132V'),				3),
(12,50,10,(SELECT `producte_id` FROM `tbl_producte` WHERE `producte_nom` = 'RC464B'),				4),
(32,50,10,(SELECT `producte_id` FROM `tbl_producte` WHERE `producte_nom` = 'WL130V'),				5),
(46,50,10,(SELECT `producte_id` FROM `tbl_producte` WHERE `producte_nom` = 'WL060V'),				6),
(29,50,10,(SELECT `producte_id` FROM `tbl_producte` WHERE `producte_nom` = 'DN060B'),				7),
(48,50,10,(SELECT `producte_id` FROM `tbl_producte` WHERE `producte_nom` = 'RS060B'),				8),
(35,50,10,(SELECT `producte_id` FROM `tbl_producte` WHERE `producte_nom` = 'BSP791'),				9),
(35,50,10,(SELECT `producte_id` FROM `tbl_producte` WHERE `producte_nom` = 'SGS253'),				10),
(20,50,10,(SELECT `producte_id` FROM `tbl_producte` WHERE `producte_nom` = 'MVF404'),				11),
(20,50,10,(SELECT `producte_id` FROM `tbl_producte` WHERE `producte_nom` = 'BVP525'),				12),
(20,50,10,(SELECT `producte_id` FROM `tbl_producte` WHERE `producte_nom` = 'BGP360'),				13),
(20,50,10,(SELECT `producte_id` FROM `tbl_producte` WHERE `producte_nom` = 'GX10MR6'),				14),
(43,50,10,(SELECT `producte_id` FROM `tbl_producte` WHERE `producte_nom` = 'BVP425'),				15),
(20,50,10,(SELECT `producte_id` FROM `tbl_producte` WHERE `producte_nom` = 'BVP651'),				16),
(20,50,10,(SELECT `producte_id` FROM `tbl_producte` WHERE `producte_nom` = 'MASTERLINE111'),		17),
(20,50,10,(SELECT `producte_id` FROM `tbl_producte` WHERE `producte_nom` = 'MR16G60'),				18),
(20,50,10,(SELECT `producte_id` FROM `tbl_producte` WHERE `producte_nom` = 'E27-230-240V'),			19),
(17,50,10,(SELECT `producte_id` FROM `tbl_producte` WHERE `producte_nom` = 'Tornado-High-Lumen'),	20),
(28,50,10,(SELECT `producte_id` FROM `tbl_producte` WHERE `producte_nom` = 'PL-R-Eco4'),			21),
(20,50,10,(SELECT `producte_id` FROM `tbl_producte` WHERE `producte_nom` = 'PL-L4'),				22),
(20,50,10,(SELECT `producte_id` FROM `tbl_producte` WHERE `producte_nom` = 'CDM-T-Elite'),			23),
(43,50,10,(SELECT `producte_id` FROM `tbl_producte` WHERE `producte_nom` = 'CDM-R-Elite'),			24),
(20,50,10,(SELECT `producte_id` FROM `tbl_producte` WHERE `producte_nom` = 'MASTER-LEDtube-T5'),	25),
(20,50,10,(SELECT `producte_id` FROM `tbl_producte` WHERE `producte_nom` = 'Tubulares-LED'),		26),
(20,50,10,(SELECT `producte_id` FROM `tbl_producte` WHERE `producte_nom` = 'AR111'),				27),
(20,50,10,(SELECT `producte_id` FROM `tbl_producte` WHERE `producte_nom` = 'LEDspotMV'),			28),
(20,50,10,(SELECT `producte_id` FROM `tbl_producte` WHERE `producte_nom` = 'HPL-SON'),				29),
(20,50,10,(SELECT `producte_id` FROM `tbl_producte` WHERE `producte_nom` = 'HPI-SON-HPL'),			30),
(20,50,10,(SELECT `producte_id` FROM `tbl_producte` WHERE `producte_nom` = 'CLA-LUSTER34'),			31),
(20,50,10,(SELECT `producte_id` FROM `tbl_producte` WHERE `producte_nom` = '5-32W-BA35'),			32),
(20,50,10,(SELECT `producte_id` FROM `tbl_producte` WHERE `producte_nom` = 'DACM-DyNet'),			33),
(20,50,10,(SELECT `producte_id` FROM `tbl_producte` WHERE `producte_nom` = 'PABPE-MA-X'),			34),
(20,50,10,(SELECT `producte_id` FROM `tbl_producte` WHERE `producte_nom` = 'DUS90AHB-DALI'),		35),
(20,50,10,(SELECT `producte_id` FROM `tbl_producte` WHERE `producte_nom` = 'DUS90CS'),				36),
(20,50,10,(SELECT `producte_id` FROM `tbl_producte` WHERE `producte_nom` = 'DDRC810DT-GL'),			37),
(20,50,10,(SELECT `producte_id` FROM `tbl_producte` WHERE `producte_nom` = 'DDRC420FR'),			38),
(50,50,10,(SELECT `producte_id` FROM `tbl_producte` WHERE `producte_nom` = 'DMBC110'),				39),
(20,50,10,(SELECT `producte_id` FROM `tbl_producte` WHERE `producte_nom` = 'DBC905W'),				40),
(41,50,10,(SELECT `producte_id` FROM `tbl_producte` WHERE `producte_nom` = 'producto41'),			100),
(40,50,10,(SELECT `producte_id` FROM `tbl_producte` WHERE `producte_nom` = 'producto42'),			101),
(48,50,10,(SELECT `producte_id` FROM `tbl_producte` WHERE `producte_nom` = 'producto43'),			102),
(30,50,10,(SELECT `producte_id` FROM `tbl_producte` WHERE `producte_nom` = 'producto44'),			103),
(50,50,10,(SELECT `producte_id` FROM `tbl_producte` WHERE `producte_nom` = 'producto45'),			104),
(50,50,10,(SELECT `producte_id` FROM `tbl_producte` WHERE `producte_nom` = 'producto46'),			105),
(50,50,10,(SELECT `producte_id` FROM `tbl_producte` WHERE `producte_nom` = 'producto47'),			106),
(50,50,10,(SELECT `producte_id` FROM `tbl_producte` WHERE `producte_nom` = 'producto48'),			107);


