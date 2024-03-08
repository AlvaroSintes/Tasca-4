-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema MER.2b
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema MER.2b
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `MER.2b` ;
USE `MER.2b` ;

-- -----------------------------------------------------
-- Table `MER.2b`.`Cine`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER.2b`.`Cine` (
  `NIF` INT(9) NOT NULL,
  `Nom` VARCHAR(45) NOT NULL,
  `Ubicacio` VARCHAR(45) NOT NULL,
  `Num_sales` VARCHAR(45) NOT NULL,
  `Horari` VARCHAR(45) NOT NULL,
  `Telefon` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`NIF`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER.2b`.`Pelicula`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER.2b`.`Pelicula` (
  `ISBN` INT(20) NOT NULL,
  `Nom` VARCHAR(45) NOT NULL,
  `Director` VARCHAR(45) NOT NULL,
  `Protagonista` VARCHAR(45) NOT NULL,
  `Actor_secundari` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ISBN`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER.2b`.`Tarifa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER.2b`.`Tarifa` (
  `ID` INT NOT NULL,
  `Nom` VARCHAR(45) NOT NULL,
  `Preu` VARCHAR(45) NOT NULL,
  `Descripcio` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER.2b`.`Projeccio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER.2b`.`Projeccio` (
  `ID` INT NOT NULL,
  `Sala` VARCHAR(45) NOT NULL,
  `Hora_inici` TIME NOT NULL,
  `Hora_fi` TIME NOT NULL,
  `Cine_NIF` INT(9) NOT NULL,
  `Pelicula_ISBN` INT(20) NOT NULL,
  `Tarifa_ID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_Projeccio_Cine_idx` (`Cine_NIF` ASC) VISIBLE,
  INDEX `fk_Projeccio_Pelicula1_idx` (`Pelicula_ISBN` ASC) VISIBLE,
  INDEX `fk_Projeccio_Tarifa1_idx` (`Tarifa_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Projeccio_Cine`
    FOREIGN KEY (`Cine_NIF`)
    REFERENCES `MER.2b`.`Cine` (`NIF`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Projeccio_Pelicula1`
    FOREIGN KEY (`Pelicula_ISBN`)
    REFERENCES `MER.2b`.`Pelicula` (`ISBN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Projeccio_Tarifa1`
    FOREIGN KEY (`Tarifa_ID`)
    REFERENCES `MER.2b`.`Tarifa` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
