-- MySQL Script generated by MySQL Workbench
-- Wed Mar  7 21:57:47 2018
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `lottoukr_ttt` DEFAULT CHARACTER SET utf8 ;
USE `lottoukr_ttt` ;

-- -----------------------------------------------------
-- Table `lottoukr_ttt`.`lt_age`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lottoukr_ttt`.`lt_age` (
  `id` VARCHAR(36) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `name_2` VARCHAR(45) NULL,
  `name_3` VARCHAR(45) NULL,
  `name_4` VARCHAR(45) NULL,
  `deletion_mark` TINYINT(1) NULL,
  `dateModified` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `lottoukr_ttt`.`lt_brand`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lottoukr_ttt`.`lt_brand` (
  `id` VARCHAR(36) NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `deletion_mark` TINYINT(1) NULL,
  `dateModified` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `Name_UNIQUE` (`name` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `lottoukr_ttt`.`lt_categoryItem`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lottoukr_ttt`.`lt_categoryItem` (
  `id` VARCHAR(36) NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `deletion_mark` TINYINT(1) NULL,
  `dateModified` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `lottoukr_ttt`.`lt_brand_technology`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lottoukr_ttt`.`lt_brand_technology` (
  `id` VARCHAR(36) NOT NULL,
  `brand_id` VARCHAR(36) NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `description_r` TEXT NULL DEFAULT NULL,
  `description_u` TEXT NULL,
  `photo_logo` VARCHAR(255) NULL DEFAULT NULL,
  `category_id_1` VARCHAR(36) NULL DEFAULT NULL,
  `category_id_2` VARCHAR(36) NULL DEFAULT NULL,
  `deletion_mark` TINYINT(1) NULL,
  `dateModified` TIMESTAMP NULL,
  `name_r` VARCHAR(255) NULL,
  `name_u` VARCHAR(255) NULL,
  PRIMARY KEY (`id`),
  INDEX `brand_id_idx` (`brand_id` ASC),
  INDEX `brandtechnology_category_id_1_idx` (`category_id_1` ASC),
  INDEX `brandtechnology_category_id_2_idx` (`category_id_2` ASC),
  CONSTRAINT `brandtechnology_brand_id`
    FOREIGN KEY (`brand_id`)
    REFERENCES `lottoukr_ttt`.`lt_brand` (`id`)
    ON UPDATE CASCADE,
  CONSTRAINT `brandtechnology_category_id_1`
    FOREIGN KEY (`category_id_1`)
    REFERENCES `lottoukr_ttt`.`lt_categoryItem` (`id`)
    ON UPDATE CASCADE,
  CONSTRAINT `brandtechnology_category_id_2`
    FOREIGN KEY (`category_id_2`)
    REFERENCES `lottoukr_ttt`.`lt_categoryItem` (`id`)
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `lottoukr_ttt`.`lt_carpet`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lottoukr_ttt`.`lt_carpet` (
  `id` VARCHAR(36) NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `deletion_mark` TINYINT(1) NULL,
  `dateModified` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `lottoukr_ttt`.`lt_collection`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lottoukr_ttt`.`lt_collection` (
  `id` VARCHAR(36) NOT NULL,
  `brand_id` VARCHAR(36) NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `deletion_mark` TINYINT(1) NULL,
  `dateModified` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  INDEX `brand_id_idx` (`brand_id` ASC),
  CONSTRAINT `collection_brand_id`
    FOREIGN KEY (`brand_id`)
    REFERENCES `lottoukr_ttt`.`lt_brand` (`id`)
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `lottoukr_ttt`.`lt_color`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lottoukr_ttt`.`lt_color` (
  `id` VARCHAR(36) NOT NULL,
  `brand_id` VARCHAR(36) NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `name_r` VARCHAR(255) NULL DEFAULT NULL,
  `name_u` VARCHAR(255) NULL DEFAULT NULL,
  `deletion_mark` TINYINT(1) NULL,
  `dateModified` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  INDEX `brand_id_idx` (`brand_id` ASC),
  CONSTRAINT `color_brand_id`
    FOREIGN KEY (`brand_id`)
    REFERENCES `lottoukr_ttt`.`lt_brand` (`id`)
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `lottoukr_ttt`.`lt_consist`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lottoukr_ttt`.`lt_consist` (
  `id` VARCHAR(36) NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `category_id` VARCHAR(36) NULL DEFAULT NULL,
  `name_e` VARCHAR(255) NULL DEFAULT NULL,
  `name_u` VARCHAR(255) NULL,
  `deletion_mark` TINYINT(1) NULL,
  `dateModified` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  INDEX `product_id_idx` (`category_id` ASC),
  CONSTRAINT `consist_category_id`
    FOREIGN KEY (`category_id`)
    REFERENCES `lottoukr_ttt`.`lt_categoryItem` (`id`)
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `lottoukr_ttt`.`lt_country`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lottoukr_ttt`.`lt_country` (
  `id` VARCHAR(36) NOT NULL,
  `name_e` VARCHAR(255) NOT NULL,
  `name_r` VARCHAR(255) NULL,
  `name_u` VARCHAR(255) NULL,
  `deletion_mark` TINYINT(1) NULL,
  `dateModified` TIMESTAMP NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `lottoukr_ttt`.`lt_description`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lottoukr_ttt`.`lt_description` (
  `id` VARCHAR(36) NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `descr_r1` TEXT NULL DEFAULT NULL,
  `descr_r2` TEXT NULL DEFAULT NULL,
  `descr_u1` TEXT NULL DEFAULT NULL,
  `descr_u2` TEXT NULL DEFAULT NULL,
  `deletion_mark` TINYINT(1) NULL,
  `dateModified` TIMESTAMP NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `lottoukr_ttt`.`lt_exclusive`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lottoukr_ttt`.`lt_exclusive` (
  `id` VARCHAR(36) NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `brand_id` VARCHAR(36) NOT NULL,
  `deletion_mark` TINYINT(1) NULL,
  `dateModified` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  INDEX `brand_id_idx` (`brand_id` ASC),
  CONSTRAINT `exclusive_brand_id`
    FOREIGN KEY (`brand_id`)
    REFERENCES `lottoukr_ttt`.`lt_brand` (`id`)
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `lottoukr_ttt`.`lt_forWhat`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lottoukr_ttt`.`lt_forWhat` (
  `id` VARCHAR(36) NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `deletion_mark` TINYINT(1) NULL,
  `dateModified` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `lottoukr_ttt`.`lt_line`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lottoukr_ttt`.`lt_line` (
  `id` VARCHAR(36) NOT NULL,
  `brand_id` VARCHAR(36) NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `deletion_mark` TINYINT(1) NULL,
  `dateModified` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  INDEX `brand_id_idx` (`brand_id` ASC),
  CONSTRAINT `line_brand_id`
    FOREIGN KEY (`brand_id`)
    REFERENCES `lottoukr_ttt`.`lt_brand` (`id`)
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `lottoukr_ttt`.`lt_model`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lottoukr_ttt`.`lt_model` (
  `id` VARCHAR(36) NOT NULL,
  `brand_id` VARCHAR(36) NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `category_id` VARCHAR(36) NULL,
  `deletion_mark` TINYINT(1) NULL,
  `dateModified` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  INDEX `brand_id_idx` (`brand_id` ASC),
  INDEX `product_id_idx` (`category_id` ASC),
  CONSTRAINT `model_brand_id`
    FOREIGN KEY (`brand_id`)
    REFERENCES `lottoukr_ttt`.`lt_brand` (`id`)
    ON UPDATE CASCADE,
  CONSTRAINT `model_category_id`
    FOREIGN KEY (`category_id`)
    REFERENCES `lottoukr_ttt`.`lt_categoryItem` (`id`)
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `lottoukr_ttt`.`lt_package`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lottoukr_ttt`.`lt_package` (
  `id` VARCHAR(36) NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `deletion_mark` TINYINT(1) NULL,
  `dateModified` TIMESTAMP NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `lottoukr_ttt`.`lt_quantity`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lottoukr_ttt`.`lt_quantity` (
  `id` VARCHAR(36) NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `deletion_mark` TINYINT(1) NULL,
  `dateModified` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `lottoukr_ttt`.`lt_rBalance`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lottoukr_ttt`.`lt_rBalance` (
  `id` VARCHAR(36) NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `deletion_mark` TINYINT(1) NULL,
  `dateModified` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `lottoukr_ttt`.`lt_rFlexibility`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lottoukr_ttt`.`lt_rFlexibility` (
  `id` VARCHAR(36) NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `deletion_mark` TINYINT(1) NULL,
  `dateModified` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `lottoukr_ttt`.`lt_rHeadSize`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lottoukr_ttt`.`lt_rHeadSize` (
  `id` VARCHAR(36) NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `deletion_mark` TINYINT(1) NULL,
  `dateModified` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `lottoukr_ttt`.`lt_rLength`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lottoukr_ttt`.`lt_rLength` (
  `id` VARCHAR(36) NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `deletion_mark` TINYINT(1) NULL,
  `dateModified` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `lottoukr_ttt`.`lt_rStatus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lottoukr_ttt`.`lt_rStatus` (
  `id` VARCHAR(36) NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `deletion_mark` TINYINT(1) NULL,
  `dateModified` TIMESTAMP NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `lottoukr_ttt`.`lt_rStringFormula`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lottoukr_ttt`.`lt_rStringFormula` (
  `id` VARCHAR(36) NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `deletion_mark` TINYINT(1) NULL,
  `dateModified` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `lottoukr_ttt`.`lt_rWeight`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lottoukr_ttt`.`lt_rWeight` (
  `id` VARCHAR(36) NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `deletion_mark` TINYINT(1) NULL,
  `dateModified` TIMESTAMP NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `lottoukr_ttt`.`lt_sex`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lottoukr_ttt`.`lt_sex` (
  `id` VARCHAR(36) NOT NULL,
  `name` VARCHAR(10) NOT NULL,
  `name_2` VARCHAR(45) NOT NULL,
  `name_3` VARCHAR(45) NOT NULL,
  `name_4` VARCHAR(45) NOT NULL,
  `deletion_mark` TINYINT(1) NULL,
  `dateModified` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `lottoukr_ttt`.`lt_stitching`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lottoukr_ttt`.`lt_stitching` (
  `id` VARCHAR(36) NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `deletion_mark` TINYINT(1) NULL,
  `dateModified` TIMESTAMP NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `lottoukr_ttt`.`lt_typeItem`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lottoukr_ttt`.`lt_typeItem` (
  `id` VARCHAR(36) NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `category_id` VARCHAR(36) NOT NULL,
  `gender_name` INT NOT NULL,
  `deletion_mark` TINYINT(1) NULL,
  `dateModified` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  INDEX `category_id_idx` (`category_id` ASC),
  CONSTRAINT `typeItem_category_id`
    FOREIGN KEY (`category_id`)
    REFERENCES `lottoukr_ttt`.`lt_categoryItem` (`id`)
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `lottoukr_ttt`.`lt_video`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lottoukr_ttt`.`lt_video` (
  `id` VARCHAR(36) NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `video_1` VARCHAR(255) NOT NULL,
  `video_2` VARCHAR(255) NULL,
  `deletion_mark` TINYINT(1) NULL,
  `dateModified` TIMESTAMP NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `lottoukr_ttt`.`lt_isNew`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lottoukr_ttt`.`lt_isNew` (
  `id` VARCHAR(36) NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `deletion_mark` TINYINT(1) NULL,
  `dateModified` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lottoukr_ttt`.`lt_consist_type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lottoukr_ttt`.`lt_consist_type` (
  `id` VARCHAR(36) NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `deletion_mark` TINYINT(1) NULL,
  `dateModified` TIMESTAMP NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `lottoukr_ttt`.`lt_shoesWeight`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lottoukr_ttt`.`lt_shoesWeight` (
  `id` VARCHAR(36) NOT NULL,
  `name` VARCHAR(255) NULL,
  `deletion_mark` TINYINT(1) NULL,
  `dateModified` TIMESTAMP NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lottoukr_ttt`.`lt_item`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lottoukr_ttt`.`lt_item` (
  `id` VARCHAR(36) NOT NULL,
  `name` VARCHAR(255) NULL,
  `code` VARCHAR(255) NOT NULL,
  `category_id` VARCHAR(36) NULL,
  `type_id` VARCHAR(36) NULL,
  `brand_id` VARCHAR(36) NULL,
  `collection_id` VARCHAR(36) NULL,
  `line_id` VARCHAR(36) NULL DEFAULT NULL,
  `model_id` VARCHAR(36) NULL,
  `exclusive_id` VARCHAR(36) NULL DEFAULT NULL,
  `country_id` VARCHAR(36) NULL,
  `consist_id` VARCHAR(36) NULL DEFAULT NULL,
  `consist_type_id` VARCHAR(36) NULL,
  `color_id` VARCHAR(36) NULL DEFAULT NULL,
  `age_id` VARCHAR(36) NULL DEFAULT NULL,
  `sex_id` VARCHAR(36) NULL DEFAULT NULL,
  `quantity_id` VARCHAR(36) NULL DEFAULT NULL,
  `forWhat_id` VARCHAR(36) NULL DEFAULT NULL,
  `package_id` VARCHAR(36) NULL DEFAULT NULL,
  `stitching_id` VARCHAR(36) NULL DEFAULT NULL,
  `shoesWeight_id` VARCHAR(36) NULL,
  `size` VARCHAR(255) NULL DEFAULT NULL,
  `capacity` VARCHAR(255) NULL DEFAULT NULL,
  `isString` TINYINT(1) NULL DEFAULT NULL,
  `rStatus_id` VARCHAR(36) NULL DEFAULT NULL,
  `rWeight_id` VARCHAR(36) NULL DEFAULT NULL,
  `rLength_id` VARCHAR(36) NULL DEFAULT NULL,
  `rBalance_id` VARCHAR(36) NULL DEFAULT NULL,
  `rHeadSize_id` VARCHAR(36) NULL DEFAULT NULL,
  `rFlexibility_id` VARCHAR(36) NULL DEFAULT NULL,
  `rStringFormula_id` VARCHAR(36) NULL DEFAULT NULL,
  `isNew` VARCHAR(36) NULL,
  `descr_id` VARCHAR(36) NULL DEFAULT NULL,
  `video_id` VARCHAR(36) NULL DEFAULT NULL,
  `dateModified` TIMESTAMP NULL,
  `deletion_mark` TINYINT(1) NULL,
  PRIMARY KEY (`id`),
  INDEX `category_id_idx` (`category_id` ASC),
  INDEX `type_id_idx` (`type_id` ASC),
  INDEX `brand_id_idx` (`brand_id` ASC),
  INDEX `collection_id_idx` (`collection_id` ASC),
  INDEX `line_id_idx` (`line_id` ASC),
  INDEX `model_id_idx` (`model_id` ASC),
  INDEX `exclusive_id_idx` (`exclusive_id` ASC),
  INDEX `country_id_idx` (`country_id` ASC),
  INDEX `age_id_idx` (`age_id` ASC),
  INDEX `sex_id_idx` (`sex_id` ASC),
  INDEX `consist_id_idx` (`consist_id` ASC),
  INDEX `color_id_idx` (`color_id` ASC),
  INDEX `quantity_id_idx` (`quantity_id` ASC),
  INDEX `forWhat_id_idx` (`forWhat_id` ASC),
  INDEX `package_id_idx` (`package_id` ASC),
  INDEX `stitching_id_idx` (`stitching_id` ASC),
  INDEX `rStatus_id_idx` (`rStatus_id` ASC),
  INDEX `rWeight_id_idx` (`rWeight_id` ASC),
  INDEX `rLength_id_idx` (`rLength_id` ASC),
  INDEX `rBalance_id_idx` (`rBalance_id` ASC),
  INDEX `rHeadSize_id_idx` (`rHeadSize_id` ASC),
  INDEX `rFlexibility_id_idx` (`rFlexibility_id` ASC),
  INDEX `rStringFormula_id_idx` (`rStringFormula_id` ASC),
  INDEX `descr_id_idx` (`descr_id` ASC),
  INDEX `video_id_idx` (`video_id` ASC),
  INDEX `item_isNew_id_idx` (`isNew` ASC),
  INDEX `item_consist_type_id_idx` (`consist_type_id` ASC),
  INDEX `item_shoesWeight_id_idx` (`shoesWeight_id` ASC),
  CONSTRAINT `item_age_id`
    FOREIGN KEY (`age_id`)
    REFERENCES `lottoukr_ttt`.`lt_age` (`id`)
    ON UPDATE CASCADE,
  CONSTRAINT `item_brand_id`
    FOREIGN KEY (`brand_id`)
    REFERENCES `lottoukr_ttt`.`lt_brand` (`id`)
    ON UPDATE CASCADE,
  CONSTRAINT `item_category_id`
    FOREIGN KEY (`category_id`)
    REFERENCES `lottoukr_ttt`.`lt_categoryItem` (`id`)
    ON UPDATE CASCADE,
  CONSTRAINT `item_collection_id`
    FOREIGN KEY (`collection_id`)
    REFERENCES `lottoukr_ttt`.`lt_collection` (`id`)
    ON UPDATE CASCADE,
  CONSTRAINT `item_color_id`
    FOREIGN KEY (`color_id`)
    REFERENCES `lottoukr_ttt`.`lt_color` (`id`)
    ON UPDATE CASCADE,
  CONSTRAINT `item_consist_id`
    FOREIGN KEY (`consist_id`)
    REFERENCES `lottoukr_ttt`.`lt_consist` (`id`)
    ON UPDATE CASCADE,
  CONSTRAINT `item_country_id`
    FOREIGN KEY (`country_id`)
    REFERENCES `lottoukr_ttt`.`lt_country` (`id`)
    ON UPDATE CASCADE,
  CONSTRAINT `item_descr_id`
    FOREIGN KEY (`descr_id`)
    REFERENCES `lottoukr_ttt`.`lt_description` (`id`)
    ON UPDATE CASCADE,
  CONSTRAINT `item_exclusive_id`
    FOREIGN KEY (`exclusive_id`)
    REFERENCES `lottoukr_ttt`.`lt_exclusive` (`id`)
    ON UPDATE CASCADE,
  CONSTRAINT `item_forWhat_id`
    FOREIGN KEY (`forWhat_id`)
    REFERENCES `lottoukr_ttt`.`lt_forWhat` (`id`)
    ON UPDATE CASCADE,
  CONSTRAINT `item_line_id`
    FOREIGN KEY (`line_id`)
    REFERENCES `lottoukr_ttt`.`lt_line` (`id`)
    ON UPDATE CASCADE,
  CONSTRAINT `item_model_id`
    FOREIGN KEY (`model_id`)
    REFERENCES `lottoukr_ttt`.`lt_model` (`id`)
    ON UPDATE CASCADE,
  CONSTRAINT `item_package_id`
    FOREIGN KEY (`package_id`)
    REFERENCES `lottoukr_ttt`.`lt_package` (`id`)
    ON UPDATE CASCADE,
  CONSTRAINT `item_quantity_id`
    FOREIGN KEY (`quantity_id`)
    REFERENCES `lottoukr_ttt`.`lt_quantity` (`id`)
    ON UPDATE CASCADE,
  CONSTRAINT `item_rBalance_id`
    FOREIGN KEY (`rBalance_id`)
    REFERENCES `lottoukr_ttt`.`lt_rBalance` (`id`)
    ON UPDATE CASCADE,
  CONSTRAINT `item_rFlexibility_id`
    FOREIGN KEY (`rFlexibility_id`)
    REFERENCES `lottoukr_ttt`.`lt_rFlexibility` (`id`)
    ON UPDATE CASCADE,
  CONSTRAINT `item_rHeadSize_id`
    FOREIGN KEY (`rHeadSize_id`)
    REFERENCES `lottoukr_ttt`.`lt_rHeadSize` (`id`)
    ON UPDATE CASCADE,
  CONSTRAINT `item_rLength_id`
    FOREIGN KEY (`rLength_id`)
    REFERENCES `lottoukr_ttt`.`lt_rLength` (`id`)
    ON UPDATE CASCADE,
  CONSTRAINT `item_rStatus_id`
    FOREIGN KEY (`rStatus_id`)
    REFERENCES `lottoukr_ttt`.`lt_rStatus` (`id`)
    ON UPDATE CASCADE,
  CONSTRAINT `item_rStringFormula_id`
    FOREIGN KEY (`rStringFormula_id`)
    REFERENCES `lottoukr_ttt`.`lt_rStringFormula` (`id`)
    ON UPDATE CASCADE,
  CONSTRAINT `item_rWeight_id`
    FOREIGN KEY (`rWeight_id`)
    REFERENCES `lottoukr_ttt`.`lt_rWeight` (`id`)
    ON UPDATE CASCADE,
  CONSTRAINT `item_sex_id`
    FOREIGN KEY (`sex_id`)
    REFERENCES `lottoukr_ttt`.`lt_sex` (`id`)
    ON UPDATE CASCADE,
  CONSTRAINT `item_stitching_id`
    FOREIGN KEY (`stitching_id`)
    REFERENCES `lottoukr_ttt`.`lt_stitching` (`id`)
    ON UPDATE CASCADE,
  CONSTRAINT `item_type_id`
    FOREIGN KEY (`type_id`)
    REFERENCES `lottoukr_ttt`.`lt_typeItem` (`id`)
    ON UPDATE CASCADE,
  CONSTRAINT `item_video_id`
    FOREIGN KEY (`video_id`)
    REFERENCES `lottoukr_ttt`.`lt_video` (`id`)
    ON UPDATE CASCADE,
  CONSTRAINT `item_isNew_id`
    FOREIGN KEY (`isNew`)
    REFERENCES `lottoukr_ttt`.`lt_isNew` (`id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `item_consist_type_id`
    FOREIGN KEY (`consist_type_id`)
    REFERENCES `lottoukr_ttt`.`lt_consist_type` (`id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `item_shoesWeight_id`
    FOREIGN KEY (`shoesWeight_id`)
    REFERENCES `lottoukr_ttt`.`lt_shoesWeight` (`id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `lottoukr_ttt`.`lt_carpet_item`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lottoukr_ttt`.`lt_carpet_item` (
  `item_id` VARCHAR(36) NOT NULL,
  `carpet_id` VARCHAR(36) NOT NULL,
  `deletion_mark` TINYINT(1) NULL,
  `dateModified` TIMESTAMP NULL,
  INDEX `carpet_id_idx` (`carpet_id` ASC),
  INDEX `item_id_idx` (`item_id` ASC),
  PRIMARY KEY (`item_id`, `carpet_id`),
  CONSTRAINT `coveritem_carpet_id`
    FOREIGN KEY (`carpet_id`)
    REFERENCES `lottoukr_ttt`.`lt_carpet` (`id`)
    ON UPDATE CASCADE,
  CONSTRAINT `coveritem_item_id`
    FOREIGN KEY (`item_id`)
    REFERENCES `lottoukr_ttt`.`lt_item` (`id`)
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `lottoukr_ttt`.`lt_item_photo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lottoukr_ttt`.`lt_item_photo` (
  `id` VARCHAR(36) NOT NULL,
  `item_id` VARCHAR(36) NOT NULL,
  `name` VARCHAR(255) NULL,
  `photo` VARCHAR(255) NOT NULL,
  `sort` INT NULL,
  `deletion_mark` TINYINT(1) NULL,
  `dateModified` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  INDEX `item_id_idx` (`item_id` ASC),
  CONSTRAINT `photo_item_id`
    FOREIGN KEY (`item_id`)
    REFERENCES `lottoukr_ttt`.`lt_item` (`id`)
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `lottoukr_ttt`.`lt_sites`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lottoukr_ttt`.`lt_sites` (
  `id` VARCHAR(36) NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `deletion_mark` TINYINT(1) NULL,
  `dateModified` TIMESTAMP NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `lottoukr_ttt`.`lt_sites_category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lottoukr_ttt`.`lt_sites_category` (
  `id` VARCHAR(36) NOT NULL,
  `site_id` VARCHAR(36) NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `name_id` INT NOT NULL,
  `deletion_mark` TINYINT(1) NULL,
  `dateModified` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  INDEX `site_id_idx` (`site_id` ASC),
  CONSTRAINT `sitecategory_site_id`
    FOREIGN KEY (`site_id`)
    REFERENCES `lottoukr_ttt`.`lt_sites` (`id`)
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `lottoukr_ttt`.`lt_item_site`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lottoukr_ttt`.`lt_item_site` (
  `item_id` VARCHAR(36) NOT NULL,
  `siteCat_id` VARCHAR(36) NOT NULL,
  `isMain` TINYINT(1) NULL DEFAULT NULL,
  `deletion_mark` TINYINT(1) NULL,
  `dateModified` TIMESTAMP NULL,
  INDEX `item_id_idx` (`item_id` ASC),
  INDEX `siteCat_id_idx` (`siteCat_id` ASC),
  PRIMARY KEY (`item_id`, `siteCat_id`),
  CONSTRAINT `itemsite_item_id`
    FOREIGN KEY (`item_id`)
    REFERENCES `lottoukr_ttt`.`lt_item` (`id`)
    ON UPDATE CASCADE,
  CONSTRAINT `itemsite_siteCat_id`
    FOREIGN KEY (`siteCat_id`)
    REFERENCES `lottoukr_ttt`.`lt_sites_category` (`id`)
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `lottoukr_ttt`.`lt_sport`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lottoukr_ttt`.`lt_sport` (
  `id` VARCHAR(36) NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `deletion_mark` TINYINT(1) NULL,
  `dateModified` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `lottoukr_ttt`.`lt_item_sport`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lottoukr_ttt`.`lt_item_sport` (
  `item_id` VARCHAR(36) NOT NULL,
  `sport_id` VARCHAR(36) NOT NULL,
  `deletion_mark` TINYINT(1) NULL,
  `dateModified` TIMESTAMP NULL,
  INDEX `sport_id_idx` (`sport_id` ASC),
  INDEX `item_id_idx` (`item_id` ASC),
  PRIMARY KEY (`item_id`, `sport_id`),
  CONSTRAINT `itemsport_item_id`
    FOREIGN KEY (`item_id`)
    REFERENCES `lottoukr_ttt`.`lt_item` (`id`)
    ON UPDATE CASCADE,
  CONSTRAINT `itemsport_sport_id`
    FOREIGN KEY (`sport_id`)
    REFERENCES `lottoukr_ttt`.`lt_sport` (`id`)
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `lottoukr_ttt`.`lt_item_technology`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lottoukr_ttt`.`lt_item_technology` (
  `item_id` VARCHAR(36) NOT NULL,
  `technology_id` VARCHAR(36) NOT NULL,
  `deletion_mark` TINYINT(1) NULL,
  `dateModified` TIMESTAMP NULL,
  INDEX `item_id_idx` (`item_id` ASC),
  INDEX `technology_id_idx` (`technology_id` ASC),
  PRIMARY KEY (`item_id`, `technology_id`),
  CONSTRAINT `itemtechnology_item_id`
    FOREIGN KEY (`item_id`)
    REFERENCES `lottoukr_ttt`.`lt_item` (`id`)
    ON UPDATE CASCADE,
  CONSTRAINT `itemtechnology_technology_id`
    FOREIGN KEY (`technology_id`)
    REFERENCES `lottoukr_ttt`.`lt_brand_technology` (`id`)
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `lottoukr_ttt`.`lt_raquets_strings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lottoukr_ttt`.`lt_raquets_strings` (
  `r_item_id` VARCHAR(36) NOT NULL,
  `s_item_id` VARCHAR(36) NOT NULL,
  `deletion_mark` TINYINT(1) NULL,
  `dateModified` TIMESTAMP NULL,
  INDEX `rs_raquet_idx` (`r_item_id` ASC),
  INDEX `rs_string_idx` (`s_item_id` ASC),
  PRIMARY KEY (`s_item_id`, `r_item_id`),
  CONSTRAINT `rs_raquet`
    FOREIGN KEY (`r_item_id`)
    REFERENCES `lottoukr_ttt`.`lt_item` (`id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `rs_string`
    FOREIGN KEY (`s_item_id`)
    REFERENCES `lottoukr_ttt`.`lt_item` (`id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lottoukr_ttt`.`lt_raquets_winding`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lottoukr_ttt`.`lt_raquets_winding` (
  `r_item_id` VARCHAR(36) NOT NULL,
  `w_item_id` VARCHAR(36) NOT NULL,
  `deletion_mark` TINYINT(1) NULL,
  `dateModified` TIMESTAMP NULL,
  INDEX `winding_raquets_id_idx` (`r_item_id` ASC),
  INDEX `winding_winding_id_idx` (`w_item_id` ASC),
  PRIMARY KEY (`r_item_id`, `w_item_id`),
  CONSTRAINT `winding_raquets_id`
    FOREIGN KEY (`r_item_id`)
    REFERENCES `lottoukr_ttt`.`lt_item` (`id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `winding_winding_id`
    FOREIGN KEY (`w_item_id`)
    REFERENCES `lottoukr_ttt`.`lt_item` (`id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lottoukr_ttt`.`lt_raquets_hand`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lottoukr_ttt`.`lt_raquets_hand` (
  `r_item_id` VARCHAR(36) NOT NULL,
  `h_item_id` VARCHAR(36) NOT NULL,
  `deletion_mark` TINYINT(1) NULL,
  `dateModified` TIMESTAMP NULL,
  INDEX `hand_raquets_id_idx` (`r_item_id` ASC),
  INDEX `hand_hand_id_idx` (`h_item_id` ASC),
  PRIMARY KEY (`r_item_id`, `h_item_id`),
  CONSTRAINT `hand_raquets_id`
    FOREIGN KEY (`r_item_id`)
    REFERENCES `lottoukr_ttt`.`lt_item` (`id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `hand_hand_id`
    FOREIGN KEY (`h_item_id`)
    REFERENCES `lottoukr_ttt`.`lt_item` (`id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lottoukr_ttt`.`lt_item_price`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lottoukr_ttt`.`lt_item_price` (
  `item_id` VARCHAR(36) NOT NULL,
  `common_price` DOUBLE NULL,
  `promotional_price` DOUBLE NULL,
  `deletion_mark` TINYINT(1) NULL,
  `dateModified` TIMESTAMP NULL,
  INDEX `price_item_id_idx` (`item_id` ASC),
  PRIMARY KEY (`item_id`),
  CONSTRAINT `price_item_id`
    FOREIGN KEY (`item_id`)
    REFERENCES `lottoukr_ttt`.`lt_item` (`id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lottoukr_ttt`.`lt_size_universal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lottoukr_ttt`.`lt_size_universal` (
  `id` VARCHAR(36) NOT NULL,
  `category_id` VARCHAR(36) NULL,
  `type_id` VARCHAR(36) NULL,
  `name` VARCHAR(255) NULL,
  `size_site_1` VARCHAR(100) NULL,
  `size_site_2` VARCHAR(100) NULL,
  `sort` INT NULL,
  `comment` VARCHAR(255) NULL,
  `thigs` VARCHAR(255) NULL,
  `waist` VARCHAR(255) NULL,
  `internal_seam` VARCHAR(255) NULL,
  `shoulder` VARCHAR(255) NULL,
  `chest` VARCHAR(255) NULL,
  `deletion_mark` TINYINT(1) NULL,
  `dateModified` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  INDEX `size_uni_category_id_idx` (`category_id` ASC),
  INDEX `size_uni_type_id_idx` (`type_id` ASC),
  CONSTRAINT `size_uni_category_id`
    FOREIGN KEY (`category_id`)
    REFERENCES `lottoukr_ttt`.`lt_categoryItem` (`id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `size_uni_type_id`
    FOREIGN KEY (`type_id`)
    REFERENCES `lottoukr_ttt`.`lt_typeItem` (`id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lottoukr_ttt`.`lt_item_size`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lottoukr_ttt`.`lt_item_size` (
  `size_name` VARCHAR(45) NULL,
  `size_universal_id` VARCHAR(36) NOT NULL,
  `item_id` VARCHAR(36) NOT NULL,
  `quantity` INT NULL,
  `deletion_mark` TINYINT(1) NULL,
  `dateModified` TIMESTAMP NULL,
  INDEX `size_item_id_idx` (`item_id` ASC),
  INDEX `item_size_universal_id_idx` (`size_universal_id` ASC),
  PRIMARY KEY (`item_id`, `size_universal_id`),
  CONSTRAINT `size_item_id`
    FOREIGN KEY (`item_id`)
    REFERENCES `lottoukr_ttt`.`lt_item` (`id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `item_size_universal_id`
    FOREIGN KEY (`size_universal_id`)
    REFERENCES `lottoukr_ttt`.`lt_size_universal` (`id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lottoukr_ttt`.`lt_technology_sport`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lottoukr_ttt`.`lt_technology_sport` (
  `id` VARCHAR(36) NOT NULL,
  `technology_id` VARCHAR(36) NULL,
  `sport_id` VARCHAR(36) NULL,
  `deletion_mark` TINYINT(1) NULL,
  `dateModified` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  INDEX `technology_sport_t_idx` (`technology_id` ASC),
  INDEX `technology_sport_s_idx` (`sport_id` ASC),
  CONSTRAINT `technology_sport_t`
    FOREIGN KEY (`technology_id`)
    REFERENCES `lottoukr_ttt`.`lt_brand_technology` (`id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `technology_sport_s`
    FOREIGN KEY (`sport_id`)
    REFERENCES `lottoukr_ttt`.`lt_sport` (`id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
