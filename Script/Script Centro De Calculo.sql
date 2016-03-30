-- MySQL Script generated by MySQL Workbench
-- 03/29/16 18:41:17
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Rol`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Rol` (
  `Rol` INT NOT NULL,
  `Descripcion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Rol`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Carrera`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Carrera` (
  `Carrera` INT NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Fecha_Creacion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Carrera`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Tipo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tipo` (
  `Tipo` INT NOT NULL,
  `Descripcion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Tipo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Area`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Area` (
  `Area` INT NOT NULL,
  `Descripcion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Area`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Ciclo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Ciclo` (
  `Anio` INT NOT NULL,
  `Ciclo` INT NOT NULL,
  PRIMARY KEY (`Anio`, `Ciclo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Salon`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Salon` (
  `Salon` INT NOT NULL,
  `Edificio` INT NOT NULL,
  `Capacidad` INT NOT NULL,
  `Audiovisual` TINYINT(1) NOT NULL,
  PRIMARY KEY (`Salon`, `Edificio`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Escuela`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Escuela` (
  `Escuela` INT NOT NULL,
  `FechaFundacion` DATE NULL,
  `HoraApertura` TIME NOT NULL,
  `HoraCierre` TIME NOT NULL,
  `Carrera` INT NOT NULL,
  `Salon` INT NOT NULL,
  `Edificio` INT NOT NULL,
  `Nombre` VARCHAR(45) NULL,
  PRIMARY KEY (`Escuela`),
  INDEX `fk_Carrera_idx` (`Carrera` ASC),
  INDEX `fk_Salon_idx` (`Salon` ASC, `Edificio` ASC),
  CONSTRAINT `fk_Carrera`
    FOREIGN KEY (`Carrera`)
    REFERENCES `mydb`.`Carrera` (`Carrera`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Salon`
    FOREIGN KEY (`Salon` , `Edificio`)
    REFERENCES `mydb`.`Salon` (`Salon` , `Edificio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Plan`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Plan` (
  `Anio` INT NOT NULL,
  `Ciclo` INT NOT NULL,
  `Escuela` INT NOT NULL,
  PRIMARY KEY (`Anio`, `Ciclo`, `Escuela`),
  INDEX `fk_Escuela_idx` (`Escuela` ASC),
  CONSTRAINT `fk_Ciclo_Anio`
    FOREIGN KEY (`Anio` , `Ciclo`)
    REFERENCES `mydb`.`Ciclo` (`Anio` , `Ciclo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Escuela`
    FOREIGN KEY (`Escuela`)
    REFERENCES `mydb`.`Escuela` (`Escuela`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Curso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Curso` (
  `Curso` INT NOT NULL,
  `Descripcion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Curso`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Pensum`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Pensum` (
  `Ciclo` INT NOT NULL,
  `Anio` INT NOT NULL,
  `Curso` INT NOT NULL,
  `Escuela` INT NOT NULL,
  `Creditos` INT NOT NULL,
  PRIMARY KEY (`Ciclo`, `Anio`, `Escuela`, `Curso`),
  INDEX `fk_Curso_idx` (`Curso` ASC),
  CONSTRAINT `fk_Plan`
    FOREIGN KEY (`Ciclo` , `Anio` , `Escuela`)
    REFERENCES `mydb`.`Plan` (`Ciclo` , `Anio` , `Escuela`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Curso`
    FOREIGN KEY (`Curso`)
    REFERENCES `mydb`.`Curso` (`Curso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`PreRequisito`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`PreRequisito` (
  `CursoPreRequisito` INT NOT NULL,
  `Ciclo` INT NOT NULL,
  `Anio` INT NOT NULL,
  `Curso` INT NOT NULL,
  `Escuela` INT NOT NULL,
  PRIMARY KEY (`CursoPreRequisito`, `Escuela`, `Curso`, `Anio`, `Ciclo`),
  INDEX `fk_Pensum_idx` (`Ciclo` ASC, `Anio` ASC, `Escuela` ASC, `Curso` ASC),
  CONSTRAINT `fk_Pensum`
    FOREIGN KEY (`Ciclo` , `Anio` , `Escuela` , `Curso`)
    REFERENCES `mydb`.`Pensum` (`Ciclo` , `Anio` , `Escuela` , `Curso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Curso`
    FOREIGN KEY (`CursoPreRequisito`)
    REFERENCES `mydb`.`Curso` (`Curso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Catedratico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Catedratico` (
  `Catedratico` INT NOT NULL,
  `Colegiado` INT NOT NULL,
  `Nombres` VARCHAR(45) NOT NULL,
  `Apellidos` VARCHAR(45) NOT NULL,
  `FechaNacimiento` DATE NOT NULL,
  `AnioIngeso` VARCHAR(4) NOT NULL,
  PRIMARY KEY (`Catedratico`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`NivelCatedratico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`NivelCatedratico` (
  `Catedratico` INT NOT NULL,
  `Nivel` INT NOT NULL,
  `Estado` TINYINT(1) NOT NULL,
  `Inicio` DATE NOT NULL,
  `Fin` DATE NULL,
  PRIMARY KEY (`Catedratico`, `Nivel`),
  CONSTRAINT `fk_Catedratico`
    FOREIGN KEY (`Catedratico`)
    REFERENCES `mydb`.`Catedratico` (`Catedratico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Director`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Director` (
  `Escuela` INT NOT NULL,
  `Catedratico` INT NOT NULL,
  `FechaInicio` DATE NOT NULL,
  `FechaFin` DATE NULL,
  `Estado` TINYINT(1) NOT NULL,
  PRIMARY KEY (`Escuela`, `Catedratico`, `FechaInicio`),
  INDEX `fk_Catedratico_idx` (`Catedratico` ASC),
  CONSTRAINT `fk_Escuela`
    FOREIGN KEY (`Escuela`)
    REFERENCES `mydb`.`Escuela` (`Escuela`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Catedratico`
    FOREIGN KEY (`Catedratico`)
    REFERENCES `mydb`.`Catedratico` (`Catedratico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`EmpresaTelefonica`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`EmpresaTelefonica` (
  `Telefonica` INT NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Telefonica`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Estudiante`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Estudiante` (
  `Carnet` INT NOT NULL,
  `Nombres` VARCHAR(45) NOT NULL,
  `Apellidos` VARCHAR(45) NOT NULL,
  `FechaNacimiento` DATE NOT NULL,
  `Telefonol` VARCHAR(8) NOT NULL,
  `Direccion` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  `EmpresaTelefonica` INT NOT NULL,
  PRIMARY KEY (`Carnet`),
  INDEX `fk_Telefonica_idx` (`EmpresaTelefonica` ASC),
  CONSTRAINT `fk_Telefonica`
    FOREIGN KEY (`EmpresaTelefonica`)
    REFERENCES `mydb`.`EmpresaTelefonica` (`Telefonica`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Inscripcion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Inscripcion` (
  `Carnet` INT NOT NULL,
  `Escuela` INT NOT NULL,
  `Fecha` DATE NOT NULL,
  PRIMARY KEY (`Carnet`, `Escuela`),
  INDEX `fk_Escuela_idx` (`Escuela` ASC),
  CONSTRAINT `fk_Estudiante`
    FOREIGN KEY (`Carnet`)
    REFERENCES `mydb`.`Estudiante` (`Carnet`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Escuela`
    FOREIGN KEY (`Escuela`)
    REFERENCES `mydb`.`Escuela` (`Escuela`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Seccion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Seccion` (
  `Seccion` INT NOT NULL,
  `Catedratico` INT NOT NULL,
  `Curso` INT NOT NULL,
  `Ciclo` INT NOT NULL,
  `Anio` INT NOT NULL,
  `Cupo` INT NOT NULL,
  `Laboratorio` TINYINT(1) NOT NULL,
  PRIMARY KEY (`Seccion`, `Curso`, `Anio`, `Ciclo`),
  INDEX `fk_Ciclo_idx` (`Ciclo` ASC, `Anio` ASC),
  INDEX `fk_Curso_idx` (`Curso` ASC),
  INDEX `fk_Catedratico_idx` (`Catedratico` ASC),
  CONSTRAINT `fk_Ciclo`
    FOREIGN KEY (`Ciclo` , `Anio`)
    REFERENCES `mydb`.`Ciclo` (`Ciclo` , `Anio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Curso`
    FOREIGN KEY (`Curso`)
    REFERENCES `mydb`.`Curso` (`Curso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Catedratico`
    FOREIGN KEY (`Catedratico`)
    REFERENCES `mydb`.`Catedratico` (`Catedratico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Asignacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Asignacion` (
  `Carnet` INT NOT NULL,
  `Seccion` INT NOT NULL,
  `Curso` INT NOT NULL,
  `Ciclo` INT NOT NULL,
  `Anio` INT NOT NULL,
  `Nota` INT NOT NULL,
  `Zona` INT NOT NULL,
  PRIMARY KEY (`Carnet`, `Seccion`, `Curso`, `Ciclo`, `Nota`, `Anio`, `Zona`),
  INDEX `fk_Seccion_idx` (`Seccion` ASC, `Curso` ASC, `Ciclo` ASC, `Anio` ASC),
  CONSTRAINT `fk_Estudiante`
    FOREIGN KEY (`Carnet`)
    REFERENCES `mydb`.`Estudiante` (`Carnet`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Seccion`
    FOREIGN KEY (`Seccion` , `Curso` , `Ciclo` , `Anio`)
    REFERENCES `mydb`.`Seccion` (`Seccion` , `Curso` , `Ciclo` , `Anio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Personal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Personal` (
  `Codigo` INT NOT NULL,
  `Nombes` VARCHAR(45) NULL,
  `Apellidos` VARCHAR(45) NULL,
  `FechaNacimiento` DATE NULL,
  `FechaInicio` DATE NULL,
  `FechaFin` DATE NULL,
  `Area` INT NULL,
  `Tipo` INT NULL,
  PRIMARY KEY (`Codigo`),
  INDEX `fk_Area_idx` (`Area` ASC),
  INDEX `fk_Tipo_idx` (`Tipo` ASC),
  CONSTRAINT `fk_Area`
    FOREIGN KEY (`Area`)
    REFERENCES `mydb`.`Area` (`Area`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Tipo`
    FOREIGN KEY (`Tipo`)
    REFERENCES `mydb`.`Tipo` (`Tipo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Asignacion_Rol`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Asignacion_Rol` (
  `Codigo` INT NOT NULL,
  `Rol` INT NOT NULL,
  PRIMARY KEY (`Codigo`, `Rol`),
  INDEX `fk_Rol_idx` (`Rol` ASC),
  CONSTRAINT `fk_Personal`
    FOREIGN KEY (`Codigo`)
    REFERENCES `mydb`.`Personal` (`Codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Rol`
    FOREIGN KEY (`Rol`)
    REFERENCES `mydb`.`Rol` (`Rol`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Unidad_NoAcademica`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Unidad_NoAcademica` (
  `Codigo` INT NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Fundacion` DATE NOT NULL,
  `Apertura` TIME NOT NULL,
  `Cierre` TIME NOT NULL,
  `Salon` INT NOT NULL,
  `Edificio` INT NOT NULL,
  PRIMARY KEY (`Codigo`, `Salon`, `Edificio`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Asignacion_Personal_UnidadNA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Asignacion_Personal_UnidadNA` (
  `CodigoUnidad` INT NOT NULL,
  `CodigoPersonal` INT NOT NULL,
  `Estado` TINYINT(1) NOT NULL,
  PRIMARY KEY (`CodigoUnidad`, `CodigoPersonal`),
  INDEX `fk_Personal_idx` (`CodigoPersonal` ASC),
  CONSTRAINT `fk_Personal`
    FOREIGN KEY (`CodigoPersonal`)
    REFERENCES `mydb`.`Personal` (`Codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Unidad`
    FOREIGN KEY (`CodigoUnidad`)
    REFERENCES `mydb`.`Unidad_NoAcademica` (`Codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Asignacion_Personal_Escuela`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Asignacion_Personal_Escuela` (
  `Escuela` INT NOT NULL,
  `Personal` INT NOT NULL,
  `Estado` TINYINT(1) NOT NULL,
  PRIMARY KEY (`Escuela`, `Personal`),
  INDEX `fk_Personal_idx` (`Personal` ASC),
  CONSTRAINT `fk_Escuela`
    FOREIGN KEY (`Escuela`)
    REFERENCES `mydb`.`Escuela` (`Escuela`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Personal`
    FOREIGN KEY (`Personal`)
    REFERENCES `mydb`.`Personal` (`Codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Director_Unidad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Director_Unidad` (
  `Unidad` INT NOT NULL,
  `Personal` INT NOT NULL,
  `FechaInicio` DATE NOT NULL,
  `FechaFin` DATE NULL,
  `Estado` TINYINT(1) NOT NULL,
  PRIMARY KEY (`Unidad`, `Personal`),
  INDEX `fk_Personal_idx` (`Personal` ASC),
  CONSTRAINT `fk_Personal`
    FOREIGN KEY (`Personal`)
    REFERENCES `mydb`.`Personal` (`Codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Unidad`
    FOREIGN KEY (`Unidad`)
    REFERENCES `mydb`.`Unidad_NoAcademica` (`Codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;