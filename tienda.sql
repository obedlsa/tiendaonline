-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 30-09-2018 a las 00:41:44
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

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `registrarcliente` (IN `nombre` VARCHAR(40), IN `app` VARCHAR(40), IN `apm` VARCHAR(40), IN `email` VARCHAR(50), IN `pass` VARCHAR(50))  NO SQL
INSERT INTO clientes(nombre,apellido_p,apellido_m,email,contraseña) VALUES (nombre,app,apm,email,sha1(pass))$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `id_categoria` int(11) NOT NULL,
  `nombre_categoria` varchar(35) NOT NULL,
  `descripcion` text NOT NULL,
  `imagen` varchar(60) NOT NULL,
  `activo` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalles_pedido`
--

CREATE TABLE `detalles_pedido` (
  `id_pedido` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `numero_orden` int(11) NOT NULL,
  `precio` double(9,2) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `descuento` double(9,2) DEFAULT NULL,
  `total` double(9,2) NOT NULL,
  `id_sku` int(11) NOT NULL,
  `tamaño` double(3,2) NOT NULL,
  `color` varchar(15) NOT NULL,
  `fecha_envio` date NOT NULL,
  `id_detalles_pedido` int(11) NOT NULL,
  `fecha_facturacion` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pago`
--

CREATE TABLE `pago` (
  `id_pago` int(11) NOT NULL,
  `tipo_pago` enum('Tarjeta','Efectivo','Deposito') DEFAULT NULL,
  `permitido` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `id_pedido` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `numero_pedido` int(11) NOT NULL,
  `id_pago` int(11) NOT NULL,
  `fecha_pedido` date DEFAULT NULL,
  `fecha_envio` date DEFAULT NULL,
  `fecha_requerida` date DEFAULT NULL,
  `id_remitente` int(11) NOT NULL,
  `impuesto_venta` double(9,2) NOT NULL,
  `marca_tiempo` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `estado_transaccion` tinyint(1) DEFAULT NULL,
  `mensaje_error` varchar(50) DEFAULT NULL,
  `borrado` char(3) DEFAULT NULL,
  `pagado` tinyint(1) DEFAULT NULL,
  `fecha_pago` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id_producto` int(11) NOT NULL,
  `id_sku` int(11) NOT NULL,
  `vendedor_id` int(11) NOT NULL,
  `nombre_producto` varchar(25) NOT NULL,
  `descripcion_producto` text NOT NULL,
  `id_proveedor` int(11) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `cantidad_por_unidad` int(11) NOT NULL,
  `precio_unidad` double(9,2) NOT NULL,
  `tamaño_disponible` double(3,2) NOT NULL,
  `color_disponible` varchar(15) NOT NULL,
  `tamaño` double(3,2) NOT NULL,
  `color` varchar(15) NOT NULL,
  `descuento` double(9,2) DEFAULT NULL,
  `peso_unidad` double(9,2) NOT NULL,
  `stock_unidades` int(11) NOT NULL,
  `encargo_unidades` int(11) NOT NULL,
  `producto_disponible` tinyint(1) NOT NULL,
  `descuento_disponible` tinyint(1) NOT NULL,
  `pedido_actual` varchar(25) NOT NULL,
  `imagen` varchar(50) DEFAULT NULL,
  `ranking` char(5) DEFAULT NULL,
  `notas` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `id_proveedor` int(11) NOT NULL,
  `nombre_compañia` varchar(40) NOT NULL,
  `nombre_contacto` varchar(25) NOT NULL,
  `apellido_p_contacto` varchar(25) NOT NULL,
  `apellido_m_contacto` varchar(25) DEFAULT NULL,
  `titulo_contacto` varchar(25) DEFAULT NULL,
  `direccion_1` varchar(50) NOT NULL,
  `direccion_2` varchar(50) DEFAULT NULL,
  `ciudad` varchar(30) NOT NULL,
  `estado` varchar(30) NOT NULL,
  `codigo_postal` char(5) NOT NULL,
  `pais` varchar(30) NOT NULL,
  `telefono` char(12) NOT NULL,
  `email` varchar(30) NOT NULL,
  `url` varchar(60) NOT NULL,
  `metodos_pago` enum('Efectivo','Cheque','Transferencia','\nTarjetas_credito','Tarjeta_debito') DEFAULT NULL,
  `tipo_descuento` varchar(30) DEFAULT NULL,
  `notas` varchar(50) DEFAULT NULL,
  `descuento_disponible` tinyint(1) DEFAULT NULL,
  `pedido_actual` varchar(25) DEFAULT NULL,
  `logo` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `remitente`
--

CREATE TABLE `remitente` (
  `id_remitente` int(11) NOT NULL,
  `nombre_compañia` varchar(30) NOT NULL,
  `telefono` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`cliente_id`);

--
-- Indices de la tabla `detalles_pedido`
--
ALTER TABLE `detalles_pedido`
  ADD PRIMARY KEY (`id_detalles_pedido`),
  ADD KEY `detalles_pedido` (`id_pedido`),
  ADD KEY `detalles_producto` (`id_producto`);

--
-- Indices de la tabla `pago`
--
ALTER TABLE `pago`
  ADD PRIMARY KEY (`id_pago`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id_pedido`),
  ADD KEY `pedidos_cliente` (`id_cliente`),
  ADD KEY `pedidos_pago` (`id_pago`),
  ADD KEY `pedidos_remitente` (`id_remitente`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id_producto`),
  ADD KEY `productos_categoria` (`id_categoria`),
  ADD KEY `productos_proveedor` (`id_proveedor`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`id_proveedor`);

--
-- Indices de la tabla `remitente`
--
ALTER TABLE `remitente`
  ADD PRIMARY KEY (`id_remitente`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `cliente_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de la tabla `detalles_pedido`
--
ALTER TABLE `detalles_pedido`
  MODIFY `id_pedido` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `pago`
--
ALTER TABLE `pago`
  MODIFY `id_pago` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id_pedido` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `id_proveedor` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `remitente`
--
ALTER TABLE `remitente`
  MODIFY `id_remitente` int(11) NOT NULL AUTO_INCREMENT;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalles_pedido`
--
ALTER TABLE `detalles_pedido`
  ADD CONSTRAINT `detalles_pedido` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id_pedido`),
  ADD CONSTRAINT `detalles_producto` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`);

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_clientes` FOREIGN KEY (`id_pedido`) REFERENCES `clientes` (`cliente_id`),
  ADD CONSTRAINT `pedidos_pago` FOREIGN KEY (`id_pago`) REFERENCES `pago` (`id_pago`),
  ADD CONSTRAINT `pedidos_remitente` FOREIGN KEY (`id_remitente`) REFERENCES `remitente` (`id_remitente`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`),
  ADD CONSTRAINT `productos_proveedor` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedores` (`id_proveedor`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
