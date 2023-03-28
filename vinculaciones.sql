-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.4.24-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Volcando estructura para tabla practicas.tb_asignacion
CREATE TABLE IF NOT EXISTS `tb_asignacion` (
  `id_asignacion` int(11) NOT NULL AUTO_INCREMENT,
  `id_docentes` int(11) DEFAULT NULL,
  `id_estudiantes` int(11) DEFAULT NULL,
  `id_jornada2` int(11) DEFAULT NULL,
  `id_carreras` int(11) DEFAULT NULL,
  `id_lugar_asignacion` int(11) DEFAULT NULL,
  `id_temas` int(11) DEFAULT NULL,
  `inicio_normal` date DEFAULT NULL,
  `final_normal` date DEFAULT NULL,
  `estado` int(11) DEFAULT 1,
  PRIMARY KEY (`id_asignacion`),
  KEY `FK_tb_asignacion_tb_estudiantes` (`id_estudiantes`),
  KEY `FK_tb_asignacion_tb_docentes` (`id_docentes`),
  KEY `FK_tb_asignacion_tb_jornada2` (`id_jornada2`),
  KEY `FK_tb_asignacion_tb_lugar_asignacion` (`id_lugar_asignacion`),
  KEY `FK_tb_asignacion_tb_carreras` (`id_carreras`),
  KEY `FK_tb_asignacion_tb_temas` (`id_temas`),
  CONSTRAINT `FK_tb_asignacion_tb_temas` FOREIGN KEY (`id_temas`) REFERENCES `tb_temas` (`id_temas`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla practicas.tb_asignacion: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `tb_asignacion` DISABLE KEYS */;
INSERT INTO `tb_asignacion` (`id_asignacion`, `id_docentes`, `id_estudiantes`, `id_jornada2`, `id_carreras`, `id_lugar_asignacion`, `id_temas`, `inicio_normal`, `final_normal`, `estado`) VALUES
	(7, 59, 35, 1, 1, 3, 2, '2022-08-25', '2022-08-16', 1),
	(11, 59, 37, 1, 1, 3, 1, '2022-08-19', '2022-08-19', 1),
	(12, 58, 35, 2, 2, 2, 1, '2022-08-16', '2022-08-11', 1),
	(13, 59, 35, 1, 1, 3, 1, '2022-09-14', '2022-09-15', 1),
	(14, 59, 34, 1, 2, 3, 1, '2022-09-19', '2022-09-21', 1),
	(15, 59, 40, 1, 6, 2, 1, '2022-09-15', '2022-09-15', 1);
/*!40000 ALTER TABLE `tb_asignacion` ENABLE KEYS */;

-- Volcando estructura para tabla practicas.tb_carreras
CREATE TABLE IF NOT EXISTS `tb_carreras` (
  `id_carreras` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) DEFAULT NULL,
  `estado` int(11) DEFAULT 1,
  PRIMARY KEY (`id_carreras`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla practicas.tb_carreras: ~8 rows (aproximadamente)
/*!40000 ALTER TABLE `tb_carreras` DISABLE KEYS */;
INSERT INTO `tb_carreras` (`id_carreras`, `descripcion`, `estado`) VALUES
	(1, 'TDS', 1),
	(2, 'TEMEC', 1),
	(3, 'TSA', 1),
	(4, 'TSC', 1),
	(5, 'TPA', 1),
	(6, 'TPGTT', 1),
	(7, 'TMMA', 1),
	(8, 'TSCOP', 1),
	(9, 'TSP', 1),
	(10, 'TSPRL', 1);
/*!40000 ALTER TABLE `tb_carreras` ENABLE KEYS */;

-- Volcando estructura para tabla practicas.tb_cursos
CREATE TABLE IF NOT EXISTS `tb_cursos` (
  `id_cursos` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) DEFAULT NULL,
  `estado` int(11) DEFAULT 1,
  PRIMARY KEY (`id_cursos`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla practicas.tb_cursos: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `tb_cursos` DISABLE KEYS */;
INSERT INTO `tb_cursos` (`id_cursos`, `descripcion`, `estado`) VALUES
	(1, 'tercero', 1),
	(2, 'cuarto', 1),
	(3, 'quinto', 1);
/*!40000 ALTER TABLE `tb_cursos` ENABLE KEYS */;

-- Volcando estructura para tabla practicas.tb_docentes
CREATE TABLE IF NOT EXISTS `tb_docentes` (
  `id_docentes` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_apellidos` varchar(50) DEFAULT NULL,
  `celular` varchar(50) DEFAULT NULL,
  `correo` varchar(50) DEFAULT NULL,
  `fecha_registro` date DEFAULT NULL,
  `estado` int(11) DEFAULT 1,
  PRIMARY KEY (`id_docentes`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla practicas.tb_docentes: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `tb_docentes` DISABLE KEYS */;
INSERT INTO `tb_docentes` (`id_docentes`, `nombre_apellidos`, `celular`, `correo`, `fecha_registro`, `estado`) VALUES
	(58, 'jonathan lopez', '03985943', 'sdjbisduigfuwgdfu', '2022-08-16', 1),
	(59, 'matxoa jose jabier', '32423432', 'jesua3020@gmail.com', '2022-08-26', 1);
/*!40000 ALTER TABLE `tb_docentes` ENABLE KEYS */;

-- Volcando estructura para tabla practicas.tb_estudiantes
CREATE TABLE IF NOT EXISTS `tb_estudiantes` (
  `id_estudiantes` int(11) NOT NULL AUTO_INCREMENT,
  `nombres_apellidos` varchar(50) DEFAULT NULL,
  `cedula` varchar(10) DEFAULT NULL,
  `telefono` varchar(10) DEFAULT NULL,
  `correo` varchar(50) DEFAULT NULL,
  `id_carreras` int(11) DEFAULT NULL,
  `id_cursos` int(11) DEFAULT NULL,
  `id_paralelos` int(11) DEFAULT NULL,
  `id_jornadas` int(11) DEFAULT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  `lider_grupo` varchar(50) DEFAULT NULL,
  `fecha_registro` date DEFAULT NULL,
  `estado` int(11) DEFAULT 1,
  PRIMARY KEY (`id_estudiantes`),
  KEY `FK_tb_estudiantes_tb_carreras` (`id_carreras`),
  KEY `FK_tb_estudiantes_tb_cursos` (`id_cursos`),
  KEY `FK_tb_estudiantes_tb_paralelos` (`id_paralelos`),
  KEY `FK_tb_estudiantes_tb_jornadas` (`id_jornadas`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla practicas.tb_estudiantes: ~7 rows (aproximadamente)
/*!40000 ALTER TABLE `tb_estudiantes` DISABLE KEYS */;
INSERT INTO `tb_estudiantes` (`id_estudiantes`, `nombres_apellidos`, `cedula`, `telefono`, `correo`, `id_carreras`, `id_cursos`, `id_paralelos`, `id_jornadas`, `direccion`, `lider_grupo`, `fecha_registro`, `estado`) VALUES
	(34, 'jose marcos martines', '09876543', '0987907897', 'jesua3020@gmail.com', 1, 2, 1, 2, 'jghghghghj', 'no', '2022-09-08', 1),
	(35, 'matxoa jose jabier', '0987654321', '3242112321', 'jonathanlopez3020@gmail.com', 3, 2, 2, 2, 'ASaAS', 'no', '2022-08-30', 1),
	(36, 'maone matines jose ', '1234567890', '0912382192', 'jesua3020@gmail.com', 1, 1, 1, 1, 'jasjas', 'no', '2022-09-08', 1),
	(37, 'martines ', '0923833322', '02392811', 'jesua3020@gmail.com', 1, 1, 1, 1, 'ZJHXBHZVXZH<Z', 'si', '2022-09-08', 1),
	(38, 'mrvfd', '434343', '343443434', 'jesua3020@gmail.com', 2, 1, 1, 1, 'ssdsad', 'si', '2022-09-01', 1),
	(39, 'marcis jose ', '9283923823', '239728723', 'jesua3020@gmail.com', 6, 1, 1, 2, 'asdasdasd', 'si', '2022-09-02', 1),
	(40, 'que te pasp', '3453432', '2039393', 'jesua3020@gmail.com', 6, 2, 1, 2, 'asdasdasd', 'si', '2022-09-08', 0);
/*!40000 ALTER TABLE `tb_estudiantes` ENABLE KEYS */;

-- Volcando estructura para tabla practicas.tb_jornada2
CREATE TABLE IF NOT EXISTS `tb_jornada2` (
  `id_jornada2` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) DEFAULT NULL,
  `estado` int(11) DEFAULT 1,
  PRIMARY KEY (`id_jornada2`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla practicas.tb_jornada2: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `tb_jornada2` DISABLE KEYS */;
INSERT INTO `tb_jornada2` (`id_jornada2`, `descripcion`, `estado`) VALUES
	(1, 'matutina', 1),
	(2, 'vespertina', 1),
	(3, 'virtual', 1);
/*!40000 ALTER TABLE `tb_jornada2` ENABLE KEYS */;

-- Volcando estructura para tabla practicas.tb_jornadas
CREATE TABLE IF NOT EXISTS `tb_jornadas` (
  `id_jornadas` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) DEFAULT NULL,
  `estado` varchar(45) DEFAULT '1',
  PRIMARY KEY (`id_jornadas`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla practicas.tb_jornadas: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `tb_jornadas` DISABLE KEYS */;
INSERT INTO `tb_jornadas` (`id_jornadas`, `descripcion`, `estado`) VALUES
	(1, 'matutina', '1'),
	(2, 'vespertina', '1'),
	(3, 'nocturna', '1');
/*!40000 ALTER TABLE `tb_jornadas` ENABLE KEYS */;

-- Volcando estructura para tabla practicas.tb_lugar_asignacion
CREATE TABLE IF NOT EXISTS `tb_lugar_asignacion` (
  `id_lugar_asignacion` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) DEFAULT NULL,
  `estado` int(11) DEFAULT 1,
  PRIMARY KEY (`id_lugar_asignacion`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla practicas.tb_lugar_asignacion: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `tb_lugar_asignacion` DISABLE KEYS */;
INSERT INTO `tb_lugar_asignacion` (`id_lugar_asignacion`, `descripcion`, `estado`) VALUES
	(2, 'gab limonal', 0),
	(3, 'GAB mar', 0),
	(4, 'gat rosa', 1);
/*!40000 ALTER TABLE `tb_lugar_asignacion` ENABLE KEYS */;

-- Volcando estructura para tabla practicas.tb_paralelos
CREATE TABLE IF NOT EXISTS `tb_paralelos` (
  `id_paralelos` int(11) NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `estado` int(11) DEFAULT 1,
  PRIMARY KEY (`id_paralelos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla practicas.tb_paralelos: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `tb_paralelos` DISABLE KEYS */;
INSERT INTO `tb_paralelos` (`id_paralelos`, `descripcion`, `estado`) VALUES
	(1, 'A', 1),
	(2, 'B', 1);
/*!40000 ALTER TABLE `tb_paralelos` ENABLE KEYS */;

-- Volcando estructura para tabla practicas.tb_temas
CREATE TABLE IF NOT EXISTS `tb_temas` (
  `id_temas` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(200) DEFAULT NULL,
  `id_carreras` int(11) DEFAULT 0,
  `estado` int(11) DEFAULT 1,
  PRIMARY KEY (`id_temas`),
  KEY `FK_tb_temas_tb_carreras` (`id_carreras`),
  CONSTRAINT `FK_tb_temas_tb_carreras` FOREIGN KEY (`id_carreras`) REFERENCES `tb_carreras` (`id_carreras`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla practicas.tb_temas: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `tb_temas` DISABLE KEYS */;
INSERT INTO `tb_temas` (`id_temas`, `descripcion`, `id_carreras`, `estado`) VALUES
	(1, 'Capacitación para el uso Herramientas Ofimáticas', 1, 1),
	(2, 'Socialización de Riesgos en la utilización de las redes sociales y herramientas de internet', 1, 1);
/*!40000 ALTER TABLE `tb_temas` ENABLE KEYS */;

-- Volcando estructura para tabla practicas.tb_tipo_usuario
CREATE TABLE IF NOT EXISTS `tb_tipo_usuario` (
  `id_tipo_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) DEFAULT NULL,
  `estado` int(11) DEFAULT 1,
  PRIMARY KEY (`id_tipo_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla practicas.tb_tipo_usuario: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `tb_tipo_usuario` DISABLE KEYS */;
INSERT INTO `tb_tipo_usuario` (`id_tipo_usuario`, `descripcion`, `estado`) VALUES
	(1, 'Admin', 1),
	(2, 'Estudiante', 1),
	(3, 'Docente', 1);
/*!40000 ALTER TABLE `tb_tipo_usuario` ENABLE KEYS */;

-- Volcando estructura para tabla practicas.tb_upload
CREATE TABLE IF NOT EXISTS `tb_upload` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fnombre` varchar(100) DEFAULT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla practicas.tb_upload: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tb_upload` DISABLE KEYS */;
INSERT INTO `tb_upload` (`id`, `fnombre`, `nombre`) VALUES
	(1, '20220907225940_CertificadoH.CLOUD-STJBA.pptx', 'CertificadoH.CLOUD-STJBA.pptx'),
	(2, '20220908000752_nominas de escuelas (1).xlsx', 'nominas de escuelas (1).xlsx'),
	(3, '20221202103128_TDS_MAT_4A_OBSERVACIONES.docx', 'TDS_MAT_4A_OBSERVACIONES.docx');
/*!40000 ALTER TABLE `tb_upload` ENABLE KEYS */;

-- Volcando estructura para tabla practicas.tb_upload2
CREATE TABLE IF NOT EXISTS `tb_upload2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fnombre` varchar(100) DEFAULT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla practicas.tb_upload2: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tb_upload2` DISABLE KEYS */;
INSERT INTO `tb_upload2` (`id`, `fnombre`, `nombre`) VALUES
	(1, '20220908002426_SSO-Y-SEGURIDAD-INFORMATICA.pdf', 'SSO-Y-SEGURIDAD-INFORMATICA.pdf'),
	(2, '20220908185505_(13) FOR-CVC-JBA 15 FICHA DE EVALUACIÓN DE ESTUDIANTES PARTICIPANTES.doc', '(13) FOR-CVC-JBA 15 FICHA DE EVALUACIÓN DE ESTUDIANTES PARTICIPANTES.doc');
/*!40000 ALTER TABLE `tb_upload2` ENABLE KEYS */;

-- Volcando estructura para tabla practicas.tb_usuario
CREATE TABLE IF NOT EXISTS `tb_usuario` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `cedula` varchar(50) DEFAULT NULL,
  `correo` varchar(50) DEFAULT NULL,
  `clave` varchar(50) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `id_tipo_usuario` int(11) DEFAULT 1,
  `estado` int(11) DEFAULT 1,
  PRIMARY KEY (`id_usuario`),
  KEY `FK_tb_usuario_tb_tipo_usuario` (`id_tipo_usuario`),
  CONSTRAINT `FK_tb_usuario_tb_tipo_usuario` FOREIGN KEY (`id_tipo_usuario`) REFERENCES `tb_tipo_usuario` (`id_tipo_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla practicas.tb_usuario: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `tb_usuario` DISABLE KEYS */;
INSERT INTO `tb_usuario` (`id_usuario`, `nombre`, `cedula`, `correo`, `clave`, `fecha`, `id_tipo_usuario`, `estado`) VALUES
	(3, 'admin', '0929979938', 'jonathanlopez3020@gmail.com', '21232f297a57a5a743894a0e4a801fc3', '2022-11-02', 1, 1),
	(4, 'hola', '0943834983', 'jesua3020@gmail.com', '5b632f94348de7c1c654fc70f29b31e4', '2022-11-02', 2, 1),
	(5, 'admin', '0923833322', 'jonathanlopez3020@gmail.com', '21232f297a57a5a743894a0e4a801fc3', '2022-11-10', 2, 1),
	(7, 'admin', '0987654321', 'jesua3020@gmail.com', '21232f297a57a5a743894a0e4a801fc3', '2022-11-12', 2, 1);
/*!40000 ALTER TABLE `tb_usuario` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
