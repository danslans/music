-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-12-2016 a las 23:12:18
-- Versión del servidor: 10.1.19-MariaDB
-- Versión de PHP: 7.0.13

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
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertar` (IN `id` INT, IN `fecha` VARCHAR(100), IN `orden` INT)  BEGIN
INSERT Into tbl_asignar_cancion (id_img,fecha,num_orden) VALUES(id,fecha,orden);
END$$

--
-- Funciones
--
CREATE DEFINER=`root`@`localhost` FUNCTION `insertHistoria` () RETURNS VARCHAR(100) CHARSET latin1 begin 
	declare idF int;
    declare fecha date;
    declare msn varchar(50);
	set idF=(Select a.id_img from TBL_ASIGNAR_CANCION a order by a.id desc limit 1);
    set fecha =(select a.fecha from TBL_ASIGNAR_CANCION a where a.id_img=idF);
if idF >0 then
    insert into TBL_HISTORIAL_CANCION values(null,fecha,idF);
    set msn='datos ingresados';
    end if;
    return msn;
end$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_asignar_cancion`
--

CREATE TABLE `tbl_asignar_cancion` (
  `id` int(11) NOT NULL,
  `id_img` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `num_orden` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `tbl_asignar_cancion`
--

INSERT INTO `tbl_asignar_cancion` (`id`, `id_img`, `fecha`, `num_orden`) VALUES
(1, 13, '2016-12-26', 4),
(2, 1, '2016-12-26', 3),
(3, 7, '2016-12-26', 2),
(4, 3, '2016-12-26', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_historial_cancion`
--

CREATE TABLE `tbl_historial_cancion` (
  `id_historial` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `id_img` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `tbl_historial_cancion`
--

INSERT INTO `tbl_historial_cancion` (`id_historial`, `fecha`, `id_img`) VALUES
(1, '2016-12-26', 13),
(2, '2016-12-26', 1),
(3, '2016-12-26', 7),
(4, '2016-12-26', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_img`
--

CREATE TABLE `tbl_img` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `descripcion` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `direccion` varchar(50) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `tbl_img`
--

INSERT INTO `tbl_img` (`id`, `nombre`, `descripcion`, `direccion`) VALUES
(1, 'Aclamad a Dios', 'Aclamad a Dios', 'images/thumbs/1 Aclamad a Dios.png'),
(2, 'Alabad a jehova', 'Alabad a jehova', 'images/thumbs/2 Alabad a Jehova.png'),
(3, 'Alabad a jehova', 'Alabad a jehova', 'images/thumbs/3 Alabad a Jehova.png'),
(4, 'Alabare', 'Alabare', 'images/thumbs/4 Alabare.png'),
(5, 'aunque otros canten', 'aunque otros canten', 'images/thumbs/5 Aunque otros Canten.png'),
(6, 'Bendecid al Senor', 'Bendecid al Senor', 'images/thumbs/6 Bendecid al Senor.png'),
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
-- Indices de la tabla `tbl_asignar_cancion`
--
ALTER TABLE `tbl_asignar_cancion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_img` (`id_img`);

--
-- Indices de la tabla `tbl_historial_cancion`
--
ALTER TABLE `tbl_historial_cancion`
  ADD PRIMARY KEY (`id_historial`);

--
-- Indices de la tabla `tbl_img`
--
ALTER TABLE `tbl_img`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tbl_asignar_cancion`
--
ALTER TABLE `tbl_asignar_cancion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `tbl_historial_cancion`
--
ALTER TABLE `tbl_historial_cancion`
  MODIFY `id_historial` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `tbl_img`
--
ALTER TABLE `tbl_img`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tbl_asignar_cancion`
--
ALTER TABLE `tbl_asignar_cancion`
  ADD CONSTRAINT `tbl_asignar_cancion_ibfk_1` FOREIGN KEY (`id_img`) REFERENCES `tbl_img` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
