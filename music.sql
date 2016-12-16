-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 15-12-2016 a las 15:03:50
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

--
-- Funciones
--
CREATE DEFINER=`root`@`localhost` FUNCTION `insertHistoria` () RETURNS VARCHAR(100) CHARSET utf8 COLLATE utf8_spanish2_ci begin 
	declare idF int;
    declare fecha date;
    declare msn varchar(50);
	set idF=(Select a.id from TBL_ASIGNAR_CANCION a order by a.id desc limit 1);
    set fecha =(select a.fecha from TBL_ASIGNAR_CANCION a where a.id=idF);
if idF >0 then
    insert into TBL_HISTORIAL_CANCION values(null,fecha,idF);
    set msn='datos ingresados';
    end if;
    return msn;
end$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TBL_ASIGNAR_CANCION`
--

CREATE TABLE `TBL_ASIGNAR_CANCION` (
  `id_img` int(11) NOT NULL,
  `fecha` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `TBL_ASIGNAR_CANCION`
--

INSERT INTO `TBL_ASIGNAR_CANCION` (`id_img`, `fecha`) VALUES
(6, '2016-12-14'),
(20, '2016-12-14'),
(21, '2016-12-14'),
(22, '2016-12-14'),
(23, '2016-12-14');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TBL_HISTORIAL_CANCION`
--

CREATE TABLE `TBL_HISTORIAL_CANCION` (
  `id_historial` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `id_img` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `TBL_HISTORIAL_CANCION`
--

INSERT INTO `TBL_HISTORIAL_CANCION` (`id_historial`, `fecha`, `id_img`) VALUES
(1, NULL, 1),
(2, NULL, 1),
(3, NULL, 1),
(5, NULL, 1);

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
-- Indices de la tabla `TBL_HISTORIAL_CANCION`
--
ALTER TABLE `TBL_HISTORIAL_CANCION`
  ADD PRIMARY KEY (`id_historial`);

--
-- Indices de la tabla `TBL_IMG`
--
ALTER TABLE `TBL_IMG`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `TBL_HISTORIAL_CANCION`
--
ALTER TABLE `TBL_HISTORIAL_CANCION`
  MODIFY `id_historial` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
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
