-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema racing
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema racing
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `racing` DEFAULT CHARACTER SET utf8 ;
USE `racing` ;

-- -----------------------------------------------------
-- Table `racing`.`racing_team`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `racing`.`racing_team` (
  `idracing_team` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `sponor` VARCHAR(45) NULL,
  PRIMARY KEY (`idracing_team`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `racing`.`racer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `racing`.`racer` (
  `idracer` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `car` VARCHAR(45) NULL,
  `racing_team_idracing_team` INT NULL,
  PRIMARY KEY (`idracer`),
  INDEX `fk_racer_racing_team1_idx` (`racing_team_idracing_team` ASC) VISIBLE,
  CONSTRAINT `fk_racer_racing_team1`
    FOREIGN KEY (`racing_team_idracing_team`)
    REFERENCES `racing`.`racing_team` (`idracing_team`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `racing`.`stage`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `racing`.`stage` (
  `idstage` INT NOT NULL,
  `year` YEAR(2) NULL,
  `finish` DATE NULL,
  `start` DATE NULL,
  PRIMARY KEY (`idstage`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `racing`.`racing_team_has_stage`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `racing`.`racing_team_has_stage` (
  `racing_team_idracing_team` INT NOT NULL,
  `stage_idstage` INT NOT NULL,
  `date` DATE NOT NULL,
  `result` INT NULL,
  `place` INT NULL,
  PRIMARY KEY (`racing_team_idracing_team`, `stage_idstage`, `date`),
  INDEX `fk_racing_team_has_stage_stage1_idx` (`stage_idstage` ASC) VISIBLE,
  INDEX `fk_racing_team_has_stage_racing_team_idx` (`racing_team_idracing_team` ASC) VISIBLE,
  CONSTRAINT `fk_racing_team_has_stage_racing_team`
    FOREIGN KEY (`racing_team_idracing_team`)
    REFERENCES `racing`.`racing_team` (`idracing_team`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_racing_team_has_stage_stage1`
    FOREIGN KEY (`stage_idstage`)
    REFERENCES `racing`.`stage` (`idstage`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
