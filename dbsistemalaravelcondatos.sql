-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-12-2018 a las 19:33:40
-- Versión del servidor: 10.1.26-MariaDB
-- Versión de PHP: 7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `dbsistemalaravel`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articulos`
--

CREATE TABLE `articulos` (
  `id` int(10) UNSIGNED NOT NULL,
  `idcategoria` int(10) UNSIGNED NOT NULL,
  `codigo` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nombre` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `precio_venta` decimal(11,2) NOT NULL,
  `stock` int(11) NOT NULL,
  `descripcion` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `condicion` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `articulos`
--

INSERT INTO `articulos` (`id`, `idcategoria`, `codigo`, `nombre`, `precio_venta`, `stock`, `descripcion`, `condicion`, `created_at`, `updated_at`) VALUES
(1, 6, '014785239', 'Jabón de tocador', '10.50', 100, NULL, 1, NULL, NULL),
(2, 5, '36985214', 'Gaseosa Pepsi 1.5 LT', '2.00', 100, NULL, 1, '2018-02-23 23:18:00', '2018-02-23 23:18:00'),
(5, 8, '0123644', 'Carne de pollo', '5.00', 88, 'carnes de pollo y gallina', 1, '2018-02-23 23:18:57', '2018-02-24 01:57:22'),
(6, 5, '145236982', 'Gaseosa Inka Kola 2LT', '5.00', 81, 'Gaseosa inka kola 2 litros', 1, '2018-02-23 23:26:52', '2018-02-27 03:52:14'),
(7, 5, '11223344', 'Gaseosa Pepsi 600 ml', '3.00', 837, NULL, 1, '2018-02-24 11:09:45', '2018-02-27 03:54:04'),
(8, 5, '111222333', 'Gaseosa CocaCola 1LT', '5.00', 938, 'Gaseosa CocaCola', 1, '2018-02-24 11:22:05', '2018-02-24 11:33:16'),
(9, 3, '8717868005604', 'Leche evaporada gloria 400g', '4.00', 1705, 'Leche evaporada gloria tarro azul', 1, '2018-02-27 04:00:37', '2018-02-27 04:01:41');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `condicion` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `nombre`, `descripcion`, `condicion`, `created_at`, `updated_at`) VALUES
(1, 'Embutidos', 'Todo tipo de carnes rojas', 1, NULL, '2018-02-08 21:47:34'),
(2, 'Cereales', 'Todos los cereales', 0, NULL, '2018-02-08 21:37:55'),
(3, 'Lácteos', 'productos derivados de la leche', 1, '2018-02-08 06:45:53', '2018-02-08 06:45:53'),
(4, 'Menestras', 'todas las menestras', 1, '2018-02-08 06:53:41', '2018-02-08 06:53:41'),
(5, 'Bebidas', 'todas las bebidas', 1, '2018-02-08 06:54:04', '2018-02-08 06:54:04'),
(6, 'Artículos de Limpieza', 'Todos los artículos de limpieza', 1, '2018-02-08 07:36:55', '2018-02-08 20:04:48'),
(7, 'Carnes', 'Todas las carnes', 1, '2018-02-08 07:37:29', '2018-02-08 07:37:29'),
(8, 'Carnes blancas', 'todas las carnes blancas', 1, '2018-02-21 04:48:28', '2018-02-21 04:58:47'),
(9, 'Carnes cocidas', 'todas las carnes cocidas', 1, '2018-02-21 04:51:02', '2018-02-21 04:58:38'),
(10, 'Carnes procesadas', 'todas las carnes procesadas', 1, '2018-02-21 04:57:45', '2018-02-21 04:59:01'),
(11, 'Carnes de pescado', 'Todos los pescados', 1, '2018-02-21 05:00:05', '2018-02-21 05:00:05'),
(12, 'útiles escolares', 'Todos los artículos escolares', 0, '2018-02-21 10:22:46', '2018-02-21 10:22:57'),
(13, 'Muebles de oficina', 'todos los muebles de oficina pequeños', 1, '2018-02-21 22:07:00', '2018-02-21 22:08:01'),
(14, 'Libros', 'Todos los libros y revistas', 1, '2018-06-20 22:25:28', '2018-06-20 22:25:55');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_ingresos`
--

CREATE TABLE `detalle_ingresos` (
  `id` int(10) UNSIGNED NOT NULL,
  `idingreso` int(10) UNSIGNED NOT NULL,
  `idarticulo` int(10) UNSIGNED NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio` decimal(11,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `detalle_ingresos`
--

INSERT INTO `detalle_ingresos` (`id`, `idingreso`, `idarticulo`, `cantidad`, `precio`) VALUES
(6, 4, 9, 50, '3.00'),
(7, 4, 8, 70, '4.00'),
(8, 5, 9, 50, '4.00'),
(9, 5, 8, 30, '3.00'),
(10, 6, 7, 100, '3.00'),
(11, 6, 9, 50, '4.00'),
(12, 7, 9, 100, '4.00'),
(13, 7, 8, 150, '3.00'),
(14, 7, 7, 200, '3.00'),
(15, 8, 9, 50, '4.00'),
(16, 8, 8, 50, '3.00'),
(17, 8, 7, 50, '3.00'),
(18, 9, 9, 10, '4.00'),
(19, 9, 8, 10, '3.00'),
(20, 10, 9, 10, '4.00'),
(21, 10, 8, 10, '3.00'),
(22, 10, 7, 10, '3.00'),
(23, 11, 9, 10, '4.00'),
(24, 11, 8, 10, '3.00'),
(25, 12, 9, 10, '4.00'),
(26, 12, 8, 10, '3.00'),
(31, 15, 9, 10, '4.00'),
(32, 15, 8, 10, '3.00'),
(33, 16, 9, 10, '4.00'),
(34, 16, 8, 10, '3.00'),
(35, 17, 9, 100, '4.00'),
(36, 17, 8, 100, '3.00'),
(37, 18, 9, 50, '4.00'),
(38, 19, 9, 10, '4.00'),
(39, 19, 8, 10, '3.00'),
(40, 20, 9, 200, '4.00'),
(41, 20, 8, 200, '3.00'),
(42, 21, 9, 500, '4.00'),
(43, 21, 7, 500, '3.00'),
(46, 23, 9, 120, '4.00'),
(47, 23, 8, 120, '6.00');

--
-- Disparadores `detalle_ingresos`
--
DELIMITER $$
CREATE TRIGGER `tr_updStockIngreso` AFTER INSERT ON `detalle_ingresos` FOR EACH ROW BEGIN
 UPDATE articulos SET stock = stock + NEW.cantidad 
 WHERE articulos.id = NEW.idarticulo;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_ventas`
--

CREATE TABLE `detalle_ventas` (
  `id` int(10) UNSIGNED NOT NULL,
  `idventa` int(10) UNSIGNED NOT NULL,
  `idarticulo` int(10) UNSIGNED NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio` decimal(11,2) NOT NULL,
  `descuento` decimal(11,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `detalle_ventas`
--

INSERT INTO `detalle_ventas` (`id`, `idventa`, `idarticulo`, `cantidad`, `precio`, `descuento`) VALUES
(1, 1, 7, 25, '4.00', '0.00'),
(2, 2, 9, 5, '4.00', '1.00'),
(3, 2, 7, 4, '3.00', '0.00'),
(4, 3, 9, 50, '4.00', '10.00'),
(5, 3, 8, 70, '5.00', '0.00'),
(6, 4, 9, 10, '4.00', '0.00'),
(7, 4, 8, 10, '5.00', '0.00'),
(8, 5, 9, 10, '4.00', '0.00'),
(9, 5, 8, 10, '5.00', '0.00'),
(10, 5, 7, 10, '3.00', '1.00'),
(11, 5, 6, 10, '5.00', '0.00'),
(12, 5, 5, 10, '5.00', '0.00'),
(13, 6, 9, 10, '4.00', '0.00'),
(14, 6, 8, 5, '5.00', '0.00'),
(15, 6, 7, 7, '3.00', '0.00'),
(16, 6, 6, 8, '5.00', '0.00'),
(17, 7, 9, 1, '4.00', '0.00'),
(18, 7, 8, 1, '5.00', '0.00'),
(19, 7, 7, 1, '3.00', '0.00'),
(20, 7, 6, 1, '5.00', '0.00'),
(21, 8, 9, 10, '4.00', '0.00'),
(22, 8, 8, 5, '5.00', '0.00'),
(23, 8, 7, 4, '3.00', '0.00'),
(24, 9, 9, 1, '4.00', '0.00'),
(25, 10, 9, 2, '4.00', '0.00'),
(26, 10, 5, 2, '5.00', '0.00'),
(27, 11, 9, 1, '4.00', '0.00'),
(28, 11, 8, 1, '5.00', '0.00'),
(29, 11, 7, 1, '3.00', '0.00');

--
-- Disparadores `detalle_ventas`
--
DELIMITER $$
CREATE TRIGGER `tr_updStockVenta` AFTER INSERT ON `detalle_ventas` FOR EACH ROW BEGIN
 UPDATE articulos SET stock = stock - NEW.cantidad 
 WHERE articulos.id = NEW.idarticulo;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingresos`
--

CREATE TABLE `ingresos` (
  `id` int(10) UNSIGNED NOT NULL,
  `idproveedor` int(10) UNSIGNED NOT NULL,
  `idusuario` int(10) UNSIGNED NOT NULL,
  `tipo_comprobante` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `serie_comprobante` varchar(7) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `num_comprobante` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_hora` date NOT NULL,
  `impuesto` decimal(4,2) NOT NULL,
  `total` decimal(11,2) NOT NULL,
  `estado` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `ingresos`
--

INSERT INTO `ingresos` (`id`, `idproveedor`, `idusuario`, `tipo_comprobante`, `serie_comprobante`, `num_comprobante`, `fecha_hora`, `impuesto`, `total`, `estado`, `created_at`, `updated_at`) VALUES
(4, 3, 10, 'BOLETA', '001', '0001', '2018-04-15', '0.18', '430.00', 'Anulado', '2018-04-15 11:04:46', '2018-04-20 08:16:15'),
(5, 4, 10, 'BOLETA', '0001', '00002', '2018-04-19', '0.18', '290.00', 'Anulado', '2018-04-20 08:27:31', '2018-04-20 08:28:22'),
(6, 4, 10, 'FACTURA', '001', '0003', '2018-04-20', '0.18', '500.00', 'Anulado', '2018-04-21 09:28:05', '2018-04-21 09:28:50'),
(7, 3, 10, 'BOLETA', '001', '0005', '2018-05-06', '0.18', '1450.00', 'Registrado', '2018-05-07 01:53:42', '2018-05-07 01:53:42'),
(8, 4, 10, 'FACTURA', '001', '0005', '2018-05-06', '0.18', '500.00', 'Registrado', '2018-05-07 01:54:26', '2018-05-07 01:54:26'),
(9, 3, 8, 'BOLETA', '001', '0008', '2018-05-20', '0.18', '70.00', 'Registrado', '2018-05-20 21:17:18', '2018-05-20 21:17:18'),
(10, 4, 8, 'BOLETA', '0001', '00005', '2018-05-27', '0.18', '100.00', 'Registrado', '2018-05-27 13:37:24', '2018-05-27 13:37:24'),
(11, 4, 8, 'BOLETA', '0001', '00015', '2018-05-27', '0.18', '70.00', 'Registrado', '2018-05-28 00:41:41', '2018-05-28 00:41:41'),
(12, 4, 8, 'BOLETA', '0001', '00087', '2018-05-27', '0.18', '70.00', 'Registrado', '2018-05-28 00:52:42', '2018-05-28 00:52:42'),
(15, 4, 8, 'BOLETA', '0001', '0009', '2018-05-29', '0.18', '70.00', 'Registrado', '2018-05-30 01:30:43', '2018-05-30 01:30:43'),
(16, 4, 8, 'BOLETA', '0001', '0009', '2018-05-29', '0.18', '70.00', 'Registrado', '2018-05-30 01:30:48', '2018-05-30 01:30:48'),
(17, 4, 8, 'BOLETA', '001', '00015', '2018-06-02', '0.18', '700.00', 'Registrado', '2018-06-02 05:02:27', '2018-06-02 05:02:27'),
(18, 4, 8, 'BOLETA', '001', '00016', '2018-06-02', '0.18', '200.00', 'Registrado', '2018-06-02 05:03:14', '2018-06-02 05:03:14'),
(19, 4, 8, 'BOLETA', '0001', '00018', '2018-06-02', '0.18', '70.00', 'Registrado', '2018-06-02 05:44:38', '2018-06-02 05:44:38'),
(20, 3, 8, 'BOLETA', '001', '00015', '2018-06-21', '0.18', '1400.00', 'Registrado', '2018-06-21 14:53:16', '2018-06-21 14:53:16'),
(21, 3, 8, 'BOLETA', '001', '00016', '2018-06-22', '0.18', '3500.00', 'Registrado', '2018-06-22 20:12:20', '2018-06-22 20:12:20'),
(23, 3, 8, 'FACTURA', '0001', '000015', '2018-12-21', '0.18', '1200.00', 'Registrado', '2018-12-21 20:15:58', '2018-12-21 20:15:58');

--
-- Disparadores `ingresos`
--
DELIMITER $$
CREATE TRIGGER `tr_updStockIngresoAnular` AFTER UPDATE ON `ingresos` FOR EACH ROW BEGIN
  UPDATE articulos a
    JOIN detalle_ingresos di
      ON di.idarticulo = a.id
     AND di.idingreso = new.id
     set a.stock = a.stock - di.cantidad;
end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2018_02_01_171225_create_categorias_table', 1),
(4, '2018_02_21_151949_create_articulos_table', 2),
(5, '2018_02_22_235257_create_articulos_table', 3),
(6, '2018_02_27_143638_create_personas_table', 4),
(7, '2018_03_06_024616_create_proveedores_table', 5),
(8, '2018_03_13_133425_create_roles_table', 6),
(9, '2018_03_14_000000_create_users_table', 7),
(10, '2018_04_08_140106_create_ingresos_table', 8),
(11, '2018_04_08_140532_create_detalle_ingresos_table', 8),
(12, '2018_04_22_212328_create_ventas_table', 9),
(13, '2018_04_22_212558_create_detalle_ventas_table', 9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personas`
--

CREATE TABLE `personas` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo_documento` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `num_documento` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `direccion` varchar(70) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telefono` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `personas`
--

INSERT INTO `personas` (`id`, `nombre`, `tipo_documento`, `num_documento`, `direccion`, `telefono`, `email`, `created_at`, `updated_at`) VALUES
(1, 'Luis Arcila', 'DNI', '96325417', 'Josée Gálvez 1368 - Chongoyape', '931742905', 'luis.pad7@gmail.com', NULL, NULL),
(2, 'Leo Perez Dávila', 'DNI', '63214589', 'Zarumilla 113 - Salaverry', '963123523', 'leoperez@gmail.com', '2018-03-06 07:39:33', '2018-03-06 07:40:06'),
(3, 'Inversiones Leon SAC', 'RUC', '20154878961', 'AV. Lambayeque 150', '963254123', 'inversionesleon@gmail.com', NULL, NULL),
(4, 'Transportes MICASA SAA', 'RUC', '20145236982', 'Av. Atahualpa 122', '074562582', 'transportesmicasa@gmail.com', '2018-03-06 09:44:44', '2018-03-06 09:45:18'),
(8, 'Juan Carlos Arcila Diaz', 'DNI', '47715777', 'Zarumilla 113 - Chiclayo', '931742904', 'jcarlos.ad7@gmail.com', '2018-03-13 21:39:10', '2018-03-13 21:39:10'),
(9, 'Vendedor', 'DNI', '12345679', 'Capac 123 - Lambayeque', '963258741', 'vendedor@incanatoit.com', '2018-03-21 23:58:35', '2018-12-23 18:29:27'),
(10, 'Almacenero', 'DNI', '96325874', 'Los treboles 123 - Los parques', '963258741', 'almacenero@incanatoit.com', '2018-03-22 00:05:48', '2018-12-23 18:25:50'),
(14, 'Administrador', 'DNI', '87654321', 'Tupac 123 - Lambayeque', '936825714', 'administrador@incanatoit.com', '2018-12-23 18:32:47', '2018-12-23 18:32:47');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `id` int(10) UNSIGNED NOT NULL,
  `contacto` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telefono_contacto` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`id`, `contacto`, `telefono_contacto`) VALUES
(3, 'Roberto Leon ', '98745632'),
(4, 'Rodolfo Gutierrez', '965874152');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `condicion` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `nombre`, `descripcion`, `condicion`) VALUES
(1, 'Administrador', 'Administradores de área', 1),
(2, 'Vendedor', 'Vendedor área venta', 1),
(3, 'Almacenero', 'Almacenero área compras', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `usuario` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `condicion` tinyint(1) NOT NULL DEFAULT '1',
  `idrol` int(10) UNSIGNED NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `usuario`, `password`, `condicion`, `idrol`, `remember_token`) VALUES
(14, 'admin', '$2y$10$npigKfWYb/K.O0dZSatQOeObd4nx7ZbTprISUnqHiaI/QX27NLBFm', 1, 1, NULL),
(10, 'almacenero', '$2y$10$u/1r8nXmf1oGVol21yzFlu5Mof7tR6xFTrE7aYsD26cYwxrPJfpAy', 1, 3, 'd9PD31agq1M3lsQ3CEybYYn5jGX2cAFl6H5YrkcoWJ23WUgEFfIiWTkh8Pc1'),
(8, 'jcarlosad7', '$2y$10$Yt1HHnF.zHONEx9ayMimCO0Tu9jUcielbsBFItHXTFL4kDSu4U.0i', 1, 1, 'QF8ZwCTFHd6HCHkgf7XKqItRUOunEBtP9hvUYuKK4DWpqxgiIUuaeBcT9sHb'),
(9, 'vendedor', '$2y$10$jZw3Eakc3kSKIyakefnW9.mpfkv0225Q5.ry7rXjM694a275Y94cu', 1, 2, '006r0AOU5RN4fgyvtgogoeL0pESBA8wvI5beJvNMkFuADJORL7qwpkjHbR55');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `id` int(10) UNSIGNED NOT NULL,
  `idcliente` int(10) UNSIGNED NOT NULL,
  `idusuario` int(10) UNSIGNED NOT NULL,
  `tipo_comprobante` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `serie_comprobante` varchar(7) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `num_comprobante` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_hora` date NOT NULL,
  `impuesto` decimal(4,2) NOT NULL,
  `total` decimal(11,2) NOT NULL,
  `estado` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`id`, `idcliente`, `idusuario`, `tipo_comprobante`, `serie_comprobante`, `num_comprobante`, `fecha_hora`, `impuesto`, `total`, `estado`, `created_at`, `updated_at`) VALUES
(1, 1, 9, 'BOLETA', '001', '0001', '2018-04-22', '0.18', '100.00', 'Anulado', NULL, '2018-04-27 10:07:54'),
(2, 10, 9, 'BOLETA', '0001', '00002', '2018-04-26', '0.18', '31.00', 'Registrado', '2018-04-27 09:43:01', '2018-04-27 09:43:01'),
(3, 1, 9, 'BOLETA', '001', '00003', '2018-04-26', '0.18', '540.00', 'Anulado', '2018-04-27 09:47:38', '2018-04-27 10:14:20'),
(4, 9, 9, 'BOLETA', '0001', '00007', '2018-04-27', '0.18', '90.00', 'Anulado', '2018-04-27 10:19:48', '2018-04-27 10:20:37'),
(5, 1, 9, 'BOLETA', '001', '0008', '2018-05-04', '0.18', '219.00', 'Registrado', '2018-05-05 02:56:46', '2018-05-05 02:56:46'),
(6, 1, 9, 'BOLETA', '0001', '00008', '2018-05-04', '0.18', '126.00', 'Registrado', '2018-05-05 03:00:53', '2018-05-05 03:00:53'),
(7, 1, 9, 'BOLETA', '0001', '0009', '2018-05-04', '0.18', '17.00', 'Registrado', '2018-05-05 03:02:37', '2018-05-05 03:02:37'),
(8, 10, 9, 'BOLETA', '0001', '0010', '2018-05-06', '0.18', '77.00', 'Registrado', '2018-05-06 05:09:03', '2018-05-06 05:09:03'),
(9, 1, 9, 'BOLETA', '001', '45', '2018-06-02', '0.18', '4.00', 'Registrado', '2018-06-02 05:50:28', '2018-06-02 05:50:28'),
(10, 10, 8, 'BOLETA', '001', '00001', '2018-12-21', '0.18', '18.00', 'Registrado', '2018-12-21 17:00:48', '2018-12-21 17:00:48'),
(11, 10, 8, 'TICKET', '00001', '000015', '2018-12-21', '0.18', '12.00', 'Registrado', '2018-12-21 18:32:35', '2018-12-21 18:32:35');

--
-- Disparadores `ventas`
--
DELIMITER $$
CREATE TRIGGER `tr_updStockVentaAnular` AFTER UPDATE ON `ventas` FOR EACH ROW BEGIN
  UPDATE articulos a
    JOIN detalle_ventas dv
      ON dv.idarticulo = a.id
     AND dv.idventa= new.id
     set a.stock = a.stock + dv.cantidad;
end
$$
DELIMITER ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `articulos`
--
ALTER TABLE `articulos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `articulos_nombre_unique` (`nombre`),
  ADD KEY `articulos_idcategoria_foreign` (`idcategoria`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `detalle_ingresos`
--
ALTER TABLE `detalle_ingresos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `detalle_ingresos_idingreso_foreign` (`idingreso`),
  ADD KEY `detalle_ingresos_idarticulo_foreign` (`idarticulo`);

--
-- Indices de la tabla `detalle_ventas`
--
ALTER TABLE `detalle_ventas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `detalle_ventas_idventa_foreign` (`idventa`),
  ADD KEY `detalle_ventas_idarticulo_foreign` (`idarticulo`);

--
-- Indices de la tabla `ingresos`
--
ALTER TABLE `ingresos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ingresos_idproveedor_foreign` (`idproveedor`),
  ADD KEY `ingresos_idusuario_foreign` (`idusuario`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indices de la tabla `personas`
--
ALTER TABLE `personas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personas_nombre_unique` (`nombre`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD KEY `proveedores_id_foreign` (`id`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_nombre_unique` (`nombre`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD UNIQUE KEY `users_usuario_unique` (`usuario`),
  ADD KEY `users_id_foreign` (`id`),
  ADD KEY `users_idrol_foreign` (`idrol`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ventas_idcliente_foreign` (`idcliente`),
  ADD KEY `ventas_idusuario_foreign` (`idusuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `articulos`
--
ALTER TABLE `articulos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `detalle_ingresos`
--
ALTER TABLE `detalle_ingresos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT de la tabla `detalle_ventas`
--
ALTER TABLE `detalle_ventas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT de la tabla `ingresos`
--
ALTER TABLE `ingresos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `personas`
--
ALTER TABLE `personas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `articulos`
--
ALTER TABLE `articulos`
  ADD CONSTRAINT `articulos_idcategoria_foreign` FOREIGN KEY (`idcategoria`) REFERENCES `categorias` (`id`);

--
-- Filtros para la tabla `detalle_ingresos`
--
ALTER TABLE `detalle_ingresos`
  ADD CONSTRAINT `detalle_ingresos_idarticulo_foreign` FOREIGN KEY (`idarticulo`) REFERENCES `articulos` (`id`),
  ADD CONSTRAINT `detalle_ingresos_idingreso_foreign` FOREIGN KEY (`idingreso`) REFERENCES `ingresos` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `detalle_ventas`
--
ALTER TABLE `detalle_ventas`
  ADD CONSTRAINT `detalle_ventas_idarticulo_foreign` FOREIGN KEY (`idarticulo`) REFERENCES `articulos` (`id`),
  ADD CONSTRAINT `detalle_ventas_idventa_foreign` FOREIGN KEY (`idventa`) REFERENCES `ventas` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `ingresos`
--
ALTER TABLE `ingresos`
  ADD CONSTRAINT `ingresos_idproveedor_foreign` FOREIGN KEY (`idproveedor`) REFERENCES `proveedores` (`id`),
  ADD CONSTRAINT `ingresos_idusuario_foreign` FOREIGN KEY (`idusuario`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD CONSTRAINT `proveedores_id_foreign` FOREIGN KEY (`id`) REFERENCES `personas` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_id_foreign` FOREIGN KEY (`id`) REFERENCES `personas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `users_idrol_foreign` FOREIGN KEY (`idrol`) REFERENCES `roles` (`id`);

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `ventas_idcliente_foreign` FOREIGN KEY (`idcliente`) REFERENCES `personas` (`id`),
  ADD CONSTRAINT `ventas_idusuario_foreign` FOREIGN KEY (`idusuario`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
