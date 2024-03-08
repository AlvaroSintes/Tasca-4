-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema MER.2c
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema MER.2c
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `MER.2c` ;
USE `MER.2c` ;

-- -----------------------------------------------------
-- Table `MER.2c`.`Departament`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER.2c`.`Departament` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Nom` VARCHAR(45) NOT NULL,
  `Descripcio` VARCHAR(45) NOT NULL,
  `Ubicacio` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER.2c`.`Assignatura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER.2c`.`Assignatura` (
  `Nom` VARCHAR(49) NOT NULL,
  `Credits` VARCHAR(100) NOT NULL,
  `Crit.Avaluacio` VARCHAR(45) NOT NULL,
  `Professor` VARCHAR(45) NOT NULL,
  `ID` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER.2c`.`Alumne`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER.2c`.`Alumne` (
  `Expedient` INT(10) NOT NULL,
  `Nom` VARCHAR(45) NOT NULL,
  `Cognom` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  `Telefon` INT(9) NOT NULL,
  `Adreca` VARCHAR(45) NOT NULL,
  `DNI` INT(9) NOT NULL,
  `Data_neixament` VARCHAR(45) NULL,
  PRIMARY KEY (`Expedient`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER.2c`.`Matricula`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER.2c`.`Matricula` (
  `Data` INT NOT NULL,
  `Nivell` VARCHAR(45) NOT NULL,
  `Curs` VARCHAR(45) NOT NULL,
  `Grup` VARCHAR(45) NOT NULL,
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Alumne_Expedient` INT(10) NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_Matricula_Alumne1_idx` (`Alumne_Expedient` ASC) VISIBLE,
  CONSTRAINT `fk_Matricula_Alumne1`
    FOREIGN KEY (`Alumne_Expedient`)
    REFERENCES `MER.2c`.`Alumne` (`Expedient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER.2c`.`Departament`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER.2c`.`Departament` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Nom` VARCHAR(45) NOT NULL,
  `Descripcio` VARCHAR(45) NOT NULL,
  `Ubicacio` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER.2c`.`Professor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER.2c`.`Professor` (
  `DNI` VARCHAR(9) NOT NULL,
  `Nom` VARCHAR(45) NOT NULL,
  `Cognom` VARCHAR(100) NOT NULL,
  `Titulacio` VARCHAR(45) NOT NULL,
  `Departament` VARCHAR(45) NOT NULL,
  `EsCapDepartament` VARCHAR(45) NOT NULL,
  `Departament_ID` INT NOT NULL,
  PRIMARY KEY (`DNI`),
  INDEX `fk_Professor_Departament1_idx` (`Departament_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Professor_Departament1`
    FOREIGN KEY (`Departament_ID`)
    REFERENCES `MER.2c`.`Departament` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER.2c`.`Assignatura_Matricula`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER.2c`.`Assignatura_Matricula` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Nom` VARCHAR(45) NOT NULL,
  `Aula` VARCHAR(45) NOT NULL,
  `Calendari` VARCHAR(45) NOT NULL,
  `Professor_DNI` VARCHAR(9) NOT NULL,
  `Assignatura_ID` INT NOT NULL,
  `Matricula_ID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_Assignatura_Matricula_Professor1_idx` (`Professor_DNI` ASC) VISIBLE,
  INDEX `fk_Assignatura_Matricula_Assignatura1_idx` (`Assignatura_ID` ASC) VISIBLE,
  INDEX `fk_Assignatura_Matricula_Matricula1_idx` (`Matricula_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Assignatura_Matricula_Professor1`
    FOREIGN KEY (`Professor_DNI`)
    REFERENCES `MER.2c`.`Professor` (`DNI`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Assignatura_Matricula_Assignatura1`
    FOREIGN KEY (`Assignatura_ID`)
    REFERENCES `MER.2c`.`Assignatura` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Assignatura_Matricula_Matricula1`
    FOREIGN KEY (`Matricula_ID`)
    REFERENCES `MER.2c`.`Matricula` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
