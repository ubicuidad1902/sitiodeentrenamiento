-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-10-2023 a las 01:43:12
-- Versión del servidor: 10.4.14-MariaDB
-- Versión de PHP: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `nemesis3punto1416`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `arquitectura`
--

CREATE TABLE `arquitectura` (
  `idarquitectura` int(11) NOT NULL,
  `nombre` varchar(70) NOT NULL,
  `ubicacion` longtext NOT NULL,
  `likes` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `arquitectura`
--

INSERT INTO `arquitectura` (`idarquitectura`, `nombre`, `ubicacion`, `likes`) VALUES
(1, 'plaza de Toros Carmelo Pérez', 'Calle Corregidora esquina Calle Macias', 0),
(2, 'Presidencia', 'Independencia 4', 39),
(3, 'kiosco', 'plaza de armas', 80),
(4, 'Palacio municipal', 'Plaza de armas', 0),
(5, 'puente morelos', 'oriente del pueblo', 0),
(9, '', '', 0),
(10, 'Casas reales', 'Centro histórico', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `atractivos_naturales`
--

CREATE TABLE `atractivos_naturales` (
  `idatractivos_naturales` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `ubicacion` longtext NOT NULL,
  `likes` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `atractivos_naturales`
--

INSERT INTO `atractivos_naturales` (`idatractivos_naturales`, `nombre`, `ubicacion`, `likes`) VALUES
(1, 'Presa', 'Sur', 0),
(2, 'El Salto del Gavilán', '6 km al sur de la ciudad', 50),
(3, 'La barranca del Tigre', '', 0),
(4, 'Arroyo de la Pimienta', 'Valverde', 0),
(5, 'Cerrito de Cristo Rey', 'Carretera Valle - San Miguel', 0),
(6, 'El ojo de agua', 'Oriene de la cabecera', 0),
(9, 'La Pimienta', 'El Bajío', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentarios_an`
--

CREATE TABLE `comentarios_an` (
  `idcomentarios_an` int(11) NOT NULL,
  `comentario` varchar(200) NOT NULL,
  `calificacion` int(11) NOT NULL,
  `fecha_comentario` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` enum('a','e') NOT NULL DEFAULT 'a',
  `likes` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_an` int(11) NOT NULL,
  `url` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `comentarios_an`
--

INSERT INTO `comentarios_an` (`idcomentarios_an`, `comentario`, `calificacion`, `fecha_comentario`, `estado`, `likes`, `id_usuario`, `id_an`, `url`) VALUES
(1, 'Se llenó el 7 de agosto de 1947', 5, '2023-06-16 06:00:00', 'a', 13, 2, 1, ''),
(2, 'Se llama El Charco Grande', 10, '0000-00-00 00:00:00', 'a', 20, 3, 1, ''),
(5, 'Se realizó en la administración de Antonio Ramírez', 8, '2023-06-16 06:00:00', 'a', 11, 2, 1, ''),
(6, 'Es una cortina de 53 metros', 5, '2023-06-16 06:00:00', 'a', 14, 2, 2, ''),
(7, 'Poblado de robles y encinos', 5, '2023-06-16 06:00:00', 'a', 57, 2, 2, ''),
(8, 'Habitaba ahí el gato montés y venado', 8, '2023-06-16 06:00:00', 'a', 56, 2, 2, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentarios_arq`
--

CREATE TABLE `comentarios_arq` (
  `idcomentarios_arq` int(11) NOT NULL,
  `comentario` longtext NOT NULL,
  `fecha_comentario` varchar(45) NOT NULL,
  `estado` enum('a','e') NOT NULL DEFAULT 'a',
  `url` varchar(150) NOT NULL,
  `likes` int(11) NOT NULL DEFAULT 0,
  `id_usuario` int(11) NOT NULL,
  `id_arq` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `comentarios_arq`
--

INSERT INTO `comentarios_arq` (`idcomentarios_arq`, `comentario`, `fecha_comentario`, `estado`, `url`, `likes`, `id_usuario`, `id_arq`) VALUES
(2, 'Se realizó en el siglo XIX', '2023-06-22', 'a', '', 18, 1, 1),
(3, 'Se inauguró en 1904', '2023-06-22', 'a', '', 12, 1, 2),
(4, 'Se inauguró en 1910', '22-06-2023', 'a', '', 40, 1, 3),
(6, 'Se remodeló en la administración 2007', '2023-06-22', 'a', '', 24, 2, 1),
(7, 'Ha albergado a grandes toreros', '2023-06-22', 'a', '', 28, 3, 1),
(8, 'Vino a inaugurar el Gral. Ramírez', '2023-06-22', 'a', '', 19, 2, 2),
(9, 'A mediados del siglo XX se le cambió el piso', '2023-06-22', 'a', '', 16, 2, 2),
(10, 'Se inauguró un 14 de septiembre', '2023-06-22', 'a', '', 76, 1, 3),
(11, 'Es de estilo porfiriano', '2023-06-16', 'a', '', 58, 2, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentarios_efemerides`
--

CREATE TABLE `comentarios_efemerides` (
  `idcomentarios_efemerides` int(11) NOT NULL,
  `comentario` varchar(200) NOT NULL,
  `id_efemeride` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `likes` int(11) NOT NULL,
  `estado` enum('a','e') NOT NULL DEFAULT 'a',
  `url` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentarios_noticias`
--

CREATE TABLE `comentarios_noticias` (
  `idcomentarios_noticias` int(11) NOT NULL,
  `comentario` varchar(200) NOT NULL,
  `id_noticias` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `likes` int(11) NOT NULL,
  `estado` enum('a','e') NOT NULL DEFAULT 'a',
  `url` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentarios_personajes`
--

CREATE TABLE `comentarios_personajes` (
  `idcomentarios_tradicion` int(11) NOT NULL,
  `comentario` varchar(200) NOT NULL,
  `id_personajes` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `likes` int(11) NOT NULL,
  `estado` enum('a','e') NOT NULL DEFAULT 'a',
  `url` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentarios_servicios`
--

CREATE TABLE `comentarios_servicios` (
  `idcomentarios_servicios` int(11) NOT NULL,
  `comentario` varchar(200) NOT NULL,
  `id_servicios` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `likes` int(11) NOT NULL,
  `estado` enum('a','e') NOT NULL DEFAULT 'a',
  `url` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentarios_tr`
--

CREATE TABLE `comentarios_tr` (
  `idcomentarios_tr` int(11) NOT NULL,
  `comentario` longtext NOT NULL,
  `fecha_comentario` varchar(45) NOT NULL,
  `estado` enum('a','e') NOT NULL DEFAULT 'a',
  `url` varchar(150) NOT NULL,
  `likes` int(11) NOT NULL DEFAULT 0,
  `id_usuario` int(11) NOT NULL,
  `id_tr` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `comentarios_tr`
--

INSERT INTO `comentarios_tr` (`idcomentarios_tr`, `comentario`, `fecha_comentario`, `estado`, `url`, `likes`, `id_usuario`, `id_tr`) VALUES
(1, 'Es el templo más antiguo de la población', '2023-06-23', 'a', '', 83, 1, 2),
(2, 'Se remodeló durante la Cristera', '2023-06-22', 'a', '', 201, 2, 2),
(3, 'Anteriormente estaba recubierto de azul', '2023-06-22', 'a', '', 240, 1, 2),
(4, 'Se bendijo el 23 de mayo de 1870', '2023-06-22', 'a', '', 279, 1, 3),
(5, 'Es un templo sobrio y elegante', '2023-06-22', 'a', '', 247, 2, 3),
(6, 'Se dedicó con el Sr. Cura Padilla', '2023-06-22', 'a', '', 186, 3, 3),
(8, 'Se le llama también obelisco', '2023-06-29', 'a', '', 80, 1, 1),
(9, 'Común en las grandes civilizaciones de occidente', '2023-06-29', 'a', '', 94, 1, 1),
(10, 'Establece como fecha de fundación 1625', '2023-06-29', 'a', '', 107, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentarios_tradicion`
--

CREATE TABLE `comentarios_tradicion` (
  `idcomentarios_tradicion` int(11) NOT NULL,
  `comentario` varchar(200) NOT NULL,
  `id_tradicion` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `likes` int(11) NOT NULL,
  `estado` enum('a','e') NOT NULL DEFAULT 'a',
  `url` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datosgenerales`
--

CREATE TABLE `datosgenerales` (
  `iddatosgenerales` int(11) NOT NULL,
  `titulo_dato` varchar(45) NOT NULL,
  `resena` varchar(200) NOT NULL,
  `likes` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `datosgenerales`
--

INSERT INTO `datosgenerales` (`iddatosgenerales`, `titulo_dato`, `resena`, `likes`) VALUES
(1, 'Clima', 'Clima semidesértico del municipio', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `efemerides`
--

CREATE TABLE `efemerides` (
  `idefemerides` int(11) NOT NULL,
  `titulo_efemeride` varchar(60) NOT NULL,
  `fecha` datetime NOT NULL,
  `resena` varchar(200) NOT NULL,
  `estado` enum('a','e') NOT NULL DEFAULT 'a',
  `likes` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `efemerides`
--

INSERT INTO `efemerides` (`idefemerides`, `titulo_efemeride`, `fecha`, `resena`, `estado`, `likes`) VALUES
(1, 'Nevada histórica', '2023-06-02 17:32:15', 'Aniversario de la nevada', 'a', 0),
(2, 'Salida de sexto', '1981-02-19 19:00:00', 'treinta de junio mil novecientos noventa y tres', 'a', 100),
(3, 'Salida de secundaria', '1981-02-19 19:00:00', 'Diez de julio de mil novecientos noventa y seis', 'a', 100),
(4, 'Salida de secundaria', '1981-02-19 19:00:00', 'Diez de julio de mil novecientos noventa y seis', 'a', 100),
(5, 'Salida de secundaria', '1981-02-19 19:00:00', 'Diez de julio de mil novecientos noventa y seis', 'a', 100),
(6, 'Salida de prepa', '1981-02-19 19:00:00', 'Primero de julio de mil novecientos noventa y nueve', 'a', 100);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `eventos`
--

CREATE TABLE `eventos` (
  `ideventos` int(10) UNSIGNED NOT NULL,
  `titulo` varchar(45) NOT NULL,
  `sub_titulo` varchar(45) NOT NULL,
  `fecha_publicacion` datetime NOT NULL,
  `fecha_evento` datetime NOT NULL,
  `resena` longtext NOT NULL,
  `categoria` enum('r','c') NOT NULL DEFAULT 'r',
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `eventos`
--

INSERT INTO `eventos` (`ideventos`, `titulo`, `sub_titulo`, `fecha_publicacion`, `fecha_evento`, `resena`, `categoria`, `id_usuario`) VALUES
(0, 'Bendición', 'Dos mil veintinueve', '2023-10-05 06:18:25', '2023-10-20 20:00:42', 'Templo Fray Reginaldo', 'r', 9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `imagenes_an`
--

CREATE TABLE `imagenes_an` (
  `idimagenes_an` int(11) NOT NULL,
  `ruta_imagen` varchar(150) NOT NULL,
  `estado` enum('a','e') NOT NULL,
  `fecha_publicacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `id_an` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `imagenes_arq`
--

CREATE TABLE `imagenes_arq` (
  `idimagenes_arq` int(11) NOT NULL,
  `ruta_imagen` varchar(150) NOT NULL,
  `estado` enum('a','e') NOT NULL,
  `fecha_publicacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `id_arq` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `imagenes_datosgenerales`
--

CREATE TABLE `imagenes_datosgenerales` (
  `idimagenes_dg` int(11) NOT NULL,
  `ruta_imagen` varchar(150) NOT NULL,
  `estado` enum('a','e') NOT NULL,
  `fecha_publicacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `id_dg` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `imagenes_noticias`
--

CREATE TABLE `imagenes_noticias` (
  `idimagenes_not` int(11) NOT NULL,
  `ruta_imagen` varchar(150) NOT NULL,
  `estado` enum('a','e') NOT NULL,
  `fecha_publicacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `id_not` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `imagenes_personajes`
--

CREATE TABLE `imagenes_personajes` (
  `idimagenes_personajes` int(11) NOT NULL,
  `ruta_imagen` varchar(150) NOT NULL,
  `fecha_publicacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `imagenes_servicios`
--

CREATE TABLE `imagenes_servicios` (
  `idimagenes_tradiciones` int(11) NOT NULL,
  `ruta_imagen` varchar(150) NOT NULL,
  `estado` enum('a','e') NOT NULL,
  `fecha_publicacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `id_servicios` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `imagenes_tr`
--

CREATE TABLE `imagenes_tr` (
  `idimagenes_tr` int(11) NOT NULL,
  `ruta_imagen` varchar(150) NOT NULL,
  `estado` enum('a','e') NOT NULL,
  `fecha_publicacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `id_tr` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `imagenes_trad`
--

CREATE TABLE `imagenes_trad` (
  `idimagenes_tradiciones` int(11) NOT NULL,
  `ruta_imagen` varchar(150) NOT NULL,
  `estado` enum('a','e') NOT NULL,
  `fecha_publicacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `id_tradiciones` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lugares`
--

CREATE TABLE `lugares` (
  `idlugares` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `noticias`
--

CREATE TABLE `noticias` (
  `idnoticias` int(11) NOT NULL,
  `Titulo_noticia` varchar(100) NOT NULL,
  `fecha` datetime NOT NULL,
  `Fecha_noticia` date NOT NULL,
  `resena` mediumtext NOT NULL,
  `estado('a', 'e')` enum('a','e') NOT NULL DEFAULT 'a',
  `likes` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `noticias`
--

INSERT INTO `noticias` (`idnoticias`, `Titulo_noticia`, `fecha`, `Fecha_noticia`, `resena`, `estado('a', 'e')`, `likes`) VALUES
(1, 'Semana cultural 2023', '0000-00-00 00:00:00', '2023-06-02', 'Semana de la Cultura', 'a', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personajes`
--

CREATE TABLE `personajes` (
  `idpersonajes` int(11) NOT NULL,
  `Nombre_personaje` varchar(50) NOT NULL,
  `fecha` datetime NOT NULL,
  `resena` varchar(200) NOT NULL,
  `likes` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `personajes`
--

INSERT INTO `personajes` (`idpersonajes`, `Nombre_personaje`, `fecha`, `resena`, `likes`) VALUES
(1, 'Cuco el de las tortas', '2023-06-02 17:46:34', 'María Tropeles', 0),
(2, 'Jesus Delgado', '0000-00-00 00:00:00', 'Intelectual principios siglo XX', 0),
(6, 'General Francisco Ramírez', '0000-00-00 00:00:00', 'Benefactor: dona escuelas.', 0),
(7, 'José María Lozano', '0000-00-00 00:00:00', 'orador', 0),
(8, 'José María Lozano', '0000-00-00 00:00:00', 'orador', 0),
(9, 'Genaro Alcala', '0000-00-00 00:00:00', 'Uno de los mejores presidentes', 0),
(10, 'Sabino Martín', '0000-00-00 00:00:00', 'Comerciante', 0),
(11, 'Sabino Martín', '0000-00-00 00:00:00', 'Comerciante', 0),
(12, 'Sabino Martín', '0000-00-00 00:00:00', 'Comerciante', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `idroles` int(11) NOT NULL,
  `rol` enum('administrador','usuario','reportero') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`idroles`, `rol`) VALUES
(1, 'administrador'),
(2, 'usuario'),
(4, 'reportero');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios`
--

CREATE TABLE `servicios` (
  `idservicios` int(11) NOT NULL,
  `titulo_servicio` varchar(50) NOT NULL,
  `fecha` datetime NOT NULL,
  `resena` varchar(200) NOT NULL,
  `likes` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `servicios`
--

INSERT INTO `servicios` (`idservicios`, `titulo_servicio`, `fecha`, `resena`, `likes`) VALUES
(1, '', '2023-06-02 18:06:25', 'Hotel Mesón de los Cristeros', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tradicion`
--

CREATE TABLE `tradicion` (
  `idtradicion` int(11) NOT NULL,
  `Nombre_tradicion` varchar(60) NOT NULL,
  `fecha_tradicion` datetime NOT NULL,
  `resena` varchar(200) NOT NULL,
  `likes` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tradicion`
--

INSERT INTO `tradicion` (`idtradicion`, `Nombre_tradicion`, `fecha_tradicion`, `resena`, `likes`) VALUES
(1, '', '0000-00-00 00:00:00', 'Serenata dominical', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `turismo_religioso`
--

CREATE TABLE `turismo_religioso` (
  `idturismo_religioso` int(11) NOT NULL,
  `nombre` varchar(70) NOT NULL,
  `ubicacion` longtext NOT NULL,
  `likes` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `turismo_religioso`
--

INSERT INTO `turismo_religioso` (`idturismo_religioso`, `nombre`, `ubicacion`, `likes`) VALUES
(1, 'Columna', 'Atrio parroquial', '0'),
(2, 'Santuario de la Purísima Concepción', 'Norte del atrio parroquial', '280'),
(3, 'Templo parroquial de San Miguel Arcángel', 'norte del atrio parroquial', '267');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `idusuarios` int(11) NOT NULL,
  `telefono` varchar(10) NOT NULL,
  `correo` varchar(40) NOT NULL,
  `nombre` varchar(14) NOT NULL DEFAULT 'USUARIO',
  `a_paterno` varchar(15) NOT NULL,
  `a_materno` varchar(15) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `genero` enum('Masculino','Femenino','LGBTIQA+') NOT NULL,
  `idroles` int(11) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`idusuarios`, `telefono`, `correo`, `nombre`, `a_paterno`, `a_materno`, `fecha_nacimiento`, `genero`, `idroles`, `password`) VALUES
(1, '3471110049', 'febrerodiecinueve@gmail.com', 'Juan Ramón', 'Jiménez', 'Jiménez', '0000-00-00', 'Masculino', 1, 'tortascucoychocomiles'),
(2, '3471107495', 'california@hotmail.com', 'Aaron', 'de la Torre', 'Muñoz', '0000-00-00', 'Masculino', 2, 'calixto'),
(3, '3471120305', 'hermosillo@hotmail.com', 'Gustavo', 'Hermosillo', 'Pérez', '0000-00-00', 'Masculino', 2, 'savagegarden'),
(8, '', '', 'USUARIO', '', '', '0000-00-00', '', 4, ''),
(9, '3471056792', 'himnosis@yahoo.com.mx', 'Joel', 'Hernández', 'Aguilar', '0000-00-00', 'Masculino', 4, 'inverosimilitud'),
(10, '356712904', 'jr@gmail.com', 'José', 'Romo', 'González', '2023-03-02', 'Masculino', 1, ''),
(12, '347293018', 'DAVA@gmail.com', 'Mauricio', 'Dávalos', 'Loza', '2023-10-20', 'Masculino', 1, '');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `arquitectura`
--
ALTER TABLE `arquitectura`
  ADD PRIMARY KEY (`idarquitectura`),
  ADD UNIQUE KEY `idturismo_religioso_UNIQUE` (`idarquitectura`),
  ADD UNIQUE KEY `nombre_UNIQUE` (`nombre`);

--
-- Indices de la tabla `atractivos_naturales`
--
ALTER TABLE `atractivos_naturales`
  ADD PRIMARY KEY (`idatractivos_naturales`),
  ADD UNIQUE KEY `idatractivos_naturales_UNIQUE` (`idatractivos_naturales`),
  ADD UNIQUE KEY `nombre_UNIQUE` (`nombre`),
  ADD UNIQUE KEY `ubicacion_UNIQUE` (`ubicacion`) USING HASH;

--
-- Indices de la tabla `comentarios_an`
--
ALTER TABLE `comentarios_an`
  ADD PRIMARY KEY (`idcomentarios_an`),
  ADD UNIQUE KEY `idcomentarios_an_UNIQUE` (`idcomentarios_an`),
  ADD KEY `fk_usuarios_comentarios_idx` (`id_usuario`),
  ADD KEY `fk_atractivonatural_comentarios_idx` (`id_an`);

--
-- Indices de la tabla `comentarios_arq`
--
ALTER TABLE `comentarios_arq`
  ADD PRIMARY KEY (`idcomentarios_arq`),
  ADD UNIQUE KEY `idcomentarios_tr_UNIQUE` (`idcomentarios_arq`),
  ADD KEY `fk_usuarios_comentarios_arq_idx` (`id_usuario`),
  ADD KEY `fk_arquitectura_comentarios_arq_idx` (`id_arq`);

--
-- Indices de la tabla `comentarios_efemerides`
--
ALTER TABLE `comentarios_efemerides`
  ADD PRIMARY KEY (`idcomentarios_efemerides`),
  ADD UNIQUE KEY `idcomentarios_efemerides_UNIQUE` (`idcomentarios_efemerides`),
  ADD KEY `fk_efemerides_comentarios_efemerides_idx` (`id_efemeride`);

--
-- Indices de la tabla `comentarios_noticias`
--
ALTER TABLE `comentarios_noticias`
  ADD PRIMARY KEY (`idcomentarios_noticias`),
  ADD UNIQUE KEY `idcomentarios_efemerides_UNIQUE` (`idcomentarios_noticias`),
  ADD KEY `fk_noticias_comentarios_noticias_idx` (`id_noticias`);

--
-- Indices de la tabla `comentarios_personajes`
--
ALTER TABLE `comentarios_personajes`
  ADD PRIMARY KEY (`idcomentarios_tradicion`),
  ADD UNIQUE KEY `idcomentarios_efemerides_UNIQUE` (`idcomentarios_tradicion`),
  ADD KEY `fk_personajes_comentarios_personajes_idx` (`id_personajes`);

--
-- Indices de la tabla `comentarios_servicios`
--
ALTER TABLE `comentarios_servicios`
  ADD PRIMARY KEY (`idcomentarios_servicios`),
  ADD UNIQUE KEY `idcomentarios_efemerides_UNIQUE` (`idcomentarios_servicios`),
  ADD KEY `fk_servicios_comentarios_servicios_idx` (`id_servicios`);

--
-- Indices de la tabla `comentarios_tr`
--
ALTER TABLE `comentarios_tr`
  ADD PRIMARY KEY (`idcomentarios_tr`),
  ADD UNIQUE KEY `idcomentarios_tr_UNIQUE` (`idcomentarios_tr`),
  ADD KEY `fk_usuarios_comentarios_tr_idx` (`id_usuario`),
  ADD KEY `fk_turismo_religioso_comentarios_tr_idx` (`id_tr`);

--
-- Indices de la tabla `comentarios_tradicion`
--
ALTER TABLE `comentarios_tradicion`
  ADD PRIMARY KEY (`idcomentarios_tradicion`),
  ADD UNIQUE KEY `idcomentarios_efemerides_UNIQUE` (`idcomentarios_tradicion`),
  ADD KEY `fk_tradicion_comentarios_tradicion_idx` (`id_tradicion`);

--
-- Indices de la tabla `datosgenerales`
--
ALTER TABLE `datosgenerales`
  ADD PRIMARY KEY (`iddatosgenerales`),
  ADD UNIQUE KEY `idefemerides_UNIQUE` (`iddatosgenerales`);

--
-- Indices de la tabla `efemerides`
--
ALTER TABLE `efemerides`
  ADD PRIMARY KEY (`idefemerides`),
  ADD UNIQUE KEY `idefemerides_UNIQUE` (`idefemerides`);

--
-- Indices de la tabla `eventos`
--
ALTER TABLE `eventos`
  ADD PRIMARY KEY (`ideventos`),
  ADD UNIQUE KEY `ideventos_UNIQUE` (`ideventos`),
  ADD UNIQUE KEY `titulo_UNIQUE` (`titulo`),
  ADD UNIQUE KEY `sub_titulo_UNIQUE` (`sub_titulo`),
  ADD KEY `fk_usuario_eventos_idx` (`id_usuario`);

--
-- Indices de la tabla `imagenes_an`
--
ALTER TABLE `imagenes_an`
  ADD PRIMARY KEY (`idimagenes_an`),
  ADD UNIQUE KEY `idimagenes_an_UNIQUE` (`idimagenes_an`),
  ADD UNIQUE KEY `id_imagen_UNIQUE` (`ruta_imagen`),
  ADD KEY `fk_atractivos_naturales_atractivos_naturales_idx` (`id_an`);

--
-- Indices de la tabla `imagenes_arq`
--
ALTER TABLE `imagenes_arq`
  ADD PRIMARY KEY (`idimagenes_arq`),
  ADD UNIQUE KEY `idimagenes_tr_UNIQUE` (`idimagenes_arq`),
  ADD UNIQUE KEY `ruta_imagen_UNIQUE` (`ruta_imagen`),
  ADD KEY `fk_turismo_religioso_imagenes_tr0_idx` (`id_arq`);

--
-- Indices de la tabla `imagenes_datosgenerales`
--
ALTER TABLE `imagenes_datosgenerales`
  ADD PRIMARY KEY (`idimagenes_dg`),
  ADD UNIQUE KEY `idimagenes_an_UNIQUE` (`idimagenes_dg`),
  ADD UNIQUE KEY `id_imagen_UNIQUE` (`ruta_imagen`),
  ADD KEY `fk_datosgenerales_imagenesdatosgenerales_idx` (`id_dg`);

--
-- Indices de la tabla `imagenes_noticias`
--
ALTER TABLE `imagenes_noticias`
  ADD PRIMARY KEY (`idimagenes_not`),
  ADD UNIQUE KEY `idimagenes_tr_UNIQUE` (`idimagenes_not`),
  ADD UNIQUE KEY `ruta_imagen_UNIQUE` (`ruta_imagen`),
  ADD KEY `fk_noticias_imagenes_noticias_idx` (`id_not`);

--
-- Indices de la tabla `imagenes_personajes`
--
ALTER TABLE `imagenes_personajes`
  ADD PRIMARY KEY (`idimagenes_personajes`),
  ADD UNIQUE KEY `idimagenes_tr_UNIQUE` (`idimagenes_personajes`),
  ADD UNIQUE KEY `ruta_imagen_UNIQUE` (`ruta_imagen`);

--
-- Indices de la tabla `imagenes_servicios`
--
ALTER TABLE `imagenes_servicios`
  ADD PRIMARY KEY (`idimagenes_tradiciones`),
  ADD UNIQUE KEY `idimagenes_tr_UNIQUE` (`idimagenes_tradiciones`),
  ADD UNIQUE KEY `ruta_imagen_UNIQUE` (`ruta_imagen`),
  ADD KEY `fk_servicios_imagenes_servicios_idx` (`id_servicios`);

--
-- Indices de la tabla `imagenes_tr`
--
ALTER TABLE `imagenes_tr`
  ADD PRIMARY KEY (`idimagenes_tr`),
  ADD UNIQUE KEY `idimagenes_tr_UNIQUE` (`idimagenes_tr`),
  ADD UNIQUE KEY `ruta_imagen_UNIQUE` (`ruta_imagen`),
  ADD KEY `fk_turismo_religioso_imagenes_tr_idx` (`id_tr`);

--
-- Indices de la tabla `imagenes_trad`
--
ALTER TABLE `imagenes_trad`
  ADD PRIMARY KEY (`idimagenes_tradiciones`),
  ADD UNIQUE KEY `idimagenes_tr_UNIQUE` (`idimagenes_tradiciones`),
  ADD UNIQUE KEY `ruta_imagen_UNIQUE` (`ruta_imagen`),
  ADD KEY `fk_tradicion_imagenes_tradicion_idx` (`id_tradiciones`);

--
-- Indices de la tabla `lugares`
--
ALTER TABLE `lugares`
  ADD PRIMARY KEY (`idlugares`),
  ADD UNIQUE KEY `idlugares_UNIQUE` (`idlugares`);

--
-- Indices de la tabla `noticias`
--
ALTER TABLE `noticias`
  ADD PRIMARY KEY (`idnoticias`),
  ADD UNIQUE KEY `idefemerides_UNIQUE` (`idnoticias`);

--
-- Indices de la tabla `personajes`
--
ALTER TABLE `personajes`
  ADD PRIMARY KEY (`idpersonajes`),
  ADD UNIQUE KEY `idefemerides_UNIQUE` (`idpersonajes`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`idroles`),
  ADD UNIQUE KEY `idroles_UNIQUE` (`idroles`);

--
-- Indices de la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD PRIMARY KEY (`idservicios`),
  ADD UNIQUE KEY `idefemerides_UNIQUE` (`idservicios`);

--
-- Indices de la tabla `tradicion`
--
ALTER TABLE `tradicion`
  ADD PRIMARY KEY (`idtradicion`),
  ADD UNIQUE KEY `idefemerides_UNIQUE` (`idtradicion`);

--
-- Indices de la tabla `turismo_religioso`
--
ALTER TABLE `turismo_religioso`
  ADD PRIMARY KEY (`idturismo_religioso`),
  ADD UNIQUE KEY `idturismo_religioso_UNIQUE` (`idturismo_religioso`),
  ADD UNIQUE KEY `nombre_UNIQUE` (`nombre`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`idusuarios`),
  ADD UNIQUE KEY `idusuarios_UNIQUE` (`idusuarios`),
  ADD UNIQUE KEY `telefono_UNIQUE` (`telefono`),
  ADD UNIQUE KEY `correo_UNIQUE` (`correo`),
  ADD KEY `fk_usuarios_roles_idx` (`idroles`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `arquitectura`
--
ALTER TABLE `arquitectura`
  MODIFY `idarquitectura` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `atractivos_naturales`
--
ALTER TABLE `atractivos_naturales`
  MODIFY `idatractivos_naturales` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `comentarios_an`
--
ALTER TABLE `comentarios_an`
  MODIFY `idcomentarios_an` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `comentarios_arq`
--
ALTER TABLE `comentarios_arq`
  MODIFY `idcomentarios_arq` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `comentarios_efemerides`
--
ALTER TABLE `comentarios_efemerides`
  MODIFY `idcomentarios_efemerides` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `comentarios_noticias`
--
ALTER TABLE `comentarios_noticias`
  MODIFY `idcomentarios_noticias` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `comentarios_personajes`
--
ALTER TABLE `comentarios_personajes`
  MODIFY `idcomentarios_tradicion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `comentarios_servicios`
--
ALTER TABLE `comentarios_servicios`
  MODIFY `idcomentarios_servicios` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `comentarios_tr`
--
ALTER TABLE `comentarios_tr`
  MODIFY `idcomentarios_tr` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `comentarios_tradicion`
--
ALTER TABLE `comentarios_tradicion`
  MODIFY `idcomentarios_tradicion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `datosgenerales`
--
ALTER TABLE `datosgenerales`
  MODIFY `iddatosgenerales` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `efemerides`
--
ALTER TABLE `efemerides`
  MODIFY `idefemerides` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `imagenes_an`
--
ALTER TABLE `imagenes_an`
  MODIFY `idimagenes_an` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `imagenes_arq`
--
ALTER TABLE `imagenes_arq`
  MODIFY `idimagenes_arq` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `imagenes_datosgenerales`
--
ALTER TABLE `imagenes_datosgenerales`
  MODIFY `idimagenes_dg` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `imagenes_noticias`
--
ALTER TABLE `imagenes_noticias`
  MODIFY `idimagenes_not` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `imagenes_personajes`
--
ALTER TABLE `imagenes_personajes`
  MODIFY `idimagenes_personajes` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `imagenes_servicios`
--
ALTER TABLE `imagenes_servicios`
  MODIFY `idimagenes_tradiciones` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `imagenes_tr`
--
ALTER TABLE `imagenes_tr`
  MODIFY `idimagenes_tr` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `imagenes_trad`
--
ALTER TABLE `imagenes_trad`
  MODIFY `idimagenes_tradiciones` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `lugares`
--
ALTER TABLE `lugares`
  MODIFY `idlugares` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `noticias`
--
ALTER TABLE `noticias`
  MODIFY `idnoticias` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `personajes`
--
ALTER TABLE `personajes`
  MODIFY `idpersonajes` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `idroles` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `servicios`
--
ALTER TABLE `servicios`
  MODIFY `idservicios` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tradicion`
--
ALTER TABLE `tradicion`
  MODIFY `idtradicion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `turismo_religioso`
--
ALTER TABLE `turismo_religioso`
  MODIFY `idturismo_religioso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `idusuarios` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `comentarios_an`
--
ALTER TABLE `comentarios_an`
  ADD CONSTRAINT `fk_atractivonatural_comentarios` FOREIGN KEY (`id_an`) REFERENCES `atractivos_naturales` (`idatractivos_naturales`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_usuarios_comentarios` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`idusuarios`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `comentarios_arq`
--
ALTER TABLE `comentarios_arq`
  ADD CONSTRAINT `fk_arquitectura_comentarios_arq` FOREIGN KEY (`id_arq`) REFERENCES `arquitectura` (`idarquitectura`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_usuarios_comentarios_arq` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`idusuarios`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `comentarios_efemerides`
--
ALTER TABLE `comentarios_efemerides`
  ADD CONSTRAINT `fk_efemerides_comentarios_efemerides` FOREIGN KEY (`id_efemeride`) REFERENCES `efemerides` (`idefemerides`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `comentarios_noticias`
--
ALTER TABLE `comentarios_noticias`
  ADD CONSTRAINT `fk_noticias_comentarios_noticias` FOREIGN KEY (`id_noticias`) REFERENCES `noticias` (`idnoticias`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `comentarios_personajes`
--
ALTER TABLE `comentarios_personajes`
  ADD CONSTRAINT `fk_personajes_comentarios_personajes` FOREIGN KEY (`id_personajes`) REFERENCES `personajes` (`idpersonajes`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `comentarios_servicios`
--
ALTER TABLE `comentarios_servicios`
  ADD CONSTRAINT `fk_servicios_comentarios_servicios` FOREIGN KEY (`id_servicios`) REFERENCES `servicios` (`idservicios`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `comentarios_tr`
--
ALTER TABLE `comentarios_tr`
  ADD CONSTRAINT `fk_turismo_religioso_comentarios_tr` FOREIGN KEY (`id_tr`) REFERENCES `turismo_religioso` (`idturismo_religioso`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_usuarios_comentarios_tr` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`idusuarios`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `comentarios_tradicion`
--
ALTER TABLE `comentarios_tradicion`
  ADD CONSTRAINT `fk_tradicion_comentarios_tradicion` FOREIGN KEY (`id_tradicion`) REFERENCES `tradicion` (`idtradicion`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `eventos`
--
ALTER TABLE `eventos`
  ADD CONSTRAINT `fk_usuario_eventos` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`idusuarios`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `imagenes_an`
--
ALTER TABLE `imagenes_an`
  ADD CONSTRAINT `fk_atractivos_naturales_atractivos_naturales` FOREIGN KEY (`id_an`) REFERENCES `atractivos_naturales` (`idatractivos_naturales`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `imagenes_arq`
--
ALTER TABLE `imagenes_arq`
  ADD CONSTRAINT `fk_arquitectura_imagenes_arq` FOREIGN KEY (`id_arq`) REFERENCES `arquitectura` (`idarquitectura`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `imagenes_datosgenerales`
--
ALTER TABLE `imagenes_datosgenerales`
  ADD CONSTRAINT `fk_datosgenerales_imagenesdatosgenerales` FOREIGN KEY (`id_dg`) REFERENCES `datosgenerales` (`iddatosgenerales`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `imagenes_noticias`
--
ALTER TABLE `imagenes_noticias`
  ADD CONSTRAINT `fk_noticias_imagenes_noticias` FOREIGN KEY (`id_not`) REFERENCES `noticias` (`idnoticias`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `imagenes_personajes`
--
ALTER TABLE `imagenes_personajes`
  ADD CONSTRAINT `fk_personajes_comentarios_personajess` FOREIGN KEY (`idimagenes_personajes`) REFERENCES `personajes` (`idpersonajes`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `imagenes_servicios`
--
ALTER TABLE `imagenes_servicios`
  ADD CONSTRAINT `fk_servicios_imagenes_servicios` FOREIGN KEY (`id_servicios`) REFERENCES `servicios` (`idservicios`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `imagenes_tr`
--
ALTER TABLE `imagenes_tr`
  ADD CONSTRAINT `fk_turismo_religioso_imagenes_tr` FOREIGN KEY (`id_tr`) REFERENCES `turismo_religioso` (`idturismo_religioso`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `imagenes_trad`
--
ALTER TABLE `imagenes_trad`
  ADD CONSTRAINT `fk_tradicion_imagenes_tradicion0` FOREIGN KEY (`id_tradiciones`) REFERENCES `tradicion` (`idtradicion`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `fk_usuarios_roles` FOREIGN KEY (`idroles`) REFERENCES `roles` (`idroles`) ON DELETE NO ACTION ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
