-- MySQL Script generated by MySQL Workbench
-- Fri Apr 29 11:32:56 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Users
-- -----------------------------------------------------
-- Website providing a market place platform for artist, fans, and partners

-- -----------------------------------------------------
-- Schema Users
--
-- Website providing a market place platform for artist, fans, and partners
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Users` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin ;
-- -----------------------------------------------------
-- Schema Administration
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Administration
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Administration` ;
-- -----------------------------------------------------
-- Schema Partners
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Partners
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Partners` ;
USE `Users` ;

-- -----------------------------------------------------
-- Table `Users`.`Users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Users`.`Users` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Username` MEDIUMTEXT NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `Surname` VARCHAR(45) NOT NULL,
  `Password` VARCHAR(45) NOT NULL,
  `Role` ENUM("Artist", "Fans", "Admin", "Parners") NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  UNIQUE INDEX `idUsers_UNIQUE` (`ID` ASC) VISIBLE,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Users`.`Fans`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Users`.`Fans` (
)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Users`.`Artists`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Users`.`Artists` (
)
ENGINE = InnoDB;

USE `Administration` ;

-- -----------------------------------------------------
-- Table `Administration`.`Admin`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Administration`.`Admin` (
  `Admin` ENUM("administrative") NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  `Cell_no` VARCHAR(45) NULL,
  `Admincol` ENUM("Site Administrators", "System Administrators", "Management Team") NOT NULL,
  `Admin_ID` INT NOT NULL,
  UNIQUE INDEX `Cell_no_UNIQUE` (`Cell_no` ASC) VISIBLE,
  INDEX `ID_idx` (`Admin_ID` ASC) VISIBLE,
  PRIMARY KEY (`Admin_ID`),
  CONSTRAINT `ID`
    FOREIGN KEY (`Admin_ID`)
    REFERENCES `Users`.`Users` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Administration`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Administration`.`Orders` (
  `Order_ID` INT NOT NULL AUTO_INCREMENT,
  `Recipient` VARCHAR(45) NOT NULL,
  `Provider` VARCHAR(45) NULL,
  `Link` VARCHAR(45) NULL,
  `Item` BLOB NULL,
  PRIMARY KEY (`Order_ID`),
  UNIQUE INDEX `Order_ID_UNIQUE` (`Order_ID` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Administration`.`Purchases`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Administration`.`Purchases` (
  `Purchase_ID` INT NOT NULL AUTO_INCREMENT,
  `User_ID` INT NOT NULL,
  `Purchase Details` LONGTEXT NULL,
  `Provider` VARCHAR(45) NOT NULL,
  `Distributor` VARCHAR(45) NOT NULL,
  UNIQUE INDEX `Purchase_ID_UNIQUE` (`Purchase_ID` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Administration`.`Content`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Administration`.`Content` (
  `Content_ID` INT NOT NULL,
  `Producer` VARCHAR(45) NOT NULL,
  `Producer_ID` INT(5) NOT NULL,
  `Distributor_ID` INT(5) NOT NULL,
  `Distributor` VARCHAR(45) NOT NULL,
  `Link` VARCHAR(45) NOT NULL,
  `Item` BLOB NOT NULL,
  `Format` VARCHAR(45) NULL,
  `Genre` VARCHAR(45) NULL,
  PRIMARY KEY (`Content_ID`),
  UNIQUE INDEX `Content_ID_UNIQUE` (`Content_ID` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Administration`.`Uploads`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Administration`.`Uploads` (
  `Upload_ID` INT NOT NULL,
  `Content_ID` VARCHAR(45) NOT NULL,
  `Distributor` VARCHAR(45) NOT NULL,
  `Producer` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Upload_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Administration`.`Comments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Administration`.`Comments` (
  `Comment_ID` INT NOT NULL,
  `Commentor_ID` INT NOT NULL,
  `Comment` LONGTEXT NOT NULL,
  `Reference` INT NOT NULL,
  PRIMARY KEY (`Comment_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Administration`.`Likes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Administration`.`Likes` (
  `Like_ID` INT NOT NULL,
  `User_ID` INT NOT NULL,
  `User` VARCHAR(45) NOT NULL,
  `Reference` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Like_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Administration`.`Log Record`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Administration`.`Log Record` (
  `Login_No` INT NOT NULL,
  `User_ID` INT NOT NULL,
  `Time` DATETIME NOT NULL,
  `Username` VARCHAR(45) NOT NULL,
  `Device` VARCHAR(45) NULL,
  `Location` VARCHAR(45) NULL,
  PRIMARY KEY (`Login_No`))
ENGINE = InnoDB;

USE `Partners` ;

-- -----------------------------------------------------
-- Table `Partners`.`Partners`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Partners`.`Partners` (
  `Partner_ID` INT NOT NULL,
  `Partner` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  `Cell_no` VARCHAR(45) NOT NULL,
  `Class` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Partner_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Partners`.`Distributors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Partners`.`Distributors` (
  `Distributor_ID` INT NOT NULL,
  UNIQUE INDEX `Distributor_ID_UNIQUE` (`Distributor_ID` ASC) VISIBLE,
  INDEX `Email` () VISIBLE,
  CONSTRAINT `User_ID`
    FOREIGN KEY (`Distributor_ID`)
    REFERENCES `Users`.`Users` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
