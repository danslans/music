-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 19-11-2016 a las 04:46:07
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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TBL_ASIGNAR_CANCION`
--

CREATE TABLE `TBL_ASIGNAR_CANCION` (
  `id_img` int(11) NOT NULL,
  `fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `TBL_ASIGNAR_CANCION`
--

INSERT INTO `TBL_ASIGNAR_CANCION` (`id_img`, `fecha`) VALUES
(1, '0000-00-00'),
(1, '0000-00-00');

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
(1, 'Siria', 'Siria', 'images/thumbs/01.jpg'),
(2, 'Three force', 'la trifuerza', 'images/thumbs/02.jpg'),
(3, 'Link', 'Link in park', 'images/thumbs/03.jpg'),
(4, 'Escudo', 'Escudo de Link', 'images/thumbs/04.jpg'),
(5, 'new photo', 'Jugadores', 'images/thumbs/05.png'),
(6, 'zelda and lira', 'Zelda tocando la lira', 'images/thumbs/06.jpg'),
(7, 'Link and Epona', 'Link en busqueda de Zelda', 'images/thumbs/07.jpg'),
(8, 'Link Preparado', 'Link peleando', 'images/thumbs/08.jpg'),
(9, 'Hay Momentos', 'Hay momentos tan especiales', 'images/thumbs/09.png'),
(10, 'Hay una fuente', 'Hay una fuente en mi', 'images/thumbs/10.png'),
(11, 'Cuan grande es el ', 'Cuan grande es el ', 'images/thumbs/11.png');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
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
