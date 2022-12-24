-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-12-2022 a las 23:40:28
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.0.25

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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actividades`
--

CREATE TABLE `actividades` (
  `id` int(11) NOT NULL,
  `nombre` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `actividades`
--

INSERT INTO `actividades` (`id`, `nombre`) VALUES
(1, 'ATV'),
(2, 'MDTB'),
(3, 'BDA'),
(4, 'X3'),
(5, 'RC'),
(6, 'CBR'),
(7, 'HBN'),
(8, 'KORA'),
(9, 'HCOMBO'),
(10, 'ORC'),
(11, 'ORCM'),
(12, 'ORH'),
(13, 'ORHM'),
(14, 'OFF'),
(15, 'ORCA'),
(16, 'BIKE');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actividad_reservacion`
--

CREATE TABLE `actividad_reservacion` (
  `id_reservacion` int(11) NOT NULL,
  `id_actividad` int(11) NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `actividad_reservacion`
--

INSERT INTO `actividad_reservacion` (`id_reservacion`, `id_actividad`, `id`) VALUES
(16, 2, 14),
(17, 6, 15),
(18, 3, 16);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamentos`
--

CREATE TABLE `departamentos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `departamentos`
--

INSERT INTO `departamentos` (`id`, `nombre`) VALUES
(1, 'Guía'),
(2, 'Fotógrafo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horarios`
--

CREATE TABLE `horarios` (
  `id` int(11) NOT NULL,
  `hora` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `horarios`
--

INSERT INTO `horarios` (`id`, `hora`) VALUES
(1, '8:00'),
(2, '9:00'),
(3, '10:00'),
(4, '11:00'),
(5, '12:00'),
(6, '13:00'),
(7, '14:00'),
(8, '15:00'),
(9, '16:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservacion`
--

CREATE TABLE `reservacion` (
  `id` int(11) NOT NULL,
  `id_horario` int(11) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `telefono` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `reservacion`
--

INSERT INTO `reservacion` (`id`, `id_horario`, `nombre`, `telefono`) VALUES
(16, 2, 'Playera', '2481366503'),
(17, 3, 'Karina', '2481366503'),
(18, 3, 'Playera', '2481822516');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservaciones_tour`
--

CREATE TABLE `reservaciones_tour` (
  `id` int(11) NOT NULL,
  `id_reservacion` int(11) NOT NULL,
  `id_tour` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `reservaciones_tour`
--

INSERT INTO `reservaciones_tour` (`id`, `id_reservacion`, `id_tour`) VALUES
(1, 16, 2),
(2, 17, 2),
(3, 18, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tours`
--

CREATE TABLE `tours` (
  `id` int(11) NOT NULL,
  `id_horario` int(11) NOT NULL,
  `id_actividad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tours`
--

INSERT INTO `tours` (`id`, `id_horario`, `id_actividad`) VALUES
(2, 2, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trabajadores`
--

CREATE TABLE `trabajadores` (
  `id` int(11) NOT NULL,
  `id_departamento` int(11) NOT NULL,
  `nombre` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `trabajadores`
--

INSERT INTO `trabajadores` (`id`, `id_departamento`, `nombre`) VALUES
(1, 1, 'Luis Maupome Garcia'),
(2, 2, 'Tomas Galloso Toledano');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `actividades`
--
ALTER TABLE `actividades`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `actividad_reservacion`
--
ALTER TABLE `actividad_reservacion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_horario` (`id_actividad`),
  ADD KEY `id_reservacion` (`id_reservacion`);

--
-- Indices de la tabla `departamentos`
--
ALTER TABLE `departamentos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `horarios`
--
ALTER TABLE `horarios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `reservacion`
--
ALTER TABLE `reservacion`
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
-- Indices de la tabla `tours`
--
ALTER TABLE `tours`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_horario` (`id_horario`),
  ADD KEY `id_horario_2` (`id_horario`),
  ADD KEY `id_actividad` (`id_actividad`);

--
-- Indices de la tabla `trabajadores`
--
ALTER TABLE `trabajadores`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_departamento` (`id_departamento`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `actividades`
--
ALTER TABLE `actividades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `actividad_reservacion`
--
ALTER TABLE `actividad_reservacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `departamentos`
--
ALTER TABLE `departamentos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `horarios`
--
ALTER TABLE `horarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `reservacion`
--
ALTER TABLE `reservacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `reservaciones_tour`
--
ALTER TABLE `reservaciones_tour`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tours`
--
ALTER TABLE `tours`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `trabajadores`
--
ALTER TABLE `trabajadores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `actividad_reservacion`
--
ALTER TABLE `actividad_reservacion`
  ADD CONSTRAINT `actividad_reservacion_ibfk_1` FOREIGN KEY (`id_actividad`) REFERENCES `actividades` (`id`),
  ADD CONSTRAINT `actividad_reservacion_ibfk_2` FOREIGN KEY (`id_reservacion`) REFERENCES `reservacion` (`id`);

--
-- Filtros para la tabla `reservacion`
--
ALTER TABLE `reservacion`
  ADD CONSTRAINT `reservacion_ibfk_1` FOREIGN KEY (`id_horario`) REFERENCES `horarios` (`id`);

--
-- Filtros para la tabla `reservaciones_tour`
--
ALTER TABLE `reservaciones_tour`
  ADD CONSTRAINT `reservaciones_tour_ibfk_1` FOREIGN KEY (`id_tour`) REFERENCES `tours` (`id`),
  ADD CONSTRAINT `reservaciones_tour_ibfk_2` FOREIGN KEY (`id_reservacion`) REFERENCES `reservacion` (`id`);

--
-- Filtros para la tabla `tours`
--
ALTER TABLE `tours`
  ADD CONSTRAINT `tours_ibfk_1` FOREIGN KEY (`id_horario`) REFERENCES `horarios` (`id`),
  ADD CONSTRAINT `tours_ibfk_2` FOREIGN KEY (`id_actividad`) REFERENCES `actividades` (`id`);

--
-- Filtros para la tabla `trabajadores`
--
ALTER TABLE `trabajadores`
  ADD CONSTRAINT `trabajadores_ibfk_1` FOREIGN KEY (`id_departamento`) REFERENCES `departamentos` (`id`);
  
  
COMMIT;

SELECT r.id ,r.nombre as cliente, r.telefono, h.hora, a.nombre FROM reservacion as r INNER JOIN horarios as h ON r.id_horario = h.id INNER JOIN actividad_reservacion as ar ON r.id = ar.id_reservacion INNER JOIN actividades as a ON ar.id_actividad = a.id;

SELECT * from tours;

SELECT h.hora as horario, a.nombre as actividad, t.id as tour_id from tours as t inner join horarios as h on t.id_horario = h.id inner join actividades as a on t.id_actividad = a.id;

SELECT r.id as id_reservacion, r.nombre as nombre_cliente, rt.id_tour as tour, ar.id_actividad as id_actividad, r.id_horario as id_horario  from reservaciones_tour as rt inner join reservacion as r on r.id = rt.id_reservacion inner join actividad_reservacion as ar on ar.id_reservacion=r.id order by rt.id_tour;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
