SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";

--
-- Base de datos: `bd_estoc`
--

DROP DATABASE IF EXISTS bd_proyecto_4;
CREATE DATABASE IF NOT EXISTS bd_proyecto_4 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;;
USE `bd_proyecto_4`;

-- --------------------------------------------------------
-- Estructura de tabla para la tabla `tbl_persona`

CREATE TABLE IF NOT EXISTS `tbl_usuario` (
	`id_usuario` int(11) NOT NULL AUTO_INCREMENT,
	`email_usuario` varchar(255) DEFAULT NULL,
	`password_usuario` varchar(255) DEFAULT NULL,
	`nombre_usuario` varchar(255) DEFAULT NULL,
	`apellido_usuario` varchar(255) DEFAULT NULL,
	`grupo_usuario` enum('usuario','administrador') DEFAULT NULL,
PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- --------------------------------------------------------
-- Estructura de tabla para la tabla `tbl_lloc`

CREATE TABLE IF NOT EXISTS `tbl_lloc` (
	`lloc_id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
	`num_bloc` enum('Bloc 1','Bloc 2','Bloc3','Bloc 4','Bloc 5','Bloc 6','Bloc 7','Bloc 8') COLLATE utf8_unicode_ci NOT NULL,
	`num_passadis` enum('passadis 1','passadis 2','passadis 3','passadis 4','passadis 5','passadis 6','passadis 7','passadis 8','passadis 9','passadis 10','passadis 11','passadis 12') COLLATE utf8_unicode_ci NOT NULL,
	`num_lleixa` enum('lleixa 1','lleixa 2','lleixa 3','lleixa 4','lleixa 5','lleixa 6','lleixa 7','lleixa 8') COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- --------------------------------------------------------
-- Estructura de tabla para la tabla `tbl_estoc`

CREATE TABLE IF NOT EXISTS `tbl_estoc` (
	`estoc_id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
	`estoc_quantitat` int(5) NOT NULL,
	`estoc_maxim` int(5) NOT NULL,
	`estoc_minim` int(5) NOT NULL,
	`producte_id` int(11)  NULL,
	`lloc_id` int(11)  NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- --------------------------------------------------------
-- Estructura de tabla para la tabla `tbl_proveidor`

/*CREATE TABLE IF NOT EXISTS `tbl_proveidor` (
	`proveidor_id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
	`proveidor_nom` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
	`proveidor_adre` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
	`proveidor_email` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;*/


-- --------------------------------------------------------
-- Estructura de tabla para la tabla `tbl_categoria` ----

CREATE TABLE IF NOT EXISTS `tbl_categoria`(
	`categoria_id` int(11) NOT NULL  PRIMARY KEY AUTO_INCREMENT,
	`categoria_nom` varchar(20) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- --------------------------------------------------------
-- Estructura de tabla para la tabla `tbl_serie`

CREATE TABLE IF NOT EXISTS `tbl_serie` (
	`serie_id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
	`serie_nom` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
	`categoria_id` int(11) NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- --------------------------------------------------------
-- Estructura de tabla para la tabla `tbl_producte`
CREATE TABLE IF NOT EXISTS `tbl_producte` (
	`producte_id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
	`producte_nom` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
	`producte_foto` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
	`producte_preu` DOUBLE COLLATE utf8_unicode_ci NOT NULL,
	`producte_descripcio` varchar(100) COLLATE utf8_unicode_ci NULL,
	`producte_descompte` int(3) NULL,
	`serie_id` int(11) NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



-- --------------------------------------------------------
-- Estructura de tabla para la tabla `tbl_comanda`
/*CREATE TABLE IF NOT EXISTS `tbl_comanda` (
	`comanda_id` int(11) NOT NULL AUTO_INCREMENT,
	`comanda_data` date NOT NULL,
	`proveidor_id` int(11)  NULL,
	PRIMARY KEY (`comanda_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;*/


-- --------------------------------------------------------
-- Estructura de tabla para la tabla `tbl_detall_comandaanda`
/*CREATE TABLE IF NOT EXISTS `tbl_detall_comanda` (
	`detallComanda_id` int(11) NOT NULL AUTO_INCREMENT,
	`detallComanda_quantitat` int(5) NOT NULL,
	`comanda_id` int(11) NOT NULL,
	`producte_id` int(11)  NULL,
	PRIMARY KEY (`detallComanda_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;*/




-- -------------------------------------------------------
-- RELACIONES PARA LAS TABLAS 
-- ---------------------------------------------------

-- `tbl_serie` `tbl_categoria`:
ALTER TABLE `tbl_serie` ADD CONSTRAINT `FK_serie_categoria` FOREIGN KEY (categoria_id)
REFERENCES `tbl_categoria`(categoria_id);
-- ---------------------------------------------------

-- `tbl_producte`  `tbl_serie`:
ALTER TABLE `tbl_producte` ADD CONSTRAINT `FK_prod_serie` FOREIGN KEY (serie_id)
REFERENCES `tbl_serie`(serie_id);
-- ---------------------------------------------------
/*
-- `tbl_detall_comandaanda` `tbl_producte`:
ALTER TABLE `tbl_detall_comanda` ADD CONSTRAINT `FK_detallComanda_producte` FOREIGN KEY (producte_id)
REFERENCES `tbl_producte`(producte_id);
-- ---------------------------------------------------

-- `tbl_detall_comandaanda` `tbl_comanda`:
ALTER TABLE `tbl_detall_comanda` ADD CONSTRAINT `FK_detall_com_comanda` FOREIGN KEY (comanda_id)
REFERENCES `tbl_comanda`(comanda_id);
-- ---------------------------------------------------

-- `tbl_comanda` `tbl_proveidor`:
ALTER TABLE `tbl_comanda` ADD CONSTRAINT `FK_comanda_prov` FOREIGN KEY (prov_id)
REFERENCES `tbl_proveidor`(prov_id);
-- ---------------------------------------------------
*/

-- `tbl_estoc` `tbl_producte`:
ALTER TABLE `tbl_estoc` ADD CONSTRAINT `FK_estoc_producte` FOREIGN KEY (producte_id)
REFERENCES `tbl_producte`(producte_id);
-- ---------------------------------------------------

-- `tbl_estoc `tbl_lloc`:
ALTER TABLE `tbl_estoc` ADD CONSTRAINT `FK_estoc_lloc` FOREIGN KEY (lloc_id)
REFERENCES `tbl_lloc`(lloc_id);
-- ----------------------------------------


-- -------------------------------------------------------
-- DATOS DE LAS TABLAS 
-- ---------------------------------------------------

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
