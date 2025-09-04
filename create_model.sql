-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema lol
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema lol
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `lol` DEFAULT CHARACTER SET utf8 ;
USE `lol` ;

-- -----------------------------------------------------
-- Table `lol`.`characters`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lol`.`characters` (
  `name` VARCHAR(45) NOT NULL,
  `species` VARCHAR(45) NULL,
  `pronoun` VARCHAR(100) NULL,
  `place_of_origin` VARCHAR(45) NULL,
  `region` VARCHAR(45) NULL,
  PRIMARY KEY (`name`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lol`.`stats`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lol`.`stats` (
  `characters_name` VARCHAR(45) NOT NULL,
  `attack` INT NULL,
  `defense` INT NULL,
  `magic` INT NULL,
  `difficulty` INT NULL,
  `tags` VARCHAR(45) NULL,
  INDEX `fk_stats_characters_idx` (`characters_name` ASC) VISIBLE,
  PRIMARY KEY (`characters_name`),
  CONSTRAINT `fk_stats_characters`
    FOREIGN KEY (`characters_name`)
    REFERENCES `lol`.`characters` (`name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lol`.`prices`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lol`.`prices` (
  `characters_name` VARCHAR(45) NOT NULL,
  `be_price` INT NULL,
  `rp_price` INT NULL,
  INDEX `fk_prices_characters1_idx` (`characters_name` ASC) VISIBLE,
  PRIMARY KEY (`characters_name`),
  CONSTRAINT `fk_prices_characters1`
    FOREIGN KEY (`characters_name`)
    REFERENCES `lol`.`characters` (`name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
