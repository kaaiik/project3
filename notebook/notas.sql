-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema videoclub
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema videoclub
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `videoclub` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `videoclub` ;

-- -----------------------------------------------------
-- Table `videoclub`.`actor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `videoclub`.`actor` (
  `actor_id` INT NULL DEFAULT NULL,
  `first_name` TEXT NOT NULL,
  `last_update` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`first_name`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `videoclub`.`category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `videoclub`.`category` (
  `category_id` INT NOT NULL,
  `name` TEXT NULL DEFAULT NULL,
  `last_update` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`category_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `videoclub`.`film`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `videoclub`.`film` (
  `MyUnknownColumn` INT NULL DEFAULT NULL,
  `film_id` INT NULL DEFAULT NULL,
  `title` TEXT NOT NULL,
  `description` TEXT NULL DEFAULT NULL,
  `release_year` INT NULL DEFAULT NULL,
  `language_id` INT NULL DEFAULT NULL,
  `rental_duration` INT NULL DEFAULT NULL,
  `rental_rate` DOUBLE NULL DEFAULT NULL,
  `length` INT NULL DEFAULT NULL,
  `replacement_cost` DOUBLE NULL DEFAULT NULL,
  `rating` TEXT NULL DEFAULT NULL,
  `special_features` TEXT NULL DEFAULT NULL,
  `last_update` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`title`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `videoclub`.`inventory`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `videoclub`.`inventory` (
  `inventory_id` INT NOT NULL,
  `film_id` INT NULL DEFAULT NULL,
  `store_id` INT NULL DEFAULT NULL,
  `last_update` TEXT NULL DEFAULT NULL,
  `film_title` TEXT NOT NULL,
  PRIMARY KEY (`inventory_id`),
  INDEX `fk_inventory_film1_idx` (`film_title` ASC) VISIBLE,
  CONSTRAINT `fk_inventory_film1`
    FOREIGN KEY (`film_title`)
    REFERENCES `videoclub`.`film` (`title`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `videoclub`.`language`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `videoclub`.`language` (
  `language_id` INT NOT NULL,
  `name` TEXT NULL DEFAULT NULL,
  `last_update` TEXT NULL DEFAULT NULL,
  `film_title` TEXT NOT NULL,
  PRIMARY KEY (`language_id`),
  INDEX `fk_language_film1_idx` (`film_title` ASC) VISIBLE,
  CONSTRAINT `fk_language_film1`
    FOREIGN KEY (`film_title`)
    REFERENCES `videoclub`.`film` (`title`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `videoclub`.`old_HDD`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `videoclub`.`old_HDD` (
  `first_name` TEXT NULL DEFAULT NULL,
  `title` TEXT NULL DEFAULT NULL,
  `release_year` DOUBLE NULL DEFAULT NULL,
  `category_id` DOUBLE NULL DEFAULT NULL,
  `actor_first_name` TEXT NOT NULL,
  `category_category_id` INT NOT NULL,
  `film_title` TEXT NOT NULL,
  INDEX `fk_old_HDD_actor1_idx` (`actor_first_name` ASC) VISIBLE,
  INDEX `fk_old_HDD_category1_idx` (`category_category_id` ASC) VISIBLE,
  INDEX `fk_old_HDD_film1_idx` (`film_title` ASC) VISIBLE,
  CONSTRAINT `fk_old_HDD_actor1`
    FOREIGN KEY (`actor_first_name`)
    REFERENCES `videoclub`.`actor` (`first_name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_old_HDD_category1`
    FOREIGN KEY (`category_category_id`)
    REFERENCES `videoclub`.`category` (`category_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_old_HDD_film1`
    FOREIGN KEY (`film_title`)
    REFERENCES `videoclub`.`film` (`title`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `videoclub`.`rental`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `videoclub`.`rental` (
  `MyUnknownColumn` INT NULL DEFAULT NULL,
  `rental_id` INT NOT NULL,
  `rental_date` TEXT NULL DEFAULT NULL,
  `inventory_id` INT NULL DEFAULT NULL,
  `customer_id` INT NULL DEFAULT NULL,
  `return_date` TEXT NULL DEFAULT NULL,
  `staff_id` INT NULL DEFAULT NULL,
  `last_update` TEXT NULL DEFAULT NULL,
  `inventory_inventory_id` INT NOT NULL,
  PRIMARY KEY (`rental_id`),
  INDEX `fk_rental_inventory_idx` (`inventory_inventory_id` ASC) VISIBLE,
  CONSTRAINT `fk_rental_inventory`
    FOREIGN KEY (`inventory_inventory_id`)
    REFERENCES `videoclub`.`inventory` (`inventory_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

