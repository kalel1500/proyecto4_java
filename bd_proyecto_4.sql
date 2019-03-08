-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 08, 2019 at 04:27 PM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bd_proyecto_4`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_categoria`
--

CREATE TABLE `tbl_categoria` (
  `categoria_id` int(11) NOT NULL,
  `categoria_nom` varchar(20) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_categoria`
--

INSERT INTO `tbl_categoria` (`categoria_id`, `categoria_nom`) VALUES
(1, 'Luz de interior'),
(2, 'Luz de exterior'),
(3, 'Lámparas'),
(4, 'LED'),
(5, 'Control Alumbrado');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_estoc`
--

CREATE TABLE `tbl_estoc` (
  `estoc_id` int(11) NOT NULL,
  `estoc_quantitat` int(5) NOT NULL,
  `estoc_maxim` int(5) NOT NULL,
  `estoc_minim` int(5) NOT NULL,
  `producte_id` int(11) DEFAULT NULL,
  `lloc_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_estoc`
--

INSERT INTO `tbl_estoc` (`estoc_id`, `estoc_quantitat`, `estoc_maxim`, `estoc_minim`, `producte_id`, `lloc_id`) VALUES
(1, 5, 500, 10, 1, 339),
(2, 20, 1500, 100, 2, 2),
(3, 20, 3000, 100, 3, 3),
(4, 20, 500, 1, 4, 4),
(5, 45, 500, 10, 5, 1),
(6, 20, 350, 5, 6, 6),
(7, 20, 3000, 1000, 7, 7),
(8, 20, 3000, 100, 8, 8),
(9, 20, 500, 50, 9, 1),
(10, 20, 2500, 300, 10, 10),
(11, 20, 2000, 250, 11, 11),
(12, 20, 250, 10, 12, 12),
(13, 370, 1000, 250, 13, 13),
(14, 20, 1000, 10, 14, 14),
(15, 20, 5000, 100, 15, 15),
(16, 20, 5000, 30, 16, 16),
(17, 20, 1000, 100, 17, 17),
(18, 20, 900, 50, 18, 18),
(19, 20, 1000, 100, 19, 19),
(20, 20, 3000, 10, 20, 20),
(21, 20, 1000, 100, 21, 21),
(22, 20, 2000, 100, 22, 22),
(23, 20, 5000, 1000, 23, 23),
(24, 20, 100, 10, 24, 24),
(25, 20, 1000, 50, 25, 25),
(26, 20, 3000, 50, 26, 26),
(27, 20, 1000, 100, 27, 27),
(28, 95, 3000, 1500, 28, 28),
(29, 20, 10000, 100, 29, 29),
(30, 20, 5000, 100, 30, 30),
(31, 20, 1000, 100, 31, 31),
(32, 20, 500, 10, 32, 32),
(33, 20, 50, 10, 33, 33),
(34, 20, 50, 10, 34, 34),
(35, 20, 50, 10, 35, 35),
(36, 20, 50, 10, 36, 36),
(37, 20, 50, 10, 37, 37),
(38, 20, 50, 10, 38, 38),
(39, 20, 50, 10, 39, 39),
(40, 20, 50, 10, 40, 40),
(41, 50, 5000, 10, 41, 87),
(42, 0, 123, 123, 42, 1),
(43, 0, 234, 234, 43, 475),
(44, 0, 123, 21, 44, 44),
(45, 0, 1714, 5, 45, 45),
(46, 0, 1000, 100, 46, 46),
(47, 0, 255, 21, 47, 311),
(48, 0, 20, 20, 48, 48);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_lloc`
--

CREATE TABLE `tbl_lloc` (
  `lloc_id` int(11) NOT NULL,
  `lloc_bloc` enum('Bloc 1','Bloc 2','Bloc 3','Bloc 4','Bloc 5','Bloc 6','Bloc 7','Bloc 8') COLLATE utf8_unicode_ci NOT NULL,
  `lloc_passadis` enum('Passadis 1','Passadis 2','Passadis 3','Passadis 4','Passadis 5','Passadis 6','Passadis 7','Passadis 8','Passadis 9','Passadis 10','Passadis 11','Passadis 12') COLLATE utf8_unicode_ci NOT NULL,
  `lloc_lleixa` enum('Lleixa 1','Lleixa 2','Lleixa 3','Lleixa 4','Lleixa 5','Lleixa 6','Lleixa 7','Lleixa 8') COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_lloc`
--

INSERT INTO `tbl_lloc` (`lloc_id`, `lloc_bloc`, `lloc_passadis`, `lloc_lleixa`) VALUES
(1, 'Bloc 1', 'Passadis 1', 'Lleixa 1'),
(2, 'Bloc 1', 'Passadis 1', 'Lleixa 2'),
(3, 'Bloc 1', 'Passadis 1', 'Lleixa 3'),
(4, 'Bloc 1', 'Passadis 1', 'Lleixa 4'),
(5, 'Bloc 1', 'Passadis 1', 'Lleixa 5'),
(6, 'Bloc 1', 'Passadis 1', 'Lleixa 6'),
(7, 'Bloc 1', 'Passadis 1', 'Lleixa 7'),
(8, 'Bloc 1', 'Passadis 1', 'Lleixa 8'),
(9, 'Bloc 1', 'Passadis 2', 'Lleixa 1'),
(10, 'Bloc 1', 'Passadis 2', 'Lleixa 2'),
(11, 'Bloc 1', 'Passadis 2', 'Lleixa 3'),
(12, 'Bloc 1', 'Passadis 2', 'Lleixa 4'),
(13, 'Bloc 1', 'Passadis 2', 'Lleixa 5'),
(14, 'Bloc 1', 'Passadis 2', 'Lleixa 6'),
(15, 'Bloc 1', 'Passadis 2', 'Lleixa 7'),
(16, 'Bloc 1', 'Passadis 2', 'Lleixa 8'),
(17, 'Bloc 1', 'Passadis 3', 'Lleixa 1'),
(18, 'Bloc 1', 'Passadis 3', 'Lleixa 2'),
(19, 'Bloc 1', 'Passadis 3', 'Lleixa 3'),
(20, 'Bloc 1', 'Passadis 3', 'Lleixa 4'),
(21, 'Bloc 1', 'Passadis 3', 'Lleixa 5'),
(22, 'Bloc 1', 'Passadis 3', 'Lleixa 6'),
(23, 'Bloc 1', 'Passadis 3', 'Lleixa 7'),
(24, 'Bloc 1', 'Passadis 3', 'Lleixa 8'),
(25, 'Bloc 1', 'Passadis 4', 'Lleixa 1'),
(26, 'Bloc 1', 'Passadis 4', 'Lleixa 2'),
(27, 'Bloc 1', 'Passadis 4', 'Lleixa 3'),
(28, 'Bloc 1', 'Passadis 4', 'Lleixa 4'),
(29, 'Bloc 1', 'Passadis 4', 'Lleixa 5'),
(30, 'Bloc 1', 'Passadis 4', 'Lleixa 6'),
(31, 'Bloc 1', 'Passadis 4', 'Lleixa 7'),
(32, 'Bloc 1', 'Passadis 4', 'Lleixa 8'),
(33, 'Bloc 1', 'Passadis 5', 'Lleixa 1'),
(34, 'Bloc 1', 'Passadis 5', 'Lleixa 2'),
(35, 'Bloc 1', 'Passadis 5', 'Lleixa 3'),
(36, 'Bloc 1', 'Passadis 5', 'Lleixa 4'),
(37, 'Bloc 1', 'Passadis 5', 'Lleixa 5'),
(38, 'Bloc 1', 'Passadis 5', 'Lleixa 6'),
(39, 'Bloc 1', 'Passadis 5', 'Lleixa 7'),
(40, 'Bloc 1', 'Passadis 5', 'Lleixa 8'),
(41, 'Bloc 1', 'Passadis 6', 'Lleixa 1'),
(42, 'Bloc 1', 'Passadis 6', 'Lleixa 2'),
(43, 'Bloc 1', 'Passadis 6', 'Lleixa 3'),
(44, 'Bloc 1', 'Passadis 6', 'Lleixa 4'),
(45, 'Bloc 1', 'Passadis 6', 'Lleixa 5'),
(46, 'Bloc 1', 'Passadis 6', 'Lleixa 6'),
(47, 'Bloc 1', 'Passadis 6', 'Lleixa 7'),
(48, 'Bloc 1', 'Passadis 6', 'Lleixa 8'),
(49, 'Bloc 1', 'Passadis 7', 'Lleixa 1'),
(50, 'Bloc 1', 'Passadis 7', 'Lleixa 2'),
(51, 'Bloc 1', 'Passadis 7', 'Lleixa 3'),
(52, 'Bloc 1', 'Passadis 7', 'Lleixa 4'),
(53, 'Bloc 1', 'Passadis 7', 'Lleixa 5'),
(54, 'Bloc 1', 'Passadis 7', 'Lleixa 6'),
(55, 'Bloc 1', 'Passadis 7', 'Lleixa 7'),
(56, 'Bloc 1', 'Passadis 7', 'Lleixa 8'),
(57, 'Bloc 1', 'Passadis 8', 'Lleixa 1'),
(58, 'Bloc 1', 'Passadis 8', 'Lleixa 2'),
(59, 'Bloc 1', 'Passadis 8', 'Lleixa 3'),
(60, 'Bloc 1', 'Passadis 8', 'Lleixa 4'),
(61, 'Bloc 1', 'Passadis 8', 'Lleixa 5'),
(62, 'Bloc 1', 'Passadis 8', 'Lleixa 6'),
(63, 'Bloc 1', 'Passadis 8', 'Lleixa 7'),
(64, 'Bloc 1', 'Passadis 8', 'Lleixa 8'),
(65, 'Bloc 1', 'Passadis 9', 'Lleixa 1'),
(66, 'Bloc 1', 'Passadis 9', 'Lleixa 2'),
(67, 'Bloc 1', 'Passadis 9', 'Lleixa 3'),
(68, 'Bloc 1', 'Passadis 9', 'Lleixa 4'),
(69, 'Bloc 1', 'Passadis 9', 'Lleixa 5'),
(70, 'Bloc 1', 'Passadis 9', 'Lleixa 6'),
(71, 'Bloc 1', 'Passadis 9', 'Lleixa 7'),
(72, 'Bloc 1', 'Passadis 9', 'Lleixa 8'),
(73, 'Bloc 1', 'Passadis 10', 'Lleixa 1'),
(74, 'Bloc 1', 'Passadis 10', 'Lleixa 2'),
(75, 'Bloc 1', 'Passadis 10', 'Lleixa 3'),
(76, 'Bloc 1', 'Passadis 10', 'Lleixa 4'),
(77, 'Bloc 1', 'Passadis 10', 'Lleixa 5'),
(78, 'Bloc 1', 'Passadis 10', 'Lleixa 6'),
(79, 'Bloc 1', 'Passadis 10', 'Lleixa 7'),
(80, 'Bloc 1', 'Passadis 10', 'Lleixa 8'),
(81, 'Bloc 1', 'Passadis 11', 'Lleixa 1'),
(82, 'Bloc 1', 'Passadis 11', 'Lleixa 2'),
(83, 'Bloc 1', 'Passadis 11', 'Lleixa 3'),
(84, 'Bloc 1', 'Passadis 11', 'Lleixa 4'),
(85, 'Bloc 1', 'Passadis 11', 'Lleixa 5'),
(86, 'Bloc 1', 'Passadis 11', 'Lleixa 6'),
(87, 'Bloc 1', 'Passadis 11', 'Lleixa 7'),
(88, 'Bloc 1', 'Passadis 11', 'Lleixa 8'),
(89, 'Bloc 1', 'Passadis 12', 'Lleixa 1'),
(90, 'Bloc 1', 'Passadis 12', 'Lleixa 2'),
(91, 'Bloc 1', 'Passadis 12', 'Lleixa 3'),
(92, 'Bloc 1', 'Passadis 12', 'Lleixa 4'),
(93, 'Bloc 1', 'Passadis 12', 'Lleixa 5'),
(94, 'Bloc 1', 'Passadis 12', 'Lleixa 6'),
(95, 'Bloc 1', 'Passadis 12', 'Lleixa 7'),
(96, 'Bloc 1', 'Passadis 12', 'Lleixa 8'),
(97, 'Bloc 2', 'Passadis 1', 'Lleixa 1'),
(98, 'Bloc 2', 'Passadis 1', 'Lleixa 2'),
(99, 'Bloc 2', 'Passadis 1', 'Lleixa 3'),
(100, 'Bloc 2', 'Passadis 1', 'Lleixa 4'),
(101, 'Bloc 2', 'Passadis 1', 'Lleixa 5'),
(102, 'Bloc 2', 'Passadis 1', 'Lleixa 6'),
(103, 'Bloc 2', 'Passadis 1', 'Lleixa 7'),
(104, 'Bloc 2', 'Passadis 1', 'Lleixa 8'),
(105, 'Bloc 2', 'Passadis 2', 'Lleixa 1'),
(106, 'Bloc 2', 'Passadis 2', 'Lleixa 2'),
(107, 'Bloc 2', 'Passadis 2', 'Lleixa 3'),
(108, 'Bloc 2', 'Passadis 2', 'Lleixa 4'),
(109, 'Bloc 2', 'Passadis 2', 'Lleixa 5'),
(110, 'Bloc 2', 'Passadis 2', 'Lleixa 6'),
(111, 'Bloc 2', 'Passadis 2', 'Lleixa 7'),
(112, 'Bloc 2', 'Passadis 2', 'Lleixa 8'),
(113, 'Bloc 2', 'Passadis 3', 'Lleixa 1'),
(114, 'Bloc 2', 'Passadis 3', 'Lleixa 2'),
(115, 'Bloc 2', 'Passadis 3', 'Lleixa 3'),
(116, 'Bloc 2', 'Passadis 3', 'Lleixa 4'),
(117, 'Bloc 2', 'Passadis 3', 'Lleixa 5'),
(118, 'Bloc 2', 'Passadis 3', 'Lleixa 6'),
(119, 'Bloc 2', 'Passadis 3', 'Lleixa 7'),
(120, 'Bloc 2', 'Passadis 3', 'Lleixa 8'),
(121, 'Bloc 2', 'Passadis 4', 'Lleixa 1'),
(122, 'Bloc 2', 'Passadis 4', 'Lleixa 2'),
(123, 'Bloc 2', 'Passadis 4', 'Lleixa 3'),
(124, 'Bloc 2', 'Passadis 4', 'Lleixa 4'),
(125, 'Bloc 2', 'Passadis 4', 'Lleixa 5'),
(126, 'Bloc 2', 'Passadis 4', 'Lleixa 6'),
(127, 'Bloc 2', 'Passadis 4', 'Lleixa 7'),
(128, 'Bloc 2', 'Passadis 4', 'Lleixa 8'),
(129, 'Bloc 2', 'Passadis 5', 'Lleixa 1'),
(130, 'Bloc 2', 'Passadis 5', 'Lleixa 2'),
(131, 'Bloc 2', 'Passadis 5', 'Lleixa 3'),
(132, 'Bloc 2', 'Passadis 5', 'Lleixa 4'),
(133, 'Bloc 2', 'Passadis 5', 'Lleixa 5'),
(134, 'Bloc 2', 'Passadis 5', 'Lleixa 6'),
(135, 'Bloc 2', 'Passadis 5', 'Lleixa 7'),
(136, 'Bloc 2', 'Passadis 5', 'Lleixa 8'),
(137, 'Bloc 2', 'Passadis 6', 'Lleixa 1'),
(138, 'Bloc 2', 'Passadis 6', 'Lleixa 2'),
(139, 'Bloc 2', 'Passadis 6', 'Lleixa 3'),
(140, 'Bloc 2', 'Passadis 6', 'Lleixa 4'),
(141, 'Bloc 2', 'Passadis 6', 'Lleixa 5'),
(142, 'Bloc 2', 'Passadis 6', 'Lleixa 6'),
(143, 'Bloc 2', 'Passadis 6', 'Lleixa 7'),
(144, 'Bloc 2', 'Passadis 6', 'Lleixa 8'),
(145, 'Bloc 2', 'Passadis 7', 'Lleixa 1'),
(146, 'Bloc 2', 'Passadis 7', 'Lleixa 2'),
(147, 'Bloc 2', 'Passadis 7', 'Lleixa 3'),
(148, 'Bloc 2', 'Passadis 7', 'Lleixa 4'),
(149, 'Bloc 2', 'Passadis 7', 'Lleixa 5'),
(150, 'Bloc 2', 'Passadis 7', 'Lleixa 6'),
(151, 'Bloc 2', 'Passadis 7', 'Lleixa 7'),
(152, 'Bloc 2', 'Passadis 7', 'Lleixa 8'),
(153, 'Bloc 2', 'Passadis 8', 'Lleixa 1'),
(154, 'Bloc 2', 'Passadis 8', 'Lleixa 2'),
(155, 'Bloc 2', 'Passadis 8', 'Lleixa 3'),
(156, 'Bloc 2', 'Passadis 8', 'Lleixa 4'),
(157, 'Bloc 2', 'Passadis 8', 'Lleixa 5'),
(158, 'Bloc 2', 'Passadis 8', 'Lleixa 6'),
(159, 'Bloc 2', 'Passadis 8', 'Lleixa 7'),
(160, 'Bloc 2', 'Passadis 8', 'Lleixa 8'),
(161, 'Bloc 2', 'Passadis 9', 'Lleixa 1'),
(162, 'Bloc 2', 'Passadis 9', 'Lleixa 2'),
(163, 'Bloc 2', 'Passadis 9', 'Lleixa 3'),
(164, 'Bloc 2', 'Passadis 9', 'Lleixa 4'),
(165, 'Bloc 2', 'Passadis 9', 'Lleixa 5'),
(166, 'Bloc 2', 'Passadis 9', 'Lleixa 6'),
(167, 'Bloc 2', 'Passadis 9', 'Lleixa 7'),
(168, 'Bloc 2', 'Passadis 9', 'Lleixa 8'),
(169, 'Bloc 2', 'Passadis 10', 'Lleixa 1'),
(170, 'Bloc 2', 'Passadis 10', 'Lleixa 2'),
(171, 'Bloc 2', 'Passadis 10', 'Lleixa 3'),
(172, 'Bloc 2', 'Passadis 10', 'Lleixa 4'),
(173, 'Bloc 2', 'Passadis 10', 'Lleixa 5'),
(174, 'Bloc 2', 'Passadis 10', 'Lleixa 6'),
(175, 'Bloc 2', 'Passadis 10', 'Lleixa 7'),
(176, 'Bloc 2', 'Passadis 10', 'Lleixa 8'),
(177, 'Bloc 2', 'Passadis 11', 'Lleixa 1'),
(178, 'Bloc 2', 'Passadis 11', 'Lleixa 2'),
(179, 'Bloc 2', 'Passadis 11', 'Lleixa 3'),
(180, 'Bloc 2', 'Passadis 11', 'Lleixa 4'),
(181, 'Bloc 2', 'Passadis 11', 'Lleixa 5'),
(182, 'Bloc 2', 'Passadis 11', 'Lleixa 6'),
(183, 'Bloc 2', 'Passadis 11', 'Lleixa 7'),
(184, 'Bloc 2', 'Passadis 11', 'Lleixa 8'),
(185, 'Bloc 2', 'Passadis 12', 'Lleixa 1'),
(186, 'Bloc 2', 'Passadis 12', 'Lleixa 2'),
(187, 'Bloc 2', 'Passadis 12', 'Lleixa 3'),
(188, 'Bloc 2', 'Passadis 12', 'Lleixa 4'),
(189, 'Bloc 2', 'Passadis 12', 'Lleixa 5'),
(190, 'Bloc 2', 'Passadis 12', 'Lleixa 6'),
(191, 'Bloc 2', 'Passadis 12', 'Lleixa 7'),
(192, 'Bloc 2', 'Passadis 12', 'Lleixa 8'),
(193, 'Bloc 3', 'Passadis 1', 'Lleixa 1'),
(194, 'Bloc 3', 'Passadis 1', 'Lleixa 2'),
(195, 'Bloc 3', 'Passadis 1', 'Lleixa 3'),
(196, 'Bloc 3', 'Passadis 1', 'Lleixa 4'),
(197, 'Bloc 3', 'Passadis 1', 'Lleixa 5'),
(198, 'Bloc 3', 'Passadis 1', 'Lleixa 6'),
(199, 'Bloc 3', 'Passadis 1', 'Lleixa 7'),
(200, 'Bloc 3', 'Passadis 1', 'Lleixa 8'),
(201, 'Bloc 3', 'Passadis 2', 'Lleixa 1'),
(202, 'Bloc 3', 'Passadis 2', 'Lleixa 2'),
(203, 'Bloc 3', 'Passadis 2', 'Lleixa 3'),
(204, 'Bloc 3', 'Passadis 2', 'Lleixa 4'),
(205, 'Bloc 3', 'Passadis 2', 'Lleixa 5'),
(206, 'Bloc 3', 'Passadis 2', 'Lleixa 6'),
(207, 'Bloc 3', 'Passadis 2', 'Lleixa 7'),
(208, 'Bloc 3', 'Passadis 2', 'Lleixa 8'),
(209, 'Bloc 3', 'Passadis 3', 'Lleixa 1'),
(210, 'Bloc 3', 'Passadis 3', 'Lleixa 2'),
(211, 'Bloc 3', 'Passadis 3', 'Lleixa 3'),
(212, 'Bloc 3', 'Passadis 3', 'Lleixa 4'),
(213, 'Bloc 3', 'Passadis 3', 'Lleixa 5'),
(214, 'Bloc 3', 'Passadis 3', 'Lleixa 6'),
(215, 'Bloc 3', 'Passadis 3', 'Lleixa 7'),
(216, 'Bloc 3', 'Passadis 3', 'Lleixa 8'),
(217, 'Bloc 3', 'Passadis 4', 'Lleixa 1'),
(218, 'Bloc 3', 'Passadis 4', 'Lleixa 2'),
(219, 'Bloc 3', 'Passadis 4', 'Lleixa 3'),
(220, 'Bloc 3', 'Passadis 4', 'Lleixa 4'),
(221, 'Bloc 3', 'Passadis 4', 'Lleixa 5'),
(222, 'Bloc 3', 'Passadis 4', 'Lleixa 6'),
(223, 'Bloc 3', 'Passadis 4', 'Lleixa 7'),
(224, 'Bloc 3', 'Passadis 4', 'Lleixa 8'),
(225, 'Bloc 3', 'Passadis 5', 'Lleixa 1'),
(226, 'Bloc 3', 'Passadis 5', 'Lleixa 2'),
(227, 'Bloc 3', 'Passadis 5', 'Lleixa 3'),
(228, 'Bloc 3', 'Passadis 5', 'Lleixa 4'),
(229, 'Bloc 3', 'Passadis 5', 'Lleixa 5'),
(230, 'Bloc 3', 'Passadis 5', 'Lleixa 6'),
(231, 'Bloc 3', 'Passadis 5', 'Lleixa 7'),
(232, 'Bloc 3', 'Passadis 5', 'Lleixa 8'),
(233, 'Bloc 3', 'Passadis 6', 'Lleixa 1'),
(234, 'Bloc 3', 'Passadis 6', 'Lleixa 2'),
(235, 'Bloc 3', 'Passadis 6', 'Lleixa 3'),
(236, 'Bloc 3', 'Passadis 6', 'Lleixa 4'),
(237, 'Bloc 3', 'Passadis 6', 'Lleixa 5'),
(238, 'Bloc 3', 'Passadis 6', 'Lleixa 6'),
(239, 'Bloc 3', 'Passadis 6', 'Lleixa 7'),
(240, 'Bloc 3', 'Passadis 6', 'Lleixa 8'),
(241, 'Bloc 3', 'Passadis 7', 'Lleixa 1'),
(242, 'Bloc 3', 'Passadis 7', 'Lleixa 2'),
(243, 'Bloc 3', 'Passadis 7', 'Lleixa 3'),
(244, 'Bloc 3', 'Passadis 7', 'Lleixa 4'),
(245, 'Bloc 3', 'Passadis 7', 'Lleixa 5'),
(246, 'Bloc 3', 'Passadis 7', 'Lleixa 6'),
(247, 'Bloc 3', 'Passadis 7', 'Lleixa 7'),
(248, 'Bloc 3', 'Passadis 7', 'Lleixa 8'),
(249, 'Bloc 3', 'Passadis 8', 'Lleixa 1'),
(250, 'Bloc 3', 'Passadis 8', 'Lleixa 2'),
(251, 'Bloc 3', 'Passadis 8', 'Lleixa 3'),
(252, 'Bloc 3', 'Passadis 8', 'Lleixa 4'),
(253, 'Bloc 3', 'Passadis 8', 'Lleixa 5'),
(254, 'Bloc 3', 'Passadis 8', 'Lleixa 6'),
(255, 'Bloc 3', 'Passadis 8', 'Lleixa 7'),
(256, 'Bloc 3', 'Passadis 8', 'Lleixa 8'),
(257, 'Bloc 3', 'Passadis 9', 'Lleixa 1'),
(258, 'Bloc 3', 'Passadis 9', 'Lleixa 2'),
(259, 'Bloc 3', 'Passadis 9', 'Lleixa 3'),
(260, 'Bloc 3', 'Passadis 9', 'Lleixa 4'),
(261, 'Bloc 3', 'Passadis 9', 'Lleixa 5'),
(262, 'Bloc 3', 'Passadis 9', 'Lleixa 6'),
(263, 'Bloc 3', 'Passadis 9', 'Lleixa 7'),
(264, 'Bloc 3', 'Passadis 9', 'Lleixa 8'),
(265, 'Bloc 3', 'Passadis 10', 'Lleixa 1'),
(266, 'Bloc 3', 'Passadis 10', 'Lleixa 2'),
(267, 'Bloc 3', 'Passadis 10', 'Lleixa 3'),
(268, 'Bloc 3', 'Passadis 10', 'Lleixa 4'),
(269, 'Bloc 3', 'Passadis 10', 'Lleixa 5'),
(270, 'Bloc 3', 'Passadis 10', 'Lleixa 6'),
(271, 'Bloc 3', 'Passadis 10', 'Lleixa 7'),
(272, 'Bloc 3', 'Passadis 10', 'Lleixa 8'),
(273, 'Bloc 3', 'Passadis 11', 'Lleixa 1'),
(274, 'Bloc 3', 'Passadis 11', 'Lleixa 2'),
(275, 'Bloc 3', 'Passadis 11', 'Lleixa 3'),
(276, 'Bloc 3', 'Passadis 11', 'Lleixa 4'),
(277, 'Bloc 3', 'Passadis 11', 'Lleixa 5'),
(278, 'Bloc 3', 'Passadis 11', 'Lleixa 6'),
(279, 'Bloc 3', 'Passadis 11', 'Lleixa 7'),
(280, 'Bloc 3', 'Passadis 11', 'Lleixa 8'),
(281, 'Bloc 3', 'Passadis 12', 'Lleixa 1'),
(282, 'Bloc 3', 'Passadis 12', 'Lleixa 2'),
(283, 'Bloc 3', 'Passadis 12', 'Lleixa 3'),
(284, 'Bloc 3', 'Passadis 12', 'Lleixa 4'),
(285, 'Bloc 3', 'Passadis 12', 'Lleixa 5'),
(286, 'Bloc 3', 'Passadis 12', 'Lleixa 6'),
(287, 'Bloc 3', 'Passadis 12', 'Lleixa 7'),
(288, 'Bloc 3', 'Passadis 12', 'Lleixa 8'),
(289, 'Bloc 4', 'Passadis 1', 'Lleixa 1'),
(290, 'Bloc 4', 'Passadis 1', 'Lleixa 2'),
(291, 'Bloc 4', 'Passadis 1', 'Lleixa 3'),
(292, 'Bloc 4', 'Passadis 1', 'Lleixa 4'),
(293, 'Bloc 4', 'Passadis 1', 'Lleixa 5'),
(294, 'Bloc 4', 'Passadis 1', 'Lleixa 6'),
(295, 'Bloc 4', 'Passadis 1', 'Lleixa 7'),
(296, 'Bloc 4', 'Passadis 1', 'Lleixa 8'),
(297, 'Bloc 4', 'Passadis 2', 'Lleixa 1'),
(298, 'Bloc 4', 'Passadis 2', 'Lleixa 2'),
(299, 'Bloc 4', 'Passadis 2', 'Lleixa 3'),
(300, 'Bloc 4', 'Passadis 2', 'Lleixa 4'),
(301, 'Bloc 4', 'Passadis 2', 'Lleixa 5'),
(302, 'Bloc 4', 'Passadis 2', 'Lleixa 6'),
(303, 'Bloc 4', 'Passadis 2', 'Lleixa 7'),
(304, 'Bloc 4', 'Passadis 2', 'Lleixa 8'),
(305, 'Bloc 4', 'Passadis 3', 'Lleixa 1'),
(306, 'Bloc 4', 'Passadis 3', 'Lleixa 2'),
(307, 'Bloc 4', 'Passadis 3', 'Lleixa 3'),
(308, 'Bloc 4', 'Passadis 3', 'Lleixa 4'),
(309, 'Bloc 4', 'Passadis 3', 'Lleixa 5'),
(310, 'Bloc 4', 'Passadis 3', 'Lleixa 6'),
(311, 'Bloc 4', 'Passadis 3', 'Lleixa 7'),
(312, 'Bloc 4', 'Passadis 3', 'Lleixa 8'),
(313, 'Bloc 4', 'Passadis 4', 'Lleixa 1'),
(314, 'Bloc 4', 'Passadis 4', 'Lleixa 2'),
(315, 'Bloc 4', 'Passadis 4', 'Lleixa 3'),
(316, 'Bloc 4', 'Passadis 4', 'Lleixa 4'),
(317, 'Bloc 4', 'Passadis 4', 'Lleixa 5'),
(318, 'Bloc 4', 'Passadis 4', 'Lleixa 6'),
(319, 'Bloc 4', 'Passadis 4', 'Lleixa 7'),
(320, 'Bloc 4', 'Passadis 4', 'Lleixa 8'),
(321, 'Bloc 4', 'Passadis 5', 'Lleixa 1'),
(322, 'Bloc 4', 'Passadis 5', 'Lleixa 2'),
(323, 'Bloc 4', 'Passadis 5', 'Lleixa 3'),
(324, 'Bloc 4', 'Passadis 5', 'Lleixa 4'),
(325, 'Bloc 4', 'Passadis 5', 'Lleixa 5'),
(326, 'Bloc 4', 'Passadis 5', 'Lleixa 6'),
(327, 'Bloc 4', 'Passadis 5', 'Lleixa 7'),
(328, 'Bloc 4', 'Passadis 5', 'Lleixa 8'),
(329, 'Bloc 4', 'Passadis 6', 'Lleixa 1'),
(330, 'Bloc 4', 'Passadis 6', 'Lleixa 2'),
(331, 'Bloc 4', 'Passadis 6', 'Lleixa 3'),
(332, 'Bloc 4', 'Passadis 6', 'Lleixa 4'),
(333, 'Bloc 4', 'Passadis 6', 'Lleixa 5'),
(334, 'Bloc 4', 'Passadis 6', 'Lleixa 6'),
(335, 'Bloc 4', 'Passadis 6', 'Lleixa 7'),
(336, 'Bloc 4', 'Passadis 6', 'Lleixa 8'),
(337, 'Bloc 4', 'Passadis 7', 'Lleixa 1'),
(338, 'Bloc 4', 'Passadis 7', 'Lleixa 2'),
(339, 'Bloc 4', 'Passadis 7', 'Lleixa 3'),
(340, 'Bloc 4', 'Passadis 7', 'Lleixa 4'),
(341, 'Bloc 4', 'Passadis 7', 'Lleixa 5'),
(342, 'Bloc 4', 'Passadis 7', 'Lleixa 6'),
(343, 'Bloc 4', 'Passadis 7', 'Lleixa 7'),
(344, 'Bloc 4', 'Passadis 7', 'Lleixa 8'),
(345, 'Bloc 4', 'Passadis 8', 'Lleixa 1'),
(346, 'Bloc 4', 'Passadis 8', 'Lleixa 2'),
(347, 'Bloc 4', 'Passadis 8', 'Lleixa 3'),
(348, 'Bloc 4', 'Passadis 8', 'Lleixa 4'),
(349, 'Bloc 4', 'Passadis 8', 'Lleixa 5'),
(350, 'Bloc 4', 'Passadis 8', 'Lleixa 6'),
(351, 'Bloc 4', 'Passadis 8', 'Lleixa 7'),
(352, 'Bloc 4', 'Passadis 8', 'Lleixa 8'),
(353, 'Bloc 4', 'Passadis 9', 'Lleixa 1'),
(354, 'Bloc 4', 'Passadis 9', 'Lleixa 2'),
(355, 'Bloc 4', 'Passadis 9', 'Lleixa 3'),
(356, 'Bloc 4', 'Passadis 9', 'Lleixa 4'),
(357, 'Bloc 4', 'Passadis 9', 'Lleixa 5'),
(358, 'Bloc 4', 'Passadis 9', 'Lleixa 6'),
(359, 'Bloc 4', 'Passadis 9', 'Lleixa 7'),
(360, 'Bloc 4', 'Passadis 9', 'Lleixa 8'),
(361, 'Bloc 4', 'Passadis 10', 'Lleixa 1'),
(362, 'Bloc 4', 'Passadis 10', 'Lleixa 2'),
(363, 'Bloc 4', 'Passadis 10', 'Lleixa 3'),
(364, 'Bloc 4', 'Passadis 10', 'Lleixa 4'),
(365, 'Bloc 4', 'Passadis 10', 'Lleixa 5'),
(366, 'Bloc 4', 'Passadis 10', 'Lleixa 6'),
(367, 'Bloc 4', 'Passadis 10', 'Lleixa 7'),
(368, 'Bloc 4', 'Passadis 10', 'Lleixa 8'),
(369, 'Bloc 4', 'Passadis 11', 'Lleixa 1'),
(370, 'Bloc 4', 'Passadis 11', 'Lleixa 2'),
(371, 'Bloc 4', 'Passadis 11', 'Lleixa 3'),
(372, 'Bloc 4', 'Passadis 11', 'Lleixa 4'),
(373, 'Bloc 4', 'Passadis 11', 'Lleixa 5'),
(374, 'Bloc 4', 'Passadis 11', 'Lleixa 6'),
(375, 'Bloc 4', 'Passadis 11', 'Lleixa 7'),
(376, 'Bloc 4', 'Passadis 11', 'Lleixa 8'),
(377, 'Bloc 4', 'Passadis 12', 'Lleixa 1'),
(378, 'Bloc 4', 'Passadis 12', 'Lleixa 2'),
(379, 'Bloc 4', 'Passadis 12', 'Lleixa 3'),
(380, 'Bloc 4', 'Passadis 12', 'Lleixa 4'),
(381, 'Bloc 4', 'Passadis 12', 'Lleixa 5'),
(382, 'Bloc 4', 'Passadis 12', 'Lleixa 6'),
(383, 'Bloc 4', 'Passadis 12', 'Lleixa 7'),
(384, 'Bloc 4', 'Passadis 12', 'Lleixa 8'),
(385, 'Bloc 5', 'Passadis 1', 'Lleixa 1'),
(386, 'Bloc 5', 'Passadis 1', 'Lleixa 2'),
(387, 'Bloc 5', 'Passadis 1', 'Lleixa 3'),
(388, 'Bloc 5', 'Passadis 1', 'Lleixa 4'),
(389, 'Bloc 5', 'Passadis 1', 'Lleixa 5'),
(390, 'Bloc 5', 'Passadis 1', 'Lleixa 6'),
(391, 'Bloc 5', 'Passadis 1', 'Lleixa 7'),
(392, 'Bloc 5', 'Passadis 1', 'Lleixa 8'),
(393, 'Bloc 5', 'Passadis 2', 'Lleixa 1'),
(394, 'Bloc 5', 'Passadis 2', 'Lleixa 2'),
(395, 'Bloc 5', 'Passadis 2', 'Lleixa 3'),
(396, 'Bloc 5', 'Passadis 2', 'Lleixa 4'),
(397, 'Bloc 5', 'Passadis 2', 'Lleixa 5'),
(398, 'Bloc 5', 'Passadis 2', 'Lleixa 6'),
(399, 'Bloc 5', 'Passadis 2', 'Lleixa 7'),
(400, 'Bloc 5', 'Passadis 2', 'Lleixa 8'),
(401, 'Bloc 5', 'Passadis 3', 'Lleixa 1'),
(402, 'Bloc 5', 'Passadis 3', 'Lleixa 2'),
(403, 'Bloc 5', 'Passadis 3', 'Lleixa 3'),
(404, 'Bloc 5', 'Passadis 3', 'Lleixa 4'),
(405, 'Bloc 5', 'Passadis 3', 'Lleixa 5'),
(406, 'Bloc 5', 'Passadis 3', 'Lleixa 6'),
(407, 'Bloc 5', 'Passadis 3', 'Lleixa 7'),
(408, 'Bloc 5', 'Passadis 3', 'Lleixa 8'),
(409, 'Bloc 5', 'Passadis 4', 'Lleixa 1'),
(410, 'Bloc 5', 'Passadis 4', 'Lleixa 2'),
(411, 'Bloc 5', 'Passadis 4', 'Lleixa 3'),
(412, 'Bloc 5', 'Passadis 4', 'Lleixa 4'),
(413, 'Bloc 5', 'Passadis 4', 'Lleixa 5'),
(414, 'Bloc 5', 'Passadis 4', 'Lleixa 6'),
(415, 'Bloc 5', 'Passadis 4', 'Lleixa 7'),
(416, 'Bloc 5', 'Passadis 4', 'Lleixa 8'),
(417, 'Bloc 5', 'Passadis 5', 'Lleixa 1'),
(418, 'Bloc 5', 'Passadis 5', 'Lleixa 2'),
(419, 'Bloc 5', 'Passadis 5', 'Lleixa 3'),
(420, 'Bloc 5', 'Passadis 5', 'Lleixa 4'),
(421, 'Bloc 5', 'Passadis 5', 'Lleixa 5'),
(422, 'Bloc 5', 'Passadis 5', 'Lleixa 6'),
(423, 'Bloc 5', 'Passadis 5', 'Lleixa 7'),
(424, 'Bloc 5', 'Passadis 5', 'Lleixa 8'),
(425, 'Bloc 5', 'Passadis 6', 'Lleixa 1'),
(426, 'Bloc 5', 'Passadis 6', 'Lleixa 2'),
(427, 'Bloc 5', 'Passadis 6', 'Lleixa 3'),
(428, 'Bloc 5', 'Passadis 6', 'Lleixa 4'),
(429, 'Bloc 5', 'Passadis 6', 'Lleixa 5'),
(430, 'Bloc 5', 'Passadis 6', 'Lleixa 6'),
(431, 'Bloc 5', 'Passadis 6', 'Lleixa 7'),
(432, 'Bloc 5', 'Passadis 6', 'Lleixa 8'),
(433, 'Bloc 5', 'Passadis 7', 'Lleixa 1'),
(434, 'Bloc 5', 'Passadis 7', 'Lleixa 2'),
(435, 'Bloc 5', 'Passadis 7', 'Lleixa 3'),
(436, 'Bloc 5', 'Passadis 7', 'Lleixa 4'),
(437, 'Bloc 5', 'Passadis 7', 'Lleixa 5'),
(438, 'Bloc 5', 'Passadis 7', 'Lleixa 6'),
(439, 'Bloc 5', 'Passadis 7', 'Lleixa 7'),
(440, 'Bloc 5', 'Passadis 7', 'Lleixa 8'),
(441, 'Bloc 5', 'Passadis 8', 'Lleixa 1'),
(442, 'Bloc 5', 'Passadis 8', 'Lleixa 2'),
(443, 'Bloc 5', 'Passadis 8', 'Lleixa 3'),
(444, 'Bloc 5', 'Passadis 8', 'Lleixa 4'),
(445, 'Bloc 5', 'Passadis 8', 'Lleixa 5'),
(446, 'Bloc 5', 'Passadis 8', 'Lleixa 6'),
(447, 'Bloc 5', 'Passadis 8', 'Lleixa 7'),
(448, 'Bloc 5', 'Passadis 8', 'Lleixa 8'),
(449, 'Bloc 5', 'Passadis 9', 'Lleixa 1'),
(450, 'Bloc 5', 'Passadis 9', 'Lleixa 2'),
(451, 'Bloc 5', 'Passadis 9', 'Lleixa 3'),
(452, 'Bloc 5', 'Passadis 9', 'Lleixa 4'),
(453, 'Bloc 5', 'Passadis 9', 'Lleixa 5'),
(454, 'Bloc 5', 'Passadis 9', 'Lleixa 6'),
(455, 'Bloc 5', 'Passadis 9', 'Lleixa 7'),
(456, 'Bloc 5', 'Passadis 9', 'Lleixa 8'),
(457, 'Bloc 5', 'Passadis 10', 'Lleixa 1'),
(458, 'Bloc 5', 'Passadis 10', 'Lleixa 2'),
(459, 'Bloc 5', 'Passadis 10', 'Lleixa 3'),
(460, 'Bloc 5', 'Passadis 10', 'Lleixa 4'),
(461, 'Bloc 5', 'Passadis 10', 'Lleixa 5'),
(462, 'Bloc 5', 'Passadis 10', 'Lleixa 6'),
(463, 'Bloc 5', 'Passadis 10', 'Lleixa 7'),
(464, 'Bloc 5', 'Passadis 10', 'Lleixa 8'),
(465, 'Bloc 5', 'Passadis 11', 'Lleixa 1'),
(466, 'Bloc 5', 'Passadis 11', 'Lleixa 2'),
(467, 'Bloc 5', 'Passadis 11', 'Lleixa 3'),
(468, 'Bloc 5', 'Passadis 11', 'Lleixa 4'),
(469, 'Bloc 5', 'Passadis 11', 'Lleixa 5'),
(470, 'Bloc 5', 'Passadis 11', 'Lleixa 6'),
(471, 'Bloc 5', 'Passadis 11', 'Lleixa 7'),
(472, 'Bloc 5', 'Passadis 11', 'Lleixa 8'),
(473, 'Bloc 5', 'Passadis 12', 'Lleixa 1'),
(474, 'Bloc 5', 'Passadis 12', 'Lleixa 2'),
(475, 'Bloc 5', 'Passadis 12', 'Lleixa 3'),
(476, 'Bloc 5', 'Passadis 12', 'Lleixa 4'),
(477, 'Bloc 5', 'Passadis 12', 'Lleixa 5'),
(478, 'Bloc 5', 'Passadis 12', 'Lleixa 6'),
(479, 'Bloc 5', 'Passadis 12', 'Lleixa 7'),
(480, 'Bloc 5', 'Passadis 12', 'Lleixa 8'),
(481, 'Bloc 6', 'Passadis 1', 'Lleixa 1'),
(482, 'Bloc 6', 'Passadis 1', 'Lleixa 2'),
(483, 'Bloc 6', 'Passadis 1', 'Lleixa 3'),
(484, 'Bloc 6', 'Passadis 1', 'Lleixa 4'),
(485, 'Bloc 6', 'Passadis 1', 'Lleixa 5'),
(486, 'Bloc 6', 'Passadis 1', 'Lleixa 6'),
(487, 'Bloc 6', 'Passadis 1', 'Lleixa 7'),
(488, 'Bloc 6', 'Passadis 1', 'Lleixa 8'),
(489, 'Bloc 6', 'Passadis 2', 'Lleixa 1'),
(490, 'Bloc 6', 'Passadis 2', 'Lleixa 2'),
(491, 'Bloc 6', 'Passadis 2', 'Lleixa 3'),
(492, 'Bloc 6', 'Passadis 2', 'Lleixa 4'),
(493, 'Bloc 6', 'Passadis 2', 'Lleixa 5'),
(494, 'Bloc 6', 'Passadis 2', 'Lleixa 6'),
(495, 'Bloc 6', 'Passadis 2', 'Lleixa 7'),
(496, 'Bloc 6', 'Passadis 2', 'Lleixa 8'),
(497, 'Bloc 6', 'Passadis 3', 'Lleixa 1'),
(498, 'Bloc 6', 'Passadis 3', 'Lleixa 2'),
(499, 'Bloc 6', 'Passadis 3', 'Lleixa 3'),
(500, 'Bloc 6', 'Passadis 3', 'Lleixa 4'),
(501, 'Bloc 6', 'Passadis 3', 'Lleixa 5'),
(502, 'Bloc 6', 'Passadis 3', 'Lleixa 6'),
(503, 'Bloc 6', 'Passadis 3', 'Lleixa 7'),
(504, 'Bloc 6', 'Passadis 3', 'Lleixa 8'),
(505, 'Bloc 6', 'Passadis 4', 'Lleixa 1'),
(506, 'Bloc 6', 'Passadis 4', 'Lleixa 2'),
(507, 'Bloc 6', 'Passadis 4', 'Lleixa 3'),
(508, 'Bloc 6', 'Passadis 4', 'Lleixa 4'),
(509, 'Bloc 6', 'Passadis 4', 'Lleixa 5'),
(510, 'Bloc 6', 'Passadis 4', 'Lleixa 6'),
(511, 'Bloc 6', 'Passadis 4', 'Lleixa 7'),
(512, 'Bloc 6', 'Passadis 4', 'Lleixa 8'),
(513, 'Bloc 6', 'Passadis 5', 'Lleixa 1'),
(514, 'Bloc 6', 'Passadis 5', 'Lleixa 2'),
(515, 'Bloc 6', 'Passadis 5', 'Lleixa 3'),
(516, 'Bloc 6', 'Passadis 5', 'Lleixa 4'),
(517, 'Bloc 6', 'Passadis 5', 'Lleixa 5'),
(518, 'Bloc 6', 'Passadis 5', 'Lleixa 6'),
(519, 'Bloc 6', 'Passadis 5', 'Lleixa 7'),
(520, 'Bloc 6', 'Passadis 5', 'Lleixa 8'),
(521, 'Bloc 6', 'Passadis 6', 'Lleixa 1'),
(522, 'Bloc 6', 'Passadis 6', 'Lleixa 2'),
(523, 'Bloc 6', 'Passadis 6', 'Lleixa 3'),
(524, 'Bloc 6', 'Passadis 6', 'Lleixa 4'),
(525, 'Bloc 6', 'Passadis 6', 'Lleixa 5'),
(526, 'Bloc 6', 'Passadis 6', 'Lleixa 6'),
(527, 'Bloc 6', 'Passadis 6', 'Lleixa 7'),
(528, 'Bloc 6', 'Passadis 6', 'Lleixa 8'),
(529, 'Bloc 6', 'Passadis 7', 'Lleixa 1'),
(530, 'Bloc 6', 'Passadis 7', 'Lleixa 2'),
(531, 'Bloc 6', 'Passadis 7', 'Lleixa 3'),
(532, 'Bloc 6', 'Passadis 7', 'Lleixa 4'),
(533, 'Bloc 6', 'Passadis 7', 'Lleixa 5'),
(534, 'Bloc 6', 'Passadis 7', 'Lleixa 6'),
(535, 'Bloc 6', 'Passadis 7', 'Lleixa 7'),
(536, 'Bloc 6', 'Passadis 7', 'Lleixa 8'),
(537, 'Bloc 6', 'Passadis 8', 'Lleixa 1'),
(538, 'Bloc 6', 'Passadis 8', 'Lleixa 2'),
(539, 'Bloc 6', 'Passadis 8', 'Lleixa 3'),
(540, 'Bloc 6', 'Passadis 8', 'Lleixa 4'),
(541, 'Bloc 6', 'Passadis 8', 'Lleixa 5'),
(542, 'Bloc 6', 'Passadis 8', 'Lleixa 6'),
(543, 'Bloc 6', 'Passadis 8', 'Lleixa 7'),
(544, 'Bloc 6', 'Passadis 8', 'Lleixa 8'),
(545, 'Bloc 6', 'Passadis 9', 'Lleixa 1'),
(546, 'Bloc 6', 'Passadis 9', 'Lleixa 2'),
(547, 'Bloc 6', 'Passadis 9', 'Lleixa 3'),
(548, 'Bloc 6', 'Passadis 9', 'Lleixa 4'),
(549, 'Bloc 6', 'Passadis 9', 'Lleixa 5'),
(550, 'Bloc 6', 'Passadis 9', 'Lleixa 6'),
(551, 'Bloc 6', 'Passadis 9', 'Lleixa 7'),
(552, 'Bloc 6', 'Passadis 9', 'Lleixa 8'),
(553, 'Bloc 6', 'Passadis 10', 'Lleixa 1'),
(554, 'Bloc 6', 'Passadis 10', 'Lleixa 2'),
(555, 'Bloc 6', 'Passadis 10', 'Lleixa 3'),
(556, 'Bloc 6', 'Passadis 10', 'Lleixa 4'),
(557, 'Bloc 6', 'Passadis 10', 'Lleixa 5'),
(558, 'Bloc 6', 'Passadis 10', 'Lleixa 6'),
(559, 'Bloc 6', 'Passadis 10', 'Lleixa 7'),
(560, 'Bloc 6', 'Passadis 10', 'Lleixa 8'),
(561, 'Bloc 6', 'Passadis 11', 'Lleixa 1'),
(562, 'Bloc 6', 'Passadis 11', 'Lleixa 2'),
(563, 'Bloc 6', 'Passadis 11', 'Lleixa 3'),
(564, 'Bloc 6', 'Passadis 11', 'Lleixa 4'),
(565, 'Bloc 6', 'Passadis 11', 'Lleixa 5'),
(566, 'Bloc 6', 'Passadis 11', 'Lleixa 6'),
(567, 'Bloc 6', 'Passadis 11', 'Lleixa 7'),
(568, 'Bloc 6', 'Passadis 11', 'Lleixa 8'),
(569, 'Bloc 6', 'Passadis 12', 'Lleixa 1'),
(570, 'Bloc 6', 'Passadis 12', 'Lleixa 2'),
(571, 'Bloc 6', 'Passadis 12', 'Lleixa 3'),
(572, 'Bloc 6', 'Passadis 12', 'Lleixa 4'),
(573, 'Bloc 6', 'Passadis 12', 'Lleixa 5'),
(574, 'Bloc 6', 'Passadis 12', 'Lleixa 6'),
(575, 'Bloc 6', 'Passadis 12', 'Lleixa 7'),
(576, 'Bloc 6', 'Passadis 12', 'Lleixa 8'),
(577, 'Bloc 7', 'Passadis 1', 'Lleixa 1'),
(578, 'Bloc 7', 'Passadis 1', 'Lleixa 2'),
(579, 'Bloc 7', 'Passadis 1', 'Lleixa 3'),
(580, 'Bloc 7', 'Passadis 1', 'Lleixa 4'),
(581, 'Bloc 7', 'Passadis 1', 'Lleixa 5'),
(582, 'Bloc 7', 'Passadis 1', 'Lleixa 6'),
(583, 'Bloc 7', 'Passadis 1', 'Lleixa 7'),
(584, 'Bloc 7', 'Passadis 1', 'Lleixa 8'),
(585, 'Bloc 7', 'Passadis 2', 'Lleixa 1'),
(586, 'Bloc 7', 'Passadis 2', 'Lleixa 2'),
(587, 'Bloc 7', 'Passadis 2', 'Lleixa 3'),
(588, 'Bloc 7', 'Passadis 2', 'Lleixa 4'),
(589, 'Bloc 7', 'Passadis 2', 'Lleixa 5'),
(590, 'Bloc 7', 'Passadis 2', 'Lleixa 6'),
(591, 'Bloc 7', 'Passadis 2', 'Lleixa 7'),
(592, 'Bloc 7', 'Passadis 2', 'Lleixa 8'),
(593, 'Bloc 7', 'Passadis 3', 'Lleixa 1'),
(594, 'Bloc 7', 'Passadis 3', 'Lleixa 2'),
(595, 'Bloc 7', 'Passadis 3', 'Lleixa 3'),
(596, 'Bloc 7', 'Passadis 3', 'Lleixa 4'),
(597, 'Bloc 7', 'Passadis 3', 'Lleixa 5'),
(598, 'Bloc 7', 'Passadis 3', 'Lleixa 6'),
(599, 'Bloc 7', 'Passadis 3', 'Lleixa 7'),
(600, 'Bloc 7', 'Passadis 3', 'Lleixa 8'),
(601, 'Bloc 7', 'Passadis 4', 'Lleixa 1'),
(602, 'Bloc 7', 'Passadis 4', 'Lleixa 2'),
(603, 'Bloc 7', 'Passadis 4', 'Lleixa 3'),
(604, 'Bloc 7', 'Passadis 4', 'Lleixa 4'),
(605, 'Bloc 7', 'Passadis 4', 'Lleixa 5'),
(606, 'Bloc 7', 'Passadis 4', 'Lleixa 6'),
(607, 'Bloc 7', 'Passadis 4', 'Lleixa 7'),
(608, 'Bloc 7', 'Passadis 4', 'Lleixa 8'),
(609, 'Bloc 7', 'Passadis 5', 'Lleixa 1'),
(610, 'Bloc 7', 'Passadis 5', 'Lleixa 2'),
(611, 'Bloc 7', 'Passadis 5', 'Lleixa 3'),
(612, 'Bloc 7', 'Passadis 5', 'Lleixa 4'),
(613, 'Bloc 7', 'Passadis 5', 'Lleixa 5'),
(614, 'Bloc 7', 'Passadis 5', 'Lleixa 6'),
(615, 'Bloc 7', 'Passadis 5', 'Lleixa 7'),
(616, 'Bloc 7', 'Passadis 5', 'Lleixa 8'),
(617, 'Bloc 7', 'Passadis 6', 'Lleixa 1'),
(618, 'Bloc 7', 'Passadis 6', 'Lleixa 2'),
(619, 'Bloc 7', 'Passadis 6', 'Lleixa 3'),
(620, 'Bloc 7', 'Passadis 6', 'Lleixa 4'),
(621, 'Bloc 7', 'Passadis 6', 'Lleixa 5'),
(622, 'Bloc 7', 'Passadis 6', 'Lleixa 6'),
(623, 'Bloc 7', 'Passadis 6', 'Lleixa 7'),
(624, 'Bloc 7', 'Passadis 6', 'Lleixa 8'),
(625, 'Bloc 7', 'Passadis 7', 'Lleixa 1'),
(626, 'Bloc 7', 'Passadis 7', 'Lleixa 2'),
(627, 'Bloc 7', 'Passadis 7', 'Lleixa 3'),
(628, 'Bloc 7', 'Passadis 7', 'Lleixa 4'),
(629, 'Bloc 7', 'Passadis 7', 'Lleixa 5'),
(630, 'Bloc 7', 'Passadis 7', 'Lleixa 6'),
(631, 'Bloc 7', 'Passadis 7', 'Lleixa 7'),
(632, 'Bloc 7', 'Passadis 7', 'Lleixa 8'),
(633, 'Bloc 7', 'Passadis 8', 'Lleixa 1'),
(634, 'Bloc 7', 'Passadis 8', 'Lleixa 2'),
(635, 'Bloc 7', 'Passadis 8', 'Lleixa 3'),
(636, 'Bloc 7', 'Passadis 8', 'Lleixa 4'),
(637, 'Bloc 7', 'Passadis 8', 'Lleixa 5'),
(638, 'Bloc 7', 'Passadis 8', 'Lleixa 6'),
(639, 'Bloc 7', 'Passadis 8', 'Lleixa 7'),
(640, 'Bloc 7', 'Passadis 8', 'Lleixa 8'),
(641, 'Bloc 7', 'Passadis 9', 'Lleixa 1'),
(642, 'Bloc 7', 'Passadis 9', 'Lleixa 2'),
(643, 'Bloc 7', 'Passadis 9', 'Lleixa 3'),
(644, 'Bloc 7', 'Passadis 9', 'Lleixa 4'),
(645, 'Bloc 7', 'Passadis 9', 'Lleixa 5'),
(646, 'Bloc 7', 'Passadis 9', 'Lleixa 6'),
(647, 'Bloc 7', 'Passadis 9', 'Lleixa 7'),
(648, 'Bloc 7', 'Passadis 9', 'Lleixa 8'),
(649, 'Bloc 7', 'Passadis 10', 'Lleixa 1'),
(650, 'Bloc 7', 'Passadis 10', 'Lleixa 2'),
(651, 'Bloc 7', 'Passadis 10', 'Lleixa 3'),
(652, 'Bloc 7', 'Passadis 10', 'Lleixa 4'),
(653, 'Bloc 7', 'Passadis 10', 'Lleixa 5'),
(654, 'Bloc 7', 'Passadis 10', 'Lleixa 6'),
(655, 'Bloc 7', 'Passadis 10', 'Lleixa 7'),
(656, 'Bloc 7', 'Passadis 10', 'Lleixa 8'),
(657, 'Bloc 7', 'Passadis 11', 'Lleixa 1'),
(658, 'Bloc 7', 'Passadis 11', 'Lleixa 2'),
(659, 'Bloc 7', 'Passadis 11', 'Lleixa 3'),
(660, 'Bloc 7', 'Passadis 11', 'Lleixa 4'),
(661, 'Bloc 7', 'Passadis 11', 'Lleixa 5'),
(662, 'Bloc 7', 'Passadis 11', 'Lleixa 6'),
(663, 'Bloc 7', 'Passadis 11', 'Lleixa 7'),
(664, 'Bloc 7', 'Passadis 11', 'Lleixa 8'),
(665, 'Bloc 7', 'Passadis 12', 'Lleixa 1'),
(666, 'Bloc 7', 'Passadis 12', 'Lleixa 2'),
(667, 'Bloc 7', 'Passadis 12', 'Lleixa 3'),
(668, 'Bloc 7', 'Passadis 12', 'Lleixa 4'),
(669, 'Bloc 7', 'Passadis 12', 'Lleixa 5'),
(670, 'Bloc 7', 'Passadis 12', 'Lleixa 6'),
(671, 'Bloc 7', 'Passadis 12', 'Lleixa 7'),
(672, 'Bloc 7', 'Passadis 12', 'Lleixa 8'),
(673, 'Bloc 8', 'Passadis 1', 'Lleixa 1'),
(674, 'Bloc 8', 'Passadis 1', 'Lleixa 2'),
(675, 'Bloc 8', 'Passadis 1', 'Lleixa 3'),
(676, 'Bloc 8', 'Passadis 1', 'Lleixa 4'),
(677, 'Bloc 8', 'Passadis 1', 'Lleixa 5'),
(678, 'Bloc 8', 'Passadis 1', 'Lleixa 6'),
(679, 'Bloc 8', 'Passadis 1', 'Lleixa 7'),
(680, 'Bloc 8', 'Passadis 1', 'Lleixa 8'),
(681, 'Bloc 8', 'Passadis 2', 'Lleixa 1'),
(682, 'Bloc 8', 'Passadis 2', 'Lleixa 2'),
(683, 'Bloc 8', 'Passadis 2', 'Lleixa 3'),
(684, 'Bloc 8', 'Passadis 2', 'Lleixa 4'),
(685, 'Bloc 8', 'Passadis 2', 'Lleixa 5'),
(686, 'Bloc 8', 'Passadis 2', 'Lleixa 6'),
(687, 'Bloc 8', 'Passadis 2', 'Lleixa 7'),
(688, 'Bloc 8', 'Passadis 2', 'Lleixa 8'),
(689, 'Bloc 8', 'Passadis 3', 'Lleixa 1'),
(690, 'Bloc 8', 'Passadis 3', 'Lleixa 2'),
(691, 'Bloc 8', 'Passadis 3', 'Lleixa 3'),
(692, 'Bloc 8', 'Passadis 3', 'Lleixa 4'),
(693, 'Bloc 8', 'Passadis 3', 'Lleixa 5'),
(694, 'Bloc 8', 'Passadis 3', 'Lleixa 6'),
(695, 'Bloc 8', 'Passadis 3', 'Lleixa 7'),
(696, 'Bloc 8', 'Passadis 3', 'Lleixa 8'),
(697, 'Bloc 8', 'Passadis 4', 'Lleixa 1'),
(698, 'Bloc 8', 'Passadis 4', 'Lleixa 2'),
(699, 'Bloc 8', 'Passadis 4', 'Lleixa 3'),
(700, 'Bloc 8', 'Passadis 4', 'Lleixa 4'),
(701, 'Bloc 8', 'Passadis 4', 'Lleixa 5'),
(702, 'Bloc 8', 'Passadis 4', 'Lleixa 6'),
(703, 'Bloc 8', 'Passadis 4', 'Lleixa 7'),
(704, 'Bloc 8', 'Passadis 4', 'Lleixa 8'),
(705, 'Bloc 8', 'Passadis 5', 'Lleixa 1'),
(706, 'Bloc 8', 'Passadis 5', 'Lleixa 2'),
(707, 'Bloc 8', 'Passadis 5', 'Lleixa 3'),
(708, 'Bloc 8', 'Passadis 5', 'Lleixa 4'),
(709, 'Bloc 8', 'Passadis 5', 'Lleixa 5'),
(710, 'Bloc 8', 'Passadis 5', 'Lleixa 6'),
(711, 'Bloc 8', 'Passadis 5', 'Lleixa 7'),
(712, 'Bloc 8', 'Passadis 5', 'Lleixa 8'),
(713, 'Bloc 8', 'Passadis 6', 'Lleixa 1'),
(714, 'Bloc 8', 'Passadis 6', 'Lleixa 2'),
(715, 'Bloc 8', 'Passadis 6', 'Lleixa 3'),
(716, 'Bloc 8', 'Passadis 6', 'Lleixa 4'),
(717, 'Bloc 8', 'Passadis 6', 'Lleixa 5'),
(718, 'Bloc 8', 'Passadis 6', 'Lleixa 6'),
(719, 'Bloc 8', 'Passadis 6', 'Lleixa 7'),
(720, 'Bloc 8', 'Passadis 6', 'Lleixa 8'),
(721, 'Bloc 8', 'Passadis 7', 'Lleixa 1'),
(722, 'Bloc 8', 'Passadis 7', 'Lleixa 2'),
(723, 'Bloc 8', 'Passadis 7', 'Lleixa 3'),
(724, 'Bloc 8', 'Passadis 7', 'Lleixa 4'),
(725, 'Bloc 8', 'Passadis 7', 'Lleixa 5'),
(726, 'Bloc 8', 'Passadis 7', 'Lleixa 6'),
(727, 'Bloc 8', 'Passadis 7', 'Lleixa 7'),
(728, 'Bloc 8', 'Passadis 7', 'Lleixa 8'),
(729, 'Bloc 8', 'Passadis 8', 'Lleixa 1'),
(730, 'Bloc 8', 'Passadis 8', 'Lleixa 2'),
(731, 'Bloc 8', 'Passadis 8', 'Lleixa 3'),
(732, 'Bloc 8', 'Passadis 8', 'Lleixa 4'),
(733, 'Bloc 8', 'Passadis 8', 'Lleixa 5'),
(734, 'Bloc 8', 'Passadis 8', 'Lleixa 6'),
(735, 'Bloc 8', 'Passadis 8', 'Lleixa 7'),
(736, 'Bloc 8', 'Passadis 8', 'Lleixa 8'),
(737, 'Bloc 8', 'Passadis 9', 'Lleixa 1'),
(738, 'Bloc 8', 'Passadis 9', 'Lleixa 2'),
(739, 'Bloc 8', 'Passadis 9', 'Lleixa 3'),
(740, 'Bloc 8', 'Passadis 9', 'Lleixa 4'),
(741, 'Bloc 8', 'Passadis 9', 'Lleixa 5'),
(742, 'Bloc 8', 'Passadis 9', 'Lleixa 6'),
(743, 'Bloc 8', 'Passadis 9', 'Lleixa 7'),
(744, 'Bloc 8', 'Passadis 9', 'Lleixa 8'),
(745, 'Bloc 8', 'Passadis 10', 'Lleixa 1'),
(746, 'Bloc 8', 'Passadis 10', 'Lleixa 2'),
(747, 'Bloc 8', 'Passadis 10', 'Lleixa 3'),
(748, 'Bloc 8', 'Passadis 10', 'Lleixa 4'),
(749, 'Bloc 8', 'Passadis 10', 'Lleixa 5'),
(750, 'Bloc 8', 'Passadis 10', 'Lleixa 6'),
(751, 'Bloc 8', 'Passadis 10', 'Lleixa 7'),
(752, 'Bloc 8', 'Passadis 10', 'Lleixa 8'),
(753, 'Bloc 8', 'Passadis 11', 'Lleixa 1'),
(754, 'Bloc 8', 'Passadis 11', 'Lleixa 2'),
(755, 'Bloc 8', 'Passadis 11', 'Lleixa 3'),
(756, 'Bloc 8', 'Passadis 11', 'Lleixa 4'),
(757, 'Bloc 8', 'Passadis 11', 'Lleixa 5'),
(758, 'Bloc 8', 'Passadis 11', 'Lleixa 6'),
(759, 'Bloc 8', 'Passadis 11', 'Lleixa 7'),
(760, 'Bloc 8', 'Passadis 11', 'Lleixa 8'),
(761, 'Bloc 8', 'Passadis 12', 'Lleixa 1'),
(762, 'Bloc 8', 'Passadis 12', 'Lleixa 2'),
(763, 'Bloc 8', 'Passadis 12', 'Lleixa 3'),
(764, 'Bloc 8', 'Passadis 12', 'Lleixa 4'),
(765, 'Bloc 8', 'Passadis 12', 'Lleixa 5'),
(766, 'Bloc 8', 'Passadis 12', 'Lleixa 6'),
(767, 'Bloc 8', 'Passadis 12', 'Lleixa 7'),
(768, 'Bloc 8', 'Passadis 12', 'Lleixa 8');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_producte`
--

CREATE TABLE `tbl_producte` (
  `producte_id` int(11) NOT NULL,
  `producte_nom` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `producte_fotoRuta` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `producte_fotoNom` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `producte_fotoExt` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `producte_preu` double NOT NULL,
  `producte_descripcio` text COLLATE utf8_unicode_ci,
  `producte_descompte` int(3) DEFAULT NULL,
  `serie_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_producte`
--

INSERT INTO `tbl_producte` (`producte_id`, `producte_nom`, `producte_fotoRuta`, `producte_fotoNom`, `producte_fotoExt`, `producte_preu`, `producte_descripcio`, `producte_descompte`, `serie_id`) VALUES
(1, 'SP534P', 'img/productos/', 'SP534P', '.jpg', 22.5, 'Temperatura de color	\r\n840 blanco neutro.\r\n\r\nDriver incluido	\r\nSi.\r\n\r\nApertura de haz de luz de la luminaria	\r\n90°\r\n\r\nCable	\r\nC1700-5P-SI.\r\n\r\nTensión de entrada	\r\n220-240 V\r\n', 3, 1),
(2, 'PT570P', 'img/productos/', 'PT570P', '.jpg', 17.24, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed quis commodo lacus, vel molestie augue. Fusce a blandit sem, ac auctor enim. Nam ut augue tristique purus fringilla facilisis sit amet ac eros. Nulla sit amet tortor gravida, molestie nibh faucibus, interdum ex. Donec eget dui neque. Pellentesque eu libero dignissim, lobortis est ac, rhoncus lacus. Vivamus a turpis quis sapien maximus iaculis ac ac dui. In mollis lorem volutpat placerat egestas.', 5, 1),
(3, 'RC132V', 'img/productos/', 'RC132V', '.jpg', 6.23, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed quis commodo lacus, vel molestie augue. Fusce a blandit sem, ac auctor enim. Nam ut augue tristique purus fringilla facilisis sit amet ac eros. Nulla sit amet tortor gravida, molestie nibh faucibus, interdum ex. Donec eget dui neque. Pellentesque eu libero dignissim, lobortis est ac, rhoncus lacus. Vivamus a turpis quis sapien maximus iaculis ac ac dui. In mollis lorem volutpat placerat egestas.', 0, 2),
(4, 'RC464B', 'img/productos/', 'RC464B', '.jpg', 23.05, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed quis commodo lacus, vel molestie augue. Fusce a blandit sem, ac auctor enim. Nam ut augue tristique purus fringilla facilisis sit amet ac eros. Nulla sit amet tortor gravida, molestie nibh faucibus, interdum ex. Donec eget dui neque. Pellentesque eu libero dignissim, lobortis est ac, rhoncus lacus. Vivamus a turpis quis sapien maximus iaculis ac ac dui. In mollis lorem volutpat placerat egestas.', 5, 2),
(5, 'WL130V', 'img/productos/', 'WL130V', '.jpg', 20.5, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed quis commodo lacus, vel molestie augue. Fusce a blandit sem, ac auctor enim. Nam ut augue tristique purus fringilla facilisis sit amet ac eros. Nulla sit amet tortor gravida, molestie nibh faucibus, interdum ex. Donec eget dui neque. Pellentesque eu libero dignissim, lobortis est ac, rhoncus lacus. Vivamus a turpis quis sapien maximus iaculis ac ac dui. In mollis lorem volutpat placerat egestas.', 5, 3),
(6, 'WL060V', 'img/productos/', 'WL060V', '.jpg', 5.45, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed quis commodo lacus, vel molestie augue. Fusce a blandit sem, ac auctor enim. Nam ut augue tristique purus fringilla facilisis sit amet ac eros. Nulla sit amet tortor gravida, molestie nibh faucibus, interdum ex. Donec eget dui neque. Pellentesque eu libero dignissim, lobortis est ac, rhoncus lacus. Vivamus a turpis quis sapien maximus iaculis ac ac dui. In mollis lorem volutpat placerat egestas.', 0, 3),
(7, 'DN060B', 'img/productos/', 'DN060B', '.jpg', 15.67, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed quis commodo lacus, vel molestie augue. Fusce a blandit sem, ac auctor enim. Nam ut augue tristique purus fringilla facilisis sit amet ac eros. Nulla sit amet tortor gravida, molestie nibh faucibus, interdum ex. Donec eget dui neque. Pellentesque eu libero dignissim, lobortis est ac, rhoncus lacus. Vivamus a turpis quis sapien maximus iaculis ac ac dui. In mollis lorem volutpat placerat egestas.', 5, 4),
(8, 'RS060B', 'img/productos/', 'RS060B', '.jpg', 45.65, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed quis commodo lacus, vel molestie augue. Fusce a blandit sem, ac auctor enim. Nam ut augue tristique purus fringilla facilisis sit amet ac eros. Nulla sit amet tortor gravida, molestie nibh faucibus, interdum ex. Donec eget dui neque. Pellentesque eu libero dignissim, lobortis est ac, rhoncus lacus. Vivamus a turpis quis sapien maximus iaculis ac ac dui. In mollis lorem volutpat placerat egestas.', 5, 4),
(9, 'BSP791', 'img/productos/', 'BSP791', '.jpg', 20, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed quis commodo lacus, vel molestie augue. Fusce a blandit sem, ac auctor enim. Nam ut augue tristique purus fringilla facilisis sit amet ac eros. Nulla sit amet tortor gravida, molestie nibh faucibus, interdum ex. Donec eget dui neque. Pellentesque eu libero dignissim, lobortis est ac, rhoncus lacus. Vivamus a turpis quis sapien maximus iaculis ac ac dui. In mollis lorem volutpat placerat egestas.', 0, 5),
(10, 'SGS253', 'img/productos/', 'SGS253', '.jpg', 23.32, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed quis commodo lacus, vel molestie augue. Fusce a blandit sem, ac auctor enim. Nam ut augue tristique purus fringilla facilisis sit amet ac eros. Nulla sit amet tortor gravida, molestie nibh faucibus, interdum ex. Donec eget dui neque. Pellentesque eu libero dignissim, lobortis est ac, rhoncus lacus. Vivamus a turpis quis sapien maximus iaculis ac ac dui. In mollis lorem volutpat placerat egestas.', 75, 5),
(11, 'MVF404', 'img/productos/', 'MVF404', '.jpg', 17.32, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed quis commodo lacus, vel molestie augue. Fusce a blandit sem, ac auctor enim. Nam ut augue tristique purus fringilla facilisis sit amet ac eros. Nulla sit amet tortor gravida, molestie nibh faucibus, interdum ex. Donec eget dui neque. Pellentesque eu libero dignissim, lobortis est ac, rhoncus lacus. Vivamus a turpis quis sapien maximus iaculis ac ac dui. In mollis lorem volutpat placerat egestas.', 3, 6),
(12, 'BVP525', 'img/productos/', 'BVP525', '.jpg', 5.25, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed quis commodo lacus, vel molestie augue. Fusce a blandit sem, ac auctor enim. Nam ut augue tristique purus fringilla facilisis sit amet ac eros. Nulla sit amet tortor gravida, molestie nibh faucibus, interdum ex. Donec eget dui neque. Pellentesque eu libero dignissim, lobortis est ac, rhoncus lacus. Vivamus a turpis quis sapien maximus iaculis ac ac dui. In mollis lorem volutpat placerat egestas.', 99, 6),
(13, 'BGP360', 'img/productos/', 'BGP360', '.jpg', 35, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed quis commodo lacus, vel molestie augue. Fusce a blandit sem, ac auctor enim. Nam ut augue tristique purus fringilla facilisis sit amet ac eros. Nulla sit amet tortor gravida, molestie nibh faucibus, interdum ex. Donec eget dui neque. Pellentesque eu libero dignissim, lobortis est ac, rhoncus lacus. Vivamus a turpis quis sapien maximus iaculis ac ac dui. In mollis lorem volutpat placerat egestas.', 15, 7),
(14, 'GX10MR6', 'img/productos/', 'GX10MR6', '.jpg', 9.99, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed quis commodo lacus, vel molestie augue. Fusce a blandit sem, ac auctor enim. Nam ut augue tristique purus fringilla facilisis sit amet ac eros. Nulla sit amet tortor gravida, molestie nibh faucibus, interdum ex. Donec eget dui neque. Pellentesque eu libero dignissim, lobortis est ac, rhoncus lacus. Vivamus a turpis quis sapien maximus iaculis ac ac dui. In mollis lorem volutpat placerat egestas.', 0, 7),
(15, 'BVP425', 'img/productos/', 'BVP425', '.jpg', 35.5, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed quis commodo lacus, vel molestie augue. Fusce a blandit sem, ac auctor enim. Nam ut augue tristique purus fringilla facilisis sit amet ac eros. Nulla sit amet tortor gravida, molestie nibh faucibus, interdum ex. Donec eget dui neque. Pellentesque eu libero dignissim, lobortis est ac, rhoncus lacus. Vivamus a turpis quis sapien maximus iaculis ac ac dui. In mollis lorem volutpat placerat egestas.', 25, 8),
(16, 'BVP651', 'img/productos/', 'BVP651', '.jpg', 45.99, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed quis commodo lacus, vel molestie augue. Fusce a blandit sem, ac auctor enim. Nam ut augue tristique purus fringilla facilisis sit amet ac eros. Nulla sit amet tortor gravida, molestie nibh faucibus, interdum ex. Donec eget dui neque. Pellentesque eu libero dignissim, lobortis est ac, rhoncus lacus. Vivamus a turpis quis sapien maximus iaculis ac ac dui. In mollis lorem volutpat placerat egestas.', 5, 8),
(17, 'MASTERLINE111', 'img/productos/', 'MASTERLINE111', '.jpg', 15, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed quis commodo lacus, vel molestie augue. Fusce a blandit sem, ac auctor enim. Nam ut augue tristique purus fringilla facilisis sit amet ac eros. Nulla sit amet tortor gravida, molestie nibh faucibus, interdum ex. Donec eget dui neque. Pellentesque eu libero dignissim, lobortis est ac, rhoncus lacus. Vivamus a turpis quis sapien maximus iaculis ac ac dui. In mollis lorem volutpat placerat egestas.', 0, 9),
(18, 'MR16G60', 'img/productos/', 'MR16G60', '.jpg', 12.99, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed quis commodo lacus, vel molestie augue. Fusce a blandit sem, ac auctor enim. Nam ut augue tristique purus fringilla facilisis sit amet ac eros. Nulla sit amet tortor gravida, molestie nibh faucibus, interdum ex. Donec eget dui neque. Pellentesque eu libero dignissim, lobortis est ac, rhoncus lacus. Vivamus a turpis quis sapien maximus iaculis ac ac dui. In mollis lorem volutpat placerat egestas.', 30, 9),
(19, 'E27-230-240V', 'img/productos/', 'E27-230-240V', '.jpg', 7.85, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed quis commodo lacus, vel molestie augue. Fusce a blandit sem, ac auctor enim. Nam ut augue tristique purus fringilla facilisis sit amet ac eros. Nulla sit amet tortor gravida, molestie nibh faucibus, interdum ex. Donec eget dui neque. Pellentesque eu libero dignissim, lobortis est ac, rhoncus lacus. Vivamus a turpis quis sapien maximus iaculis ac ac dui. In mollis lorem volutpat placerat egestas.', 5, 10),
(20, 'Tornado-High-Lumen', 'img/productos/', 'Tornado-High-Lumen', '.jpg', 12.25, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed quis commodo lacus, vel molestie augue. Fusce a blandit sem, ac auctor enim. Nam ut augue tristique purus fringilla facilisis sit amet ac eros. Nulla sit amet tortor gravida, molestie nibh faucibus, interdum ex. Donec eget dui neque. Pellentesque eu libero dignissim, lobortis est ac, rhoncus lacus. Vivamus a turpis quis sapien maximus iaculis ac ac dui. In mollis lorem volutpat placerat egestas.', 0, 10),
(21, 'PL-R-Eco4', 'img/productos/', 'PL-R-Eco4', '.jpg', 9.99, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed quis commodo lacus, vel molestie augue. Fusce a blandit sem, ac auctor enim. Nam ut augue tristique purus fringilla facilisis sit amet ac eros. Nulla sit amet tortor gravida, molestie nibh faucibus, interdum ex. Donec eget dui neque. Pellentesque eu libero dignissim, lobortis est ac, rhoncus lacus. Vivamus a turpis quis sapien maximus iaculis ac ac dui. In mollis lorem volutpat placerat egestas.', 10, 11),
(22, 'PL-L4', 'img/productos/', 'PL-L4', '.jpg', 5.45, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed quis commodo lacus, vel molestie augue. Fusce a blandit sem, ac auctor enim. Nam ut augue tristique purus fringilla facilisis sit amet ac eros. Nulla sit amet tortor gravida, molestie nibh faucibus, interdum ex. Donec eget dui neque. Pellentesque eu libero dignissim, lobortis est ac, rhoncus lacus. Vivamus a turpis quis sapien maximus iaculis ac ac dui. In mollis lorem volutpat placerat egestas.', 0, 11),
(23, 'CDM-T-Elite', 'img/productos/', 'CDM-T-Elite', '.jpg', 25.75, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed quis commodo lacus, vel molestie augue. Fusce a blandit sem, ac auctor enim. Nam ut augue tristique purus fringilla facilisis sit amet ac eros. Nulla sit amet tortor gravida, molestie nibh faucibus, interdum ex. Donec eget dui neque. Pellentesque eu libero dignissim, lobortis est ac, rhoncus lacus. Vivamus a turpis quis sapien maximus iaculis ac ac dui. In mollis lorem volutpat placerat egestas.', 80, 12),
(24, 'CDM-R-Elite', 'img/productos/', 'CDM-R-Elite', '.jpg', 8.7, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed quis commodo lacus, vel molestie augue. Fusce a blandit sem, ac auctor enim. Nam ut augue tristique purus fringilla facilisis sit amet ac eros. Nulla sit amet tortor gravida, molestie nibh faucibus, interdum ex. Donec eget dui neque. Pellentesque eu libero dignissim, lobortis est ac, rhoncus lacus. Vivamus a turpis quis sapien maximus iaculis ac ac dui. In mollis lorem volutpat placerat egestas.', 5, 12),
(25, 'MASTER-LEDtube-T5', 'img/productos/', 'MASTER-LEDtube-T5', '.jpg', 15.3, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed quis commodo lacus, vel molestie augue. Fusce a blandit sem, ac auctor enim. Nam ut augue tristique purus fringilla facilisis sit amet ac eros. Nulla sit amet tortor gravida, molestie nibh faucibus, interdum ex. Donec eget dui neque. Pellentesque eu libero dignissim, lobortis est ac, rhoncus lacus. Vivamus a turpis quis sapien maximus iaculis ac ac dui. In mollis lorem volutpat placerat egestas.', 15, 13),
(26, 'Tubulares-LED', 'img/productos/', 'Tubulares-LED', '.jpg', 3.45, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed quis commodo lacus, vel molestie augue. Fusce a blandit sem, ac auctor enim. Nam ut augue tristique purus fringilla facilisis sit amet ac eros. Nulla sit amet tortor gravida, molestie nibh faucibus, interdum ex. Donec eget dui neque. Pellentesque eu libero dignissim, lobortis est ac, rhoncus lacus. Vivamus a turpis quis sapien maximus iaculis ac ac dui. In mollis lorem volutpat placerat egestas.', 50, 13),
(27, 'AR111', 'img/productos/', 'AR111', '.jpg', 15.3, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed quis commodo lacus, vel molestie augue. Fusce a blandit sem, ac auctor enim. Nam ut augue tristique purus fringilla facilisis sit amet ac eros. Nulla sit amet tortor gravida, molestie nibh faucibus, interdum ex. Donec eget dui neque. Pellentesque eu libero dignissim, lobortis est ac, rhoncus lacus. Vivamus a turpis quis sapien maximus iaculis ac ac dui. In mollis lorem volutpat placerat egestas.', 75, 14),
(28, 'LEDspotMV', 'img/productos/', 'LEDspotMV', '.jpg', 7.25, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed quis commodo lacus, vel molestie augue. Fusce a blandit sem, ac auctor enim. Nam ut augue tristique purus fringilla facilisis sit amet ac eros. Nulla sit amet tortor gravida, molestie nibh faucibus, interdum ex. Donec eget dui neque. Pellentesque eu libero dignissim, lobortis est ac, rhoncus lacus. Vivamus a turpis quis sapien maximus iaculis ac ac dui. In mollis lorem volutpat placerat egestas.', 50, 14),
(29, 'HPL-SON', 'img/productos/', 'HPL-SON', '.jpg', 3.5, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed quis commodo lacus, vel molestie augue. Fusce a blandit sem, ac auctor enim. Nam ut augue tristique purus fringilla facilisis sit amet ac eros. Nulla sit amet tortor gravida, molestie nibh faucibus, interdum ex. Donec eget dui neque. Pellentesque eu libero dignissim, lobortis est ac, rhoncus lacus. Vivamus a turpis quis sapien maximus iaculis ac ac dui. In mollis lorem volutpat placerat egestas.', 2, 15),
(30, 'HPI-SON-HPL', 'img/productos/', 'HPI-SON-HPL', '.jpg', 2.75, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed quis commodo lacus, vel molestie augue. Fusce a blandit sem, ac auctor enim. Nam ut augue tristique purus fringilla facilisis sit amet ac eros. Nulla sit amet tortor gravida, molestie nibh faucibus, interdum ex. Donec eget dui neque. Pellentesque eu libero dignissim, lobortis est ac, rhoncus lacus. Vivamus a turpis quis sapien maximus iaculis ac ac dui. In mollis lorem volutpat placerat egestas.', 1, 15),
(31, 'CLA-LUSTER34', 'img/productos/', 'CLA-LUSTER34', '.jpg', 6.75, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed quis commodo lacus, vel molestie augue. Fusce a blandit sem, ac auctor enim. Nam ut augue tristique purus fringilla facilisis sit amet ac eros. Nulla sit amet tortor gravida, molestie nibh faucibus, interdum ex. Donec eget dui neque. Pellentesque eu libero dignissim, lobortis est ac, rhoncus lacus. Vivamus a turpis quis sapien maximus iaculis ac ac dui. In mollis lorem volutpat placerat egestas.', 5, 16),
(32, '5-32W-BA35', 'img/productos/', '5-32W-BA35', '.jpg', 5, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed quis commodo lacus, vel molestie augue. Fusce a blandit sem, ac auctor enim. Nam ut augue tristique purus fringilla facilisis sit amet ac eros. Nulla sit amet tortor gravida, molestie nibh faucibus, interdum ex. Donec eget dui neque. Pellentesque eu libero dignissim, lobortis est ac, rhoncus lacus. Vivamus a turpis quis sapien maximus iaculis ac ac dui. In mollis lorem volutpat placerat egestas.', 0, 16),
(33, 'DACM-DyNet', 'img/productos/', 'DACM-DyNet', '.jpg', 65.99, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed quis commodo lacus, vel molestie augue. Fusce a blandit sem, ac auctor enim. Nam ut augue tristique purus fringilla facilisis sit amet ac eros. Nulla sit amet tortor gravida, molestie nibh faucibus, interdum ex. Donec eget dui neque. Pellentesque eu libero dignissim, lobortis est ac, rhoncus lacus. Vivamus a turpis quis sapien maximus iaculis ac ac dui. In mollis lorem volutpat placerat egestas.', 0, 17),
(34, 'PABPE-MA-X', 'img/productos/', 'PABPE-MA-X', '.jpg', 40.35, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed quis commodo lacus, vel molestie augue. Fusce a blandit sem, ac auctor enim. Nam ut augue tristique purus fringilla facilisis sit amet ac eros. Nulla sit amet tortor gravida, molestie nibh faucibus, interdum ex. Donec eget dui neque. Pellentesque eu libero dignissim, lobortis est ac, rhoncus lacus. Vivamus a turpis quis sapien maximus iaculis ac ac dui. In mollis lorem volutpat placerat egestas.', 20, 17),
(35, 'DUS90AHB-DALI', 'img/productos/', 'DUS90AHB-DALI', '.jpg', 25.5, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed quis commodo lacus, vel molestie augue. Fusce a blandit sem, ac auctor enim. Nam ut augue tristique purus fringilla facilisis sit amet ac eros. Nulla sit amet tortor gravida, molestie nibh faucibus, interdum ex. Donec eget dui neque. Pellentesque eu libero dignissim, lobortis est ac, rhoncus lacus. Vivamus a turpis quis sapien maximus iaculis ac ac dui. In mollis lorem volutpat placerat egestas.', 0, 18),
(36, 'DUS90CS', 'img/productos/', 'DUS90CS', '.jpg', 15.75, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed quis commodo lacus, vel molestie augue. Fusce a blandit sem, ac auctor enim. Nam ut augue tristique purus fringilla facilisis sit amet ac eros. Nulla sit amet tortor gravida, molestie nibh faucibus, interdum ex. Donec eget dui neque. Pellentesque eu libero dignissim, lobortis est ac, rhoncus lacus. Vivamus a turpis quis sapien maximus iaculis ac ac dui. In mollis lorem volutpat placerat egestas.', 0, 18),
(37, 'DDRC810DT-GL', 'img/productos/', 'DDRC810DT-GL', '.jpg', 22.33, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed quis commodo lacus, vel molestie augue. Fusce a blandit sem, ac auctor enim. Nam ut augue tristique purus fringilla facilisis sit amet ac eros. Nulla sit amet tortor gravida, molestie nibh faucibus, interdum ex. Donec eget dui neque. Pellentesque eu libero dignissim, lobortis est ac, rhoncus lacus. Vivamus a turpis quis sapien maximus iaculis ac ac dui. In mollis lorem volutpat placerat egestas.', 0, 19),
(38, 'DDRC420FR', 'img/productos/', 'DDRC420FR', '.jpg', 65.8, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed quis commodo lacus, vel molestie augue. Fusce a blandit sem, ac auctor enim. Nam ut augue tristique purus fringilla facilisis sit amet ac eros. Nulla sit amet tortor gravida, molestie nibh faucibus, interdum ex. Donec eget dui neque. Pellentesque eu libero dignissim, lobortis est ac, rhoncus lacus. Vivamus a turpis quis sapien maximus iaculis ac ac dui. In mollis lorem volutpat placerat egestas.', 20, 19),
(39, 'DMBC110', 'img/productos/', 'DMBC110', '.jpg', 22.35, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed quis commodo lacus, vel molestie augue. Fusce a blandit sem, ac auctor enim. Nam ut augue tristique purus fringilla facilisis sit amet ac eros. Nulla sit amet tortor gravida, molestie nibh faucibus, interdum ex. Donec eget dui neque. Pellentesque eu libero dignissim, lobortis est ac, rhoncus lacus. Vivamus a turpis quis sapien maximus iaculis ac ac dui. In mollis lorem volutpat placerat egestas.', 15, 20),
(40, 'DBC905W', 'img/productos/', 'DBC905W', '.jpg', 20, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed quis commodo lacus, vel molestie augue. Fusce a blandit sem, ac auctor enim. Nam ut augue tristique purus fringilla facilisis sit amet ac eros. Nulla sit amet tortor gravida, molestie nibh faucibus, interdum ex. Donec eget dui neque. Pellentesque eu libero dignissim, lobortis est ac, rhoncus lacus. Vivamus a turpis quis sapien maximus iaculis ac ac dui. In mollis lorem volutpat placerat egestas.', NULL, 20),
(41, 'producto41', 'img/productos/', 'producto41', '.jpg', 25, 'esto es una prueba', 4, 11),
(42, 'producto42', 'img/productos/', 'producto42', '.jpg', 123, 'producto sin catalogar', 123, 18),
(43, 'producto43', 'img/productos/', 'producto43', '.jpg', 23, 'producto pruebas crear producto', 234, 12),
(44, 'producto44', 'img/productos/', 'producto44', '.jpg', 33.43, 'esto es la descripcion para el producto 44', 33, 18),
(45, 'producto45', 'img/productos/', 'producto44', '.jpg', 155, 'esto es la descripcion para el producto 44', 33, 10),
(46, 'producto46', 'img/productos/', 'producto45', '.jpg', 25.45, 'descripcion', 0, 14),
(47, 'producto47', 'img/productos/', 'producto47', '.jpg', 35, 'descripcion', 2, 15),
(48, 'producto48', 'img/productos/', 'null', '.jpg', 300, 'Foco ultra led super iluminador', 10, 14);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_serie`
--

CREATE TABLE `tbl_serie` (
  `serie_id` int(11) NOT NULL,
  `serie_nom` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `categoria_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_serie`
--

INSERT INTO `tbl_serie` (`serie_id`, `serie_nom`, `categoria_id`) VALUES
(1, 'Suspendida', 1),
(2, 'Empotrables', 1),
(3, 'Apliques', 1),
(4, 'Downlights', 1),
(5, 'Alumbrado Público', 2),
(6, 'Proyectores', 2),
(7, 'Túneles', 2),
(8, 'Grandes Superfícies', 2),
(9, 'Halógenas', 3),
(10, 'Fluorescentes', 3),
(11, 'Compactas', 3),
(12, 'Incandescentes', 3),
(13, 'Tubos', 4),
(14, 'Focos', 4),
(15, 'HID', 4),
(16, 'Velas y Reflejo', 4),
(17, 'User Interface', 5),
(18, 'Sensors', 5),
(19, 'Relay Controllers', 5),
(20, 'Reguladores', 5);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_usuario`
--

CREATE TABLE `tbl_usuario` (
  `id_usuario` int(11) NOT NULL,
  `email_usuario` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_usuario` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nombre_usuario` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `apellido_usuario` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `grupo_usuario` enum('usuario','administrador') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_usuario`
--

INSERT INTO `tbl_usuario` (`id_usuario`, `email_usuario`, `password_usuario`, `nombre_usuario`, `apellido_usuario`, `grupo_usuario`) VALUES
(1, 'admin@gmail.com', '1234', 'Admin', 'Empresa', 'administrador'),
(2, 'usu01@gmail.com', '1234', 'Stefan', 'Salvatore', 'usuario'),
(3, 'usu02@gmail.com', '1234', 'Damon', 'Salvatore', 'usuario'),
(4, 'usu03@gmail.com', '1234', 'Elena', 'Gilbert', 'usuario'),
(5, 'usu04@gmail.com', '1234', 'Jeremy', 'Gilbert', 'usuario'),
(6, 'usu05@gmail.com', '1234', 'Bonnie', 'Bennett', 'usuario'),
(7, 'usu06@gmail.com', '1234', 'Caroline', 'Forbes', 'usuario'),
(8, 'usu07@gmail.com', '1234', 'Matt', 'Donovan', 'usuario'),
(9, 'usu08@gmail.com', '1234', 'Tyler', 'Lockwood', 'usuario'),
(10, 'usu09@gmail.com', '1234', 'Alaric', 'Saltzman', 'usuario'),
(11, 'usu11@gmail.com', '1234', 'Katherine', 'Pierce', 'usuario'),
(12, 'usu12@gmail.com', '1234', 'Kai', 'Parker', 'usuario'),
(13, 'usu13@gmail.com', '1234', 'Niklaus', 'Mikaelson', 'usuario'),
(14, 'usu14@gmail.com', '1234', 'Elijah', 'Mikaelson', 'usuario'),
(15, 'usu15@gmail.com', '1234', 'Rebekah ', 'Mikaelson', 'usuario'),
(16, 'usu16@gmail.com', '1234', 'Cole', 'Mikaelson', 'usuario'),
(17, 'usu17@gmail.com', '1234', 'Fin', 'Mikaelson', 'usuario'),
(18, 'usu18@gmail.com', '1234', 'Freya', 'Mikaelson', 'usuario'),
(19, 'ssole', 'root', 'administrador', 'Master', 'administrador');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_categoria`
--
ALTER TABLE `tbl_categoria`
  ADD PRIMARY KEY (`categoria_id`);

--
-- Indexes for table `tbl_estoc`
--
ALTER TABLE `tbl_estoc`
  ADD PRIMARY KEY (`estoc_id`),
  ADD KEY `FK_estoc_producte` (`producte_id`),
  ADD KEY `FK_estoc_lloc` (`lloc_id`);

--
-- Indexes for table `tbl_lloc`
--
ALTER TABLE `tbl_lloc`
  ADD PRIMARY KEY (`lloc_id`);

--
-- Indexes for table `tbl_producte`
--
ALTER TABLE `tbl_producte`
  ADD PRIMARY KEY (`producte_id`),
  ADD KEY `FK_prod_serie` (`serie_id`);

--
-- Indexes for table `tbl_serie`
--
ALTER TABLE `tbl_serie`
  ADD PRIMARY KEY (`serie_id`),
  ADD KEY `FK_serie_categoria` (`categoria_id`);

--
-- Indexes for table `tbl_usuario`
--
ALTER TABLE `tbl_usuario`
  ADD PRIMARY KEY (`id_usuario`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_categoria`
--
ALTER TABLE `tbl_categoria`
  MODIFY `categoria_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_estoc`
--
ALTER TABLE `tbl_estoc`
  MODIFY `estoc_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `tbl_lloc`
--
ALTER TABLE `tbl_lloc`
  MODIFY `lloc_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=769;

--
-- AUTO_INCREMENT for table `tbl_producte`
--
ALTER TABLE `tbl_producte`
  MODIFY `producte_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `tbl_serie`
--
ALTER TABLE `tbl_serie`
  MODIFY `serie_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `tbl_usuario`
--
ALTER TABLE `tbl_usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_estoc`
--
ALTER TABLE `tbl_estoc`
  ADD CONSTRAINT `FK_estoc_lloc` FOREIGN KEY (`lloc_id`) REFERENCES `tbl_lloc` (`lloc_id`),
  ADD CONSTRAINT `FK_estoc_producte` FOREIGN KEY (`producte_id`) REFERENCES `tbl_producte` (`producte_id`);

--
-- Constraints for table `tbl_producte`
--
ALTER TABLE `tbl_producte`
  ADD CONSTRAINT `FK_prod_serie` FOREIGN KEY (`serie_id`) REFERENCES `tbl_serie` (`serie_id`);

--
-- Constraints for table `tbl_serie`
--
ALTER TABLE `tbl_serie`
  ADD CONSTRAINT `FK_serie_categoria` FOREIGN KEY (`categoria_id`) REFERENCES `tbl_categoria` (`categoria_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
