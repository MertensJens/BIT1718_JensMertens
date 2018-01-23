-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema Examen_databases_oef9
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Examen_databases_oef9
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Examen_databases_oef9` DEFAULT CHARACTER SET utf8 ;
USE `Examen_databases_oef9` ;

-- -----------------------------------------------------
-- Table `Examen_databases_oef9`.`syndrome`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Examen_databases_oef9`.`syndrome` (
  `syndrome_id` INT UNSIGNED NOT NULL,
  `syndrome_name` VARCHAR(45) NULL,
  `description` VARCHAR(45) NULL,
  PRIMARY KEY (`syndrome_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Examen_databases_oef9`.`Patient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Examen_databases_oef9`.`Patient` (
  `patient_id` INT UNSIGNED NOT NULL,
  `patient_name` VARCHAR(45) NULL,
  `syndrome_id` INT UNSIGNED NULL,
  PRIMARY KEY (`patient_id`),
  INDEX `patient-syndrome_idx` (`syndrome_id` ASC),
  CONSTRAINT `patient-syndrome`
    FOREIGN KEY (`syndrome_id`)
    REFERENCES `Examen_databases_oef9`.`syndrome` (`syndrome_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Examen_databases_oef9`.`Mutation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Examen_databases_oef9`.`Mutation` (
  `mutation_id` INT UNSIGNED NOT NULL,
  `Start` INT UNSIGNED NULL,
  `end` INT UNSIGNED NULL,
  `chromosome` DECIMAL(2) NULL,
  `syndrome_id` INT UNSIGNED NULL,
  PRIMARY KEY (`mutation_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Examen_databases_oef9`.`Gene`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Examen_databases_oef9`.`Gene` (
  `gene_id` INT UNSIGNED NOT NULL,
  `gene_name` VARCHAR(45) NULL,
  `gene_description` VARCHAR(45) NULL,
  `patient_id` INT UNSIGNED NULL,
  `mutation_id` INT UNSIGNED NULL,
  PRIMARY KEY (`gene_id`),
  INDEX `gene-patient_idx` (`patient_id` ASC),
  INDEX `gene-mutation_idx` (`mutation_id` ASC),
  CONSTRAINT `gene-patient`
    FOREIGN KEY (`patient_id`)
    REFERENCES `Examen_databases_oef9`.`Patient` (`patient_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `gene-mutation`
    FOREIGN KEY (`mutation_id`)
    REFERENCES `Examen_databases_oef9`.`Mutation` (`mutation_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
