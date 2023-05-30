-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-05-2023 a las 11:07:10
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bbddsnk`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle`
--

CREATE TABLE `detalle` (
  `codigo_pedido` int(11) NOT NULL,
  `codigo_producto` int(11) NOT NULL,
  `unidades` int(11) DEFAULT NULL,
  `precio_unitario` decimal(8,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detalle`
--

INSERT INTO `detalle` (`codigo_pedido`, `codigo_producto`, `unidades`, `precio_unitario`) VALUES
(35, 70, 1, 75.00),
(35, 71, 1, 70.00),
(35, 72, 1, 70.00),
(37, 29, 1, 150.00),
(37, 30, 1, 110.00),
(37, 37, 2, 120.00),
(38, 3, 1, 110.00),
(38, 61, 2, 95.00),
(38, 114, 3, 60.00),
(39, 74, 1, 105.00),
(39, 78, 1, 110.00),
(39, 80, 1, 130.00),
(41, 3, 1, 110.00),
(41, 5, 2, 110.00),
(41, 6, 2, 180.00),
(41, 30, 1, 110.00),
(42, 64, 1, 65.00),
(42, 93, 1, 100.00),
(42, 99, 1, 110.00),
(43, 1, 2, 90.00),
(43, 9, 1, 55.00),
(43, 10, 1, 150.00),
(44, 60, 1, 110.00),
(44, 61, 2, 95.00),
(44, 62, 1, 75.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados`
--

CREATE TABLE `estados` (
  `codigo` int(11) NOT NULL,
  `descripcion` varchar(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estados`
--

INSERT INTO `estados` (`codigo`, `descripcion`) VALUES
(1, 'PROCESADO'),
(2, 'ENVIADO'),
(3, 'ENTREGADO'),
(4, 'CANCELADO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `genero`
--

CREATE TABLE `genero` (
  `codigo` int(11) NOT NULL,
  `genero` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `genero`
--

INSERT INTO `genero` (`codigo`, `genero`) VALUES
(1, 'HOMBRE'),
(2, 'MUJER');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marca`
--

CREATE TABLE `marca` (
  `codigo` int(11) NOT NULL,
  `marca` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `marca`
--

INSERT INTO `marca` (`codigo`, `marca`) VALUES
(1, 'ADIDAS'),
(2, 'NIKE'),
(3, 'PUMA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mensajes`
--

CREATE TABLE `mensajes` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `asunto` varchar(100) NOT NULL,
  `mensaje` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `mensajes`
--

INSERT INTO `mensajes` (`id`, `id_usuario`, `asunto`, `mensaje`) VALUES
(3, 4624, 'PRUEBA', 'Mensaje de prueba por Pepe');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `codigo` int(11) NOT NULL,
  `persona` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `importe` decimal(8,2) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `direccion` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`codigo`, `persona`, `fecha`, `importe`, `estado`, `direccion`) VALUES
(35, 4622, '2023-05-10', 220.00, 2, 'Calle Barranquillo, Alboraya'),
(37, 1, '2023-05-17', 505.00, 3, 'Calle Río Bidasoa, 17, Valencia'),
(38, 1, '2023-05-17', 485.00, 3, 'Calle Río Bidasoa, 17, Valencia'),
(39, 1, '2023-05-17', 350.00, 4, 'Calle Río Bidasoa, 17, Valencia'),
(41, 4624, '2023-05-17', 805.00, 4, 'calle catalina'),
(42, 4624, '2023-05-17', 280.00, 1, 'calle catalina'),
(43, 4625, '2023-05-17', 390.00, 1, 'calle chanquete'),
(44, 4625, '2023-05-17', 380.00, 2, 'calle chanquete');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `codigo` int(11) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `precio` decimal(8,2) DEFAULT NULL,
  `existencias` int(11) DEFAULT NULL,
  `imagen` varchar(255) DEFAULT NULL,
  `marca` int(11) DEFAULT NULL,
  `color` varchar(128) DEFAULT NULL,
  `genero` int(11) DEFAULT NULL,
  `talla` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`codigo`, `descripcion`, `precio`, `existencias`, `imagen`, `marca`, `color`, `genero`, `talla`) VALUES
(1, 'ZAPATILLAS BUSENITZ', 90.00, 895, './images/Producto/Adidas_hombre/Zapatillas_busenitz.webp', 1, 'Crystal White', 1, 40),
(3, 'ZAPATILLA FORUM EXHIBIT LOW', 110.00, 485, './images/Producto/Adidas_hombre/Zapatillas_forum.webp', 1, 'Off White', 1, 38),
(4, 'ZAPATILLAS GALAXY 6', 60.00, 820, './images/Producto/Adidas_hombre/Zapatillas_galaxy.webp7', 1, 'Coral Red', 1, 43),
(5, 'ZAPATILLAS GAZELLE', 110.00, 802, './images/Producto/Adidas_hombre/Zapatillas_gazelle.webp', 1, 'Collegiate Green', 1, 37),
(6, 'ZAPATILLAS DE GOLF TOUR360 XT-SL 2.0 SPIKELESS', 180.00, 402, './images/Producto/Adidas_hombre/Zapatillas_golf.webp', 1, 'Core Black', 1, 43),
(7, 'ZAPATILLAS RESPONSE', 75.00, 744, './images/Producto/Adidas_hombre/Zapatillas_response.webp', 1, 'Core Black', 1, 44),
(8, 'ZAPATILLAS RETROVULC', 70.00, 559, './images/Producto/Adidas_hombre/Zapatillas_retrovulc.webp', 1, 'Core Black', 1, 38),
(9, 'ZAPATILLAS RUN 60s 2.0', 55.00, 585, './images/Producto/Adidas_hombre/Zapatillas_run.webp', 1, 'Crew Navy', 1, 45),
(10, 'ZAPATILLAS SAMBA', 150.00, 929, './images/Producto/Adidas_hombre/Zapatillas_samba.webp', 1, 'Grey One', 1, 41),
(11, 'ZAPATILLAS SEELEY XT', 70.00, 278, './images/Producto/Adidas_hombre/Zapatillas_seeley.webp', 1, 'Carbon', 1, 45),
(12, 'ZAPATILLAS STAN SMITH CREPE', 150.00, 750, './images/Producto/Adidas_hombre/Zapatillas_stan.webp', 1, 'Sand Strata', 1, 40),
(13, 'ZAPATILLAS SUPERSTAR 82', 150.00, 1102, './images/Producto/Adidas_hombre/Zapatillas_superstar_82.webp', 1, 'Cloud White', 1, 47),
(27, 'ZAPATILLAS 3MC VULC', 70.00, 568, './images/Producto/Adidas_mujer/Zapatillas_3mc.webp', 1, 'Cloud White', 2, 35),
(28, 'ZAPATILLAS AVACOURT', 150.00, 829, './images/Producto/Adidas_mujer/Zapatillas_avacourt.webp', 1, 'Lucid Blue', 2, 36),
(29, 'ZAPATILLAS FIVE TEN FREERIDER PRO', 150.00, 712, './images/Producto/Adidas_mujer/Zapatillas_five.webp', 1, 'Grey Three', 2, 38),
(30, 'ZAPATILLAS FORUM LOW', 110.00, 944, './images/Producto/Adidas_mujer/Zapatillas_forum.webp', 1, 'Charcoal Solid Grey', 2, 37),
(31, 'ZAPATILLAS GAZELLE INDOOR', 120.00, 1087, './images/Producto/Adidas_mujer/Zapatillas_gazelle.webp', 1, 'Preloved Blue', 2, 39),
(32, 'ZAPATILLAS GRAND COURT x LEGO', 80.00, 123, './images/Producto/Adidas_mujer/Zapatillas_grand_court.webp', 1, 'Cloud White', 2, 38),
(33, 'ZAPATILLAS HANDBALL SPEZIAL', 110.00, 627, './images/Producto/Adidas_mujer/Zapatillas_handball.webp', 1, 'Pulse Blue', 2, 37),
(34, 'ZAPATILLAS HOOPS 3.0', 70.00, 765, './images/Producto/Adidas_mujer/Zapatillas_hoops.webp', 1, 'Cloud White', 2, 40),
(35, 'ZAPATILLAS NIZZA PLATFORM', 80.00, 804, './images/Producto/Adidas_mujer/Zapatillas_nizza.webp', 1, 'Core Black', 2, 35),
(36, 'ZAPATILLAS NMD R1', 150.00, 835, './images/Producto/Adidas_mujer/Zapatillas_nmd.webp', 1, 'Grey Six', 2, 36),
(37, 'ZAPATILLAS SUPERSTAR', 120.00, 2021, './images/Producto/Adidas_mujer/Zapatillas_superstar.webp', 1, 'Core Black', 2, 37),
(38, 'ZAPATILLAS OWNTHEGAME', 70.00, 614, './images/Producto/Adidas_mujer/Zapatillas_ownthegame.webp', 1, 'Core Black', 2, 38),
(39, 'ZAPATILLAS OZWEEGO', 120.00, 897, './images/Producto/Adidas_mujer/Zapatillas_ozweego.webp', 1, 'Bliss', 2, 39),
(40, 'ZAPATILLAS TERREX AX4', 120.00, 735, './images/Producto/Adidas_mujer/Zapatillas_terrex.webp', 1, 'Coral Fushion', 2, 40),
(41, 'ZAPATILLAS RUNFALCON 3', 60.00, 2147, './images/Producto/Adidas_mujer/Zapatillas_runfalcon.webp', 1, 'Blue Dawn', 2, 41),
(57, 'ZAPATILLAS AIR 200E', 135.00, 1049, './images/Producto/Nike_hombre/Zapatillas_air_200.webp', 2, 'Brown Five', 1, 39),
(58, 'ZAPATILLAS AIR MONARCH IV', 60.00, 1870, './images/Producto/Nike_hombre/Zapatillas_air_monarch.webp', 2, 'Core Black', 1, 42),
(59, 'ZAPATILLAS AIRFORCE 1', 100.00, 2054, './images/Producto/Nike_hombre/Zapatillas_airforce_1.webp', 2, 'Cloud White', 1, 40),
(60, 'ZAPATILLAS AIRJORDAR 1', 110.00, 986, './images/Producto/Nike_hombre/Zapatillas_airjordan1.webp', 2, 'Cloud White', 1, 37),
(61, 'ZAPATILLAS AIRMAX ALPHA', 95.00, 463, './images/Producto/Nike_hombre/Zapatillas_airmax_alpha.webp', 2, 'Core Black', 1, 38),
(62, 'ZAPATILLAS AIRMAX PLUS', 75.00, 941, './images/Producto/Nike_hombre/Zapatillas_airmax_plus.webp', 2, 'Core Black', 1, 43),
(63, 'ZAPATILLAS BLAZER', 105.00, 1354, './images/Producto/Nike_hombre/Zapatillas_blazer.webp', 2, 'Cloud White', 1, 42),
(64, 'ZAPATILLAS COURT VISION LOW', 65.00, 546, './images/Producto/Nike_hombre/Zapatillas_court.webp', 2, 'Core Black', 1, 46),
(65, 'ZAPATILLAS DUNK LOW', 120.00, 2487, './images/Producto/Nike_hombre/Zapatillas_dunk2.webp', 2, 'Industrial Blue', 1, 40),
(66, 'ZAPATILLAS DUNK LOW', 110.00, 548, './images/Producto/Nike_hombre/Zapatillas_dunk.webp', 2, 'Photon Dust', 1, 36),
(67, 'ZAPATILLAS DUNK HIGH', 120.00, 2310, './images/Producto/Nike_hombre/Zapatillas_dunk3.webp', 2, 'Cloud White/Core Black', 1, 38),
(68, 'ZAPATILLAS INMORTALITY 2', 85.00, 1234, './images/Producto/Nike_hombre/Zapatillas_inmortality.webp', 2, 'Cloud White', 1, 38),
(69, 'ZAPATILLAS PEGASUS', 140.00, 1354, './images/Producto/Nike_hombre/Zapatillas_pegasus.webp', 2, 'Grey Light', 1, 41),
(70, 'ZAPATILLAS PRECISION 6', 75.00, 1764, './images/Producto/Nike_hombre/Zapatillas_precision.webp', 2, 'Core Black', 1, 43),
(71, 'ZAPATILLAS WAFFLE', 70.00, 871, './images/Producto/Nike_hombre/Zapatillas_waffle.webp', 2, 'Core Black', 1, 38),
(72, 'ZAPATILLAS AF1', 70.00, 1455, './images/Producto/Nike_mujer/Zapatillas_af1.webp', 2, 'Sail', 2, 36),
(73, 'ZAPATILLAS AIR FORCE 1', 110.00, 2341, './images/Producto/Nike_mujer/Zapatillas_airforce_1.webp', 2, 'Pink Oxford', 2, 35),
(74, 'ZAPATILLAS AIR JORDAN 1', 105.00, 2357, './images/Producto/Nike_mujer/Zapatillas_airjordan_1.webp', 2, 'Blue Off', 2, 39),
(75, 'ZAPATILLAS CITY TRAINER 2', 65.00, 1498, './images/Producto/Nike_mujer/Zapatillas_city.webp', 2, 'Core Black', 2, 38),
(76, 'ZAPATILLAS COURT BOROUGH LOW', 65.00, 2364, './images/Producto/Nike_mujer/Zapatillas_court.webp', 2, 'Cloud White', 2, 40),
(77, 'ZAPATILLAS DUNK LOW', 100.00, 945, './images/Producto/Nike_mujer/Zapatillas_dunk.webp', 2, 'Summit White', 2, 41),
(78, 'ZAPATILLAS DUNK LOW', 110.00, 1044, './images/Producto/Nike_mujer/Zapatillas_dunk2.webp', 2, 'Red Team', 2, 36),
(79, 'ZAPATILLAS DUNK LOW', 110.00, 1063, './images/Producto/Nike_mujer/Zapatillas_dunk3.webp', 2, 'Purple Team', 2, 38),
(80, 'ZAPATILLAS GO FLY-EASE', 130.00, 2564, './images/Producto/Nike_mujer/Zapatillas_go.webp', 2, 'Core Black', 2, 40),
(81, 'ZAPATILLAS LEGEND ESSENTIAL 3', 65.00, 1378, './images/Producto/Nike_mujer/Zapatillas_legend.webp', 2, 'Football Grey', 2, 39),
(82, 'ZAPATILLAS MC TRAINER 2', 75.00, 1498, './images/Producto/Nike_mujer/Zapatillas_mc.webp', 2, 'Phantom', 2, 36),
(83, 'ZAPATILLAS PEGASUS TRAIL 4', 150.00, 1500, './images/Producto/Nike_mujer/Zapatillas_pegasus.webp', 2, 'Football Grey', 2, 41),
(84, 'ZAPATILLAS TC 7900 PREMIUM', 120.00, 1200, './images/Producto/Nike_mujer/Zapatillas_tc.webp', 2, 'Oxygen Purple', 2, 37),
(85, 'ZAPATILLAS WAFFLE DEBUT', 75.00, 1341, './images/Producto/Nike_mujer/Zapatillas_waffle.webp', 2, 'Pearl Pink', 2, 36),
(86, 'ZAPATILLAS ZOOM FLY 5', 170.00, 1785, './images/Producto/Nike_mujer/Zapatillas_zoom.webp', 2, 'Calid Orange', 2, 38),
(87, 'ZAPATILLAS RIDER FUTURE VINTAGE', 100.00, 1235, './images/Producto/Puma_mujer/Zapatillas_rider.jpg', 3, 'Multicolor', 2, 36),
(88, 'ZAPATILLAS SLIPSTREAM ARCHIVE', 120.00, 1478, './images/Producto/Puma_mujer/Zapatillas_slipstream.jpg', 3, 'Green Tree', 2, 38),
(89, 'ZAPATILLAS ANZARUN LITE', 60.00, 2153, './images/Producto/Puma_mujer/Zapatillas_anzarun.webp', 3, 'Cloud White', 2, 35),
(90, 'ZAPATILLAS CARINA STREET', 70.00, 1125, './images/Producto/Puma_mujer/Zapatillas_carina.webp', 3, 'Cloud White', 2, 38),
(91, 'ZAPATILLAS CASSIA MIX', 75.00, 1564, './images/Producto/Puma_mujer/Zapatillas_cassia.webp', 3, 'Granola', 2, 36),
(92, 'ZAPATILLAS CILIA MODE', 65.00, 1324, './images/Producto/Puma_mujer/Zapatillas_Cilia.webp', 3, 'Cloud White', 2, 39),
(93, 'ZAPATILLAS CRUISE RIDER NU', 100.00, 1795, './images/Producto/Puma_mujer/Zapatillas_cruise.webp', 3, 'Spring Lavander', 2, 40),
(94, 'ZPATILLAS KARMEN WEDGE', 75.00, 1765, './images/Producto/Puma_mujer/Zapatillas_karmen.webp', 3, 'Elegant Brown', 2, 36),
(95, 'ZAPATILLAS KOSMO RIDER', 110.00, 1100, './images/Producto/Puma_mujer/Zapatillas_kosmo.webp', 3, 'Kosmo and Wanda', 2, 38),
(96, 'ZAPATILLAS MAYZE THRIFTED', 120.00, 1400, './images/Producto/Puma_mujer/Zapatillas_mayze.webp', 3, 'Cloud White', 2, 39),
(97, 'ZAPATILLAS MAYZE THRIFTED', 120.00, 1238, './images/Producto/Puma_mujer/Zapatillas_mayze2.webp', 3, 'Cloud White', 2, 35),
(98, 'ZAPATILLAS RIDER FUTURE VINTAGE', 100.00, 1365, './images/Producto/Puma_mujer/Zapatillas_rider.webp', 3, 'Kosmo Green and Wanda Pink', 2, 40),
(99, 'ZAPATILLAS RS-X CANDY', 110.00, 1110, './images/Producto/Puma_mujer/Zapatillas_rs.webp', 3, 'Dusty Tan', 2, 41),
(100, 'ZAPATILLAS SMASH 3.0', 600.00, 897, './images/Producto/Puma_mujer/Zapatillas_smash.webp', 3, 'Platinum Grey', 2, 38),
(101, 'ZAPATILLAS VIKKY STACKED', 65.00, 1131, './images/Producto/Puma_mujer/Zapatillas_vikky.webp', 3, 'Cloud White', 2, 41),
(102, 'ZAPATILLAS EXTENT NITRO', 130.00, 1330, './images/Producto/Puma_hombre/Zapatillas_extent.jpg', 3, 'Core Black', 1, 39),
(103, 'ZAPATILLAS RBD GAME LOW', 80.00, 1579, './images/Producto/Puma_hombre/Zapatillas_rbd.jpg', 3, 'Core Black/Cloud White', 1, 38),
(104, 'ZAPATILLAS SLIPSTREAM ARCHIVE', 120.00, 1460, './images/Producto/Puma_hombre/Zapatillas_slipstream.jpg', 3, 'Green Tree', 1, 41),
(105, 'ZAPATILLAS SUEDE CLASSIC XXI', 90.00, 901, './images/Producto/Puma_hombre/Zapatillas_suede.jpg', 3, 'Pea Coat', 1, 42),
(106, 'ZAPATILLAS ANZARUN LITE', 60.00, 1654, './images/Producto/Puma_hombre/Zapatillas_anzarun.webp', 3, 'Cloud White', 1, 38),
(107, 'ZAPATILLAS CA PRO', 95.00, 954, './images/Producto/Puma_hombre/Zapatillas_ca.webp', 3, 'Cloud White', 1, 45),
(108, 'ZAPATILLAS CLYDE BASE', 100.00, 1000, './images/Producto/Puma_hombre/Zapatillas_clyde.webp', 3, 'Core Black', 1, 42),
(109, 'ZAPATILLAS FUTURE RIDER', 95.00, 1095, './images/Producto/Puma_hombre/Zapatillas_future.webp', 3, 'Multicolor', 1, 38),
(110, 'ZAPATILLAS GRAVITON', 70.00, 758, './images/Producto/Puma_hombre/Zapatillas_graviton.webp', 3, 'Dark grey', 1, 41),
(111, 'ZAPATILLAS PUMA 180', 110.00, 1110, './images/Producto/Puma_hombre/Zapatillas_puma_180.webp', 3, 'Chocolate', 1, 42),
(112, 'ZAPATILLAS R78', 70.00, 897, './images/Producto/Puma_hombre/Zapatillas_r78.webp', 3, 'Soft Black', 1, 42),
(113, 'ZAPATILLAS RS-X', 110.00, 1119, './images/Producto/Puma_hombre/Zapatillas_rs.webp', 3, 'Cloud White/Pearl Pink', 1, 41),
(114, 'ZAPATILLAS SHUFFLE', 60.00, 642, './images/Producto/Puma_hombre/Zapatillas_shuffle.webp', 3, 'Core Black', 1, 37),
(115, 'ZAPATILLAS SUPERTEC ZERO', 65.00, 897, './images/Producto/Puma_hombre/Zapatillas_supertec.webp', 3, 'Cloud White', 1, 39),
(116, 'ZAPATILLAS X-RAY SQUARE', 85.00, 1635, './images/Producto/Puma_hombre/Zapatillas_xray.webp', 3, 'Core Black', 1, 38);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `codigo` int(11) NOT NULL,
  `activo` int(11) DEFAULT NULL,
  `admin` int(11) DEFAULT NULL,
  `usuario` varchar(32) DEFAULT NULL,
  `clave` varchar(32) DEFAULT NULL,
  `nombre` varchar(64) DEFAULT NULL,
  `telefono` char(9) DEFAULT NULL,
  `domicilio` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`codigo`, `activo`, `admin`, `usuario`, `clave`, `nombre`, `telefono`, `domicilio`) VALUES
(1, 1, 1, 'aljanue', '09052001', 'Alberto Játiva', '691491211', 'Calle Río Bidasoa, 17, Valencia'),
(4622, 1, 1, 'rpenya', '12345', 'Raúl Peña Ortiz', '666998877', 'Calle Barranquillo, Alboraya'),
(4624, 0, 0, 'pepe', 'pepe', 'pepe pepito', '444552211', 'calle catalina'),
(4625, 1, 0, 'paco', 'paco', 'paco paquito', '111223344', 'calle chanquetes');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `detalle`
--
ALTER TABLE `detalle`
  ADD PRIMARY KEY (`codigo_pedido`,`codigo_producto`),
  ADD KEY `contiene` (`codigo_producto`);

--
-- Indices de la tabla `estados`
--
ALTER TABLE `estados`
  ADD PRIMARY KEY (`codigo`);

--
-- Indices de la tabla `genero`
--
ALTER TABLE `genero`
  ADD PRIMARY KEY (`codigo`);

--
-- Indices de la tabla `marca`
--
ALTER TABLE `marca`
  ADD PRIMARY KEY (`codigo`);

--
-- Indices de la tabla `mensajes`
--
ALTER TABLE `mensajes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `pedidopor` (`persona`),
  ADD KEY `enestado` (`estado`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `marca` (`marca`),
  ADD KEY `genero` (`genero`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`codigo`),
  ADD UNIQUE KEY `usuario` (`usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `estados`
--
ALTER TABLE `estados`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `genero`
--
ALTER TABLE `genero`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `marca`
--
ALTER TABLE `marca`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `mensajes`
--
ALTER TABLE `mensajes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=139;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4626;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalle`
--
ALTER TABLE `detalle`
  ADD CONSTRAINT `contiene` FOREIGN KEY (`codigo_producto`) REFERENCES `productos` (`codigo`),
  ADD CONSTRAINT `referentea` FOREIGN KEY (`codigo_pedido`) REFERENCES `pedidos` (`codigo`);

--
-- Filtros para la tabla `mensajes`
--
ALTER TABLE `mensajes`
  ADD CONSTRAINT `mensajes_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`codigo`);

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `enestado` FOREIGN KEY (`estado`) REFERENCES `estados` (`codigo`),
  ADD CONSTRAINT `pedidopor` FOREIGN KEY (`persona`) REFERENCES `usuarios` (`codigo`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `genero` FOREIGN KEY (`genero`) REFERENCES `genero` (`codigo`),
  ADD CONSTRAINT `marca` FOREIGN KEY (`marca`) REFERENCES `marca` (`codigo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
