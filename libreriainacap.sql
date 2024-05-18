-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-05-2024 a las 04:16:03
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
  `RUTUsuario` varchar(15) NOT NULL,
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
  `titulo` varchar(255) NOT NULL,
  `autor` varchar(255) DEFAULT NULL,
  `anioPublicacion` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `libros`
--

INSERT INTO `libros` (`codigoLibro`, `titulo`, `autor`, `anioPublicacion`) VALUES
(1, 'malesuada ut, sem. Nulla interdum.', 'Uta Lambert', 1981),
(2, 'elit, pellentesque', 'Shad Mckinney', 1967),
(3, 'id, blandit at, nisi. Cum sociis natoque penatibus', 'Yoshi Armstrong', 1980),
(4, 'Nunc quis arcu vel quam dignissim pharetra. Nam ac', 'Jacqueline Foley', 1992),
(5, 'Cras dolor', 'Adrienne Ayala', 1989),
(6, 'turpis. In condimentum. Donec at arcu. Vestibulum', 'Reagan Schroeder', 1979),
(7, 'at arcu. Vestibulum ante ipsum primis in', 'Rooney Richards', 1970),
(8, 'tortor. Integer aliquam adipiscing lacus.', 'Jakeem James', 1973),
(9, 'Duis risus odio, auctor vitae, aliquet nec, imperdiet', 'Hedwig Davidson', 1985),
(10, 'pharetra, felis eget varius ultrices, mauris ipsum porta', 'Aurelia Little', 2000),
(11, 'commodo ipsum. Suspendisse non leo. Vivamus nibh dolor, nonummy ac,', 'Ivana Myers', 1963),
(12, 'nibh. Quisque', 'Neil Kent', 1994),
(13, 'Sed eu eros. Nam consequat', 'Katell Howell', 1976),
(14, 'sit amet, consectetuer adipiscing elit. Aliquam', 'Lenore Christian', 1970),
(15, 'Aliquam auctor, velit eget', 'Savannah Moreno', 1996),
(16, 'varius ultrices, mauris ipsum porta elit, a', 'Anjolie Sullivan', 1989),
(17, 'dui, nec', 'Hu Cooke', 1993),
(18, 'lacus, varius et, euismod et, commodo at, libero. Morbi', 'Beau O\'donnell', 1994),
(19, 'feugiat. Lorem ipsum', 'Hope Horton', 1973),
(20, 'risus. Donec egestas. Aliquam', 'Walter Mayo', 1966),
(21, 'risus. Morbi metus.', 'Aidan Head', 1993),
(22, 'Vivamus euismod urna. Nullam lobortis quam a', 'Christian Haley', 1988),
(23, 'nisi. Aenean eget metus.', 'Whitney Frye', 1965),
(24, 'nunc ac mattis ornare, lectus ante dictum mi,', 'Cassandra Wiley', 1998),
(25, 'eu nulla at sem molestie sodales. Mauris', 'Leo Kirkland', 1964),
(26, 'quam. Pellentesque habitant morbi tristique senectus et netus et', 'Lee Soto', 1964),
(27, 'netus et', 'Hope House', 1996),
(28, 'Quisque libero lacus, varius et, euismod et, commodo at, libero.', 'Danielle Baldwin', 1963),
(29, 'Duis risus odio, auctor vitae, aliquet nec,', 'John Valenzuela', 1977),
(30, 'pede.', 'Cleo Burgess', 1963),
(31, 'Donec tempor,', 'Samson Cohen', 1992),
(32, 'fermentum metus. Aenean sed pede nec ante blandit viverra. Donec', 'Barrett Barlow', 1995),
(33, 'scelerisque sed, sapien. Nunc pulvinar', 'Kenneth Morrison', 1997),
(34, 'ut, pellentesque', 'Sylvester Wiley', 1993),
(35, 'sagittis felis. Donec tempor, est ac mattis', 'Burke Kaufman', 1970),
(36, 'Donec tempor, est ac', 'Winifred Mcknight', 1995),
(37, 'malesuada vel,', 'Ashely Ramsey', 1981),
(38, 'vulputate velit eu sem. Pellentesque', 'Desiree Gillespie', 1975),
(39, 'Suspendisse tristique neque venenatis lacus. Etiam bibendum fermentum', 'Hoyt Sims', 1968),
(40, 'molestie tellus. Aenean egestas hendrerit neque. In ornare sagittis', 'Karen Small', 1971),
(41, 'quis turpis vitae purus', 'Pandora Hall', 1976),
(42, 'at, nisi. Cum sociis natoque penatibus et magnis dis parturient', 'Xander Mcneil', 1994),
(43, 'est arcu ac orci. Ut semper pretium', 'Sawyer Rivers', 1995),
(44, 'quis, pede. Suspendisse dui. Fusce diam', 'Mollie Blake', 1969),
(45, 'eget ipsum. Suspendisse sagittis. Nullam vitae diam. Proin dolor.', 'Troy Browning', 1973),
(46, 'erat neque non quam. Pellentesque habitant morbi tristique senectus', 'Prescott Shannon', 1965),
(47, 'sed dictum eleifend, nunc risus varius orci, in', 'Ulla Stewart', 1986),
(48, 'facilisis vitae, orci. Phasellus dapibus quam quis diam.', 'Vladimir Glover', 1977),
(49, 'nec', 'April Camacho', 1983),
(50, 'vestibulum nec, euismod in, dolor. Fusce feugiat. Lorem ipsum dolor', 'Amelia Manning', 1994),
(51, 'orci sem eget massa. Suspendisse', 'Maile Cantu', 1970),
(52, 'urna', 'Lila Simpson', 1997),
(53, 'at pede. Cras vulputate', 'Rashad Mendez', 1988),
(54, 'Donec est mauris, rhoncus id,', 'Alvin Becker', 1982),
(55, 'dictum ultricies', 'Hilda Mooney', 1969),
(56, 'sed, facilisis', 'Allen Baxter', 1981),
(57, 'Aenean eget metus. In nec orci.', 'Maisie Summers', 1973),
(58, 'tempor diam dictum sapien. Aenean massa.', 'Ulysses Rogers', 1979),
(59, 'Vivamus nibh dolor, nonummy ac, feugiat non, lobortis', 'Amal Ortega', 1999),
(60, 'Cras sed leo. Cras vehicula aliquet libero. Integer', 'Chadwick Reyes', 1993),
(61, 'mauris ipsum porta elit, a feugiat tellus lorem eu metus.', 'Zachary Zimmerman', 1996),
(62, 'felis. Nulla tempor augue ac ipsum. Phasellus vitae', 'Uma Wagner', 1983),
(63, 'lorem fringilla ornare placerat, orci lacus', 'Amena Wells', 1970),
(64, 'est ac mattis semper, dui lectus', 'Samson Simpson', 1988),
(65, 'In at', 'Eliana Roman', 1966),
(66, 'enim. Sed', 'Dalton Malone', 1999),
(67, 'Nunc sollicitudin commodo ipsum. Suspendisse non leo.', 'Cullen Valencia', 1983),
(68, 'auctor,', 'Buckminster Shannon', 1983),
(69, 'nulla. Integer vulputate, risus a ultricies', 'Keith Pugh', 1968),
(70, 'pellentesque a, facilisis non, bibendum', 'Renee Valenzuela', 1988),
(71, 'diam eu dolor egestas rhoncus. Proin nisl', 'Alfreda Sanchez', 1970),
(72, 'nisl. Nulla', 'Caldwell Ross', 1998),
(73, 'nisi sem semper erat, in consectetuer ipsum', 'Nero Ross', 1964),
(74, 'Phasellus fermentum convallis', 'Clementine Richard', 1996),
(75, 'enim, condimentum', 'Meredith Guy', 1974),
(76, 'vitae, sodales', 'Felicia Dillard', 1999),
(77, 'augue porttitor interdum.', 'August Logan', 1975),
(78, 'blandit at, nisi. Cum sociis natoque penatibus et', 'Flavia Hunter', 1990),
(79, 'Nulla dignissim. Maecenas ornare egestas ligula.', 'Eric Reeves', 1966),
(80, 'non magna. Nam ligula', 'Silas England', 1969),
(81, 'molestie', 'Shay Fernandez', 1994),
(82, 'Curabitur dictum. Phasellus in felis. Nulla tempor augue ac', 'Lev Calhoun', 1985),
(83, 'ultricies sem magna', 'Audrey Luna', 1967),
(84, 'Fusce fermentum', 'Veronica Farmer', 1985),
(85, 'urna justo', 'Mufutau Conrad', 1968),
(86, 'Aenean massa. Integer vitae nibh. Donec est mauris, rhoncus', 'Camille Tran', 1971),
(87, 'Fusce fermentum fermentum arcu.', 'Camilla Collier', 1997),
(88, 'aliquet, sem ut cursus luctus, ipsum leo elementum sem, vitae', 'Adrian Jefferson', 1987),
(89, 'Mauris eu turpis. Nulla aliquet. Proin velit.', 'Jaquelyn Curtis', 1986),
(90, 'eleifend non, dapibus rutrum, justo. Praesent', 'Salvador Jordan', 1984),
(91, 'a', 'Nicole Wyatt', 1967),
(92, 'Nunc laoreet lectus quis', 'Nathaniel Kidd', 1992),
(93, 'a purus. Duis', 'Marvin Walsh', 1985),
(94, 'non, bibendum', 'Connor Nielsen', 1969),
(95, 'scelerisque sed, sapien. Nunc', 'Amena Stanton', 1970),
(96, 'metus urna convallis', 'Sheila Fleming', 1983),
(97, 'ligula tortor, dictum eu,', 'Ulysses Clarke', 1967),
(98, 'sem', 'Felicia Ferguson', 1982),
(99, 'dictum. Proin', 'Erich Stark', 1973),
(100, 'nulla at sem molestie sodales. Mauris blandit enim consequat', 'Steven Gray', 1970),
(101, 'tincidunt pede ac urna. Ut', 'Randall Singleton', 1977),
(102, 'gravida. Praesent eu nulla at', 'Dana Little', 1977),
(103, 'imperdiet', 'Sara Raymond', 1981),
(104, 'in aliquet lobortis, nisi nibh lacinia orci, consectetuer', 'Timon Jenkins', 1974),
(105, 'volutpat nunc sit amet metus. Aliquam erat', 'Lamar Warren', 1991),
(106, 'porttitor eros nec', 'Sybill Wagner', 1976),
(107, 'Donec elementum, lorem', 'Benjamin Hood', 1994),
(108, 'faucibus lectus, a', 'Akeem Richardson', 1974),
(109, 'penatibus et', 'Allen Strickland', 1976),
(110, 'enim non nisi. Aenean eget metus. In', 'Barbara Alford', 1983),
(111, 'dui', 'Slade Gutierrez', 1983),
(112, 'Nam interdum enim non nisi.', 'Indira Dodson', 1964),
(113, 'Cras sed leo. Cras vehicula aliquet', 'Hayley Rollins', 1983),
(114, 'ac, eleifend vitae, erat. Vivamus', 'Orla Norris', 1998),
(115, 'Mauris eu', 'Brenna Dodson', 1975),
(116, 'luctus sit amet,', 'Tanner Strickland', 1997),
(117, 'non, bibendum', 'Shea Russell', 1966),
(118, 'faucibus orci luctus et', 'Cassandra Solis', 1969),
(119, 'Mauris quis turpis vitae purus gravida sagittis. Duis', 'Tanek Cross', 1995),
(120, 'Curabitur vel lectus. Cum sociis', 'Indira Valenzuela', 1987),
(121, 'ac facilisis facilisis, magna tellus faucibus leo, in lobortis', 'Calvin Albert', 1998),
(122, 'nec,', 'Orlando Mcconnell', 1983),
(123, 'pharetra', 'Wylie Houston', 1994),
(124, 'neque pellentesque massa lobortis ultrices. Vivamus rhoncus. Donec est.', 'Joseph Massey', 1977),
(125, 'arcu. Curabitur ut', 'Nolan Harper', 1976),
(126, 'nonummy ultricies ornare, elit elit fermentum risus, at fringilla', 'Amal Rivera', 1985),
(127, 'odio a purus. Duis', 'Vladimir Hahn', 1971),
(128, 'mi tempor lorem, eget mollis lectus pede', 'Orlando Wilson', 1972),
(129, 'porttitor vulputate,', 'Alec Ramos', 1969),
(130, 'Morbi non', 'Keegan Travis', 1990),
(131, 'Morbi non sapien molestie orci tincidunt adipiscing.', 'Calvin Mcknight', 1988),
(132, 'sed tortor. Integer aliquam adipiscing', 'Declan Carson', 1982),
(133, 'massa. Suspendisse eleifend. Cras sed', 'Stacy Black', 1973),
(134, 'lobortis augue scelerisque mollis. Phasellus', 'Alana Mcdaniel', 1987),
(135, 'Aliquam', 'Gabriel Jefferson', 1998),
(136, 'mattis ornare, lectus ante dictum', 'Cecilia Love', 1970),
(137, 'tristique', 'Noel Wood', 1982),
(138, 'nulla magna, malesuada vel, convallis in, cursus et,', 'Bell Callahan', 1990),
(139, 'scelerisque neque', 'Carla Park', 1970),
(140, 'non, luctus sit', 'Nolan Watson', 1968),
(141, 'sollicitudin', 'Jin Franklin', 1984),
(142, 'imperdiet dictum magna.', 'Dominique Mccarthy', 1981),
(143, 'massa rutrum magna. Cras convallis convallis', 'Sybill Cleveland', 1997),
(144, 'Aliquam ornare, libero at auctor ullamcorper, nisl arcu iaculis', 'Nicholas Vazquez', 1974),
(145, 'dui lectus', 'Allen Everett', 1971),
(146, 'velit. Cras lorem lorem, luctus ut, pellentesque', 'Jasper Watkins', 1991),
(147, 'facilisis eget, ipsum. Donec sollicitudin adipiscing ligula. Aenean gravida', 'Brooke Reilly', 1977),
(148, 'molestie orci tincidunt adipiscing.', 'Geoffrey Graham', 1998),
(149, 'malesuada', 'Eleanor Camacho', 1994),
(150, 'vel, venenatis vel, faucibus id, libero. Donec consectetuer mauris', 'Keegan Hughes', 1988),
(151, 'eros. Proin ultrices. Duis volutpat', 'Blaze Hamilton', 1975),
(152, 'et malesuada fames ac turpis egestas. Fusce', 'Shay Whitney', 1973),
(153, 'a feugiat', 'Cameran Hall', 1969),
(154, 'Suspendisse eleifend. Cras sed', 'Phyllis Hurst', 1991),
(155, 'neque pellentesque massa lobortis ultrices.', 'Gwendolyn Brooks', 1974),
(156, 'nulla at', 'Britanney Morton', 1975),
(157, 'vitae purus', 'Hedwig Joseph', 1968),
(158, 'Nullam suscipit, est ac facilisis facilisis, magna tellus faucibus', 'Carl Jacobs', 1997),
(159, 'euismod est arcu', 'Murphy Parks', 1996),
(160, 'nisi. Aenean eget', 'Fleur Roy', 1994),
(161, 'urna justo faucibus', 'Harlan Chapman', 1965),
(162, 'Nunc quis arcu vel quam', 'Aquila Wright', 1984),
(163, 'Mauris eu turpis. Nulla aliquet. Proin', 'Oren Walters', 1978),
(164, 'nec orci. Donec nibh. Quisque nonummy ipsum non arcu.', 'Tarik Emerson', 1984),
(165, 'a ultricies adipiscing, enim', 'Stephanie Dunn', 1973),
(166, 'feugiat tellus lorem', 'Sophia Lucas', 1986),
(167, 'tellus', 'Macy Hayden', 1967),
(168, 'quis urna.', 'Shaine Bishop', 1984),
(169, 'tristique pharetra. Quisque ac', 'Teegan Ray', 1969),
(170, 'nec mauris', 'Dane Emerson', 1988),
(171, 'scelerisque', 'Edan Morales', 1988);

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
  `RUTUsuario` varchar(15) NOT NULL,
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
(2, 'Profesor');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `RUT` varchar(15) NOT NULL,
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
  ADD KEY `RUTUsuario` (`RUTUsuario`),
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
  ADD KEY `RUTUsuario` (`RUTUsuario`),
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
  ADD PRIMARY KEY (`RUT`),
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
-- AUTO_INCREMENT de la tabla `libros`
--
ALTER TABLE `libros`
  MODIFY `codigoLibro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=172;

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
  ADD CONSTRAINT `Deudas_ibfk_1` FOREIGN KEY (`RUTUsuario`) REFERENCES `usuarios` (`RUT`),
  ADD CONSTRAINT `deuda_prestamo_fk` FOREIGN KEY (`idPrestamoLibro`) REFERENCES `prestamos` (`idPrestamo`),
  ADD CONSTRAINT `deudas_Libro_fk` FOREIGN KEY (`idPrestamoLibro`) REFERENCES `libros` (`codigoLibro`);

--
-- Filtros para la tabla `prestamos`
--
ALTER TABLE `prestamos`
  ADD CONSTRAINT `Prestamos_ibfk_1` FOREIGN KEY (`codigoLibro`) REFERENCES `libros` (`codigoLibro`),
  ADD CONSTRAINT `Prestamos_ibfk_2` FOREIGN KEY (`RUTUsuario`) REFERENCES `usuarios` (`RUT`),
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
