-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-05-2024 a las 23:27:28
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

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
`RUTUsuario` varchar(15) DEFAULT NULL,
`tituloLibro` varchar(255) DEFAULT NULL,
`diasRetraso` int(11) DEFAULT NULL,
`montoDeuda` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historialprestamos`
--

CREATE TABLE `historialprestamos` (
`idHistorial` int(11) NOT NULL,
`RUTUsuario` varchar(15) DEFAULT NULL,
`codigoLibro` int(11) DEFAULT NULL,
`fechaPrestamo` date DEFAULT NULL,
`fechaDevolucion` date DEFAULT NULL,
`estadoPrestamo` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libros`
--

CREATE TABLE `libros` (
`codigoLibro` int(11) NOT NULL,
`titulo` varchar(255) DEFAULT NULL,
`autor` varchar(255) DEFAULT NULL,
`anioPublicacion` int(11) DEFAULT NULL,
`estado` varchar(50) DEFAULT NULL
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
-- Estructura de tabla para la tabla `multas`
--

CREATE TABLE `multas` (
`idMulta` int(11) NOT NULL,
`RUTUsuario` varchar(15) DEFAULT NULL,
`fechaGeneracion` date DEFAULT NULL,
`monto` int(11) DEFAULT NULL,
`estadoMulta` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestamos`
--

CREATE TABLE `prestamos` (
`idPrestamo` int(11) NOT NULL,
`codigoLibro` int(11) DEFAULT NULL,
`RUTUsuario` varchar(15) DEFAULT NULL,
`fechaPrestamo` date DEFAULT NULL,
`fechaDevolucion` date DEFAULT NULL,
`estadoPrestamo` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `renovaciones`
--

CREATE TABLE `renovaciones` (
`idRenovacion` int(11) NOT NULL,
`idPrestamo` int(11) DEFAULT NULL,
`fechaRenovacion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `stocklibros`
--

CREATE TABLE `stocklibros` (
`codigoLibro` int(11) NOT NULL,
`cantidadDisponible` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
`RUT` varchar(15) NOT NULL,
`nombre` varchar(255) DEFAULT NULL,
`tipoUsuario` varchar(50) DEFAULT NULL,
`Contacto` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `deudas`
--
ALTER TABLE `deudas`
ADD PRIMARY KEY (`idDeuda`),
ADD KEY `RUTUsuario` (`RUTUsuario`);

--
-- Indices de la tabla `historialprestamos`
--
ALTER TABLE `historialprestamos`
ADD PRIMARY KEY (`idHistorial`),
ADD KEY `RUTUsuario` (`RUTUsuario`),
ADD KEY `codigoLibro` (`codigoLibro`);

--
-- Indices de la tabla `libros`
--
ALTER TABLE `libros`
ADD PRIMARY KEY (`codigoLibro`);

--
-- Indices de la tabla `multas`
--
ALTER TABLE `multas`
ADD PRIMARY KEY (`idMulta`),
ADD KEY `RUTUsuario` (`RUTUsuario`);

--
-- Indices de la tabla `prestamos`
--
ALTER TABLE `prestamos`
ADD PRIMARY KEY (`idPrestamo`),
ADD KEY `codigoLibro` (`codigoLibro`),
ADD KEY `RUTUsuario` (`RUTUsuario`);

--
-- Indices de la tabla `renovaciones`
--
ALTER TABLE `renovaciones`
ADD PRIMARY KEY (`idRenovacion`),
ADD KEY `idPrestamo` (`idPrestamo`);

--
-- Indices de la tabla `stocklibros`
--
ALTER TABLE `stocklibros`
ADD PRIMARY KEY (`codigoLibro`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
ADD PRIMARY KEY (`RUT`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `deudas`
--
ALTER TABLE `deudas`
ADD CONSTRAINT `Deudas_ibfk_1` FOREIGN KEY (`RUTUsuario`) REFERENCES `usuarios` (`RUT`);

--
-- Filtros para la tabla `historialprestamos`
--
ALTER TABLE `historialprestamos`
ADD CONSTRAINT `HistorialPrestamos_ibfk_1` FOREIGN KEY (`RUTUsuario`) REFERENCES `usuarios` (`RUT`),
ADD CONSTRAINT `HistorialPrestamos_ibfk_2` FOREIGN KEY (`codigoLibro`) REFERENCES `libros` (`codigoLibro`);

--
-- Filtros para la tabla `multas`
--
ALTER TABLE `multas`
ADD CONSTRAINT `Multas_ibfk_1` FOREIGN KEY (`RUTUsuario`) REFERENCES `usuarios` (`RUT`);

--
-- Filtros para la tabla `prestamos`
--
ALTER TABLE `prestamos`
ADD CONSTRAINT `Prestamos_ibfk_1` FOREIGN KEY (`codigoLibro`) REFERENCES `libros` (`codigoLibro`),
ADD CONSTRAINT `Prestamos_ibfk_2` FOREIGN KEY (`RUTUsuario`) REFERENCES `usuarios` (`RUT`);

--
-- Filtros para la tabla `renovaciones`
--
ALTER TABLE `renovaciones`
ADD CONSTRAINT `Renovaciones_ibfk_1` FOREIGN KEY (`idPrestamo`) REFERENCES `prestamos` (`idPrestamo`);

--
-- Filtros para la tabla `stocklibros`
--
ALTER TABLE `stocklibros`
ADD CONSTRAINT `StockLibros_ibfk_1` FOREIGN KEY (`codigoLibro`) REFERENCES `libros` (`codigoLibro`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
