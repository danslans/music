-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 04-12-2016 a las 03:09:46
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertar` (IN `id` INT, IN `fecha` VARCHAR(100))  BEGIN
INSERT Into TBL_ASIGNAR_CANCION VALUES(id,fecha);
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TBL_ASIGNAR_CANCION`
--

CREATE TABLE `TBL_ASIGNAR_CANCION` (
  `id_img` int(11) NOT NULL,
  `fecha` varchar(100) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `TBL_ASIGNAR_CANCION`
--

INSERT INTO `TBL_ASIGNAR_CANCION` (`id_img`, `fecha`) VALUES
(2, '-2024'),
(3, '-2024'),
(7, '-2024');

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
(5, 'aunque otros canten', 'aunque otros canten', 'images/thumbs/5 Aunque otros Canten.png'),
(6, 'Bendecid al Señor', 'Bendecid al Señor', 'images/thumbs/6 Bendecid al Senor.png'),
(7, 'Bendecir a Jehova', 'Bendecir a Jehova', 'images/thumbs/7 Bendecire a Jehova.png'),
(8, 'Bendito se Jehova la Roca', 'Bendito se Jehova la Roca', 'images/thumbs/8 Bendito se Jehova la Roca.png'),
(9, 'Bueno Es', 'Bueno Es', 'images/thumbs/9 Bueno Es.png'),
(10, 'Bueno es Alabar', 'Bueno es Alabar', 'images/thumbs/10 Bueno es Alabar.png'),
(11, 'Bueno es Alabarte Jehova', 'Bueno es Alabarte Jehova', 'images/thumbs/11 Bueno es Alabarte Jehova.png'),
(12, 'Canta a Dios un Canto Nuevo', 'Canta a Dios un Canto Nuevo', 'images/thumbs/12 Canta a Dios un Canto Nuevo.png'),
(13, 'Cantad a Jehova Cantico Nuevo', 'Cantad a Jehova Cantico Nuevo', 'images/thumbs/13 Cantad a Jehova Cantico Nuevo.png'),
(14, 'Canten Todos', 'Canten Todos', 'images/thumbs/14 Canten Todos.png'),
(15, 'Celebrad a Cristo', 'Celebrad a Cristo', 'images/thumbs/15 Celebrad a Cristo.png'),
(16, 'Celebrare y Cantare', 'Celebrare y Cantare', 'images/thumbs/16 Celebrare y Cantare.png'),
(17, 'Conozco un hombre de Poder', 'Conozco un hombre de Poder', 'images/thumbs/17 Conozco un hombre de Poder.png'),
(18, 'Con que me Presentare', 'Con que me Presentare', 'images/thumbs/18 Con que me Presentare.png'),
(19, 'Digno de alabar ', 'Digno de alabar ', 'images/thumbs/19 Digno de alabar .png'),
(20, 'Dios esta aqui', 'Dios esta aqui', 'images/thumbs/20 Dios esta aqui.png'),
(21, 'Dios esta Presente', 'Dios esta Presente', 'images/thumbs/21 Dios esta Presente.png'),
(22, 'El me ha vestido de Alegria', 'El me ha vestido de Alegria', 'images/thumbs/22 El me ha vestido de Alegria.png'),
(23, 'El poderoso de Israel', 'El poderoso de Israel', 'images/thumbs/23 El poderoso de Israel.png');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
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


SELECT * FROM music.TBL_ASIGNAR_CANCION;
TRUNCATE TABLE music.TBL_ASIGNAR_CANCION;
ALTER TABLE music.TBL_ASIGNAR_CANCION MODIFY COLUMN fecha date;
 call insertar (1,'2016/12/05');