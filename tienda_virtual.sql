-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-05-2025 a las 21:35:12
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tienda_virtual`
--

CREATE DATABASE IF NOT EXISTS tienda_virtual;
USE tienda_virtual;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `apellidos` varchar(100) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `genero` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `nombre`, `apellidos`, `correo`, `fecha_nacimiento`, `genero`) VALUES
(1, 'Antonio', 'Villalba', 'antonioV@gmail.com', '2006-01-05', 'masculino'),
(2, 'usuario', 'usuario', 'usuario@gmail.com', '2025-05-01', 'masculino'),
(3, 'prueba', 'registro', 'pruebaregistro@gmail.com', '2025-05-01', 'otro'),
(4, 'c', 'c', 'c@gmail.com', '2025-05-01', 'masculino'),
(5, 'D', 'D', 'D@gmail.com', '2025-05-01', 'masculino');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

CREATE TABLE `compras` (
  `id` int(11) NOT NULL,
  `usuario` varchar(50) DEFAULT NULL,
  `referencia_producto` int(11) DEFAULT NULL,
  `fecha_compra` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `compras`
--

INSERT INTO `compras` (`id`, `usuario`, `referencia_producto`, `fecha_compra`) VALUES
(1, 'Antonio', 4, '2025-05-18 19:44:19'),
(2, 'usuario', 3, '2025-05-18 19:48:38'),
(3, 'D', 4, '2025-05-18 20:34:15'),
(4, 'D', 1, '2025-05-18 21:06:22');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `referencia` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`referencia`, `nombre`, `precio`) VALUES
(1, 'The Legend of Zelda: Breath of the Wild', 59.99),
(2, 'God of War Ragnarok', 69.99),
(3, 'Cyberpunk 2077', 49.99),
(4, 'Minecraft', 26.95),
(5, 'FIFA 23', 59.99),
(6, 'Call of Duty: Modern Warfare II', 69.99),
(7, 'Elden Ring', 59.99),
(8, 'Super Mario Odyssey', 59.99),
(9, 'Resident Evil Village', 39.99),
(10, 'Hollow Knight', 14.99);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `usuario` varchar(50) NOT NULL,
  `contraseña` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`usuario`, `contraseña`) VALUES
('Antonio', '$2y$10$AhQpj7x7pkuGWGKa5/JUfOPeBuM/SyuR5UZKt2wmDX0OhxyycWDj.'),
('C', '$2y$10$SHPjaaUHhnLYrX9gLj8/9.4f3DD.YS3EtG/eTOehsR/tow7TaqBGS'),
('D', '$2y$10$ndSqzCe.0wrq2pVjx6evpenuwuo6EdYGAUj/72sTJsmYXIVrIAjiq'),
('Pruebaregistro', '$2y$10$Y2gk1jN3hX.t77NCPZF9k..cj6T3ORUd4EJNHvig8gGyOVBoEL3XC'),
('usuario', '$2y$10$cYBYrUvdlmKaBkVVqi0f2OcWKzve.Epx6fI6D6F585R66U2/lIxWO');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario` (`usuario`),
  ADD KEY `referencia_producto` (`referencia_producto`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`referencia`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `compras`
--
ALTER TABLE `compras`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `compras`
--
ALTER TABLE `compras`
  ADD CONSTRAINT `compras_ibfk_1` FOREIGN KEY (`usuario`) REFERENCES `usuarios` (`usuario`),
  ADD CONSTRAINT `compras_ibfk_2` FOREIGN KEY (`referencia_producto`) REFERENCES `productos` (`referencia`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

