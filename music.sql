-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 29-11-2016 a las 21:25:29
-- Versión del servidor: 10.1.13-MariaDB
-- Versión de PHP: 7.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `music`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertar` (IN `id` INTEGER, IN `fecha` DATE)  BEGIN
INSERT Into TBL_ASIGNAR_CANCION VALUES(id,fecha);
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TBL_ASIGNAR_CANCION`
--

CREATE TABLE `TBL_ASIGNAR_CANCION` (
  `id_img` int(11) NOT NULL,
  `fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TBL_IMG`
--

CREATE TABLE `TBL_IMG` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `descripcion` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `direccion` varchar(50) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `TBL_IMG`
--

INSERT INTO `TBL_IMG` (`id`, `nombre`, `descripcion`, `direccion`) VALUES
(1, 'Aclamad a Dios', 'Aclamad a Dios', 'images/thumbs/1 Aclamad a Dios.png'),
(2, 'Alabad a jehova', 'Alabad a jehova', 'images/thumbs/2 Alabad a Jehova.png'),
(3, 'Alabad a jehova', 'Alabad a jehova', 'images/thumbs/3 Alabad a Jehova.png'),
(4, 'Alabare', 'Alabare', 'images/thumbs/4 Alabare.png'),
(5, 'aunque otros canten', 'aunque otros canten', 'images/thumbs/5 Aunque otros Canten.png');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `TBL_ASIGNAR_CANCION`
--
ALTER TABLE `TBL_ASIGNAR_CANCION`
  ADD KEY `id_img` (`id_img`);

--
-- Indices de la tabla `TBL_IMG`
--
ALTER TABLE `TBL_IMG`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `TBL_IMG`
--
ALTER TABLE `TBL_IMG`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `TBL_ASIGNAR_CANCION`
--
ALTER TABLE `TBL_ASIGNAR_CANCION`
  ADD CONSTRAINT `tbl_asignar_cancion_ibfk_1` FOREIGN KEY (`id_img`) REFERENCES `TBL_IMG` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
