-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-02-2021 a las 19:19:23
-- Versión del servidor: 10.4.17-MariaDB
-- Versión de PHP: 7.3.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `gasolinera`
--
CREATE DATABASE IF NOT EXISTS `gasolinera` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `gasolinera`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add producto', 7, 'add_producto'),
(26, 'Can change producto', 7, 'change_producto'),
(27, 'Can delete producto', 7, 'delete_producto'),
(28, 'Can view producto', 7, 'view_producto'),
(29, 'Can add vehiculo', 8, 'add_vehiculo'),
(30, 'Can change vehiculo', 8, 'change_vehiculo'),
(31, 'Can delete vehiculo', 8, 'delete_vehiculo'),
(32, 'Can view vehiculo', 8, 'view_vehiculo'),
(33, 'Can add cliente', 9, 'add_cliente'),
(34, 'Can change cliente', 9, 'change_cliente'),
(35, 'Can delete cliente', 9, 'delete_cliente'),
(36, 'Can view cliente', 9, 'view_cliente'),
(37, 'Can add detalle', 10, 'add_detalle'),
(38, 'Can change detalle', 10, 'change_detalle'),
(39, 'Can delete detalle', 10, 'delete_detalle'),
(40, 'Can view detalle', 10, 'view_detalle'),
(41, 'Can add venta', 11, 'add_venta'),
(42, 'Can change venta', 11, 'change_venta'),
(43, 'Can delete venta', 11, 'delete_venta'),
(44, 'Can view venta', 11, 'view_venta');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(9, 'modelo', 'cliente'),
(10, 'modelo', 'detalle'),
(7, 'modelo', 'producto'),
(8, 'modelo', 'vehiculo'),
(11, 'modelo', 'venta'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2021-02-25 12:21:44.120939'),
(2, 'auth', '0001_initial', '2021-02-25 12:21:47.225577'),
(3, 'admin', '0001_initial', '2021-02-25 12:21:53.642485'),
(4, 'admin', '0002_logentry_remove_auto_add', '2021-02-25 12:21:55.285327'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2021-02-25 12:21:55.318913'),
(6, 'contenttypes', '0002_remove_content_type_name', '2021-02-25 12:21:55.806575'),
(7, 'auth', '0002_alter_permission_name_max_length', '2021-02-25 12:21:56.526027'),
(8, 'auth', '0003_alter_user_email_max_length', '2021-02-25 12:21:56.641671'),
(9, 'auth', '0004_alter_user_username_opts', '2021-02-25 12:21:56.678960'),
(10, 'auth', '0005_alter_user_last_login_null', '2021-02-25 12:21:57.089785'),
(11, 'auth', '0006_require_contenttypes_0002', '2021-02-25 12:21:57.139328'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2021-02-25 12:21:57.183308'),
(13, 'auth', '0008_alter_user_username_max_length', '2021-02-25 12:21:57.264596'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2021-02-25 12:21:57.413375'),
(15, 'auth', '0010_alter_group_name_max_length', '2021-02-25 12:21:57.594002'),
(16, 'auth', '0011_update_proxy_permissions', '2021-02-25 12:21:57.629572'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2021-02-25 12:21:57.697530'),
(18, 'sessions', '0001_initial', '2021-02-25 12:21:58.281334'),
(19, 'modelo', '0001_initial', '2021-02-25 12:42:53.186877'),
(20, 'modelo', '0002_auto_20210227_1417', '2021-02-27 19:17:45.880172'),
(21, 'modelo', '0003_auto_20210228_0109', '2021-02-28 06:09:34.273775'),
(22, 'modelo', '0004_venta_placas', '2021-02-28 14:34:49.212589'),
(23, 'modelo', '0005_auto_20210228_0935', '2021-02-28 14:36:00.657701'),
(24, 'modelo', '0006_auto_20210228_1205', '2021-02-28 17:05:43.577084');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_session`
--

DROP TABLE IF EXISTS `django_session`;
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modelo_cliente`
--

DROP TABLE IF EXISTS `modelo_cliente`;
CREATE TABLE IF NOT EXISTS `modelo_cliente` (
  `cli_id` int(11) NOT NULL AUTO_INCREMENT,
  `cedula` varchar(10) NOT NULL,
  `nombres` varchar(70) NOT NULL,
  `apellidos` varchar(70) NOT NULL,
  `genero` varchar(20) NOT NULL,
  `correo` varchar(105) NOT NULL,
  `celular` varchar(15) NOT NULL,
  `direccion` varchar(200) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  PRIMARY KEY (`cli_id`),
  UNIQUE KEY `cedula` (`cedula`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `modelo_cliente`
--

INSERT INTO `modelo_cliente` (`cli_id`, `cedula`, `nombres`, `apellidos`, `genero`, `correo`, `celular`, `direccion`, `date_created`) VALUES
(3, '1111111', 'Byron Alexander', 'Herrera', 'masculino', 'byron.herrera@unl.edu.ec', '0969677432', 'Catamayo', '2021-02-28 16:26:48.437602'),
(4, '2222222', 'Carlos', 'Faroz', 'masculino', 'as@sad', '099999', 'Loja', '2021-02-28 17:16:02.698530');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modelo_detalle`
--

DROP TABLE IF EXISTS `modelo_detalle`;
CREATE TABLE IF NOT EXISTS `modelo_detalle` (
  `detvent_id` int(11) NOT NULL AUTO_INCREMENT,
  `ngalones` varchar(20) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `producto_id` int(11) NOT NULL,
  PRIMARY KEY (`detvent_id`),
  KEY `modelo_detalle_producto_id_975c1ba5_fk_modelo_producto_prod_id` (`producto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `modelo_detalle`
--

INSERT INTO `modelo_detalle` (`detvent_id`, `ngalones`, `date_created`, `producto_id`) VALUES
(20, '44', '2021-02-28 17:28:47.347775', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modelo_producto`
--

DROP TABLE IF EXISTS `modelo_producto`;
CREATE TABLE IF NOT EXISTS `modelo_producto` (
  `prod_id` int(11) NOT NULL AUTO_INCREMENT,
  `precio` decimal(10,3) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `existencia` varchar(20) NOT NULL,
  `estado` tinyint(1) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  PRIMARY KEY (`prod_id`),
  UNIQUE KEY `modelo_producto_nombre_10cdbc77_uniq` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `modelo_producto`
--

INSERT INTO `modelo_producto` (`prod_id`, `precio`, `nombre`, `existencia`, `estado`, `date_created`) VALUES
(2, '1.500', 'Super', '2000', 1, '2021-02-27 19:46:03.820328'),
(3, '3.700', 'Ecopais', '3000', 1, '2021-02-27 19:46:26.170669'),
(5, '1.850', 'Diesel', '4500', 1, '2021-02-28 17:06:07.322874');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modelo_vehiculo`
--

DROP TABLE IF EXISTS `modelo_vehiculo`;
CREATE TABLE IF NOT EXISTS `modelo_vehiculo` (
  `vehiculo_id` int(11) NOT NULL AUTO_INCREMENT,
  `placas` varchar(7) NOT NULL,
  `cliente_id` int(11) NOT NULL,
  PRIMARY KEY (`vehiculo_id`),
  UNIQUE KEY `modelo_vehiculo_placas_0ccabfe8_uniq` (`placas`),
  KEY `modelo_vehiculo_cliente_id_fd666037_fk_modelo_cliente_cli_id` (`cliente_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `modelo_vehiculo`
--

INSERT INTO `modelo_vehiculo` (`vehiculo_id`, `placas`, `cliente_id`) VALUES
(6, 'PSE0881', 3),
(7, 'ABL0875', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modelo_venta`
--

DROP TABLE IF EXISTS `modelo_venta`;
CREATE TABLE IF NOT EXISTS `modelo_venta` (
  `vent_id` int(11) NOT NULL AUTO_INCREMENT,
  `total` decimal(10,3) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `detalle_id` int(11) NOT NULL,
  `vehiculo_id` int(11) NOT NULL,
  `placas` varchar(10) NOT NULL,
  PRIMARY KEY (`vent_id`),
  KEY `modelo_venta_detalle_id_029dceeb_fk_modelo_detalle_detvent_id` (`detalle_id`),
  KEY `modelo_venta_vehiculo_id_1ad7f8e1_fk_modelo_vehiculo_vehiculo_id` (`vehiculo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

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
-- Filtros para la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `modelo_detalle`
--
ALTER TABLE `modelo_detalle`
  ADD CONSTRAINT `modelo_detalle_producto_id_975c1ba5_fk_modelo_producto_prod_id` FOREIGN KEY (`producto_id`) REFERENCES `modelo_producto` (`prod_id`);

--
-- Filtros para la tabla `modelo_vehiculo`
--
ALTER TABLE `modelo_vehiculo`
  ADD CONSTRAINT `modelo_vehiculo_cliente_id_fd666037_fk_modelo_cliente_cli_id` FOREIGN KEY (`cliente_id`) REFERENCES `modelo_cliente` (`cli_id`);

--
-- Filtros para la tabla `modelo_venta`
--
ALTER TABLE `modelo_venta`
  ADD CONSTRAINT `modelo_venta_detalle_id_029dceeb_fk_modelo_detalle_detvent_id` FOREIGN KEY (`detalle_id`) REFERENCES `modelo_detalle` (`detvent_id`),
  ADD CONSTRAINT `modelo_venta_vehiculo_id_1ad7f8e1_fk_modelo_vehiculo_vehiculo_id` FOREIGN KEY (`vehiculo_id`) REFERENCES `modelo_vehiculo` (`vehiculo_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
