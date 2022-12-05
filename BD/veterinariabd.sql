-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-12-2022 a las 00:11:16
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `veterinariabd`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa`
--

CREATE TABLE `empresa` (
  `Nit` int(12) NOT NULL,
  `RazonSocial` varchar(100) NOT NULL DEFAULT '',
  `Direccion` varchar(150) NOT NULL DEFAULT '',
  `Telefono` int(12) NOT NULL DEFAULT 0,
  `Email` varchar(50) NOT NULL DEFAULT '0',
  `Logo` blob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Descripción de la empresa que utilizará el aplicativo.';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `formula`
--

CREATE TABLE `formula` (
  `NroFormula` int(10) NOT NULL,
  `CodMed` int(4) NOT NULL DEFAULT 0 COMMENT 'Código del medicamento (Tabla Medicamentos)',
  `Cantidad` int(2) NOT NULL DEFAULT 0,
  `Observaciones` varchar(150) NOT NULL DEFAULT '0' COMMENT 'Indica la forma en que se suministra el medicamento a la mascota'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Permite registrar los medicamentos que se generaron para la mascota.';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historiaclinica`
--

CREATE TABLE `historiaclinica` (
  `ID` int(10) NOT NULL COMMENT 'Identificación de la mascota',
  `FechaHis` date NOT NULL COMMENT 'Fecha en la que se realizó la historia clínica a la mascota',
  `CodProc` int(4) DEFAULT 0 COMMENT 'Código del procedimiento realizado. Se permite Null si se generó formula (campo NroFormula).',
  `NroFormula` int(10) DEFAULT 0 COMMENT 'Consecutivo de la fórmula generada. Se permite Null si se realizó procedimiento (Campo CodProc).',
  `CodVet` int(12) NOT NULL DEFAULT 0 COMMENT 'Código del veterinario que atendió la mascota',
  `Observaciones` varchar(150) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Almacena información de la historia clínica de la mascota.';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mascotas`
--

CREATE TABLE `mascotas` (
  `ID` int(10) NOT NULL COMMENT 'Generado automáticamente para identificar a la mascota.',
  `Nombre` varchar(50) NOT NULL DEFAULT '' COMMENT 'Nombre de la mascota',
  `FechaNac` date NOT NULL COMMENT 'Fecha de nacimiento de la mascota.',
  `CodRaz` int(4) NOT NULL COMMENT 'Código o tipo de raza de la mascota (Tabla Razas)',
  `Sexo` char(1) NOT NULL DEFAULT '' COMMENT 'Macho (M), Hembra (H)',
  `Color` varchar(50) NOT NULL DEFAULT '',
  `Caracteristicas` varchar(100) DEFAULT '' COMMENT 'Señas particulares de la mascota',
  `Foto` blob DEFAULT NULL,
  `Identificacion` int(12) NOT NULL COMMENT 'Identificacion del cliente o dueño de la mascota'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Contiene los datos básicos de las mascotas que se atienden en la veterinaria.';

--
-- Volcado de datos para la tabla `mascotas`
--

INSERT INTO `mascotas` (`ID`, `Nombre`, `FechaNac`, `CodRaz`, `Sexo`, `Color`, `Caracteristicas`, `Foto`, `Identificacion`) VALUES
(6, 'Pachito', '2022-02-03', 1, 'M', 'Blanco', '  Chiquitpo', '', 1),
(7, 'Niebla', '2019-06-08', 1, 'H', 'Gris', '  Gris niebla ', 0x6761746f2e6a7067, 1),
(8, 'Gatico', '0000-00-00', 1, 'H', 'Amarillo y naranja', 'Bailarín y feliz', '', 1),
(10, 'Juanito', '2014-05-14', 1, 'M', 'Negro', '  Ojos grandes', '', 1),
(11, 'Nebulosa', '2022-11-09', 1, 'H', 'Blanco', '  BEBE', '', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medicamentos`
--

CREATE TABLE `medicamentos` (
  `CodMed` int(4) NOT NULL COMMENT 'Código del medicamento.',
  `NomMed` varchar(150) NOT NULL DEFAULT '0' COMMENT 'Nombre del medicamento',
  `Presentacion` varchar(50) NOT NULL DEFAULT '0' COMMENT 'Tableta, Jarabe, Inyeccion, etc'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Codificación de los medicamentos recetados a las mascotas.';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `procedimientos`
--

CREATE TABLE `procedimientos` (
  `CodProc` int(4) NOT NULL COMMENT 'Código del procedimiento realizado a la mascota',
  `NomProc` varchar(150) NOT NULL DEFAULT '' COMMENT 'Nombre del procedimiento realizado a la mascota'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Codificación de los procedimientos que pueden ser realizados a las mascotas por un veterinario.';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `razas`
--

CREATE TABLE `razas` (
  `CodRaz` int(4) NOT NULL COMMENT 'Código para identificar los tipos de razas',
  `NomRaz` varchar(50) NOT NULL DEFAULT '0' COMMENT 'Nombre de la raza'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Codificación de las clases de razas de mascotas.';

--
-- Volcado de datos para la tabla `razas`
--

INSERT INTO `razas` (`CodRaz`, `NomRaz`) VALUES
(1, 'Gato Holandes');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sessions`
--

CREATE TABLE `sessions` (
  `session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` int(11) UNSIGNED NOT NULL,
  `data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `sessions`
--

INSERT INTO `sessions` (`session_id`, `expires`, `data`) VALUES
('ChWic0DUAWULk2ufSqFqSM9tXJIeezY_', 1670119595, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"passport\":{\"user\":10},\"flash\":{}}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipousuario`
--

CREATE TABLE `tipousuario` (
  `TipUsu` int(1) NOT NULL COMMENT 'Código para identificar al tipo de usuario que utiliza el aplicativo (Administrador, Veterinario, Empleado, Cliente)',
  `NomUsu` varchar(50) NOT NULL DEFAULT '' COMMENT 'Descripción del usuario (Administrador, Veterinario, Empleado, Cliente)',
  `TipoAcceso` char(1) NOT NULL DEFAULT '' COMMENT 'Indica el tipo de acceso que el usuario tiene en el aplicativo (Registrar [R], Modificar [M], Consultar [C], Imprimir [I], Control Total [T])'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Identifica al tipo de usuario que utiliza el aplicativo (Administrador, Veterinario, Empleado, Cliente) y su clase de acceso al mismo.';

--
-- Volcado de datos para la tabla `tipousuario`
--

INSERT INTO `tipousuario` (`TipUsu`, `NomUsu`, `TipoAcceso`) VALUES
(1, 'Veterinario/a', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `Identificacion` int(12) NOT NULL COMMENT 'Número de identificación',
  `IdUser` int(5) NOT NULL,
  `Nombres` varchar(50) NOT NULL DEFAULT '',
  `Apellidos` varchar(50) NOT NULL DEFAULT '',
  `Direccion` varchar(150) NOT NULL DEFAULT '',
  `Telefono` int(12) NOT NULL DEFAULT 0,
  `Email` varchar(50) NOT NULL,
  `TipoUsuario` int(1) NOT NULL DEFAULT 0 COMMENT 'Perfil: Administrador, Veterinario, Empleado, Cliente',
  `Nit` int(12) DEFAULT NULL COMMENT 'Nit de la empresa',
  `Usuario` varchar(50) NOT NULL DEFAULT '' COMMENT 'Login',
  `Contraseña` varchar(50) NOT NULL DEFAULT '' COMMENT 'Password'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Tabla para almacenar los nombres de los usuarios que ingresaran al aplicativo y su rol.';

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`Identificacion`, `IdUser`, `Nombres`, `Apellidos`, `Direccion`, `Telefono`, `Email`, `TipoUsuario`, `Nit`, `Usuario`, `Contraseña`) VALUES
(0, 1, 'Juanes', 'Piña', 'Calle o no', 3132131, 'juanes@ema.com', 1, NULL, 'JuanesPiña', '$2a$10$pPDCWWryWTHwMRQJTQhQUOr42CLtQMZw7EqyTE8ikGw'),
(1, 2, 'Nikolas', 'Rodriguez', 'calle siempre viva', 31313564, 'niko@gmail.com', 1, NULL, 'niko@gmail.com', '123456'),
(456, 7, 'Arthur', 'Morgan', 'Campamento', 0, 'arthur@email.com', 1, NULL, 'thebest', '$2a$10$dE3TAkPaxM1GUDz04mOCv.GCsYEYlBQK2rRC.ANuI.Y'),
(999, 6, 'Joe', 'Miller', 'Texas', 777, 'joel@email.com', 1, NULL, 'JoelKiller', '$2a$10$I9qy4bVcKRahshAt2D7mR.94A28A5atHVFit0p8JyPY'),
(1919, 9, 'Marcus', 'Goodman', 'Guarida', 7777, 'no@email.com', 1, NULL, 'MarcusDog', '$2a$10$bqxfxoQe/tu8kDdC9hU.f.v731OOYpk3h0B71IyPJDj'),
(465456, 10, 'Julian', 'Mendez', 'cra 323', 314524404, 'juli@email.com', 1, NULL, 'Juliii', '$2a$10$32ynCMFgBg8H6wF.FN.5z.C6byXPjoc6u62FQLRfNzU'),
(107613432, 3, 'Juanes', 'Piña', 'Calle o no', 31345645, 'juanes@ema.com', 1, NULL, 'JuanesPiña', '$2a$10$w52O6iEskWObBmZ8vtJb1.HUd645n0587nrv/.sI/Gx');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `empresa`
--
ALTER TABLE `empresa`
  ADD PRIMARY KEY (`Nit`);

--
-- Indices de la tabla `formula`
--
ALTER TABLE `formula`
  ADD PRIMARY KEY (`NroFormula`),
  ADD KEY `CodMed` (`CodMed`);

--
-- Indices de la tabla `historiaclinica`
--
ALTER TABLE `historiaclinica`
  ADD KEY `CodProc` (`CodProc`),
  ADD KEY `CodVet` (`CodVet`),
  ADD KEY `ID` (`ID`),
  ADD KEY `CodMed` (`NroFormula`) USING BTREE;

--
-- Indices de la tabla `mascotas`
--
ALTER TABLE `mascotas`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `CodRaz` (`CodRaz`),
  ADD KEY `Identificacion` (`Identificacion`);

--
-- Indices de la tabla `medicamentos`
--
ALTER TABLE `medicamentos`
  ADD PRIMARY KEY (`CodMed`);

--
-- Indices de la tabla `procedimientos`
--
ALTER TABLE `procedimientos`
  ADD PRIMARY KEY (`CodProc`) USING BTREE;

--
-- Indices de la tabla `razas`
--
ALTER TABLE `razas`
  ADD PRIMARY KEY (`CodRaz`);

--
-- Indices de la tabla `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`session_id`);

--
-- Indices de la tabla `tipousuario`
--
ALTER TABLE `tipousuario`
  ADD PRIMARY KEY (`TipUsu`) USING BTREE;

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`Identificacion`),
  ADD KEY `Usuario` (`Usuario`),
  ADD KEY `Nit` (`Nit`),
  ADD KEY `TipoUsuario` (`TipoUsuario`),
  ADD KEY `IdUser` (`IdUser`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `formula`
--
ALTER TABLE `formula`
  MODIFY `NroFormula` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `mascotas`
--
ALTER TABLE `mascotas`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT COMMENT 'Generado automáticamente para identificar a la mascota.', AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `medicamentos`
--
ALTER TABLE `medicamentos`
  MODIFY `CodMed` int(4) NOT NULL AUTO_INCREMENT COMMENT 'Código del medicamento.';

--
-- AUTO_INCREMENT de la tabla `procedimientos`
--
ALTER TABLE `procedimientos`
  MODIFY `CodProc` int(4) NOT NULL AUTO_INCREMENT COMMENT 'Código del procedimiento realizado a la mascota';

--
-- AUTO_INCREMENT de la tabla `razas`
--
ALTER TABLE `razas`
  MODIFY `CodRaz` int(4) NOT NULL AUTO_INCREMENT COMMENT 'Código para identificar los tipos de razas', AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `IdUser` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `formula`
--
ALTER TABLE `formula`
  ADD CONSTRAINT `formula_ibfk_1` FOREIGN KEY (`CodMed`) REFERENCES `medicamentos` (`CodMed`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `historiaclinica`
--
ALTER TABLE `historiaclinica`
  ADD CONSTRAINT `historiaclinica_ibfk_1` FOREIGN KEY (`CodProc`) REFERENCES `procedimientos` (`CodProc`) ON UPDATE CASCADE,
  ADD CONSTRAINT `historiaclinica_ibfk_2` FOREIGN KEY (`ID`) REFERENCES `mascotas` (`ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `historiaclinica_ibfk_3` FOREIGN KEY (`NroFormula`) REFERENCES `formula` (`NroFormula`),
  ADD CONSTRAINT `historiaclinica_ibfk_4` FOREIGN KEY (`CodVet`) REFERENCES `usuarios` (`Identificacion`);

--
-- Filtros para la tabla `mascotas`
--
ALTER TABLE `mascotas`
  ADD CONSTRAINT `mascotas_ibfk_1` FOREIGN KEY (`CodRaz`) REFERENCES `razas` (`CodRaz`) ON UPDATE CASCADE,
  ADD CONSTRAINT `mascotas_ibfk_2` FOREIGN KEY (`Identificacion`) REFERENCES `usuarios` (`Identificacion`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_2` FOREIGN KEY (`Nit`) REFERENCES `empresa` (`Nit`) ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_3` FOREIGN KEY (`TipoUsuario`) REFERENCES `tipousuario` (`TipUsu`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
