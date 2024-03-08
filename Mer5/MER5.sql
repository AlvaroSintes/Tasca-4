-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema MER5
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema MER5
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `MER5` ;
USE `MER5` ;

-- -----------------------------------------------------
-- Table `MER5`.`Tipus_vehicle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER5`.`Tipus_vehicle` (
  `ID` INT NOT NULL,
  `Nom` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER5`.`Vehicle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER5`.`Vehicle` (
  `ID` INT NOT NULL,
  `Marca` VARCHAR(45) NULL,
  `Model` VARCHAR(45) NULL,
  `Matricula` VARCHAR(45) NULL,
  `Num_carroseria` VARCHAR(45) NULL,
  `Tipus_vehicle_ID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_Vehicle_Tipus_vehicle_idx` (`Tipus_vehicle_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Vehicle_Tipus_vehicle`
    FOREIGN KEY (`Tipus_vehicle_ID`)
    REFERENCES `MER5`.`Tipus_vehicle` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER5`.`Client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER5`.`Client` (
  `DNI` VARCHAR(9) NOT NULL,
  `Nom` VARCHAR(45) NULL,
  `Cognom` VARCHAR(45) NULL,
  `Telefon` INT(9) NULL,
  PRIMARY KEY (`DNI`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER5`.`Cita`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER5`.`Cita` (
  `ID` INT NOT NULL,
  `Ubicacio` VARCHAR(45) NULL,
  `Data` DATE NULL,
  `Vehicle_ID` INT NOT NULL,
  `Client_DNI` VARCHAR(9) NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_Cita_Vehicle1_idx` (`Vehicle_ID` ASC) VISIBLE,
  INDEX `fk_Cita_Client1_idx` (`Client_DNI` ASC) VISIBLE,
  CONSTRAINT `fk_Cita_Vehicle1`
    FOREIGN KEY (`Vehicle_ID`)
    REFERENCES `MER5`.`Vehicle` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Cita_Client1`
    FOREIGN KEY (`Client_DNI`)
    REFERENCES `MER5`.`Client` (`DNI`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER5`.`Client_vehicle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER5`.`Client_vehicle` (
  `ID` INT NOT NULL,
  `Data_inici` DATE NULL,
  `Data_final` DATE NULL,
  `Vehicle_ID` INT NOT NULL,
  `Client_DNI` VARCHAR(9) NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_Client_vehicle_Vehicle1_idx` (`Vehicle_ID` ASC) VISIBLE,
  INDEX `fk_Client_vehicle_Client1_idx` (`Client_DNI` ASC) VISIBLE,
  CONSTRAINT `fk_Client_vehicle_Vehicle1`
    FOREIGN KEY (`Vehicle_ID`)
    REFERENCES `MER5`.`Vehicle` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Client_vehicle_Client1`
    FOREIGN KEY (`Client_DNI`)
    REFERENCES `MER5`.`Client` (`DNI`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
