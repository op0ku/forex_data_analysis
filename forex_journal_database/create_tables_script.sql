-- Forex Journal Database

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema forex_journal
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema forex_journal
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `forex_journal` DEFAULT CHARACTER SET utf8mb4 ;
USE `forex_journal` ;

-- -----------------------------------------------------
-- Table `forex_journal`.`Trade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `forex_journal`.`Trade` (
  `Trade_id` INT NOT NULL AUTO_INCREMENT,
  `Trade_open` TIMESTAMP(6) NOT NULL,
  `Trade_close` TIMESTAMP(6) NOT NULL,
  `Day` VARCHAR(10) GENERATED ALWAYS AS (DAYNAME('Trade_open')) VIRTUAL,
  `Session` VARCHAR(10) NOT NULL,
  `Asset` VARCHAR(10) NOT NULL,
  `Position` VARCHAR(10) NOT NULL,
  `Bias` VARCHAR(10) NOT NULL,
  `Profile` VARCHAR(10) NOT NULL,
  `Entry` VARCHAR(10) NOT NULL,
  `Confirmation` VARCHAR(10) NOT NULL,
  `Fvg_level` INT NULL,
  PRIMARY KEY (`Trade_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `forex_journal`.`Psychology`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `forex_journal`.`Psychology` (
  `Psychology_id` INT NOT NULL AUTO_INCREMENT,
  `Trade_id` INT NOT NULL,
  `Setup_alignment` VARCHAR(10) NOT NULL,
  `Pre_emotion` VARCHAR(20) NOT NULL,
  `Post_emotion` VARCHAR(20) NOT NULL,
  `Mental_state` VARCHAR(20) NOT NULL,
  `Retake_trade` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`Psychology_id`),
  INDEX `Trade_id_idx` (`Trade_id` ASC) VISIBLE,
  CONSTRAINT `Trade_id`
    FOREIGN KEY (`Trade_id`)
    REFERENCES `forex_journal`.`Trade` (`Trade_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `forex_journal`.`Risk_Management`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `forex_journal`.`Risk_Management` (
  `Risk_id` INT NOT NULL AUTO_INCREMENT,
  `Trade_id` INT NOT NULL,
  `Stop_loss_pips` FLOAT NOT NULL,
  `Take_profit_pips` FLOAT NOT NULL,
  `Risk_reward` FLOAT GENERATED ALWAYS AS (`Take_profit_pips` / `Stop_loss_pips`) VIRTUAL,
  `Risk_usd` FLOAT NOT NULL,
  `Profit_loss` FLOAT NOT NULL,
  `Trail_stop` VARCHAR(10) NOT NULL,
  `Outcome` VARCHAR(10) NOT NULL,
  `Balance` FLOAT NOT NULL,
  PRIMARY KEY (`Risk_id`),
  INDEX `Trade_id_idx` (`Trade_id` ASC) VISIBLE,
  CONSTRAINT `Trade_id`
    FOREIGN KEY (`Trade_id`)
    REFERENCES `forex_journal`.`Trade` (`Trade_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `forex_journal`.`Daily_Candle_Data`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `forex_journal`.`Daily_Candle_Data` (
  `DCD_id` VARCHAR(10) NOT NULL,
  `Trade_id` VARCHAR(10) NOT NULL,
  `Daily_candle` VARCHAR(10) NOT NULL,
  `Candle_range_pips` VARCHAR(45) NOT NULL,
  `Pre_entry_capture` MEDIUMBLOB NULL,
  `Post_entry_capture` MEDIUMBLOB NULL,
  PRIMARY KEY (`DCD_id`),
  INDEX `Trade_id_idx` (`Trade_id` ASC) VISIBLE,
  CONSTRAINT `Trade_id`
    FOREIGN KEY (`Trade_id`)
    REFERENCES `forex_journal`.`Trade` (`Trade_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
