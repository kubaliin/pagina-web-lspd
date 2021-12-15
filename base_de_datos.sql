-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-07-2021 a las 17:50:04
-- Versión del servidor: 10.4.20-MariaDB
-- Versión de PHP: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `lspd`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add permission', 1, 'add_permission'),
(2, 'Can change permission', 1, 'change_permission'),
(3, 'Can delete permission', 1, 'delete_permission'),
(4, 'Can view permission', 1, 'view_permission'),
(5, 'Can add group', 2, 'add_group'),
(6, 'Can change group', 2, 'change_group'),
(7, 'Can delete group', 2, 'delete_group'),
(8, 'Can view group', 2, 'view_group'),
(9, 'Can add user', 3, 'add_user'),
(10, 'Can change user', 3, 'change_user'),
(11, 'Can delete user', 3, 'delete_user'),
(12, 'Can view user', 3, 'view_user'),
(13, 'Can add content type', 4, 'add_contenttype'),
(14, 'Can change content type', 4, 'change_contenttype'),
(15, 'Can delete content type', 4, 'delete_contenttype'),
(16, 'Can view content type', 4, 'view_contenttype'),
(17, 'Can add log entry', 5, 'add_logentry'),
(18, 'Can change log entry', 5, 'change_logentry'),
(19, 'Can delete log entry', 5, 'delete_logentry'),
(20, 'Can view log entry', 5, 'view_logentry'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add ciudadanos', 7, 'add_ciudadanos'),
(26, 'Can change ciudadanos', 7, 'change_ciudadanos'),
(27, 'Can delete ciudadanos', 7, 'delete_ciudadanos'),
(28, 'Can view ciudadanos', 7, 'view_ciudadanos'),
(29, 'Can add policia', 8, 'add_policia'),
(30, 'Can change policia', 8, 'change_policia'),
(31, 'Can delete policia', 8, 'delete_policia'),
(32, 'Can view policia', 8, 'view_policia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$260000$Ipqdgaub104vU0QEJglfME$CNIF40/mFjNC0I/Y4hE4CJa+kJxKbn5TUZR7envYD/8=', '2021-07-13 13:56:19.270126', 1, 'admin', '', '', '', 1, 1, '0000-00-00 00:00:00.000000'),
(99, 'pbkdf2_sha256$260000$zZFFaRec0rqgZjy9yMvbRe$JiJiChwdS/Z2rjQxTSshs0UsBDYyZOUg2tBk+qx1xjk=', NULL, 0, 'detallie', '', '', '', 1, 1, '2021-07-13 14:21:07.639310'),
(101, 'pbkdf2_sha256$260000$bstWkZxKG83fHtcKskXgIO$18Q7BMOXOyBebsGjRJI6atS6xDJaCe3KlBroUHvQO4w=', NULL, 0, 'street', '', '', '', 1, 1, '2021-07-13 15:27:57.256904'),
(102, 'pbkdf2_sha256$260000$ZI8cwJfqnNerqiVadC5gxS$BRqQ1uoatqqU6EZY8nEx6i4bVlLYl+QpmUBTfacwHiE=', NULL, 0, 'campo', '', '', '', 0, 1, '2021-07-13 15:28:15.439289'),
(103, 'pbkdf2_sha256$260000$AO9eMoW4ccvdEme6YNKNfy$CQcW4H7jlLm1lIYXF5o9R6VPdy4ibWArEbfAP0bJ94Q=', NULL, 0, 'evans', '', '', '', 0, 1, '2021-07-13 15:28:31.367425'),
(104, 'pbkdf2_sha256$260000$MzVmO4dQZTkL9q2NpIKmgZ$EAH//6xnPR/h27qZK1WxOQv/VvAqB1MKm1FSib5/+eM=', NULL, 0, 'williams', '', '', '', 1, 1, '2021-07-13 15:28:47.863642'),
(105, 'pbkdf2_sha256$260000$rbzYqYqdJofWlglcYwhDyn$35nC6XdvLa+Iv3IfAnXGFj3NYaLlGGuvHxZIcnZAkiU=', NULL, 0, 'hellson', '', '', '', 0, 1, '2021-07-13 15:29:04.487248'),
(106, 'pbkdf2_sha256$260000$YcdsqG67L6K5dEp7M04qT9$YVPMla2/BzA9ORXArJuSkXig0UH6Yj+b30oSFwGA2Hc=', NULL, 0, 'salazar', '', '', '', 1, 1, '2021-07-13 15:29:18.641192'),
(107, 'pbkdf2_sha256$260000$A5iOOwQbNyGA6908QtWakE$y0vfITiAkML+SFnBjGIii5oGbcjpuPxMmpker9GMzl4=', NULL, 0, 'tinoco', '', '', '', 0, 1, '2021-07-13 15:29:33.318216'),
(108, 'pbkdf2_sha256$260000$oT8dvTZIpTVXX1xGMejBtC$FtjYVdpPQfwTIX5LTKdhXDiLtBvzwJ31iwrLsU2F2JA=', NULL, 0, 'garcia', '', '', '', 0, 1, '2021-07-13 15:29:44.839914'),
(109, 'pbkdf2_sha256$260000$8z0sXyZ9wzMnUsU1nmDIsm$TguytXK/MagEBQaPZWhkGULKszmIolXWpoW+imjYvaY=', NULL, 0, 'holmes', '', '', '', 0, 1, '2021-07-13 15:29:56.443340'),
(110, 'pbkdf2_sha256$260000$lux3zGQy03a4pK0KwDb1kM$mrTlaDcdFgDztwuct9aRuBXA60eiABV0PzRv1Zbd23I=', NULL, 0, 'james', '', '', '', 0, 1, '2021-07-13 15:30:10.024785'),
(111, 'pbkdf2_sha256$260000$LXQme2NE59ts3UpmP0iGh6$qgqDFnEzwWVUPdEqerJXPEkDjgM6kY4GL2k9tDSVIv8=', NULL, 0, 'mckenzei', '', '', '', 0, 1, '2021-07-13 15:30:32.516201'),
(112, 'pbkdf2_sha256$260000$TObYWHnTfRAFJ9mpu7tQBt$1ULKiwCErJJeYBLc13npZOJ0bQM5DVdJDenTemfuNFU=', NULL, 0, 'keiolani', '', '', '', 0, 1, '2021-07-13 15:30:52.277562'),
(113, 'pbkdf2_sha256$260000$RuGNEsbkwd9mhLP63bJuox$OtptabeARKnOb9N/1GBoY+PCK9r5PG9CP7/L1JCDsz0=', NULL, 0, 'molina', '', '', '', 0, 1, '2021-07-13 15:31:02.854058'),
(114, 'pbkdf2_sha256$260000$F6328jlpIwIRlPVW6ucmCm$KHdg4Lv80fCz7wDCs10UM5wWPNSt4PO/6kWO7KB1S8U=', NULL, 0, 'ryan', '', '', '', 0, 1, '2021-07-13 15:31:15.762880'),
(115, 'pbkdf2_sha256$260000$5DmO58t1ayICBm9tknsUPa$CyYjW/qJuOsWR0SrO1d+K/zviqfBwwITGc+4BUF4FIc=', NULL, 0, 'jackson', '', '', '', 0, 1, '2021-07-13 15:31:32.508466'),
(116, 'pbkdf2_sha256$260000$Lz7cHVaUgdfq0QTeT3LnPq$eR3QUAY1lWl6ZW95KOgbwfKnUVqlen6hxp3F/CStqMM=', NULL, 0, 'arthur', '', '', '', 1, 1, '2021-07-13 15:31:51.812315'),
(117, 'pbkdf2_sha256$260000$iDf8t9Zdk2VyH5BERHd3Wk$LPMxv0WbG2eS5FhKDiBy/OhFt6ja9fDidsR+D2Fo+k8=', NULL, 0, 'gonzalez', '', '', '', 0, 1, '2021-07-13 15:32:14.766287'),
(118, 'pbkdf2_sha256$260000$dXIfGat5FAlppSWJqWRzMx$c2l33QjUMS0xPJIMg/d1bbvylVuugua3PpHa8/HZdh4=', NULL, 0, 'bucciarati', '', '', '', 0, 1, '2021-07-13 15:32:42.803265'),
(119, 'pbkdf2_sha256$260000$9fRYNT2ohuVCrjYGNQ0nl4$d6k4/in7eS8bGh7YXm9Y7orb4gIW6wRAdCNfRo6tCcY=', NULL, 0, 'hotchner', '', '', '', 0, 1, '2021-07-13 15:33:18.561053'),
(120, 'pbkdf2_sha256$260000$F1ZwfMCydwcXtpqhehAlPC$vWayFzrT6P0POOWK/tUcbJJHsA0cujirYJMs+2pWjC4=', NULL, 0, 'martinez', '', '', '', 0, 1, '2021-07-13 15:33:31.521374'),
(121, 'pbkdf2_sha256$260000$E99TTV9CkzLC0EEeoVyljb$bl/3MfFHl5dqvt7YBmqdly35q/dzdNZbBVRg9Hj2vbk=', NULL, 0, 'giovanni', '', '', '', 0, 1, '2021-07-13 15:33:51.072342'),
(122, 'pbkdf2_sha256$260000$RnHmopGs6rSLWtcEQnDXIW$9HRgHqm/gYFS8Kt3bfQojrAjPqd98jTqnyDEibbxdtg=', NULL, 0, 'carlos', '', '', '', 0, 1, '2021-07-13 15:34:02.157577'),
(123, 'pbkdf2_sha256$260000$DGHbzwMHiaQc7LqzW2mZTX$/4j2YNzN4iUaP2eUNJX9eXDLhg0KJivTKMqw8Qxf41o=', NULL, 0, 'oconnor', '', '', '', 0, 1, '2021-07-13 15:34:15.120383'),
(124, 'pbkdf2_sha256$260000$6SLgQO5qnmrINdm2jztisd$8cvZc3okJuSDAXjJGdh9Ng83QEYKQ1UdPCu4b3A9Eww=', NULL, 0, 'valentino', '', '', '', 0, 1, '2021-07-13 15:34:35.343292'),
(125, 'pbkdf2_sha256$260000$AOvPxiWs2V0mJd39Mi7Qtt$Aba73pRPUKJSW89zB4El/0WLMWiCyrHvz74deFXFIzk=', NULL, 0, 'oneil', '', '', '', 0, 1, '2021-07-13 15:34:51.175183');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `busca_captura`
--

CREATE TABLE `busca_captura` (
  `id` int(11) NOT NULL,
  `ciudadano_id` int(11) NOT NULL,
  `motivo` varchar(500) NOT NULL,
  `estado` tinyint(1) NOT NULL,
  `agente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudadanos`
--

CREATE TABLE `ciudadanos` (
  `id` int(10) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `nombre_completo` varchar(100) NOT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `telefono` int(7) DEFAULT NULL,
  `imagenes_id` varchar(250) DEFAULT NULL,
  `creado_por` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `ciudadanos`
--

INSERT INTO `ciudadanos` (`id`, `nombre`, `apellido`, `nombre_completo`, `fecha_nacimiento`, `telefono`, `imagenes_id`, `creado_por`) VALUES
(60, 'Adam', 'Perez', 'Adam Perez', '2000-02-29', NULL, '20210713160211', 1),
(61, 'Adry', 'Ortega', 'Adry Ortega', '2012-08-26', NULL, NULL, 1),
(62, 'Aiden', 'Pennywise', 'Aiden Pennywise', '1997-10-03', NULL, NULL, 1),
(63, 'Aiitor', 'Martiin', 'Aiitor Martiin', '2000-07-12', NULL, NULL, 1),
(64, 'Akiles', 'Castro', 'Akiles Castro', '2000-10-12', NULL, NULL, 1),
(65, 'Alan', 'Santana', 'Alan Santana', NULL, NULL, NULL, 1),
(66, 'Alejandro', 'Fernandez', 'Alejandro Fernandez', NULL, NULL, NULL, 1),
(67, 'Alexandra', 'Garcia', 'Alexandra Garcia', NULL, NULL, NULL, 1),
(68, 'Algimiro', 'Guanipa', 'Algimiro Guanipa', NULL, NULL, NULL, 1),
(69, 'Ali José Leslie', 'Tupu Graham', 'Ali José Leslie Tupu Graham', NULL, NULL, NULL, 1),
(70, 'Alvaro', 'Ortega', 'Alvaro Ortega', NULL, NULL, NULL, 1),
(71, 'Anakin', 'Liguori', 'Anakin Liguori', NULL, NULL, NULL, 1),
(72, 'Anastasio', 'Perico', 'Anastasio Perico', NULL, NULL, NULL, 1),
(73, 'Anthony', 'Santos', 'Anthony Santos', NULL, NULL, NULL, 1),
(74, 'Antonio', 'de los Rios', 'Antonio de los Rios', NULL, NULL, NULL, 1),
(75, 'Aquite', 'Castra', 'Aquite Castra', NULL, NULL, NULL, 1),
(76, 'Asbjörn Verikirves', 'Vikiinkisoturi Karhu', 'Asbjörn Verikirves Vikiinkisoturi Karhu', NULL, NULL, NULL, 1),
(77, 'Asis', 'Caballero', 'Asis Caballero', NULL, NULL, NULL, 1),
(78, 'Atila', 'Pérez', 'Atila Pérez', NULL, NULL, NULL, 1),
(79, 'Axel', 'Odonell', 'Axel Odonell', NULL, NULL, NULL, 1),
(80, 'Ayana', 'Turner', 'Ayana Turner', NULL, NULL, NULL, 1),
(81, 'Ayhan', 'Ymir Aydhab', 'Ayhan Ymir Aydhab', NULL, NULL, NULL, 1),
(82, 'Bartelome', 'Tupu', 'Bartelome Tupu', NULL, NULL, NULL, 1),
(83, 'Bogdan', 'Petreknov', 'Bogdan Petreknov', NULL, NULL, NULL, 1),
(84, 'Boris', 'Castro', 'Boris Castro', NULL, NULL, NULL, 1),
(85, 'Brady', 'Allen', 'Brady Allen', NULL, NULL, NULL, 1),
(86, 'Brian', 'Ramirez', 'Brian Ramirez', NULL, NULL, NULL, 1),
(87, 'Brian', 'Walker', 'Brian Walker', NULL, NULL, NULL, 1),
(88, 'Brooke', 'Jonshon Bronw', 'Brooke Jonshon Bronw', NULL, NULL, NULL, 1),
(89, 'Browm', 'Elon', 'Browm Elon', NULL, NULL, NULL, 1),
(90, 'Bryan', 'Smith', 'Bryan Smith', NULL, NULL, NULL, 1),
(91, 'Bryant', 'Urcullu', 'Bryant Urcullu', NULL, NULL, NULL, 1),
(92, 'Carl', 'Williams', 'Carl Williams', NULL, NULL, NULL, 1),
(93, 'Casildo', 'Bailen', 'Casildo Bailen', NULL, NULL, NULL, 1),
(94, 'Charlie', 'Miller', 'Charlie Miller', NULL, NULL, NULL, 1),
(95, 'Charlotte', 'Evans', 'Charlotte Evans', NULL, NULL, NULL, 1),
(96, 'Christiansen', 'Berg Nilsen', 'Christiansen Berg Nilsen', NULL, NULL, NULL, 1),
(97, 'David', 'Lopez', 'David Lopez', NULL, NULL, NULL, 1),
(98, 'Dekay', 'Bajer', 'Dekay Bajer', NULL, NULL, NULL, 1),
(99, 'Dennis', 'Smith', 'Dennis Smith', NULL, NULL, NULL, 1),
(100, 'Dionisio', 'Rivas', 'Dionisio Rivas', NULL, NULL, NULL, 1),
(101, 'Dominic', 'West', 'Dominic West', NULL, NULL, NULL, 1),
(102, 'Crake', 'Tyson', 'Crake Tyson', NULL, NULL, NULL, 1),
(103, 'Dylan', 'Black Bunny', 'Dylan Black Bunny', NULL, NULL, NULL, 1),
(104, 'Dylan', 'Tyson', 'Dylan Tyson', NULL, NULL, NULL, 1),
(105, 'Elisa', 'Santos', 'Elisa Santos', NULL, NULL, NULL, 1),
(106, 'Eneko', 'Toribio', 'Eneko Toribio', NULL, NULL, NULL, 1),
(107, 'Enric', 'Ruiz', 'Enric Ruiz', NULL, NULL, NULL, 1),
(108, 'Enzo', 'Montana', 'Enzo Montana', NULL, NULL, NULL, 1),
(109, 'Euctavia', 'Liksickfruna', 'Euctavia Liksickfruna', NULL, NULL, NULL, 1),
(110, 'Faliyo', 'Heredia', 'Faliyo Heredia', NULL, NULL, NULL, 1),
(111, 'Felipe', 'Huertín', 'Felipe Huertín', NULL, NULL, NULL, 1),
(112, 'Fran', 'Heredia', 'Fran Heredia', NULL, NULL, NULL, 1),
(113, 'Frank', 'Peterson', 'Frank Peterson', NULL, NULL, NULL, 1),
(114, 'Frans', 'Eriksen', 'Frans Eriksen', NULL, NULL, NULL, 1),
(115, 'Gazzy', 'Walker', 'Gazzy Walker', NULL, NULL, NULL, 1),
(116, 'Gerard', 'Sullivan', 'Gerard Sullivan', NULL, NULL, NULL, 1),
(117, 'Guzman', 'Diaz', 'Guzman Diaz', NULL, NULL, NULL, 1),
(118, 'Hector', 'Vera', 'Hector Vera', NULL, NULL, NULL, 1),
(119, 'Herenoche', 'Heredia', 'Herenoche Heredia', NULL, NULL, NULL, 1),
(120, 'Isaac', 'Petrov', 'Isaac Petrov', NULL, NULL, NULL, 1),
(121, 'Izan', 'Smith', 'Izan Smith', NULL, NULL, NULL, 1),
(122, 'Jackson', 'Brown', 'Jackson Brown', NULL, NULL, NULL, 1),
(123, 'Jackson', 'Nate', 'Jackson Nate', NULL, NULL, NULL, 1),
(124, 'Jafed', 'Nathan', 'Jafed Nathan', NULL, NULL, NULL, 1),
(125, 'James', 'Anderson', 'James Anderson', NULL, NULL, NULL, 1),
(126, 'James', 'Lamar', 'James Lamar', NULL, NULL, NULL, 1),
(127, 'Jane', 'Austen', 'Jane Austen', NULL, NULL, NULL, 1),
(128, 'Jarod', 'Brown', 'Jarod Brown', NULL, NULL, NULL, 1),
(129, 'Jarrius', 'Brown', 'Jarrius Brown', NULL, NULL, NULL, 1),
(130, 'Jayden', 'Jackson', 'Jayden Jackson', NULL, NULL, NULL, 1),
(131, 'Jayden', 'Santos', 'Jayden Santos', NULL, NULL, NULL, 1),
(132, 'Jen', 'Scofilt', 'Jen Scofilt', NULL, NULL, NULL, 1),
(133, 'Jerry', 'Toppin', 'Jerry Toppin', NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `denuncias`
--

CREATE TABLE `denuncias` (
  `id` int(11) NOT NULL,
  `ciudadano_id` int(11) NOT NULL,
  `denunciado` varchar(50) NOT NULL,
  `testigos` varchar(50) DEFAULT NULL,
  `lugar` varchar(50) DEFAULT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `denuncia` varchar(500) NOT NULL,
  `pruebas` varchar(250) DEFAULT NULL,
  `imagenes_id` varchar(20) DEFAULT NULL,
  `estado` tinyint(1) NOT NULL,
  `agente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detenciones`
--

CREATE TABLE `detenciones` (
  `id` int(11) NOT NULL,
  `id_ciudadanos` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `objetos` varchar(250) NOT NULL,
  `detalles` varchar(500) DEFAULT NULL,
  `agente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2021-05-13 00:20:42.201588', '4', 'asd', 1, '[{\"added\": {}}]', 3, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(5, 'admin', 'logentry'),
(2, 'auth', 'group'),
(1, 'auth', 'permission'),
(3, 'auth', 'user'),
(4, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(7, 'web', 'ciudadanos'),
(8, 'web', 'policia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2021-05-07 15:59:46.875887'),
(2, 'auth', '0001_initial', '2021-05-07 15:59:47.072749'),
(3, 'contenttypes', '0002_remove_content_type_name', '2021-05-07 15:59:47.822176'),
(4, 'auth', '0002_alter_permission_name_max_length', '2021-05-07 15:59:47.904288'),
(5, 'auth', '0003_alter_user_email_max_length', '2021-05-07 15:59:47.921557'),
(6, 'auth', '0004_alter_user_username_opts', '2021-05-07 15:59:47.935698'),
(7, 'auth', '0005_alter_user_last_login_null', '2021-05-07 15:59:47.995675'),
(8, 'auth', '0006_require_contenttypes_0002', '2021-05-07 15:59:47.999636'),
(9, 'auth', '0007_alter_validators_add_error_messages', '2021-05-07 15:59:48.007656'),
(10, 'auth', '0008_alter_user_username_max_length', '2021-05-07 15:59:48.024211'),
(11, 'auth', '0009_alter_user_last_name_max_length', '2021-05-07 15:59:48.039171'),
(12, 'auth', '0010_alter_group_name_max_length', '2021-05-07 15:59:48.055148'),
(13, 'auth', '0011_update_proxy_permissions', '2021-05-07 15:59:48.063182'),
(14, 'auth', '0012_alter_user_first_name_max_length', '2021-05-07 15:59:48.081430'),
(15, 'admin', '0001_initial', '2021-05-07 15:59:53.363793'),
(16, 'admin', '0002_logentry_remove_auto_add', '2021-05-07 15:59:53.531853'),
(17, 'admin', '0003_logentry_add_action_flag_choices', '2021-05-07 15:59:53.540828'),
(18, 'sessions', '0001_initial', '2021-05-07 15:59:53.635575'),
(19, 'web', '0001_initial', '2021-05-08 01:06:33.815395'),
(20, 'web', '0002_auto_20210508_0311', '2021-05-08 01:11:57.565135'),
(21, 'web', '0003_auto_20210508_0333', '2021-05-08 01:33:08.617868'),
(22, 'web', '0004_auto_20210508_1908', '2021-05-08 17:08:49.307415'),
(23, 'web', '0005_auto_20210509_1409', '2021-05-09 12:09:50.017703');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('08cy88mdevsmrn8d3r0flkkp5vsawwlo', '.eJxVjEEOwiAQAP_C2RBgae169O4byMIuUjWQlPZk_Ltp0oNeZybzVoG2tYStyxJmVhdl1emXRUpPqbvgB9V706nVdZmj3hN92K5vjeV1Pdq_QaFe9q2H6QxZ3GDd4CxKRi85JgYeGSeB7A2AJWcw-kkiYjLoidnLSGkY1ecL0so33g:1lfLBy:C5V-NSmYfQw39xlju4m82uA56hsiQ3-JgPG2e3iKQRo', '2021-05-22 11:32:18.056804'),
('31xshcv074nkgn9t5d61sqpd0hv4zdy5', '.eJxVjEEOgyAURO_CuiGCqNhl956BfD5DsW0gEV01vXs1cdHOct6beQtH25rcVrG4OYirUOLy23niJ_IBwoPyvUgueV1mLw9FnrTKqQS8bqf7d5Copn1NPgKBWjRoNRs9AqBRQXNsIrOxXdMxRWvNAK_MQHGP7oFIxoTei88XNs46Ew:1loUQ5:sAx4ngCRfSCOdNGRAbTsH5tAXpoNQCgkZfLoEzEgC-I', '2021-06-16 17:12:41.159296'),
('5ouwin7x90ki3gv0c6uyjb02jb5ndiqd', '.eJxVjEEOwiAQAP_C2RBgae169O4byMIuUjWQlPZk_Ltp0oNeZybzVoG2tYStyxJmVhdl1emXRUpPqbvgB9V706nVdZmj3hN92K5vjeV1Pdq_QaFe9q2H6QxZ3GDd4CxKRi85JgYeGSeB7A2AJWcw-kkiYjLoidnLSGkY1ecL0so33g:1lfOmI:FylEXwlPogWuMnVMiwyW8-TVog2JcdXcrjcfGGPWjhY', '2021-05-22 15:22:02.890558'),
('qmd1k5369nny943ymlh967uof1oal6t4', '.eJxVjEEOgyAURO_CuiGCqNhl956BfD5DsW0gEV01vXs1cdHOct6beQtH25rcVrG4OYirUOLy23niJ_IBwoPyvUgueV1mLw9FnrTKqQS8bqf7d5Copn1NPgKBWjRoNRs9AqBRQXNsIrOxXdMxRWvNAK_MQHGP7oFIxoTei88XNs46Ew:1lj9Qy:59NGKvVUSH4Qc4dYPTkeSiQ0Gy0m0yEMCphwgqmGoHI', '2021-06-01 23:47:32.699848'),
('tvqz81z6jydl019t6pj70zdcu8o2ukmr', '.eJxVjDsOAiEUAO9CbYh8FtDS3jOQ91NWDSTLbmW8uyHZQtuZybxVhm0teeuy5JnVWRl1-GUI9JQ6BD-g3pumVtdlRj0Svduur43lddnbv0GBXsaWCFI6-YQmCrA7Jks8-UQTeScRGbwjixjICMcQvIs-2kQ3cEZiYPX5AvHfODU:1m3ItX:a8YfGCZLL5xjCyCjplztmykH6KD9LSYaoo-aycJeix0', '2021-07-27 13:56:19.274115'),
('wsuhhb7p39yrmqb98hccgmcznzy52yw7', '.eJxVjEEOwiAQAP_C2RBgae169O4byMIuUjWQlPZk_Ltp0oNeZybzVoG2tYStyxJmVhdl1emXRUpPqbvgB9V706nVdZmj3hN92K5vjeV1Pdq_QaFe9q2H6QxZ3GDd4CxKRi85JgYeGSeB7A2AJWcw-kkiYjLoidnLSGkY1ecL0so33g:1lfOko:sUheVNfvXGXzOq1mbIoDBWgdBEQXWTwqdhgKrdra21A', '2021-05-22 15:20:30.463283'),
('wum4ihyksmpzjneradvqmaimjnvftm97', '.eJxVjEEOwiAQAP_C2RBgae169O4byMIuUjWQlPZk_Ltp0oNeZybzVoG2tYStyxJmVhdl1emXRUpPqbvgB9V706nVdZmj3hN92K5vjeV1Pdq_QaFe9q2H6QxZ3GDd4CxKRi85JgYeGSeB7A2AJWcw-kkiYjLoidnLSGkY1ecL0so33g:1lfgPv:praj46XNRC1jfrQec-8sE4mHOqL3xr7Ug9nZZOOt-DY', '2021-05-23 10:12:07.197492');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historico_multas`
--

CREATE TABLE `historico_multas` (
  `id` int(11) NOT NULL,
  `id_detenciones` int(11) NOT NULL,
  `id_multas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `imagenes`
--

CREATE TABLE `imagenes` (
  `id` int(11) NOT NULL,
  `imagenes_id` varchar(20) NOT NULL,
  `url` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `imagenes_ciudadanos`
--

CREATE TABLE `imagenes_ciudadanos` (
  `id` int(11) NOT NULL,
  `imagenes_id` varchar(20) NOT NULL,
  `url` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `imagenes_ciudadanos`
--

INSERT INTO `imagenes_ciudadanos` (`id`, `imagenes_id`, `url`) VALUES
(26, '20210713160211', 'https://media.discordapp.net/attachments/848986222638399548/864481189660983306/unknown.png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `licencias`
--

CREATE TABLE `licencias` (
  `id` int(11) NOT NULL,
  `ciudadano_id` int(11) NOT NULL,
  `tipos_licencias_id` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `psicotecnico` tinyint(1) DEFAULT NULL,
  `confirmacion` tinyint(1) DEFAULT NULL,
  `utilizacion` varchar(250) NOT NULL,
  `comentarios` varchar(250) DEFAULT NULL,
  `estado` tinyint(1) NOT NULL,
  `agente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `multas`
--

CREATE TABLE `multas` (
  `id` int(11) NOT NULL,
  `tipo_multas_id` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `articulo` varchar(50) NOT NULL,
  `tiempo` varchar(50) NOT NULL,
  `dinero` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `multas`
--

INSERT INTO `multas` (`id`, `tipo_multas_id`, `descripcion`, `articulo`, `tiempo`, `dinero`) VALUES
(1, 1, 'Intento de secuestro a civil', 'Art.6.1 ', '10 meses', 2000),
(2, 1, 'Secuestro a un civil', 'Art.6.2', '15 meses', 4000),
(3, 1, 'Intento de homicidio a un civil', 'Art.6.3', '10 meses', 7500),
(4, 1, 'Homicidio', 'Art.6.4', '15 meses', 15000),
(5, 1, 'Amenaza o extorsión a un ciudadano', 'Art.6.5', '0 meses', 3000),
(6, 1, 'Amenazar de muerte a un funcionario', 'Art.7.1.3', '0 meses', 5000),
(7, 1, 'Secuestro a un funcionario público', 'Art.7.3.1', '15 meses', 20000),
(8, 1, 'Amenazar a un funcionario con un arma', 'Art.7.3.2', '15 meses', 7000),
(9, 1, 'Intento de homicidio a funcionario público', 'Art.7.3.3', '10 meses', 10000),
(10, 1, 'Homicidio a un funcionario publico', 'Art.7.3.4', '15 meses', 12500),
(11, 1, 'Homicidio a múltiples funcionarios', 'Art.7.3.5', '20 meses', 25000),
(12, 1, 'Homicidio imprudente', 'Art.7.3.6', '10 meses', 7000),
(13, 1, 'Homicidio en defensa propia', 'Art.7.3.7', '15 meses', 10000),
(14, 2, 'Exceso de velocidad en vías urbanas', 'Art.1.1', '0 meses', 750),
(15, 2, 'Circular marcha atrás', 'Art.1.2', '0 meses', 450),
(16, 2, 'Saltarse un control', 'Art.1.3', '0 meses', 900),
(17, 2, 'Giro Indebido', 'Art.1.4', '0 meses', 500),
(18, 2, 'Circular en sentido contrario', 'Art.1.5', '0 meses', 650),
(19, 2, 'Conducir un vehículo en malas condiciones', 'Art.1.6', '0 meses', 500),
(20, 2, 'No ceder el paso a vehículos de emergencia', 'Art.1.7', '0 meses', 400),
(21, 2, 'Saltarse un semáforo', 'Art.1.8', '0 meses', 400),
(22, 2, 'Estacionar en zonas no habilitadas/obstaculizar', 'Art.1.9', '0 meses', 700),
(23, 2, 'Circular sin casco en la moto', 'Art.1.10', '0 meses', 350),
(24, 2, 'Huir de la justicia', 'Art.1.11', '10 meses', 3000),
(25, 2, 'Cómplice de huida de la justicia', 'Art.1.11.2', '5 meses', 1500),
(26, 2, 'Conducción temeraria', 'Art.1.12', '5 meses', 4000),
(27, 2, 'Conducir sin licencia', 'Art.1.13', '5 meses', 2500),
(28, 3, 'Alteración del orden público', 'Art.2.1', '0 meses', 1200),
(29, 3, 'Racismo', 'Art.2.3', '0 meses', 3000),
(30, 3, 'Dañar mobiliario público', 'Art.2.4', '0 meses', 1500),
(31, 3, 'Intento de violación', 'Art.2.5', '20 meses', 40000),
(32, 3, 'Violación', 'Art.2.6', '40 meses', 80000),
(33, 3, 'Acoso psicológico', 'Art.2.7', '20 meses', 12000),
(34, 3, 'Suplantación de identidad', 'Art.2.8', '15 meses', 8000),
(35, 3, 'Circular con el rostro tapado', 'Art.2.9', '0 meses', 2000),
(36, 3, 'Fraude o engaño', 'Art.2.10', '10 meses', 17000),
(37, 3, 'Acoso sexual', 'Art.2.11', '20 meses', 40000),
(38, 3, 'Negativa a identificarse', 'Art.2.12', '0 meses', 3000),
(39, 3, 'Obstrucción a la policía', 'Art.2.13', '0 meses', 5000),
(40, 3, 'Allanamiento de propiedad privada', 'Art.3.10', '5 meses', 4500),
(41, 3, 'Dar falsos testimonios o mentiras', 'Art.7.2', '10 meses', 5000),
(42, 3, 'Desacato a una autoridad', 'Art.7.1.1', '0 meses', 4500),
(43, 3, 'Insultar a un funcionario público', 'Art.7.1.2', '0 meses', 5000),
(44, 3, 'Agredir a un civil', 'Art.8.11', '0 meses', 3500),
(45, 3, 'Agredir a un funcionario publico', 'Art.7.1', '5 meses', 5000),
(46, 3, 'Estafa', 'Art.9.4', '10 meses', 7000),
(47, 3, 'Pesca sin licencia', 'Art.11.1', '10 meses', 4000),
(48, 3, 'Caza sin licencia', 'Art.11.2', '10 meses', 6000),
(49, 3, 'Falta de respeto a un civil', 'Art.2.2', '0 meses', 1300),
(50, 3, 'Suspender el programa de reinserción', 'Art.2.39', '0 meses', 10000),
(51, 4, 'Robo de vehículo', 'Art.3.1', '5 meses', 2000),
(52, 4, 'Robo mediante intimidación', 'Art.3.2', '10 meses', 3500),
(53, 4, 'Robo con violencia', 'Art.3.3', '15 meses', 5000),
(54, 4, 'Robo menor (licorería o badulake)', 'Art.3.4', '10 meses', 6000),
(55, 4, 'Robo a joyería con rehenes', 'Art.3.6', '15 meses', 20000),
(56, 4, 'Robo a sucursal con rehenes', 'Art.3.8', '20 meses', 30000),
(57, 4, 'Robo a banco', 'Art.3.9', '30 meses', 50000),
(58, 4, 'Robo a uno o varios agente', 'Art.7.3.7', '15 meses', 10000),
(59, 4, 'Robo a ATM', 'Art.12.1', '5 meses', 5000),
(60, 5, 'Posesión de armas ilegal (blanca) (si se ha utilizado)', 'Art.4.1', '0 meses', 3500),
(61, 5, 'Posesión de arma sin licencia (de fuego)', 'Art.4.1.1', '0 meses', 10000),
(62, 5, 'Posesión de arma ilegal (de fuego)', 'Art.4.1.3', '10 meses', 15000),
(63, 5, 'Tráfico de armas y/o munición', 'Art.4.4', '0 meses', 5000),
(64, 5, 'Posesión excesiva de munición', 'Art.4.4.1', '10 meses', 5000),
(65, 5, 'Posesión de dinero negro (a partir de 2000)', 'Art.4.5', '0 meses', 500),
(66, 5, 'Posesión de estupefacientes según cantidades', 'Art.5.1', '0 meses', 500),
(67, 5, 'Posesión de Canutos/Marihuana (por cada 10, 1500$)', 'Art.5.1.1', '5 meses', 1500),
(68, 5, 'Posesión Cocaína sin pastillas/procesada', 'Art.5.1.2', '15 meses', 300),
(69, 5, 'Posesión de Nevaditos', 'Art.5.1.3', '15 meses', 500),
(70, 5, 'Tráfico de drogas', 'Art.5.2', '5 meses', 4000),
(71, 5, 'Venta de Marihuana', 'Art.5.2', '15 meses', 8000),
(72, 5, 'Venta de Cocaína', 'Art.5.2', '20 meses', 12000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden_alejamiento`
--

CREATE TABLE `orden_alejamiento` (
  `id` int(11) NOT NULL,
  `ciudadano_id` int(11) NOT NULL,
  `denunciante` varchar(100) NOT NULL,
  `motivo` varchar(500) NOT NULL,
  `resolucion` varchar(500) DEFAULT NULL,
  `estado` tinyint(1) NOT NULL,
  `agente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `policia`
--

CREATE TABLE `policia` (
  `id` int(10) NOT NULL,
  `users_id` int(10) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `telefono` int(7) DEFAULT NULL,
  `placa` int(4) NOT NULL,
  `rango` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `policia`
--

INSERT INTO `policia` (`id`, `users_id`, `nombre`, `apellido`, `telefono`, `placa`, `rango`) VALUES
(1, 1, 'Admin', 'admin', NULL, 0, 1),
(27, 99, 'Shelby', 'Detallié', NULL, 1205, 1),
(29, 101, 'Lou', 'Street', NULL, 8459, 3),
(30, 102, 'Charlie', 'Campo', NULL, 427, 4),
(31, 103, 'Charlotte', 'Evans', NULL, 1307, 4),
(32, 104, 'Henry', 'Williams', NULL, 1414, 4),
(33, 105, 'Hellson', 'Smith', NULL, 1994, 4),
(34, 106, 'Aitor', 'Salazar', NULL, 2512, 5),
(35, 107, 'Rocky', 'Tinoco', NULL, 2208, 6),
(36, 108, 'Javier', 'Garcia', NULL, 8945, 6),
(37, 109, 'Samael', 'Holmes', NULL, 2315, 7),
(38, 110, 'James', 'Smith', NULL, 101, 7),
(39, 111, 'Ivanok', 'McKenzei', NULL, 191, 8),
(40, 112, 'Kalam', 'Keiolani', NULL, 5505, 8),
(41, 113, 'Santiago', 'Molina', NULL, 306, 8),
(42, 114, 'Steve', 'Ryan', NULL, 1506, 11),
(43, 115, 'Jackson', 'Miller', NULL, 9510, 9),
(44, 116, 'Arthur', 'Miller', NULL, 1736, 1),
(45, 117, 'Ale', 'González', NULL, 9804, 10),
(46, 118, 'Benjamín', 'Bucciarati', NULL, 13, 10),
(47, 119, 'Dylan', 'Hotchner', NULL, 4080, 10),
(48, 120, 'Felicitas', 'Martinez', NULL, 721, 10),
(49, 121, 'Giovanni', 'Bucciarati', NULL, 1225, 10),
(50, 122, 'Juan', 'Carlos', NULL, 1418, 10),
(51, 123, 'Mason', 'O\'connor', NULL, 9229, 10),
(52, 124, 'Valentino', 'Bucciarati', NULL, 4793, 10),
(53, 125, 'Wenceslao', 'O\'Neil', NULL, 1060, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rangos`
--

CREATE TABLE `rangos` (
  `id` int(10) NOT NULL,
  `rango` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `rangos`
--

INSERT INTO `rangos` (`id`, `rango`) VALUES
(1, 'Capitán'),
(2, 'Teniente'),
(3, 'Sargento II'),
(4, 'Sargento'),
(5, 'Inspector'),
(6, 'Subinspector'),
(7, 'Oficial III'),
(8, 'Oficial II'),
(9, 'Oficial I'),
(10, 'Cadete'),
(11, 'Alumno');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos_licencias`
--

CREATE TABLE `tipos_licencias` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipos_licencias`
--

INSERT INTO `tipos_licencias` (`id`, `descripcion`) VALUES
(1, 'Conducir'),
(2, 'Armas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos_multas`
--

CREATE TABLE `tipos_multas` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipos_multas`
--

INSERT INTO `tipos_multas` (`id`, `descripcion`) VALUES
(1, 'Homicidios | Secuestros | Amenazas'),
(2, 'Tráfico'),
(3, 'Sociedad'),
(4, 'Robos'),
(5, 'Armas y drogas');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indices de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indices de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indices de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `busca_captura`
--
ALTER TABLE `busca_captura`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ciudadano_id` (`ciudadano_id`);

--
-- Indices de la tabla `ciudadanos`
--
ALTER TABLE `ciudadanos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `creado_por` (`creado_por`),
  ADD KEY `imagenes_id` (`imagenes_id`);

--
-- Indices de la tabla `denuncias`
--
ALTER TABLE `denuncias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ciudadano_id` (`ciudadano_id`),
  ADD KEY `imagenes_id` (`imagenes_id`);

--
-- Indices de la tabla `detenciones`
--
ALTER TABLE `detenciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_ciudadanos` (`id_ciudadanos`);

--
-- Indices de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indices de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indices de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indices de la tabla `historico_multas`
--
ALTER TABLE `historico_multas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_detenciones` (`id_detenciones`),
  ADD KEY `id_multas` (`id_multas`);

--
-- Indices de la tabla `imagenes`
--
ALTER TABLE `imagenes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `imagenes_id` (`imagenes_id`);

--
-- Indices de la tabla `imagenes_ciudadanos`
--
ALTER TABLE `imagenes_ciudadanos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `imagenes_id` (`imagenes_id`);

--
-- Indices de la tabla `licencias`
--
ALTER TABLE `licencias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ciudadano_id` (`ciudadano_id`),
  ADD KEY `tipo` (`tipos_licencias_id`);

--
-- Indices de la tabla `multas`
--
ALTER TABLE `multas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tipo_multas_id` (`tipo_multas_id`);

--
-- Indices de la tabla `orden_alejamiento`
--
ALTER TABLE `orden_alejamiento`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ciudadano_id` (`ciudadano_id`);

--
-- Indices de la tabla `policia`
--
ALTER TABLE `policia`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_id` (`users_id`),
  ADD KEY `rango` (`rango`);

--
-- Indices de la tabla `rangos`
--
ALTER TABLE `rangos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indices de la tabla `tipos_licencias`
--
ALTER TABLE `tipos_licencias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipos_multas`
--
ALTER TABLE `tipos_multas`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=127;

--
-- AUTO_INCREMENT de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `busca_captura`
--
ALTER TABLE `busca_captura`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `ciudadanos`
--
ALTER TABLE `ciudadanos`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=136;

--
-- AUTO_INCREMENT de la tabla `denuncias`
--
ALTER TABLE `denuncias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `detenciones`
--
ALTER TABLE `detenciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `historico_multas`
--
ALTER TABLE `historico_multas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT de la tabla `imagenes`
--
ALTER TABLE `imagenes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `imagenes_ciudadanos`
--
ALTER TABLE `imagenes_ciudadanos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de la tabla `licencias`
--
ALTER TABLE `licencias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `multas`
--
ALTER TABLE `multas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT de la tabla `orden_alejamiento`
--
ALTER TABLE `orden_alejamiento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `policia`
--
ALTER TABLE `policia`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT de la tabla `rangos`
--
ALTER TABLE `rangos`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `tipos_licencias`
--
ALTER TABLE `tipos_licencias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tipos_multas`
--
ALTER TABLE `tipos_multas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Filtros para la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Filtros para la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `busca_captura`
--
ALTER TABLE `busca_captura`
  ADD CONSTRAINT `busca_captura_ibfk_1` FOREIGN KEY (`ciudadano_id`) REFERENCES `ciudadanos` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `ciudadanos`
--
ALTER TABLE `ciudadanos`
  ADD CONSTRAINT `ciudadanos_ibfk_1` FOREIGN KEY (`creado_por`) REFERENCES `policia` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `denuncias`
--
ALTER TABLE `denuncias`
  ADD CONSTRAINT `denuncias_ibfk_1` FOREIGN KEY (`ciudadano_id`) REFERENCES `ciudadanos` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `detenciones`
--
ALTER TABLE `detenciones`
  ADD CONSTRAINT `detenciones_ibfk_1` FOREIGN KEY (`id_ciudadanos`) REFERENCES `ciudadanos` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `historico_multas`
--
ALTER TABLE `historico_multas`
  ADD CONSTRAINT `historico_multas_ibfk_1` FOREIGN KEY (`id_detenciones`) REFERENCES `detenciones` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `historico_multas_ibfk_2` FOREIGN KEY (`id_multas`) REFERENCES `multas` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `imagenes`
--
ALTER TABLE `imagenes`
  ADD CONSTRAINT `imagenes_ibfk_1` FOREIGN KEY (`imagenes_id`) REFERENCES `denuncias` (`imagenes_id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `imagenes_ciudadanos`
--
ALTER TABLE `imagenes_ciudadanos`
  ADD CONSTRAINT `imagenes_ciudadanos_ibfk_1` FOREIGN KEY (`imagenes_id`) REFERENCES `ciudadanos` (`imagenes_id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `licencias`
--
ALTER TABLE `licencias`
  ADD CONSTRAINT `licencias_ibfk_1` FOREIGN KEY (`ciudadano_id`) REFERENCES `ciudadanos` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `licencias_ibfk_2` FOREIGN KEY (`tipos_licencias_id`) REFERENCES `tipos_licencias` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `multas`
--
ALTER TABLE `multas`
  ADD CONSTRAINT `multas_ibfk_1` FOREIGN KEY (`tipo_multas_id`) REFERENCES `tipos_multas` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `orden_alejamiento`
--
ALTER TABLE `orden_alejamiento`
  ADD CONSTRAINT `orden_alejamiento_ibfk_1` FOREIGN KEY (`ciudadano_id`) REFERENCES `ciudadanos` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `policia`
--
ALTER TABLE `policia`
  ADD CONSTRAINT `policia_ibfk_1` FOREIGN KEY (`users_id`) REFERENCES `auth_user` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `policia_ibfk_2` FOREIGN KEY (`rango`) REFERENCES `rangos` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
