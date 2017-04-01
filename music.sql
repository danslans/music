-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 24-03-2017 a las 01:38:19
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
CREATE  PROCEDURE `insertar` (IN `id` INT, IN `fecha` VARCHAR(100), IN `orden` INT, IN `id_persona` INT)  BEGIN
INSERT Into TBL_ASIGNAR_CANCION (id_img,fecha,num_orden,id_persona) VALUES(id,fecha,orden,id_persona);
END$$

CREATE  PROCEDURE `truncateAsignar` ()  BEGIN
declare result int;
TRUNCATE TBL_ASIGNAR_CANCION;
SET result =1;
SELECT result;
END$$

--
-- Funciones
--
CREATE  FUNCTION `insertHistoria` () RETURNS VARCHAR(100) CHARSET utf8 begin 
	declare idH int;
    declare fecha date;
    declare msn varchar(50);
    declare idPersona int;
    declare img int;
	set idH=(Select a.id from TBL_ASIGNAR_CANCION a order by a.id desc limit 1);
    set img=(select a.id_img from TBL_ASIGNAR_CANCION a where a.id=idH);
    set fecha =(select a.fecha from TBL_ASIGNAR_CANCION a where a.id=idH);
    set idPersona=(select a.id_persona FROM TBL_ASIGNAR_CANCION a WHERE a.id=idH);
if idH >0 then
   INSERT INTO `TBL_HISTORIAL_CANCION`(`id_historial`, `fecha`, `id_img`, `id_persona`) values(null,fecha,img,idPersona);
    set msn='datos ingresados';
	ELSE	
    set msn="null";
    end if;
    return msn;
end$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TBL_ASIGNAR_CANCION`
--

CREATE TABLE `TBL_ASIGNAR_CANCION` (
  `id` int(11) NOT NULL,
  `id_img` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `num_orden` int(11) NOT NULL,
  `id_persona` int(11) NOT NULL
) ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TBL_HISTORIAL_CANCION`
--

CREATE TABLE `TBL_HISTORIAL_CANCION` (
  `id_historial` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `id_img` int(11) DEFAULT NULL,
  `id_persona` int(11) NOT NULL
) ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TBL_IMG`
--

CREATE TABLE `TBL_IMG` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `descripcion` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `direccion` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL
) ;

--
-- Volcado de datos para la tabla `TBL_IMG`
--

INSERT INTO `TBL_IMG` (`id`, `nombre`, `descripcion`, `direccion`) VALUES
(1, '1 Aclamad a Dios', 'Aclamad a Dios', 'images/thumbs/1 Aclamad a Dios.png'),
(2, '2 Alabad a jehova', 'Alabad a jehova', 'images/thumbs/2 Alabad a Jehova.png'),
(3, '3 Alabad a jehova', 'Alabad a jehova', 'images/thumbs/3 Alabad a Jehova.png'),
(4, '4 Alabare', 'Alabare', 'images/thumbs/4 Alabare.png'),
(5, '5 aunque otros canten', 'aunque otros canten', 'images/thumbs/5 Aunque otros Canten.png'),
(6, '6 Bendecid al Se&#241or', 'Bendecid al Se&#241or', 'images/thumbs/6 Bendecid al Senor.png'),
(7, '7 Bendecir a Jehova', 'Bendecir a Jehova', 'images/thumbs/7 Bendecire a Jehova.png'),
(8, '8 Bendito se Jehova la Roca', 'Bendito se Jehova la Roca', 'images/thumbs/8 Bendito se Jehova la Roca.png'),
(9, '9 Bueno Es', 'Bueno Es', 'images/thumbs/9 Bueno Es.png'),
(10, '10 Bueno es Alabar', 'Bueno es Alabar', 'images/thumbs/10 Bueno es Alabar.png'),
(11, '11 Bueno es Alabarte Jehova', 'Bueno es Alabarte Jehova', 'images/thumbs/11 Bueno es Alabarte Jehova.png'),
(12, '12 Canta a Dios un Canto Nuevo', 'Canta a Dios un Canto Nuevo', 'images/thumbs/12 Canta a Dios un Canto Nuevo.png'),
(13, '13 Cantad a Jehova Cantico Nuevo', 'Cantad a Jehova Cantico Nuevo', 'images/thumbs/13 Cantad a Jehova Cantico Nuevo.png'),
(14, '14 Canten Todos', 'Canten Todos', 'images/thumbs/14 Canten Todos.png'),
(15, '15 Celebrad a Cristo', 'Celebrad a Cristo', 'images/thumbs/15 Celebrad a Cristo.png'),
(16, '16 Celebrare y Cantare', 'Celebrare y Cantare', 'images/thumbs/16 Celebrare y Cantare.png'),
(17, '17 Conozco un hombre de Poder', 'Conozco un hombre de Poder', 'images/thumbs/17 Conozco un hombre de Poder.png'),
(18, '18 Con que me Presentare', 'Con que me Presentare', 'images/thumbs/18 Con que me Presentare.png'),
(19, '19 Digno de alabar ', 'Digno de alabar ', 'images/thumbs/19 Digno de alabar .png'),
(20, '20 Dios esta aqui', 'Dios esta aqui', 'images/thumbs/20 Dios esta aqui.png'),
(21, '21 Dios esta Presente', 'Dios esta Presente', 'images/thumbs/21 Dios esta Presente.png'),
(22, '22 El me ha vestido de Alegria', 'El me ha vestido de Alegria', 'images/thumbs/22 El me ha vestido de Alegria.png'),
(23, '23 El poderoso de Israel', 'El poderoso de Israel', 'images/thumbs/23 El poderoso de Israel.png'),
(24, '24 En Dios Haremos', 'En Dios Haremos', 'images/thumbs/24 En Dios Haremos.png'),
(25, '25 En Gran Manera', 'En Gran Manera', 'images/thumbs/25 En Gran Manera.png'),
(26, '26 Gocemonos y Alegremonos', 'Gocemonos y Alegremonos', 'images/thumbs/26 Gocemonos y Alegremonos.png'),
(27, '27 Gocemonos y Alegremonos', 'Gocemonos y Alegremonos', 'images/thumbs/27 Gocemonos y Alegremonos.png'),
(28, '28 Gocense y Alegrense', 'Gocense y Alegrense', 'images/thumbs/28 Gocense y Alegrense.png'),
(29, '29 Gozate delante del Senor', 'Gozate delante del Senor', 'images/thumbs/29 Gozate delante del senor.png'),
(30, '30 Grande es el Se&#241or', 'Grande es el Se&#241or', 'images/thumbs/30 Grande es el Senor.png'),
(31, '31 Grande es el Se&#241or', 'Grande es el Se&#241or', 'images/thumbs/31 Grande es el Senor.png'),
(32, '32 Grandes y Maravillosas', 'Grandes y Maravillosas', 'images/thumbs/32 Grandes y Maravillosas.png'),
(33, '33 Has Cambiado ', 'Has Cambiado ', 'images/thumbs/33 Has Cambiado .png'),
(34, '34 Hosanna', 'Hosanna', 'images/thumbs/34 Hosanna.png'),
(35, '35 Hoy Venimos', 'Hoy Venimos', 'images/thumbs/35 Hoy Venimos.png'),
(36, '36 Jehova esta en su templo', 'Jehova esta en su templo', 'images/thumbs/36 Jehova esta en su templo.png'),
(37, '37 La Alabanza a Dios', 'La Alabanza a Dios', 'images/thumbs/37 La Alabanza a Dios.png'),
(38, '38 Maravilloso es el Se&#241or', 'Maravilloso es el Se&#241or', 'images/thumbs/38 Maravilloso es el Senor.png'),
(39, '39 Me Gozare', 'Me Gozare', 'images/thumbs/39 Me Gozare.png'),
(40, '40 Me Gozare en tu Presencia', 'Me Gozare en tu Presencia', 'images/thumbs/40 Me Gozare en tu Presencia.png'),
(41, '41 Mi Amado ', 'Mi Amado ', 'images/thumbs/41 Mi Amado .png'),
(42, '42 Mirad Bendecid', 'Mirad Bendecid', 'images/thumbs/42 Mirad Bendecid.png'),
(43, '43 No hay Dios como mi Dios', 'No hay Dios como mi Dios', 'images/thumbs/43 No hay Dios como mi Dios.png'),
(44, '44 No hay Dios tan grande como tu', 'No hay Dios tan grande como tu', 'images/thumbs/44 No hay Dios tan grande como tu.png'),
(45, '45 Oh Moradora', 'Oh Moradora', 'images/thumbs/45 Oh Moradora.png'),
(46, '46 Para ti oh Jehova', 'Para ti oh Jehova', 'images/thumbs/46 Para ti oh Jehova.png'),
(47, '47 Pelearan Contra el Cordero', 'Pelearan Contra el Cordero', 'images/thumbs/47 Pelearan Contra el Cordero.png'),
(48, '48 Proclamemos con Gozo', 'Proclamemos con Gozo', 'images/thumbs/48 Proclamemos con Gozo.png'),
(49, '49 Pueblos todos Batid Manos', 'Pueblos todos Batid Manos', 'images/thumbs/49 Pueblos todos Batid Manos.png'),
(50, '50 Que viva Cristo', 'Que viva Cristo', 'images/thumbs/50 Que viva Cristo.png'),
(51, '51 Quien Como Jehova', 'Quien Como Jehova', 'images/thumbs/51 Quien Como Jehova.png'),
(52, '52 Quien como tu, Jehova entre los dioses', 'Quien como tu, Jehova entre los dioses', 'images/thumbs/52 Quien como tu, Jehova entre los dioses.png'),
(53, '53 Quien es el rey', 'Quien es el rey', 'images/thumbs/53 Quien es el rey.png'),
(54, '54 Santo, Santo, Santo', 'Santo, Santo, Santo', 'images/thumbs/54 Santo, Santo, Santo.png'),
(55, '55 Santo, Santo tu eres', 'Santo, Santo tu eres', 'images/thumbs/55 Santo, Santo tu eres.png'),
(56, '56 Se&#241or a Quien Iremos', 'Se&#241or a Quien Iremos', 'images/thumbs/56 Senor a Quien Iremos.png'),
(57, '57 Su Gloria Cubrio los Cielos', 'Su Gloria Cubrio los Cielos', 'images/thumbs/57 Su Gloria Cubrio los Cielos.png'),
(58, '58 Su Nombre de Guerra', 'Su Nombre de Guerra', 'images/thumbs/58 Su Nombre de Guerra.png'),
(59, '59 Te alabaran oh Jehova', 'Te alabaran oh Jehova', 'images/thumbs/59 Te alabaran oh Jehova.png'),
(60, '60 Te Alabare', 'Te Alabare', 'images/thumbs/60 Te Alabare.png'),
(61, '61 Te alabare oh Dios', 'Te alabare oh Dios', 'images/thumbs/61 Te alabare oh Dios.png'),
(62, '62 Te amo oh, Jehova', 'Te amo oh, Jehova', 'images/thumbs/62 Te amo oh, Jehova.png'),
(63, '63 Toda la noche sin parar', 'Toda la noche sin parar', 'images/thumbs/63 Toda la noche sin parar.png'),
(64, '64 Tu eres Dios', 'Tu eres Dios', 'images/thumbs/64 Tu eres Dios.png'),
(65, '65 Tu misericordia', 'Tu misericordia', 'images/thumbs/65 Tu misericordia.png'),
(66, '66 Tu Nombre Levantare', 'Tu Nombre Levantare', 'images/thumbs/66 Tu Nombre Levantare.png'),
(67, '67 Una Cosa he Demandado', 'Una Cosa he Demandado', 'images/thumbs/67 Una Cosa he Demandado.png'),
(68, '68 Vamos a Alabar a Jehova', 'Vamos a Alabar a Jehova', 'images/thumbs/68 Vamos a Alabar a Jehova.png'),
(69, '69 Venid Aclamemos', 'Venid Aclamemos', 'images/thumbs/69 Venid Aclamemos.png'),
(70, '70 Venid Todos', 'Venid Todos', 'images/thumbs/70 Venid Todos.png'),
(71, '71 Ven y Juntos  Alabemos', 'Ven y Juntos  Alabemos', 'images/thumbs/71 Ven y Juntos  Alabemos.png'),
(72, '72 Yo Celebrare', 'Yo Celebrare', 'images/thumbs/72 Yo Celebrare.png'),
(73, '73 Yo Celebrare, Cantare al Senor', 'Yo Celebrare, Cantare al Senor', 'images/thumbs/73 Yo Celebrare, Cantare al Senor.png'),
(74, '74 To se que estas aqui mi Senor', 'To se que estas aqui mi Senor', 'images/thumbs/74 To se que estas aqui mi Senor.png'),
(75, '75 Yo te adoro Senor', 'Yo te adoro Senor', 'images/thumbs/75 Yo te adoro Senor.png'),
(76, '76 Yo vine alabar a Dios', 'Yo vine alabar a Dios', 'images/thumbs/76 Yo vine alabar a Dios.png'),
(77, '77 El gozo que siento yo', 'El gozo que siento yo', 'images/thumbs/77 El gozo que siento yo.png'),
(78, '78 El senor me lleno de gozo', 'El senor me lleno de gozo', 'images/thumbs/78 El senor me lleno de gozo.png'),
(79, '79 Estamos de fiesta con Jesus', 'Estamos de fiesta con Jesus', 'images/thumbs/79 Estamos de fiesta con Jesus.png'),
(80, '80 Estamos hoy de fiesta', 'Estamos hoy de fiesta', 'images/thumbs/80 Estamos hoy de fiesta.png'),
(81, '81 Este gozo que siento yo', 'Este gozo que siento yo', 'images/thumbs/81 Este gozo que siento yo.png'),
(82, '82 Gozo yo queria', 'Gozo yo queria', 'images/thumbs/82 Gozo yo queria.png'),
(83, '83 Hay una fiesta', 'Hay una fiesta', 'images/thumbs/83 Hay una fiesta.png'),
(84, '84 Hay un motivo', 'Hay un motivo', 'images/thumbs/84 Hay un motivo.png'),
(85, '85 Hay un pueblo', 'Hay un pueblo', 'images/thumbs/85 Hay un pueblo.png'),
(86, '86 Mas los Justos', 'Mas los Justos', 'images/thumbs/86 Mas los Justos.png'),
(87, '87 No puede estar triste', 'No puede estar triste', 'images/thumbs/87 No puede estar triste.png'),
(88, '88 Solo Dios hace al hombre feliz', 'Solo Dios hace al hombre feliz', 'images/thumbs/88 Solo Dios hace al hombre feliz.png'),
(89, '89 Yo me gozo', 'Yo me gozo', 'images/thumbs/89 Yo me gozo.png'),
(90, '90 Yo siento gozo', 'Yo siento gozo', 'images/thumbs/90 Yo siento gozo.png'),
(91, '91 Alabad a Dios', 'Alabad a Dios', 'images/thumbs/91 Alabad a Dios.png'),
(92, '92 Aunque gigante se encuentre alla', 'Aunque gigante se encuentre alla', 'images/thumbs/92 Aunque gigante se encuentre alla.png'),
(93, '93 Cada dia me siento mas alegre', 'Cada dia me siento mas alegre', 'images/thumbs/93 Cada dia me siento mas alegre.png'),
(94, '94 Clamando estoy', 'Clamando estoy', 'images/thumbs/94 Clamando estoy.png'),
(95, '95 Con mi Dios', 'Con mi Dios', 'images/thumbs/95 Con mi Dios.png'),
(96, '96 Digno Eres tu Jehova', 'Digno Eres tu Jehova', 'images/thumbs/96 Digno Eres tu Jehova.png'),
(97, '97 Dios es nuestro amparo', 'Dios es nuestro amparo', 'images/thumbs/97 Dios es nuestro amparo.png'),
(98, '98 El senor es mi pastor', 'El senor es mi pastor', 'images/thumbs/98 El senor es mi pastor.png'),
(99, '99 Escogido fui de Dios', 'Escogido fui de Dios', 'images/thumbs/99 Escogido fui de Dios.png'),
(100, '100 Es Cristo la Roca', 'Es Cristo la Roca', 'images/thumbs/100 Es Cristo la Roca.png'),
(101, '101 Jesus es mi pastor', 'Jesus es mi pastor', 'images/thumbs/101 Jesus es mi pastor.png'),
(102, '102 La Madrugada', 'La Madrugada', 'images/thumbs/102 La Madrugada.png'),
(103, '103 Los que Esperan', 'Los que Esperan', 'images/thumbs/103 Los que Esperan.png'),
(104, '104 Me alegrare', 'Me alegrare', 'images/thumbs/104 Me alegrare.png'),
(105, '105 No retrocedere', 'No retrocedere', 'images/thumbs/105 No retrocedere.png'),
(106, '106 Poderoso Gigante', 'Poderoso Gigante', 'images/thumbs/106 Poderoso Gigante.png'),
(107, '107 Quien nos separara', 'Quien nos separara', 'images/thumbs/107 Quien nos separara.png'),
(108, '108 Si tuvieres fe', 'Si tuvieres fe', 'images/thumbs/108 Si tuvieres fe.png'),
(109, '109 Solo No Estoy', 'Solo No Estoy', 'images/thumbs/109 Solo No Estoy.png'),
(110, '110 Te espero', 'Te espero', 'images/thumbs/110 Te espero.png'),
(111, '111 Tu vas delante Senor', 'Tu vas delante Senor', 'images/thumbs/111 Tu vas delante Senor.png'),
(112, '112 Tu vienes contra mi', 'Tu vienes contra mi', 'images/thumbs/112 Tu vienes contra mi.png'),
(113, '113 Vamos escalando perdanos', 'Vamos escalando perdanos', 'images/thumbs/113 Vamos escalando perdanos.png'),
(114, '114 Ya que has puesto tu mano', 'Ya que has puesto tu mano', 'images/thumbs/114 Ya que has puesto tu mano.png'),
(115, '115 Yo solo espero a Jesus', 'Yo solo espero a Jesus', 'images/thumbs/115 Yo solo espero a Jesus.png'),
(116, '116 Yo soy testigo', 'Yo soy testigo', 'images/thumbs/116 Yo soy testigo.png'),
(117, '117 En victoria estoy', 'En victoria estoy', 'images/thumbs/117 En victoria estoy.png'),
(118, '118 Hay victoria', 'Hay victoria', 'images/thumbs/118 Hay victoria.png'),
(119, '119 Hay victoria en mi Jesus', '119 Hay victoria en mi Jesus', 'images/thumbs/119 Hay victoria en mi Jesus.png'),
(120, '120 Quien dijo que no', 'Quien dijo que no', 'images/thumbs/120 Quien dijo que no.png'),
(121, '121 Cristo rompe las cademas', 'Cristo rompe las cademas', 'images/thumbs/121 Cristo rompe las cademas.png'),
(122, '122 Libre', 'Libre', 'images/thumbs/122 Libre.png'),
(123, '123 Los Muros caen', 'Los Muros caen', 'images/thumbs/123 Los Muros caen.png'),
(124, '124 Yo siento paz y gozo', 'Yo siento paz y gozo', 'images/thumbs/124 Yo siento paz y gozo.png'),
(125, '125 Alla en el cielo', 'Alla en el cielo', 'images/thumbs/125  Alla en el cielo.png'),
(126, '126 Alla en el cielo no habra mas llanto', 'Alla en el cielo no habra mas llanto', 'images/thumbs/126 Alla en el cielo no habra mas llanto.png'),
(127, '127 Bellas mansiones', 'Bellas mansiones', 'images/thumbs/127 Bellas mansiones.png'),
(128, '128 Cuando alla se pase lista', 'Cuando alla se pase lista', 'images/thumbs/128 Cuando alla se pase lista.png'),
(129, '129 Hay una patria', 'Hay una patria', 'images/thumbs/129 Hay una patria.png'),
(130, '130 Mas alla del sol', 'Mas alla del sol', 'images/thumbs/130 Mas alla del sol.png'),
(131, '131 Oh Jerusalen', 'Oh Jerusalen', 'images/thumbs/131 Oh Jerusalen.png'),
(132, '132 Se fial hasta la merte', 'Se fial hasta la merte', 'images/thumbs/132 Se fial hasta la merte.png'),
(133, '133 Yo tengo un hogar', 'Yo tengo un hogar', 'images/thumbs/133 Yo tengo un hogar.png'),
(134, '134 Como ladron en la noche', 'Como ladron en la noche', 'images/thumbs/134 Como ladron en la noche.png'),
(135, '135 Estaras tu velando', 'Estaras tu velando', 'images/thumbs/135 Estaras tu velando.png'),
(136, '136 La manana gloriosa', 'La manana gloriosa', 'images/thumbs/136 La manana gloriosa.png'),
(137, '137 La venida de cristo', '137 La venida de cristo', 'images/thumbs/137 La venida de cristo.png'),
(138, '138 Suena las trompetas', '138 Suena las trompetas', 'images/thumbs/138 Suena las trompetas.png'),
(139, '139 Vestido de ternura', '139 Vestido de ternura', 'images/thumbs/139 Vestido de ternura.png'),
(140, '140 Ahora mismo', '140 Ahora mismo', 'images/thumbs/140 Ahora mismo.png'),
(141, '141 Algo esta descendiendo', '141 Algo esta descendiendo', 'images/thumbs/141 Algo esta descendiendo.png'),
(142, '142 Alguien esta aqui', '142 Alguien esta aqui', 'images/thumbs/142 Alguien esta aqui.png'),
(143, '143 Aquel fuego', '143 Aquel fuego', 'images/thumbs/143 Aquel fuego.png'),
(144, '144 Aquel que camino', '144 Aquel que camino', 'images/thumbs/144 Aquel que camino.png'),
(145, '145 Aqui se siente', '145 Aqui se siente', 'images/thumbs/145 Aqui se siente.png'),
(146, '146 Ardiendo en fuego', '146 Ardiendo en fuego', 'images/thumbs/146 Ardiendo en fuego.png'),
(147, '147 Como el ciervo brama', '147 Como el ciervo brama', 'images/thumbs/147 Como el ciervo brama.png'),
(148, '148 Como la arena del mar', '148 Como la arena del mar', 'images/thumbs/148 Como la arena del mar.png'),
(149, '149 Cuando el pueblo', '149 Cuando el pueblo', 'images/thumbs/149 Cuando el pueblo.png'),
(150, '150 Cuando Faraon', '150 Cuando Faraon', 'images/thumbs/150 Cuando Faraon.png'),
(151, '151 Desciende aqui', '151 Desciende aqui', 'images/thumbs/151 Desciende aqui.png'),
(152, '152 Donde esta el espiritu de Dios', '152 Donde esta el espiritu de Dios', 'images/thumbs/152 Donde esta el espiritu de Dios.png'),
(153, '153 El culto de hoy', '153 El culto de hoy', 'images/thumbs/153 El culto de hoy.png'),
(154, '154 Elias oraba', '154 Elias oraba', 'images/thumbs/154 Elias oraba.png'),
(155, '155 El maestro de Galilea', '155 El maestro de Galilea', 'images/thumbs/155 El maestro de Galilea.png'),
(156, '156 En el altar de Dios', '156 En el altar de Dios', 'images/thumbs/156 En el altar de Dios.png'),
(157, '157 En el principio', '157 En el principio', 'images/thumbs/157 En el principio.png'),
(158, '158 Zarza', '158 Zarza', 'images/thumbs/158 Zarza.png'),
(159, '159 Espiritu de Dios desciende', '159 Espiritu de Dios desciende', 'images/thumbs/159 Espiritu de Dios desciende.png'),
(160, '160 Estaban todos unanimes', '160 Estaban todos unanimes', 'images/thumbs/160 Estaban todos unanimes.png'),
(161, '161 Estamos pidiendo', '161 Estamos pidiendo', 'images/thumbs/161 Estamos pidiendo.png'),
(162, '162 Este avivamiento', '162 Este avivamiento', 'images/thumbs/162 Este avivamiento.png'),
(163, '163 Estoy sintiendo un poder', '163 Estoy sintiendo un poder', 'images/thumbs/163 Estoy sintiendo un poder.png'),
(164, '164 Fuego de Dios', '164 Fuego de Dios', 'images/thumbs/164 Fuego de Dios.png'),
(165, '165 Fuego, Fuego', '165 Fuego, Fuego', 'images/thumbs/165 Fuego, Fuego.png'),
(166, '166 Hare un altar para ti', '166 Hare un altar para ti', 'images/thumbs/166 Hare un altar para ti.png'),
(167, '167 Jacob lucho con el angel', '167 Jacob lucho con el angel', 'images/thumbs/167 Jacob lucho con el angel.png'),
(168, '168 Jesus esta pasando por aqui', '168 Jesus esta pasando por aqui', 'images/thumbs/168 Jesus esta pasando por aqui.png'),
(169, '169 La gloria de jehova', '169 La gloria de jehova', 'images/thumbs/169 La gloria de jehova.png'),
(170, '170 La gloria de jehova cayo en el Sinai', '170 La gloria de jehova cayo en el Sinai', 'images/thumbs/170 La gloria de jehova cayo en el Sinai.png'),
(171, '171 La Gracia de Dios', '171 La Gracia de Dios.png', 'images/thumbs/171 La Gracia de Dios.png'),
(172, '172 Lo que el Espiritu diga', '172 Lo que el Espiritu diga', 'images/thumbs/172 Lo que el Espiritu diga.png'),
(173, '173 Manda poder', '173 Manda poder', 'images/thumbs/173 Manda poder.png'),
(174, '174 Manda Poder del Cielo', '174 Manda Poder del Cielo', 'images/thumbs/174 Manda Poder del Cielo.png'),
(175, '175 Maravilloso poder', '175 Maravilloso poder', 'images/thumbs/175 Maravilloso poder.png'),
(176, '176 Mi unico anhelo', '176 Mi unico anhelo', 'images/thumbs/176 Mi unico anhelo.png'),
(177, '177 No te dejare', '177 No te dejare', 'images/thumbs/177 No te dejare.png'),
(178, '178 Oh poder pentescostal', '178 Oh poder pentescostal', 'images/thumbs/178 Oh poder pentescostal.png'),
(179, '179 Paseate Nazareno', '179 Paseate Nazareno', 'images/thumbs/179 Paseate Nazareno.png'),
(180, '180 Pon Aceite', '180 Pon Aceite', 'images/thumbs/180 Pon Aceite.png'),
(181, '181 Porque el fuego esta encendido', '181 Porque el fuego esta encendido', 'images/thumbs/181 Porque el fuego esta encendido.png'),
(182, '182 Rios de agua viva', '182 Rios de agua viva', 'images/thumbs/182 Rios de agua viva.png'),
(183, '183 Se mueve la mano de Dios', '183 Se mueve la mano de Dios', 'images/thumbs/183 Se mueve la mano de Dios.png'),
(184, '184 Si empezamos a cantar', '184 Si empezamos a cantar', 'images/thumbs/184 Si empezamos a cantar.png'),
(185, '185 Si has Conocido al Senor', '185 Si has Conocido al Senor', 'images/thumbs/185 Si has Conocido al Senor.png'),
(186, '186 Si tu quieres sentir', '186 Si tu quieres sentir', 'images/thumbs/186 Si tu quieres sentir.png'),
(187, '187 Un fuego ardiente', '187 Un fuego ardiente', 'images/thumbs/187 Un fuego ardiente.png'),
(188, '188 Vamos orando', '188 Vamos orando', 'images/thumbs/188 Vamos orando.png'),
(189, '189 Ven espiritu divino', '189 Ven espiritu divino', 'images/thumbs/189 Ven espiritu divino.png'),
(190, '190 Ya llego el Espiritu', '190 Ya llego el Espiritu', 'images/thumbs/190 Ya llego el Espiritu.png'),
(191, '191 Yo siento como que la gloria bajo', '191 Yo siento como que la gloria bajo', 'images/thumbs/191 Yo siento como que la gloria bajo.png'),
(192, '192 Yo siento que me lleno de poder', '192 Yo siento que me lleno de poder', 'images/thumbs/192 Yo siento que me lleno de poder.png'),
(193, '193 Yo si se', '193 Yo si se', 'images/thumbs/193 Yo si se.png'),
(194, '194 Yo tengo una peticion', '194 Yo tengo una peticion', 'images/thumbs/194 Yo tengo una peticion.png'),
(195, '195 Yo vine a buscar una bendicion', '195 Yo vine a buscar una bendicion', 'images/thumbs/195 Yo vine a buscar una bendicion.png'),
(196, '196 Yo vine aqui', '196 Yo vine aqui', 'images/thumbs/196 Yo vine aqui.png'),
(197, '197 Abba padre', '197 Abba padre', 'images/thumbs/197 Abba padre.png'),
(198, '198 A cada instante', '198 A cada instante', 'images/thumbs/198 A cada instante.png'),
(199, '199 A Cristo', '199 A Cristo', 'images/thumbs/199 A Cristo.png'),
(200, '200 Adorad al cordero santo', '200 Adorad al cordero santo', 'images/thumbs/200 Adorad al cordero santo.png'),
(201, '201 Adorarte', '201 Adorarte', 'images/thumbs/201 Adorarte.png'),
(202, '202 A el alto y sublime', '202 A el alto y sublime', 'images/thumbs/202 A el alto y sublime.png'),
(203, '203 A el sea la gloria', '203 A el sea la gloria', 'images/thumbs/203 A el sea la gloria.png'),
(204, '204 Agnus dei', '204 Agnus dei', 'images/thumbs/204 Agnus dei.png'),
(205, '205 A Jehova cantare', '205 A Jehova cantare', 'images/thumbs/205 A Jehova cantare.png'),
(206, '206 Alabadle', '206 Alabadle', 'images/thumbs/206 Alabadle.png'),
(207, '207 Aleluya', '207 Aleluya', 'images/thumbs/207 Aleluya.png'),
(208, '208 Al estar ante ti', '208 Al estar ante ti', 'images/thumbs/208 Al estar ante ti.png'),
(209, '209 Al estar aqui', '209 Al estar aqui', 'images/thumbs/209 Al estar aqui.png'),
(210, '210 Al que esta sentado en el trono', '210 Al que esta sentado en el trono', 'images/thumbs/210 Al que esta sentado en el trono.png'),
(211, '211 A quien tengo yo en los cielos', '211 A quien tengo yo en los cielos', 'images/thumbs/211 A quien tengo yo en los cielos.png'),
(212, '212 A ti Atribuimos', '212 A ti Atribuimos', 'images/thumbs/212 A ti Atribuimos.png'),
(213, '213 A ti Jesus', '213 A ti Jesus', 'images/thumbs/213 A ti Jesus.png'),
(214, '214 Bendecire al Senor', '214 Bendecire al Senor', 'images/thumbs/214 Bendecire al Senor.png'),
(215, '215 Bendito sea el Senor', '215 Bendito sea el Senor', 'images/thumbs/215 Bendito sea el Senor.png'),
(216, '216 Canta al Senor', '216 Canta al Senor', 'images/thumbs/216 Canta al Senor.png'),
(217, '217 Con mi canto', '217 Con mi canto', 'images/thumbs/217 Con mi canto.png'),
(218, '218 Con mis labios', '218 Con mis labios', 'images/thumbs/218 Con mis labios.png'),
(219, '219 Con mis labios', '219 Con mis labios', 'images/thumbs/219 Con mis labios.png'),
(220, '220 Cristo, altisimo Senor', '220 Cristo, altisimo Senor', 'images/thumbs/220 Cristo, altisimo Senor.png'),
(221, '221 Cristo, yo te amo', '221 Cristo, yo te amo', 'images/thumbs/221 Cristo, yo te amo.png'),
(222, '222 Cuando pienso', '222 Cuando pienso', 'images/thumbs/222 Cuando pienso.png'),
(223, '223 Cuando pienso en tu santidad', '223 Cuando pienso en tu santidad', 'images/thumbs/223 Cuando pienso en tu santidad.png'),
(224, '224 Cuando veo tu amor', '224 Cuando veo tu amor', 'images/thumbs/224 Cuando veo tu amor.png'),
(225, '225 Damos honor a ti', '225 Damos honor a ti', 'images/thumbs/225 Damos honor a ti.png'),
(226, '226 Declaramos tu Majestad', '226 Declaramos tu Majestad', 'images/thumbs/226 Declaramos tu Majestad.png'),
(227, '227 Deja que el Senor', '227 Deja que el Senor', 'images/thumbs/227 Deja que el Senor.png'),
(228, '228 Delante de tu trono', '228 Delante de tu trono', 'images/thumbs/228 Delante de tu trono.png'),
(229, '229 De oidas', '229 De oidas', 'images/thumbs/229 De oidas.png'),
(230, '230 De tal manera', '230 De tal manera', 'images/thumbs/230 De tal manera.png'),
(231, '231 Dios el mas grande', '231 Dios el mas grande', 'images/thumbs/231 Dios el mas grande.png'),
(232, '232 Dios esta aqui', '232 Dios esta aqui', 'images/thumbs/232 Dios esta aqui.png'),
(233, '233 Dios ha sido bueno', '233 Dios ha sido bueno', 'images/thumbs/233 Dios ha sido bueno.png'),
(234, '234 El Senor es mi luz', '234 El Senor es mi luz', 'images/thumbs/234 El Senor es mi luz.png'),
(235, '235 E Senor es mi Rey', '235 E Senor es mi Rey', 'images/thumbs/235 E Senor es mi Rey.png'),
(236, '236 Entra en la presencia', '236 Entra en la presencia', 'images/thumbs/236 Entra en la presencia.png'),
(237, '237 En tu presencia', '237 En tu presencia', 'images/thumbs/237 En tu presencia.png'),
(238, '238 En tus atrios estoy', '238 En tus atrios estoy', 'images/thumbs/238 En tus atrios estoy.png'),
(239, '239 Eres', '239 Eres', 'images/thumbs/239 Eres.png'),
(240, '240 Eres Digno', '240 Eres Digno', 'images/thumbs/240 Eres Digno.png'),
(241, '241 Estar en tu presencia', '241 Estar en tu presencia', 'images/thumbs/241 Estar en tu presencia.png'),
(242, '242 Exaltad a Jehova', '242 Exaltad a Jehova', 'images/thumbs/242 Exaltad a Jehova.png'),
(243, '243 Exaltate', '243 Exaltate', 'images/thumbs/243 Exaltate.png'),
(244, '244 Hay momentos', '244 Hay momentos', 'images/thumbs/244 Hay momentos.png'),
(245, '245 Hay una fuente en mi', '245 Hay una fuente en mi', 'images/thumbs/245 Hay una fuente en mi.png'),
(246, '246 Hemos venido a tu Casa', '246 Hemos venido a tu Casa', 'images/thumbs/246 Hemos venido a tu Casa.png'),
(247, '247 Hermoso Eres', '247 Hermoso Eres', 'images/thumbs/247 Hermoso Eres.png'),
(248, '248 He venido a Adorarte', '248 He venido a Adorarte', 'images/thumbs/248 He venido a Adorarte.png'),
(249, '249 Hijo de Dios', '249 Hijo de Dios', 'images/thumbs/249 Hijo de Dios.png'),
(250, '250 Hosanna', '250 Hosanna', 'images/thumbs/250 Hosanna.png'),
(251, '251 La gracia se Derramo', '251 La gracia se Derramo', 'images/thumbs/251 La gracia se Derramo.png'),
(252, '252 Magnifico', '252 Magnifico', 'images/thumbs/252 Magnifico.png'),
(253, '253 Majestuoso, poderoso', '253 Majestuoso, poderoso', 'images/thumbs/253 Majestuoso, poderoso.png'),
(254, '254 Maravilloso Jesus, es para mi', '254 Maravilloso Jesus, es para mi', 'images/thumbs/254 Maravilloso Jesus, es para mi.png'),
(255, '255 Mas yo por la abundancia', '255 Mas yo por la abundancia', 'images/thumbs/255 Mas yo por la abundancia.png'),
(256, '256 Mejor que vida es tu misericordia', '256 Mejor que vida es tu misericordia', 'images/thumbs/256 Mejor que vida es tu misericordia.png'),
(257, '257 Mi anhelo', '257 Mi anhelo', 'images/thumbs/257 Mi anhelo.png'),
(258, '258 Mi pensamiento eres tu, Senor', '258 Mi pensamiento eres tu, Senor', 'images/thumbs/258 Mi pensamiento eres tu, Senor.png'),
(259, '259 Momentos especiales', '259 Momentos especiales', 'images/thumbs/259 Momentos especiales.png'),
(260, '260 No hay nadie como tu', '260 No hay nadie como tu', 'images/thumbs/260 No hay nadie como tu.png'),
(261, '261 No se porque', '261 No se porque', 'images/thumbs/261 No se porque.png'),
(262, '262 Oh ven', '262 Oh ven', 'images/thumbs/262 Oh ven.png'),
(263, '263 Palabras de verdad', '263 Palabras de verdad', 'images/thumbs/263 Palabras de verdad.png'),
(264, '264 Porque para siempre Dios', '264 Porque para siempre Dios', 'images/thumbs/264 Porque para siempre Dios.png'),
(265, '265 Que dulce', '265 Que dulce', 'images/thumbs/265 Que dulce.png'),
(266, '266 Que te alaben', '266 Que te alaben', 'images/thumbs/266 Que te alaben.png'),
(267, '267 Queremos darte gloria', '267 Queremos darte gloria', 'images/thumbs/267 Queremos darte gloria.png'),
(268, '268 Quiero levantar mis manos', '268 Quiero levantar mis manos', 'images/thumbs/268 Quiero levantar mis manos.png'),
(269, '269 Quiero llenar', '269 Quiero llenar', 'images/thumbs/269 Quiero llenar.png'),
(270, '270 Santo eres tu', '270 Santo eres tu', 'images/thumbs/270 Santo eres tu.png'),
(271, '271 Santo es el Senor', '271 Santo es el Senor', 'images/thumbs/271 Santo es el Senor.png'),
(272, '272 Santo, mi corazon te adora', '272 Santo, mi corazon te adora', 'images/thumbs/272 Santo, mi corazon te adora.png'),
(273, '273 Santo, Senor de gloria', '273 Santo, Senor de gloria', 'images/thumbs/273 Santo, Senor de gloria.png'),
(274, '274 Sentado en su trono', '274 Sentado en su trono', 'images/thumbs/274 Sentado en su trono.png'),
(275, '275 Senor eres grande', '275 Senor eres grande', 'images/thumbs/275 Senor eres grande.png'),
(276, '276 Senor tu eres', '276 Senor tu eres', 'images/thumbs/276 Senor tu eres.png'),
(277, '277 Sin Dios nada somos', '277 Sin Dios nada somos', 'images/thumbs/277 Sin Dios nada somos.png'),
(278, '278 Soberano Dios', '278 Soberano Dios', 'images/thumbs/278 Soberano Dios.png'),
(279, '279 Solo tu eres santo', '279 Solo tu eres santo', 'images/thumbs/279 Solo tu eres santo.png'),
(280, '280 Te adoramos', '280 Te adoramos', 'images/thumbs/280 Te adoramos.png'),
(281, '281 Te Adoro', '281 Te Adoro', 'images/thumbs/281 Te Adoro.png'),
(282, '282 Te Alabamos senor', '282 Te Alabamos senor', 'images/thumbs/282 Te Alabamos senor.png'),
(283, '283 Te alabamos, te adoramos', '283 Te alabamos, te adoramos', 'images/thumbs/283 Te alabamos, te adoramos.png'),
(284, '284 Te alabo', '284 Te alabo', 'images/thumbs/284 Te alabo.png'),
(285, '285 Te alabo, te bendigo', '285 Te alabo, te bendigo', 'images/thumbs/285 Te alabo, te bendigo.png'),
(286, '286 Te exaltare, mi Dios, mi Rey', '286 Te exaltare, mi Dios, mi Rey', 'images/thumbs/286 Te exaltare, mi Dios, mi Rey.png'),
(287, '287 Te vengo a bendecir', '287 Te vengo a bendecir', 'images/thumbs/287 Te vengo a bendecir.png'),
(288, '288 Toda gloria y majestad', '288 Toda gloria y majestad', 'images/thumbs/288 Toda gloria y majestad.png'),
(289, '289 Toda honra', '289 Toda honra', 'images/thumbs/289 Toda honra.png'),
(290, '290 Toma mi mano', '290 Toma mi mano', 'images/thumbs/290 Toma mi mano.png'),
(291, '291 Torre fuerte', '291 Torre fuerte', 'images/thumbs/291 Torre fuerte.png'),
(292, '292 Tu amor por mi', '292 Tu amor por mi', 'images/thumbs/292 Tu amor por mi.png'),
(293, '293 Tu eres Digno', '293 Tu eres Digno', 'images/thumbs/293 Tu eres Digno.png'),
(294, '294 Tu eres Dios', '294 Tu eres Dios', 'images/thumbs/294 Tu eres Dios.png'),
(295, '295 Tu estas aqui', '295 Tu estas aqui', 'images/thumbs/295 Tu estas aqui.png'),
(296, '296 Tu fidelidad', '296 Tu fidelidad', 'images/thumbs/296 Tu fidelidad.png'),
(297, '297 Tu habitas', '297 Tu habitas', 'images/thumbs/297 Tu habitas.png'),
(298, '298 Tu mereces gloria', '298 Tu mereces gloria', 'images/thumbs/298 Tu mereces gloria.png'),
(299, '299 Tu mirada', '299 Tu mirada', 'images/thumbs/299 Tu mirada.png'),
(300, '300 Tu nombre es santo', '300 Tu nombre es santo', 'images/thumbs/300 Tu nombre es santo.png'),
(301, '301 Tu nombre ho Dios', '301 Tu nombre ho Dios', 'images/thumbs/301 Tu nombre ho Dios.png'),
(302, '302 Tu presencia Senor', '302 Tu presencia Senor', 'images/thumbs/302 Tu presencia Senor.png'),
(303, '303 Vamos a la ciudad', '303 Vamos a la ciudad', 'images/thumbs/303 Vamos a la ciudad.png'),
(304, '304 Vengo a Rendirme', '304 Vengo a Rendirme', 'images/thumbs/304 Vengo a Rendirme.png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TBL_PERSONA`
--

CREATE TABLE `TBL_PERSONA` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `pwd` varchar(100) NOT NULL,
  `rol` int(11) NOT NULL
) 

--
-- Volcado de datos para la tabla `TBL_PERSONA`
--

INSERT INTO `TBL_PERSONA` (`id`, `nombre`, `username`, `pwd`, `rol`) VALUES
(1, 'Daniel Gomez', 'danslans', '*F09BE671F5D94A97CFF8F09BAC87F45E7224FB6D', 1),
(2, 'juan pablo', 'spokentitan', '*4E340E67A90B535FE1E5CBDF6C788A21B2EE6853', 2),
(3, 'Jeison Andres', 'jap', '*674EDDBD9440EDFF4BBEB1C8EE9A28C79B2DFCA1', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TBL_ROL`
--

CREATE TABLE `TBL_ROL` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL
);

--
-- Volcado de datos para la tabla `TBL_ROL`
--

INSERT INTO `TBL_ROL` (`id`, `nombre`) VALUES
(1, 'AdminSong'),
(2, 'UserSong');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `TBL_ASIGNAR_CANCION`
--
ALTER TABLE `TBL_ASIGNAR_CANCION`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_img` (`id_img`),
  ADD KEY `id_persona` (`id_persona`);

--
-- Indices de la tabla `TBL_HISTORIAL_CANCION`
--
ALTER TABLE `TBL_HISTORIAL_CANCION`
  ADD PRIMARY KEY (`id_historial`),
  ADD KEY `id_img` (`id_img`);

--
-- Indices de la tabla `TBL_IMG`
--
ALTER TABLE `TBL_IMG`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `TBL_PERSONA`
--
ALTER TABLE `TBL_PERSONA`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `rol` (`rol`);

--
-- Indices de la tabla `TBL_ROL`
--
ALTER TABLE `TBL_ROL`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `TBL_ASIGNAR_CANCION`
--
ALTER TABLE `TBL_ASIGNAR_CANCION`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `TBL_HISTORIAL_CANCION`
--
ALTER TABLE `TBL_HISTORIAL_CANCION`
  MODIFY `id_historial` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `TBL_IMG`
--
ALTER TABLE `TBL_IMG`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=305;
--
-- AUTO_INCREMENT de la tabla `TBL_PERSONA`
--
ALTER TABLE `TBL_PERSONA`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
