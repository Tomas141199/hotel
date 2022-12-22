-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 21-12-2022 a las 18:22:06
-- Versión del servidor: 10.4.17-MariaDB
-- Versión de PHP: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `hotel`
--
DROP SCHEMA IF EXISTS `hotel` ;

-- -----------------------------------------------------
-- Schema hotel
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `hotel` DEFAULT CHARACTER SET utf8 ;
USE `hotel` ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Actividades`
--

CREATE TABLE `Actividades` (
  `id` int(11) NOT NULL,
  `nombre` nvarchar(10)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actividad_reservacion`
--

CREATE TABLE `actividad_reservacion` (
  `id_reservacion` int(11) NOT NULL,
  `id_actividad` int(11) NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Departamentos`
--

CREATE TABLE `Departamentos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `Departamentos`
--

INSERT INTO `Departamentos` (`id`, `nombre`) VALUES
(1, 'Guía'),
(2, 'Fotógrafo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Horarios`
--

CREATE TABLE `Horarios` (
  `id` int(11) NOT NULL,
  `hora` nvarchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Reservacion`
--

CREATE TABLE `Reservacion` (
  `id` int(11) NOT NULL,
  `id_horario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservaciones_tour`
--

CREATE TABLE `reservaciones_tour` (
  `id` int(11) NOT NULL,
  `id_reservacion` int(11) NOT NULL,
  `id_tour` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Tours`
--

CREATE TABLE `Tours` (
  `id` int(11) NOT NULL,
  `id_horario` int(11) NOT NULL,
  `id_actividad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Trabajadores`
--

CREATE TABLE `Trabajadores` (
  `id` int(11) NOT NULL,
  `id_departamento` int(11) NOT NULL,
  `nombre` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `Trabajadores`
--

INSERT INTO `Trabajadores` (`id`, `id_departamento`, `nombre`) VALUES
(1, 1, 'Luis Maupome Garcia'),
(2, 2, 'Tomas Galloso Toledano');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `Actividades`
--
ALTER TABLE `Actividades`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `actividad_reservacion`
--
ALTER TABLE `actividad_reservacion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_horario` (`id_actividad`),
  ADD KEY `id_reservacion` (`id_reservacion`);

--
-- Indices de la tabla `Departamentos`
--
ALTER TABLE `Departamentos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `Horarios`
--
ALTER TABLE `Horarios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `Reservacion`
--
ALTER TABLE `Reservacion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_horario` (`id_horario`);

--
-- Indices de la tabla `reservaciones_tour`
--
ALTER TABLE `reservaciones_tour`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_reservacion` (`id_reservacion`),
  ADD KEY `id_tour` (`id_tour`);

--
-- Indices de la tabla `Tours`
--
ALTER TABLE `Tours`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_horario` (`id_horario`),
  ADD KEY `id_horario_2` (`id_horario`),
  ADD KEY `id_actividad` (`id_actividad`);

--
-- Indices de la tabla `Trabajadores`
--
ALTER TABLE `Trabajadores`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_departamento` (`id_departamento`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `Actividades`
--
ALTER TABLE `Actividades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `actividad_reservacion`
--
ALTER TABLE `actividad_reservacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Departamentos`
--
ALTER TABLE `Departamentos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `Horarios`
--
ALTER TABLE `Horarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Reservacion`
--
ALTER TABLE `Reservacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `reservaciones_tour`
--
ALTER TABLE `reservaciones_tour`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Tours`
--
ALTER TABLE `Tours`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Trabajadores`
--
ALTER TABLE `Trabajadores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `actividad_reservacion`
--
ALTER TABLE `actividad_reservacion`
  ADD CONSTRAINT `actividad_reservacion_ibfk_1` FOREIGN KEY (`id_actividad`) REFERENCES `Actividades` (`id`),
  ADD CONSTRAINT `actividad_reservacion_ibfk_2` FOREIGN KEY (`id_reservacion`) REFERENCES `Reservacion` (`id`);

--
-- Filtros para la tabla `Reservacion`
--
ALTER TABLE `Reservacion`
  ADD CONSTRAINT `reservacion_ibfk_1` FOREIGN KEY (`id_horario`) REFERENCES `Horarios` (`id`);

--
-- Filtros para la tabla `reservaciones_tour`
--
ALTER TABLE `reservaciones_tour`
  ADD CONSTRAINT `reservaciones_tour_ibfk_1` FOREIGN KEY (`id_tour`) REFERENCES `Tours` (`id`),
  ADD CONSTRAINT `reservaciones_tour_ibfk_2` FOREIGN KEY (`id_reservacion`) REFERENCES `Reservacion` (`id`);

--
-- Filtros para la tabla `Tours`
--
ALTER TABLE `Tours`
  ADD CONSTRAINT `tours_ibfk_1` FOREIGN KEY (`id_horario`) REFERENCES `Horarios` (`id`),
  ADD CONSTRAINT `tours_ibfk_2` FOREIGN KEY (`id_actividad`) REFERENCES `Actividades` (`id`);

--
-- Filtros para la tabla `Trabajadores`
--
ALTER TABLE `Trabajadores`
  ADD CONSTRAINT `trabajadores_ibfk_1` FOREIGN KEY (`id_departamento`) REFERENCES `Departamentos` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

insert into `Actividades` (`id`, `nombre`) values 
(1,'ATV'),
(2,'MDTB'),
(3,'BDA'),
(4,'X3'),
(5,'RC'),
(6,'CBR'),
(7,'HBN'),
(8,'KORA'),
(9,'HCOMBO'),
(10,'ORC'),
(11,'ORCM'),
(12,'ORH'),
(13,'ORHM'),
(14,'OFF'),
(15,'ORCA'),
(16,'BIKE');
SELECT * FROM `Actividades`;

insert into `Horarios` (`id`, `hora`) values 
(1,'8;00'),
(2,'9;00'),
(3,'10;00'),
(4,'11;00'),
(5,'12;00'),
(6,'13;00'),
(7,'14;00'),
(8,'15;00'),
(9,'16;00');

SELECT * FROM `Horarios`;
