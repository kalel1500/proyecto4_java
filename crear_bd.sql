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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- --------------------------------------------------------
-- Estructura de tabla para la tabla `tbl_lloc`

CREATE TABLE IF NOT EXISTS `tbl_lloc` (
	`lloc_id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
	`lloc_bloc` enum('Bloc 1','Bloc 2','Bloc 3','Bloc 4','Bloc 5','Bloc 6','Bloc 7','Bloc 8') COLLATE utf8_unicode_ci NOT NULL,
	`lloc_passadis` enum('Passadis 1','Passadis 2','Passadis 3','Passadis 4','Passadis 5','Passadis 6','Passadis 7','Passadis 8','Passadis 9','Passadis 10','Passadis 11','Passadis 12') COLLATE utf8_unicode_ci NOT NULL,
	`lloc_lleixa` enum('Lleixa 1','Lleixa 2','Lleixa 3','Lleixa 4','Lleixa 5','Lleixa 6','Lleixa 7','Lleixa 8') COLLATE utf8_unicode_ci NOT NULL
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
	`producte_fotoRuta` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
	`producte_fotoNom` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
	`producte_fotoExt` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
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


INSERT INTO `tbl_categoria` (`categoria_nom`) VALUES
('cat01'),
('cat02'),
('cat03'),
('cat04'),
('cat05');


INSERT INTO `tbl_serie` (`serie_nom`,`categoria_id`) VALUES
('serie01',	(SELECT `categoria_id` FROM `tbl_categoria` WHERE `categoria_nom` = 'cat01')),
('serie02',	(SELECT `categoria_id` FROM `tbl_categoria` WHERE `categoria_nom` = 'cat01')),
('serie03',	(SELECT `categoria_id` FROM `tbl_categoria` WHERE `categoria_nom` = 'cat01')),
('serie04',	(SELECT `categoria_id` FROM `tbl_categoria` WHERE `categoria_nom` = 'cat01')),
('serie05',	(SELECT `categoria_id` FROM `tbl_categoria` WHERE `categoria_nom` = 'cat02')),
('serie06',	(SELECT `categoria_id` FROM `tbl_categoria` WHERE `categoria_nom` = 'cat02')),
('serie07',	(SELECT `categoria_id` FROM `tbl_categoria` WHERE `categoria_nom` = 'cat02')),
('serie08',	(SELECT `categoria_id` FROM `tbl_categoria` WHERE `categoria_nom` = 'cat02')),
('serie09',	(SELECT `categoria_id` FROM `tbl_categoria` WHERE `categoria_nom` = 'cat03')),
('serie10',	(SELECT `categoria_id` FROM `tbl_categoria` WHERE `categoria_nom` = 'cat03')),
('serie11',	(SELECT `categoria_id` FROM `tbl_categoria` WHERE `categoria_nom` = 'cat03')),
('serie12',	(SELECT `categoria_id` FROM `tbl_categoria` WHERE `categoria_nom` = 'cat03')),
('serie13',	(SELECT `categoria_id` FROM `tbl_categoria` WHERE `categoria_nom` = 'cat04')),
('serie14',	(SELECT `categoria_id` FROM `tbl_categoria` WHERE `categoria_nom` = 'cat04')),
('serie15',	(SELECT `categoria_id` FROM `tbl_categoria` WHERE `categoria_nom` = 'cat04')),
('serie16',	(SELECT `categoria_id` FROM `tbl_categoria` WHERE `categoria_nom` = 'cat04')),
('serie17',	(SELECT `categoria_id` FROM `tbl_categoria` WHERE `categoria_nom` = 'cat05')),
('serie18',	(SELECT `categoria_id` FROM `tbl_categoria` WHERE `categoria_nom` = 'cat05')),
('serie19',	(SELECT `categoria_id` FROM `tbl_categoria` WHERE `categoria_nom` = 'cat05')),
('serie20',	(SELECT `categoria_id` FROM `tbl_categoria` WHERE `categoria_nom` = 'cat05'));


INSERT INTO `tbl_producte` (`producte_nom`,`producte_fotoRuta`,`producte_fotoNom`,`producte_fotoExt`,`producte_preu`,`producte_descripcio`,`producte_descompte`,`serie_id`) VALUES
('prod01',	'img/productos/',	'prod01',	'.jpg',	20,	'Descripcion',	NULL,	(SELECT `serie_id` FROM `tbl_serie` WHERE `serie_nom` = 'serie01')),
('prod02',	'img/productos/',	'prod02',	'.jpg',	20,	'Descripcion',	NULL,	(SELECT `serie_id` FROM `tbl_serie` WHERE `serie_nom` = 'serie01')),
('prod03',	'img/productos/',	'prod03',	'.jpg',	20,	'Descripcion',	NULL,	(SELECT `serie_id` FROM `tbl_serie` WHERE `serie_nom` = 'serie02')),
('prod04',	'img/productos/',	'prod04',	'.jpg',	20,	'Descripcion',	NULL,	(SELECT `serie_id` FROM `tbl_serie` WHERE `serie_nom` = 'serie02')),
('prod05',	'img/productos/',	'prod05',	'.jpg',	20,	'Descripcion',	NULL,	(SELECT `serie_id` FROM `tbl_serie` WHERE `serie_nom` = 'serie03')),
('prod06',	'img/productos/',	'prod06',	'.jpg',	20,	'Descripcion',	NULL,	(SELECT `serie_id` FROM `tbl_serie` WHERE `serie_nom` = 'serie03')),
('prod07',	'img/productos/',	'prod07',	'.jpg',	20,	'Descripcion',	NULL,	(SELECT `serie_id` FROM `tbl_serie` WHERE `serie_nom` = 'serie04')),
('prod08',	'img/productos/',	'prod08',	'.jpg',	20,	'Descripcion',	NULL,	(SELECT `serie_id` FROM `tbl_serie` WHERE `serie_nom` = 'serie04')),
('prod09',	'img/productos/',	'prod09',	'.jpg',	20,	'Descripcion',	NULL,	(SELECT `serie_id` FROM `tbl_serie` WHERE `serie_nom` = 'serie05')),
('prod10',	'img/productos/',	'prod10',	'.jpg',	20,	'Descripcion',	NULL,	(SELECT `serie_id` FROM `tbl_serie` WHERE `serie_nom` = 'serie05')),
('prod11',	'img/productos/',	'prod11',	'.jpg',	20,	'Descripcion',	NULL,	(SELECT `serie_id` FROM `tbl_serie` WHERE `serie_nom` = 'serie06')),
('prod12',	'img/productos/',	'prod12',	'.jpg',	20,	'Descripcion',	NULL,	(SELECT `serie_id` FROM `tbl_serie` WHERE `serie_nom` = 'serie06')),
('prod13',	'img/productos/',	'prod13',	'.jpg',	20,	'Descripcion',	NULL,	(SELECT `serie_id` FROM `tbl_serie` WHERE `serie_nom` = 'serie07')),
('prod14',	'img/productos/',	'prod14',	'.jpg',	20,	'Descripcion',	NULL,	(SELECT `serie_id` FROM `tbl_serie` WHERE `serie_nom` = 'serie07')),
('prod15',	'img/productos/',	'prod15',	'.jpg',	20,	'Descripcion',	NULL,	(SELECT `serie_id` FROM `tbl_serie` WHERE `serie_nom` = 'serie08')),
('prod16',	'img/productos/',	'prod16',	'.jpg',	20,	'Descripcion',	NULL,	(SELECT `serie_id` FROM `tbl_serie` WHERE `serie_nom` = 'serie08')),
('prod17',	'img/productos/',	'prod17',	'.jpg',	20,	'Descripcion',	NULL,	(SELECT `serie_id` FROM `tbl_serie` WHERE `serie_nom` = 'serie09')),
('prod18',	'img/productos/',	'prod18',	'.jpg',	20,	'Descripcion',	NULL,	(SELECT `serie_id` FROM `tbl_serie` WHERE `serie_nom` = 'serie09')),
('prod19',	'img/productos/',	'prod19',	'.jpg',	20,	'Descripcion',	NULL,	(SELECT `serie_id` FROM `tbl_serie` WHERE `serie_nom` = 'serie10')),
('prod20',	'img/productos/',	'prod20',	'.jpg',	20,	'Descripcion',	NULL,	(SELECT `serie_id` FROM `tbl_serie` WHERE `serie_nom` = 'serie10')),
('prod21',	'img/productos/',	'prod21',	'.jpg',	20,	'Descripcion',	NULL,	(SELECT `serie_id` FROM `tbl_serie` WHERE `serie_nom` = 'serie11')),
('prod22',	'img/productos/',	'prod22',	'.jpg',	20,	'Descripcion',	NULL,	(SELECT `serie_id` FROM `tbl_serie` WHERE `serie_nom` = 'serie11')),
('prod23',	'img/productos/',	'prod23',	'.jpg',	20,	'Descripcion',	NULL,	(SELECT `serie_id` FROM `tbl_serie` WHERE `serie_nom` = 'serie12')),
('prod24',	'img/productos/',	'prod24',	'.jpg',	20,	'Descripcion',	NULL,	(SELECT `serie_id` FROM `tbl_serie` WHERE `serie_nom` = 'serie12')),
('prod25',	'img/productos/',	'prod25',	'.jpg',	20,	'Descripcion',	NULL,	(SELECT `serie_id` FROM `tbl_serie` WHERE `serie_nom` = 'serie13')),
('prod26',	'img/productos/',	'prod26',	'.jpg',	20,	'Descripcion',	NULL,	(SELECT `serie_id` FROM `tbl_serie` WHERE `serie_nom` = 'serie13')),
('prod27',	'img/productos/',	'prod27',	'.jpg',	20,	'Descripcion',	NULL,	(SELECT `serie_id` FROM `tbl_serie` WHERE `serie_nom` = 'serie14')),
('prod28',	'img/productos/',	'prod28',	'.jpg',	20,	'Descripcion',	NULL,	(SELECT `serie_id` FROM `tbl_serie` WHERE `serie_nom` = 'serie14')),
('prod29',	'img/productos/',	'prod29',	'.jpg',	20,	'Descripcion',	NULL,	(SELECT `serie_id` FROM `tbl_serie` WHERE `serie_nom` = 'serie15')),
('prod30',	'img/productos/',	'prod30',	'.jpg',	20,	'Descripcion',	NULL,	(SELECT `serie_id` FROM `tbl_serie` WHERE `serie_nom` = 'serie15')),
('prod31',	'img/productos/',	'prod31',	'.jpg',	20,	'Descripcion',	NULL,	(SELECT `serie_id` FROM `tbl_serie` WHERE `serie_nom` = 'serie16')),
('prod32',	'img/productos/',	'prod32',	'.jpg',	20,	'Descripcion',	NULL,	(SELECT `serie_id` FROM `tbl_serie` WHERE `serie_nom` = 'serie16')),
('prod33',	'img/productos/',	'prod33',	'.jpg',	20,	'Descripcion',	NULL,	(SELECT `serie_id` FROM `tbl_serie` WHERE `serie_nom` = 'serie17')),
('prod34',	'img/productos/',	'prod34',	'.jpg',	20,	'Descripcion',	NULL,	(SELECT `serie_id` FROM `tbl_serie` WHERE `serie_nom` = 'serie17')),
('prod35',	'img/productos/',	'prod35',	'.jpg',	20,	'Descripcion',	NULL,	(SELECT `serie_id` FROM `tbl_serie` WHERE `serie_nom` = 'serie18')),
('prod36',	'img/productos/',	'prod36',	'.jpg',	20,	'Descripcion',	NULL,	(SELECT `serie_id` FROM `tbl_serie` WHERE `serie_nom` = 'serie18')),
('prod37',	'img/productos/',	'prod37',	'.jpg',	20,	'Descripcion',	NULL,	(SELECT `serie_id` FROM `tbl_serie` WHERE `serie_nom` = 'serie19')),
('prod38',	'img/productos/',	'prod38',	'.jpg',	20,	'Descripcion',	NULL,	(SELECT `serie_id` FROM `tbl_serie` WHERE `serie_nom` = 'serie19')),
('prod39',	'img/productos/',	'prod39',	'.jpg',	20,	'Descripcion',	NULL,	(SELECT `serie_id` FROM `tbl_serie` WHERE `serie_nom` = 'serie20')),
('prod40',	'img/productos/',	'prod40',	'.jpg',	20,	'Descripcion',	NULL,	(SELECT `serie_id` FROM `tbl_serie` WHERE `serie_nom` = 'serie20'));


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


INSERT INTO `tbl_estoc` (`estoc_quantitat`,`estoc_maxim`,`estoc_minim`,`producte_id`,`lloc_id`) VALUES
(20,50,10,(SELECT `producte_id` FROM `tbl_producte` WHERE `producte_nom` = 'prod01'),1),
(20,50,10,(SELECT `producte_id` FROM `tbl_producte` WHERE `producte_nom` = 'prod02'),2),
(20,50,10,(SELECT `producte_id` FROM `tbl_producte` WHERE `producte_nom` = 'prod03'),3),
(20,50,10,(SELECT `producte_id` FROM `tbl_producte` WHERE `producte_nom` = 'prod04'),4),
(20,50,10,(SELECT `producte_id` FROM `tbl_producte` WHERE `producte_nom` = 'prod05'),5),
(20,50,10,(SELECT `producte_id` FROM `tbl_producte` WHERE `producte_nom` = 'prod06'),6),
(20,50,10,(SELECT `producte_id` FROM `tbl_producte` WHERE `producte_nom` = 'prod07'),7),
(20,50,10,(SELECT `producte_id` FROM `tbl_producte` WHERE `producte_nom` = 'prod08'),8),
(20,50,10,(SELECT `producte_id` FROM `tbl_producte` WHERE `producte_nom` = 'prod09'),9),
(20,50,10,(SELECT `producte_id` FROM `tbl_producte` WHERE `producte_nom` = 'prod10'),10),
(20,50,10,(SELECT `producte_id` FROM `tbl_producte` WHERE `producte_nom` = 'prod11'),11),
(20,50,10,(SELECT `producte_id` FROM `tbl_producte` WHERE `producte_nom` = 'prod12'),12),
(20,50,10,(SELECT `producte_id` FROM `tbl_producte` WHERE `producte_nom` = 'prod13'),13),
(20,50,10,(SELECT `producte_id` FROM `tbl_producte` WHERE `producte_nom` = 'prod14'),14),
(20,50,10,(SELECT `producte_id` FROM `tbl_producte` WHERE `producte_nom` = 'prod15'),15),
(20,50,10,(SELECT `producte_id` FROM `tbl_producte` WHERE `producte_nom` = 'prod16'),16),
(20,50,10,(SELECT `producte_id` FROM `tbl_producte` WHERE `producte_nom` = 'prod17'),17),
(20,50,10,(SELECT `producte_id` FROM `tbl_producte` WHERE `producte_nom` = 'prod18'),18),
(20,50,10,(SELECT `producte_id` FROM `tbl_producte` WHERE `producte_nom` = 'prod19'),19),
(20,50,10,(SELECT `producte_id` FROM `tbl_producte` WHERE `producte_nom` = 'prod20'),20),
(20,50,10,(SELECT `producte_id` FROM `tbl_producte` WHERE `producte_nom` = 'prod21'),21),
(20,50,10,(SELECT `producte_id` FROM `tbl_producte` WHERE `producte_nom` = 'prod22'),22),
(20,50,10,(SELECT `producte_id` FROM `tbl_producte` WHERE `producte_nom` = 'prod23'),23),
(20,50,10,(SELECT `producte_id` FROM `tbl_producte` WHERE `producte_nom` = 'prod24'),24),
(20,50,10,(SELECT `producte_id` FROM `tbl_producte` WHERE `producte_nom` = 'prod25'),25),
(20,50,10,(SELECT `producte_id` FROM `tbl_producte` WHERE `producte_nom` = 'prod26'),26),
(20,50,10,(SELECT `producte_id` FROM `tbl_producte` WHERE `producte_nom` = 'prod27'),27),
(20,50,10,(SELECT `producte_id` FROM `tbl_producte` WHERE `producte_nom` = 'prod28'),28),
(20,50,10,(SELECT `producte_id` FROM `tbl_producte` WHERE `producte_nom` = 'prod29'),29),
(20,50,10,(SELECT `producte_id` FROM `tbl_producte` WHERE `producte_nom` = 'prod30'),30),
(20,50,10,(SELECT `producte_id` FROM `tbl_producte` WHERE `producte_nom` = 'prod31'),31),
(20,50,10,(SELECT `producte_id` FROM `tbl_producte` WHERE `producte_nom` = 'prod32'),32),
(20,50,10,(SELECT `producte_id` FROM `tbl_producte` WHERE `producte_nom` = 'prod33'),33),
(20,50,10,(SELECT `producte_id` FROM `tbl_producte` WHERE `producte_nom` = 'prod34'),34),
(20,50,10,(SELECT `producte_id` FROM `tbl_producte` WHERE `producte_nom` = 'prod35'),35),
(20,50,10,(SELECT `producte_id` FROM `tbl_producte` WHERE `producte_nom` = 'prod36'),36),
(20,50,10,(SELECT `producte_id` FROM `tbl_producte` WHERE `producte_nom` = 'prod37'),37),
(20,50,10,(SELECT `producte_id` FROM `tbl_producte` WHERE `producte_nom` = 'prod38'),38),
(20,50,10,(SELECT `producte_id` FROM `tbl_producte` WHERE `producte_nom` = 'prod39'),39),
(20,50,10,(SELECT `producte_id` FROM `tbl_producte` WHERE `producte_nom` = 'prod40'),40);