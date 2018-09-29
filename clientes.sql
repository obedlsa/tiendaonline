-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 30-09-2018 a las 00:36:56
-- Versión del servidor: 10.1.26-MariaDB
-- Versión de PHP: 7.1.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tienda`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `cliente_id` int(11) NOT NULL,
  `nombre` varchar(25) NOT NULL,
  `apellido_p` varchar(25) NOT NULL,
  `apellido_m` varchar(25) NOT NULL,
  `direccion_1` varchar(50) DEFAULT NULL,
  `direccion_2` varchar(50) DEFAULT NULL,
  `ciudad` varchar(25) DEFAULT NULL,
  `estado` varchar(30) DEFAULT NULL,
  `codigo_postal` char(5) DEFAULT NULL,
  `pais` varchar(25) DEFAULT NULL,
  `telefono` char(12) DEFAULT NULL,
  `email` varchar(30) NOT NULL,
  `contraseña` varchar(100) NOT NULL,
  `tarjeta_credito` int(16) DEFAULT NULL,
  `tipo_tarjeta_credito` enum('Credito','Debito') DEFAULT NULL,
  `tarjeta_mes_expiracion` char(2) DEFAULT NULL,
  `tarjeta_año_expiracion` year(4) DEFAULT NULL,
  `direccion_facturacion` varchar(50) DEFAULT NULL,
  `ciudad_facturacion` varchar(25) DEFAULT NULL,
  `region_facturacion` varchar(25) DEFAULT NULL,
  `codigo_postal_facturacion` char(5) DEFAULT NULL,
  `pais_facturacion` varchar(25) DEFAULT NULL,
  `direccion_envio` varchar(50) DEFAULT NULL,
  `ciudad_envio` varchar(25) DEFAULT NULL,
  `region_envio` varchar(25) DEFAULT NULL,
  `codigo_postal_envio` char(5) DEFAULT NULL,
  `pais_envio` varchar(25) DEFAULT NULL,
  `fecha_ingresada` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`cliente_id`, `nombre`, `apellido_p`, `apellido_m`, `direccion_1`, `direccion_2`, `ciudad`, `estado`, `codigo_postal`, `pais`, `telefono`, `email`, `contraseña`, `tarjeta_credito`, `tipo_tarjeta_credito`, `tarjeta_mes_expiracion`, `tarjeta_año_expiracion`, `direccion_facturacion`, `ciudad_facturacion`, `region_facturacion`, `codigo_postal_facturacion`, `pais_facturacion`, `direccion_envio`, `ciudad_envio`, `region_envio`, `codigo_postal_envio`, `pais_envio`, `fecha_ingresada`) VALUES
(1, 'obed', 'alvarado', 'garcia', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'obed@obed.com', '711383a59fda05336fd2ccf70c8059d1523eb41a', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 'mark', 'perez', 'sss', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pedro@pedro.com', 'da39a3ee5e6b4b0d3255bfef95601890afd80709', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, 'lalo', 'dd', 'dd', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ww@ss.com', 'da39a3ee5e6b4b0d3255bfef95601890afd80709', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(7, 'marco', 'antonio', 'perez', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'marco@marco.com', 'da39a3ee5e6b4b0d3255bfef95601890afd80709', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, 'Benito', 'Sanchez', 'Raya', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'benito@beny.com', 'da39a3ee5e6b4b0d3255bfef95601890afd80709', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`cliente_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `cliente_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
