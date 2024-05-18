-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-05-2024 a las 02:16:24
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
-- Base de datos: `libreriainacap`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `deudas`
--

CREATE TABLE `deudas` (
  `idDeuda` int(11) NOT NULL,
  `codigoLibroUsuario` varchar(15) NOT NULL,
  `idPrestamoLibro` int(11) NOT NULL,
  `diasRetraso` int(11) DEFAULT NULL,
  `montoDeuda` int(11) DEFAULT NULL,
  `idEstado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados`
--

CREATE TABLE `estados` (
  `idestados` int(11) NOT NULL,
  `estado` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estados`
--

INSERT INTO `estados` (`idestados`, `estado`) VALUES
(1, 'pagado'),
(2, 'atrasado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libros`
--

CREATE TABLE `libros` (
  `codigoLibro` int(11) NOT NULL,
  `codigoLibro` varchar(255) NOT NULL,
  `autor` varchar(255) DEFAULT NULL,
  `anioPublicacion` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `login`
--

CREATE TABLE `login` (
  `usuario` varchar(100) NOT NULL,
  `correo` varchar(255) NOT NULL,
  `clave` varchar(255) NOT NULL,
  `fecha` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `login`
--

INSERT INTO `login` (`usuario`, `correo`, `clave`, `fecha`) VALUES
('brandon', 'brandon.joao.c@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '2024-05-16');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestamos`
--

CREATE TABLE `prestamos` (
  `idPrestamo` int(11) NOT NULL,
  `codigoLibro` int(11) NOT NULL,
  `codigoLibroUsuario` varchar(15) NOT NULL,
  `fechaPrestamo` date NOT NULL,
  `fechaVencimiento` date NOT NULL,
  `fechaDevolucion` date DEFAULT NULL,
  `idEstado` int(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `renovaciones`
--

CREATE TABLE `renovaciones` (
  `idRenovacion` int(11) NOT NULL,
  `idPrestamo` int(11) NOT NULL,
  `fechaRenovacion` date NOT NULL,
  `fechaVencimiento` date NOT NULL,
  `idEstado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `stocklibros`
--

CREATE TABLE `stocklibros` (
  `codigoLibro` int(11) NOT NULL,
  `cantidadDisponible` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipousuarios`
--

CREATE TABLE `tipousuarios` (
  `idTipoUsuario` int(11) NOT NULL,
  `TipoUsuario` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipousuarios`
--

INSERT INTO `tipousuarios` (`idTipoUsuario`, `TipoUsuario`) VALUES
(1, 'Alumno'),
(2, 'libro');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `codigoLibro` varchar(15) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `idTipoUsuario` int(11) DEFAULT NULL,
  `Contacto` varchar(255) DEFAULT NULL,
  `correo` varchar(255) NOT NULL,
  `idEstado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `deudas`
--
ALTER TABLE `deudas`
  ADD PRIMARY KEY (`idDeuda`),
  ADD KEY `codigoLibroUsuario` (`codigoLibroUsuario`),
  ADD KEY `deuda_prestamo_fk` (`idPrestamoLibro`),
  ADD KEY `Deudas_estado_1` (`idEstado`);

--
-- Indices de la tabla `estados`
--
ALTER TABLE `estados`
  ADD PRIMARY KEY (`idestados`);

--
-- Indices de la tabla `libros`
--
ALTER TABLE `libros`
  ADD PRIMARY KEY (`codigoLibro`);

--
-- Indices de la tabla `prestamos`
--
ALTER TABLE `prestamos`
  ADD PRIMARY KEY (`idPrestamo`),
  ADD KEY `codigoLibro` (`codigoLibro`),
  ADD KEY `codigoLibroUsuario` (`codigoLibroUsuario`),
  ADD KEY `prestamos_estado_fk1` (`idEstado`);

--
-- Indices de la tabla `renovaciones`
--
ALTER TABLE `renovaciones`
  ADD PRIMARY KEY (`idRenovacion`),
  ADD KEY `idPrestamo` (`idPrestamo`),
  ADD KEY `renovacion_estado_fk` (`idEstado`);

--
-- Indices de la tabla `stocklibros`
--
ALTER TABLE `stocklibros`
  ADD PRIMARY KEY (`codigoLibro`);

--
-- Indices de la tabla `tipousuarios`
--
ALTER TABLE `tipousuarios`
  ADD PRIMARY KEY (`idTipoUsuario`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`codigoLibro`),
  ADD KEY `tiposusuairo_fk` (`idTipoUsuario`),
  ADD KEY `usaurio_estado_fk` (`idEstado`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `estados`
--
ALTER TABLE `estados`
  MODIFY `idestados` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tipousuarios`
--
ALTER TABLE `tipousuarios`
  MODIFY `idTipoUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `deudas`
--
ALTER TABLE `deudas`
  ADD CONSTRAINT `Deudas_estado_1` FOREIGN KEY (`idEstado`) REFERENCES `estados` (`idestados`),
  ADD CONSTRAINT `Deudas_ibfk_1` FOREIGN KEY (`codigoLibroUsuario`) REFERENCES `usuarios` (`codigoLibro`),
  ADD CONSTRAINT `deuda_prestamo_fk` FOREIGN KEY (`idPrestamoLibro`) REFERENCES `prestamos` (`idPrestamo`),
  ADD CONSTRAINT `deudas_Libro_fk` FOREIGN KEY (`idPrestamoLibro`) REFERENCES `libros` (`codigoLibro`);

--
-- Filtros para la tabla `prestamos`
--
ALTER TABLE `prestamos`
  ADD CONSTRAINT `Prestamos_ibfk_1` FOREIGN KEY (`codigoLibro`) REFERENCES `libros` (`codigoLibro`),
  ADD CONSTRAINT `Prestamos_ibfk_2` FOREIGN KEY (`codigoLibroUsuario`) REFERENCES `usuarios` (`codigoLibro`),
  ADD CONSTRAINT `prestamos_estado_fk1` FOREIGN KEY (`idEstado`) REFERENCES `estados` (`idestados`);

--
-- Filtros para la tabla `renovaciones`
--
ALTER TABLE `renovaciones`
  ADD CONSTRAINT `Renovaciones_ibfk_1` FOREIGN KEY (`idPrestamo`) REFERENCES `prestamos` (`idPrestamo`),
  ADD CONSTRAINT `renovacion_estado_fk` FOREIGN KEY (`idEstado`) REFERENCES `estados` (`idestados`);

--
-- Filtros para la tabla `stocklibros`
--
ALTER TABLE `stocklibros`
  ADD CONSTRAINT `StockLibros_ibfk_1` FOREIGN KEY (`codigoLibro`) REFERENCES `libros` (`codigoLibro`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `tiposusuairo_fk` FOREIGN KEY (`idTipoUsuario`) REFERENCES `tipousuarios` (`idTipoUsuario`),
  ADD CONSTRAINT `usaurio_estado_fk` FOREIGN KEY (`idEstado`) REFERENCES `estados` (`idestados`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
