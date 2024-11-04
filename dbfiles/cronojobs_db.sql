USE cronojobs ;

-- -----------------------------------------------------
-- Table `cronojobs`.`suscripcion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS suscripcion;

CREATE TABLE IF NOT EXISTS `cronojobs`.`suscripcion` (
  `pk_suscripcion` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`pk_suscripcion`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `cronojobs`.`empresa`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cronojobs`.`empresa` ;

CREATE TABLE IF NOT EXISTS `cronojobs`.`empresa` (
  `pk_empresa` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  `pais` VARCHAR(100) NOT NULL,
  `cp` VARCHAR(10) NOT NULL,
  `estado` VARCHAR(50) NOT NULL,
  `ciudad` VARCHAR(50) NOT NULL,
  `colonia` VARCHAR(50) NOT NULL,
  `calle` VARCHAR(50) NOT NULL,
  `numero` VARCHAR(10) NOT NULL,
  `fecha_suscripcion` DATE NOT NULL,
  `fk_suscripcion` INT NOT NULL,
  PRIMARY KEY (`pk_empresa`),
  INDEX `fk_empresa_suscripcion1_idx` (`fk_suscripcion` ASC) VISIBLE,
  CONSTRAINT `fk_empresa_suscripcion1`
    FOREIGN KEY (`fk_suscripcion`)
    REFERENCES `cronojobs`.`suscripcion` (`pk_suscripcion`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `cronojobs`.`area`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cronojobs`.`area` ;

CREATE TABLE IF NOT EXISTS `cronojobs`.`area` (
  `pk_area` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NULL DEFAULT NULL,
  `fk_empresa` INT NOT NULL,
  PRIMARY KEY (`pk_area`),
  INDEX `fk_area_empresa1_idx` (`fk_empresa` ASC) VISIBLE,
  CONSTRAINT `fk_area_empresa1`
    FOREIGN KEY (`fk_empresa`)
    REFERENCES `cronojobs`.`empresa` (`pk_empresa`))
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `cronojobs`.`proyecto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cronojobs`.`proyecto` ;

CREATE TABLE IF NOT EXISTS `cronojobs`.`proyecto` (
  `pk_proyecto` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NULL DEFAULT NULL,
  `descripcion` VARCHAR(450) NULL DEFAULT NULL,
  `fecha_inicio` DATE NULL DEFAULT NULL,
  `fecha_fin` DATE NULL DEFAULT NULL,
  `estado` TINYINT NULL DEFAULT NULL,
  `fecha_termino` DATE NULL DEFAULT NULL,
  `fk_area` INT NULL,
  PRIMARY KEY (`pk_proyecto`),
  INDEX `fk_proyecto_area1_idx` (`fk_area` ASC) VISIBLE,
  CONSTRAINT `fk_proyecto_area1`
    FOREIGN KEY (`fk_area`)
    REFERENCES `cronojobs`.`area` (`pk_area`))
ENGINE = InnoDB
AUTO_INCREMENT = 9
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `cronojobs`.`rol`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cronojobs`.`rol` ;

CREATE TABLE IF NOT EXISTS `cronojobs`.`rol` (
  `pk_rol` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`pk_rol`))
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `cronojobs`.`usuario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cronojobs`.`usuario` ;

CREATE TABLE IF NOT EXISTS `cronojobs`.`usuario` (
  `pk_usuario` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NULL DEFAULT NULL,
  `ape_paterno` VARCHAR(50) NULL DEFAULT NULL,
  `ape_materno` VARCHAR(50) NULL DEFAULT NULL,
  `email` VARCHAR(60) NULL DEFAULT NULL,
  `password` VARCHAR(50) NULL DEFAULT NULL,
  `telefono` VARCHAR(12) NULL DEFAULT NULL,
  `genero` VARCHAR(15) NULL DEFAULT NULL,
  `fecha_nacimiento` DATE NULL DEFAULT NULL,
  `fk_rol` INT NOT NULL,
  `fk_area` INT NULL DEFAULT NULL,
  `fk_empresa` INT NULL,
  PRIMARY KEY (`pk_usuario`),
  INDEX `fk_usuario_rol_idx` (`fk_rol` ASC) VISIBLE,
  INDEX `fk_usuario_area1_idx` (`fk_area` ASC) VISIBLE,
  INDEX `fk_usuario_empresa1_idx` (`fk_empresa` ASC) VISIBLE,
  CONSTRAINT `fk_usuario_area1`
    FOREIGN KEY (`fk_area`)
    REFERENCES `cronojobs`.`area` (`pk_area`),
  CONSTRAINT `fk_usuario_rol`
    FOREIGN KEY (`fk_rol`)
    REFERENCES `cronojobs`.`rol` (`pk_rol`),
  CONSTRAINT `fk_usuario_empresa1`
    FOREIGN KEY (`fk_empresa`)
    REFERENCES `cronojobs`.`empresa` (`pk_empresa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 29
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `cronojobs`.`actividad`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cronojobs`.`actividad` ;

CREATE TABLE IF NOT EXISTS `cronojobs`.`actividad` (
  `pk_actividad` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NULL DEFAULT NULL,
  `descripcion` VARCHAR(450) NULL DEFAULT NULL,
  `fecha_inicio` DATE NULL DEFAULT NULL,
  `fecha_fin` DATE NULL DEFAULT NULL,
  `estado` TINYINT NULL DEFAULT NULL,
  `fecha_termino` DATE NULL DEFAULT NULL,
  `fk_proyecto` INT NOT NULL,
  `fk_usuario` INT NOT NULL,
  PRIMARY KEY (`pk_actividad`),
  INDEX `fk_actividad_proyecto1_idx` (`fk_proyecto` ASC) VISIBLE,
  INDEX `fk_actividad_usuario1_idx` (`fk_usuario` ASC) VISIBLE,
  CONSTRAINT `fk_actividad_proyecto1`
    FOREIGN KEY (`fk_proyecto`)
    REFERENCES `cronojobs`.`proyecto` (`pk_proyecto`),
  CONSTRAINT `fk_actividad_usuario1`
    FOREIGN KEY (`fk_usuario`)
    REFERENCES `cronojobs`.`usuario` (`pk_usuario`))
ENGINE = InnoDB
AUTO_INCREMENT = 18
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `cronojobs`.`comentario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cronojobs`.`comentario` ;

CREATE TABLE IF NOT EXISTS `cronojobs`.`comentario` (
  `pk_comentario` INT NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(450) NULL DEFAULT NULL,
  `fecha` DATE NULL DEFAULT NULL,
  `fk_actividad` INT NOT NULL,
  PRIMARY KEY (`pk_comentario`),
  INDEX `fk_comentario_actividad1_idx` (`fk_actividad` ASC) VISIBLE,
  CONSTRAINT `fk_comentario_actividad1`
    FOREIGN KEY (`fk_actividad`)
    REFERENCES `cronojobs`.`actividad` (`pk_actividad`))
ENGINE = InnoDB
AUTO_INCREMENT = 10
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `cronojobs`.`nota`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cronojobs`.`nota` ;

CREATE TABLE IF NOT EXISTS `cronojobs`.`nota` (
  `pk_nota` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NULL DEFAULT NULL,
  `descripcion` VARCHAR(300) NULL DEFAULT NULL,
  `prioridad` SMALLINT NULL DEFAULT NULL,
  `fecha` DATE NULL DEFAULT NULL,
  `fk_proyecto` INT NOT NULL,
  PRIMARY KEY (`pk_nota`),
  INDEX `fk_nota_proyecto1_idx` (`fk_proyecto` ASC) VISIBLE,
  CONSTRAINT `fk_nota_proyecto1`
    FOREIGN KEY (`fk_proyecto`)
    REFERENCES `cronojobs`.`proyecto` (`pk_proyecto`))
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `cronojobs`.`notificacion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cronojobs`.`notificacion` ;

CREATE TABLE IF NOT EXISTS `cronojobs`.`notificacion` (
  `pk_notificacion` INT NOT NULL AUTO_INCREMENT,
  `fecha` DATE NULL DEFAULT NULL,
  `comentario` VARCHAR(450) NULL DEFAULT NULL,
  `fk_usuario` INT NOT NULL,
  PRIMARY KEY (`pk_notificacion`),
  INDEX `fk_notificacion_usuario1_idx` (`fk_usuario` ASC) VISIBLE,
  CONSTRAINT `fk_notificacion_usuario1`
    FOREIGN KEY (`fk_usuario`)
    REFERENCES `cronojobs`.`usuario` (`pk_usuario`))
ENGINE = InnoDB
AUTO_INCREMENT = 15
DEFAULT CHARACTER SET = utf8mb3;


use `cronojobs` ;
INSERT INTO `rol` VALUES (1,'Administrador'),(2,'CEO'),(3,'Supervisor'),(4,'Empleado');
INSERT INTO `suscripcion` VALUES (1,'Básico'),(2,'Pro'),(3,'Premium');
INSERT INTO `empresa` VALUES (1,'GSW de Guanajuato','México','37800','Guanajuato','Dolores Hidalgo','Lindavista','Caoba','5','2024-01-01',1);
INSERT INTO `area` VALUES (1,'Montaje',1),(2,'Pintura',1),(3,'Ensamblaje',1),(4,'Control de calidad',1);
INSERT INTO `usuario` VALUES 
(1,'Juan','Pérez','García','juan@cronojobs.com','123','555-555-5555','Masculino','1980-01-01',1,NULL,1),
(2,'María','López','Hernández','maria.lopez@cronojobs.com','123456','555-555-5556','Femenino','1985-02-02',1,NULL,1),
(3,'Angel','García','Pérez','carlos.garcia@cronojobs.com','123456','555-555-6666','Masculino','1970-01-01',2,NULL,1),
(4,'Pedro','González','Rodríguez','pedro.gonzalez@cronojobs.com','123456','555-555-5557','Masculino','1990-03-03',4,1,1),
(5,'Ana','Martínez','Sánchez','ana.martinez@cronojobs.com','123456','555-555-5558','Femenino','1995-04-04',3,2,1),
(6,'José','Fernández','Pérez','jose.fernandez@cronojobs.com','123456','555-555-5559','Masculino','1990-05-05',3,3,1),
(7,'Susana','García','López','susana.garcia@cronojobs.com','123456','555-555-5560','Femenino','1995-06-06',3,4,1),
(8,'Luis','Pérez','González','luis.perez@cronojobs.com','123456','555-555-5561','Masculino','1990-07-07',3,1,1),
(9,'Carmen','López','Martínez','carmen.lopez@cronojobs.com','123456','555-555-5562','Femenino','1995-08-08',4,2,1),
(10,'David','Martínez','García','david.martinez@cronojobs.com','123456','555-555-5563','Masculino','1990-09-09',4,3,1),
(11,'Laura','Fernández','Pérez','laura.fernandez@cronojobs.com','123456','555-555-5564','Femenino','1995-10-10',4,4,1),
(26,'Pedro','González','Sánchez','pedro@cronojobs.com','123456','4181121818','Femenino','2023-11-29',4,3,1),
(27,'Aldo','Vázquez','Rodríguez','aldo@cronojobs.com','123456','4181441818','Masculino','1998-06-09',3,1,1);
INSERT INTO `proyecto` VALUES (1,'Nuevo modelo de vehículo','Desarrollo de un nuevo modelo de vehículo','2023-08-01','2023-10-31',1,'2023-11-23',1),(2,'Nueva campaña de marketing','Desarrollo de una nueva campaña de marketing para aumentar las ventas','2023-09-01','2023-11-30',0,NULL,2),(6,'Proyecto Mbappé','Generar la nueva generación de vehículos del futuro.','2023-11-05','2024-07-31',1,'2023-11-06 08:48:32',1);
INSERT INTO `actividad` VALUES (1,'Diseño del vehículo','Diseño del exterior e interior del vehículo','2023-08-01','2023-09-30',0,NULL,1,4),(2,'Desarrollo del motor','Desarrollo del motor del vehículo','2023-09-01','2023-10-31',1,'2023-10-31',1,4),(3,'Fabricación del vehículo','Fabricación del vehículo','2023-10-01','2023-12-31',1,'2023-12-31',1,4),(4,'Pruebas del vehículo','Pruebas del vehículo para garantizar su seguridad y funcionalidad','2023-11-01','2023-12-31',0,NULL,1,4),(5,'Definición de la estrategia de marketing','Definición de la estrategia de marketing para la nueva campaña','2023-09-01','2023-10-31',1,'2023-10-31',2,5),(6,'Creación de contenido','Creación de contenido para la nueva campaña, como anuncios, videos y artículos','2023-10-01','2023-11-30',0,NULL,2,5),(7,'Publicación de la campaña','Publicación de la nueva campaña en los canales de marketing','2023-11-01','2023-12-31',1,'2023-12-31',2,5),(8,'Seguimiento de los resultados','Seguimiento de los resultados de la nueva campaña para evaluar su éxito','2023-12-01','2023-12-31',0,NULL,2,5),(12,'dsasdas','dasdasd','2023-11-20','2023-11-27',0,NULL,6,8),(13,'dasdas','dasdas','2023-11-14','2023-11-27',1,'2023-11-06',6,4);
INSERT INTO `comentario` VALUES (1,'El desarrollo del motor está progresando bien, pero estamos teniendo algunos problemas con el rendimiento.','2023-09-20',2),(2,'La fabricación del vehículo está en marcha, pero estamos teniendo algunos retrasos en la entrega de los componentes.','2023-10-20',3),(3,'Hemos realizado algunos cambios en el diseño del motor para mejorar el rendimiento.','2023-10-01',2),(4,'Estamos trabajando con nuestros proveedores para agilizar la entrega de los componentes.','2023-11-01',3),(5,'Hola esta es una prueba','2023-11-06',3),(6,'Prueba 2','2023-11-06',3),(7,'Ya casi acabo.','2023-11-06',13);
INSERT INTO `nota` VALUES (1,'Nuevos requisitos de seguridad','El vehículo debe cumplir con los nuevos requisitos de seguridad establecidos por el gobierno.',1,'2023-09-20',1),(2,'Problemas de calidad','Se han detectado algunos problemas de calidad en el vehículo.',2,'2023-10-20',1),(3,'Nuevos objetivos de marketing','Los objetivos de marketing para la nueva campaña han sido actualizados.',3,'2023-09-20',2),(4,'Cambios en el cronograma','El cronograma de la nueva campaña ha sido ajustado.',1,'2023-10-20',2),(5,'Es difícil','verificar que los modelos sean correctos',3,'2023-11-06',1),(6,'Nuevas herramientas','Es importante que utilicen las nuevas herramientas implementadas en la planta',1,'2023-11-06',1);
INSERT INTO `notificacion` VALUES (10,'2023-11-06','hola',8),(11,'2023-11-06','hola',4),(12,'2023-11-06','Ponte las pilas',4),(13,'2023-11-06','Hay q echarle ganas',5),(14,'2023-11-06','hola',8);