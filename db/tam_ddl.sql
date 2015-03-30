-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema tam
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema tam
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `tam` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `tam` ;

-- -----------------------------------------------------
-- Table `tam`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tam`.`user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_name` VARCHAR(45) NOT NULL,
  `user_password` VARCHAR(45) NOT NULL,
  `full_name` VARCHAR(45) NOT NULL,
  `disable` VARCHAR(1) NOT NULL DEFAULT 'F',
  `record_date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tam`.`pnr`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tam`.`pnr` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `pnr_no` VARCHAR(6) NOT NULL,
  `user_id` INT NOT NULL,
  `option_date` DATETIME NULL,
  `status` VARCHAR(2) NOT NULL COMMENT 'OK : Active reservation\nCX : Canceled reservation',
  `type` VARCHAR(2) NULL COMMENT 'OW : One way flight\nRT : Round trip flight\nHH : Hotel',
  `cancel_reason` VARCHAR(200) NULL,
  `note` VARCHAR(200) NULL,
  `record_date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `INX_PNR_USER_USER_ID` (`user_id` ASC),
  CONSTRAINT `FK_PNR_USER_USER_ID`
    FOREIGN KEY (`user_id`)
    REFERENCES `tam`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tam`.`contact_info`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tam`.`contact_info` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(45) NULL,
  `mobile` VARCHAR(18) NULL,
  `home_phone` VARCHAR(18) NULL,
  `company_phone` VARCHAR(18) NULL,
  `address` VARCHAR(200) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tam`.`pax`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tam`.`pax` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `surname` VARCHAR(45) NOT NULL,
  `birthdate` DATE NULL,
  `passport_no` VARCHAR(45) NULL,
  `identification_number` INT(11) NULL,
  `company` VARCHAR(45) NULL,
  `record_date` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `pnr_id` INT NOT NULL,
  `contact_info_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `INX_TRAVELER_NAME` (`name` ASC, `surname` ASC),
  INDEX `INX_TRAVELER_PNR_PNR_ID` (`pnr_id` ASC),
  INDEX `INX_PAX_CONTACT_INFO_CONTACT_INFO_ID` (`contact_info_id` ASC),
  CONSTRAINT `FK_TRAVELER_PNR_PNR_ID`
    FOREIGN KEY (`pnr_id`)
    REFERENCES `tam`.`pnr` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_PAX_CONTACT_INFO_CONTACT_INFO_ID`
    FOREIGN KEY (`contact_info_id`)
    REFERENCES `tam`.`contact_info` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tam`.`payment_type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tam`.`payment_type` (
  `code` VARCHAR(2) NOT NULL,
  `explanation` VARCHAR(200) NULL,
  PRIMARY KEY (`code`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tam`.`ticket`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tam`.`ticket` (
  `tkt_no` VARCHAR(13) NOT NULL,
  `status` VARCHAR(2) NOT NULL,
  `dos` DATETIME NOT NULL,
  `dor` DATETIME NULL,
  `user_id` INT NOT NULL,
  `buying_amount` DOUBLE NOT NULL,
  `buying_currency` VARCHAR(3) NOT NULL,
  `payment_type_code` VARCHAR(2) NOT NULL,
  `selling_amount` DOUBLE NOT NULL,
  `selling_currency` VARCHAR(3) NOT NULL,
  `traveler_id` INT NOT NULL,
  `pnr_id` INT NULL,
  INDEX `INX_TICKET_TRAVELER_ID` (`traveler_id` ASC),
  INDEX `INX_TICKET_DOS` (`dos` ASC),
  INDEX `INX_TICKET_USER_ID` (`user_id` ASC),
  PRIMARY KEY (`tkt_no`),
  INDEX `INX_TICKET_USER_PNR_ID` (`pnr_id` ASC),
  INDEX `FK_TICKET_PAYMENT_TYPE_PAYMENT_TYPE_CODE_idx` (`payment_type_code` ASC),
  CONSTRAINT `FK_TICKET_TRAVELER_TVL_ID`
    FOREIGN KEY (`traveler_id`)
    REFERENCES `tam`.`pax` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_TICKET_USER_USER_ID`
    FOREIGN KEY (`user_id`)
    REFERENCES `tam`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_TICKET_USER_PNR_ID`
    FOREIGN KEY (`pnr_id`)
    REFERENCES `tam`.`pnr` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_TICKET_PAYMENT_TYPE_PAYMENT_TYPE_CODE`
    FOREIGN KEY (`payment_type_code`)
    REFERENCES `tam`.`payment_type` (`code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tam`.`country`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tam`.`country` (
  `code` VARCHAR(2) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`code`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tam`.`region`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tam`.`region` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `code` VARCHAR(20) NOT NULL,
  `country_code` VARCHAR(2) NOT NULL,
  `explanation` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `UI_REGION_CODE` (`code` ASC),
  INDEX `INX_REGION_COUNTRY_COUNTRY_CODE` (`country_code` ASC),
  CONSTRAINT `FK_REGION_COUNTRY_COUNTRY_CODE`
    FOREIGN KEY (`country_code`)
    REFERENCES `tam`.`country` (`code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tam`.`city`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tam`.`city` (
  `code` VARCHAR(3) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `country_code` VARCHAR(2) NOT NULL,
  `region_code` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`code`),
  INDEX `INX_CITY_COUNTRY_COUNTRY_CODE` (`country_code` ASC),
  INDEX `INX_CITY_COUNTRY_REGION_CODE` (`region_code` ASC),
  CONSTRAINT `FK_CITY_COUNTRY_COUNTRY_CODE`
    FOREIGN KEY (`country_code`)
    REFERENCES `tam`.`country` (`code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_CITY_COUNTRY_REGION_CODE`
    FOREIGN KEY (`region_code`)
    REFERENCES `tam`.`region` (`code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tam`.`port`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tam`.`port` (
  `code` VARCHAR(3) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `city_code` VARCHAR(3) NOT NULL,
  PRIMARY KEY (`code`),
  INDEX `FK_PORT_CITY_CITY_CODE_idx` (`city_code` ASC),
  CONSTRAINT `FK_PORT_CITY_CITY_CODE`
    FOREIGN KEY (`city_code`)
    REFERENCES `tam`.`city` (`code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tam`.`segment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tam`.`segment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `aa_code` VARCHAR(3) NOT NULL,
  `flt_no` VARCHAR(4) NOT NULL,
  `dep_port` VARCHAR(3) NOT NULL,
  `arr_port` VARCHAR(3) NOT NULL,
  `dep_date` DATETIME NOT NULL,
  `record_date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `UI_SEGMENT_FLT` (`flt_no` ASC, `dep_date` ASC, `aa_code` ASC, `dep_port` ASC, `arr_port` ASC),
  INDEX `FK_SEGMENT_PORT_DEP_PORT_idx` (`dep_port` ASC),
  INDEX `FK_SEGMENT_PORT_ARR_PORT_idx` (`arr_port` ASC),
  CONSTRAINT `FK_SEGMENT_PORT_DEP_PORT`
    FOREIGN KEY (`dep_port`)
    REFERENCES `tam`.`port` (`code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_SEGMENT_PORT_ARR_PORT`
    FOREIGN KEY (`arr_port`)
    REFERENCES `tam`.`port` (`code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tam`.`coupon`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tam`.`coupon` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `tkt_no` VARCHAR(13) NOT NULL,
  `cpn_no` INT(1) NOT NULL,
  `segment_id` INT NOT NULL,
  `cpn_status` VARCHAR(1) NOT NULL,
  `record_date` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `INX_COUPON_TCKT_NO` (`tkt_no` ASC),
  INDEX `INX_COUPON_SEG_ID` (`segment_id` ASC),
  CONSTRAINT `FK_COUPON_TICKET_TCKT_NO`
    FOREIGN KEY (`tkt_no`)
    REFERENCES `tam`.`ticket` (`tkt_no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_COUNPO_SEGMENT_SEG_ID`
    FOREIGN KEY (`segment_id`)
    REFERENCES `tam`.`segment` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tam`.`role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tam`.`role` (
  `code` VARCHAR(20) NOT NULL,
  `explanation` VARCHAR(100) NULL,
  PRIMARY KEY (`code`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tam`.`user_role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tam`.`user_role` (
  `user_id` INT NOT NULL,
  `role_code` VARCHAR(20) NOT NULL,
  INDEX `INX_USER_ROLE_ROLE_CODE` (`role_code` ASC),
  INDEX `INX_USER_ROLE_USER_ID` (`user_id` ASC),
  CONSTRAINT `FK_USER_ROLE_ROLE_ROLE_CODE`
    FOREIGN KEY (`role_code`)
    REFERENCES `tam`.`role` (`code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_USER_ROLE_USER_USER_ID`
    FOREIGN KEY (`user_id`)
    REFERENCES `tam`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tam`.`process`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tam`.`process` (
  `code` VARCHAR(20) NOT NULL,
  `explanation` VARCHAR(100) NULL,
  PRIMARY KEY (`code`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tam`.`role_process`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tam`.`role_process` (
  `role_code` VARCHAR(20) NOT NULL,
  `process_code` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`role_code`, `process_code`),
  INDEX `INX_ROLE_PROCESS_ROCESS_CODE` (`process_code` ASC),
  CONSTRAINT `FK_ROLE_PROCESS_ROLE_ROLE_CODE`
    FOREIGN KEY (`role_code`)
    REFERENCES `tam`.`role` (`code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_ROLE_PROCESS_PROCESS_PROCESS_CODE`
    FOREIGN KEY (`process_code`)
    REFERENCES `tam`.`process` (`code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tam`.`hotel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tam`.`hotel` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `address` VARCHAR(200) NOT NULL,
  `city_code` VARCHAR(3) NOT NULL,
  `email` VARCHAR(45) NULL,
  `phone` VARCHAR(18) NULL,
  PRIMARY KEY (`id`),
  INDEX `INX_HOTEL_CIYT_CITY_CODE` (`city_code` ASC),
  CONSTRAINT `FK_HOTEL_CIYT_CITY_CODE`
    FOREIGN KEY (`city_code`)
    REFERENCES `tam`.`city` (`code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tam`.`hotel_reservation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tam`.`hotel_reservation` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `hotel_id` INT NOT NULL,
  `traveler_id` INT NOT NULL,
  `pnr_id` INT NOT NULL,
  `date_from` DATE NOT NULL,
  `date_until` DATE NOT NULL,
  `room_count` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `INX_HOTEL_RESERVATION_HOTEL_HOTEL_ID` (`hotel_id` ASC),
  INDEX `INX_HOTEL_RESERVATION_TRAVELER_TRAVELER_ID` (`traveler_id` ASC),
  INDEX `INX_HOTEL_RESERVATION_PNR_PNR_ID` (`pnr_id` ASC),
  CONSTRAINT `FK_HOTEL_RESERVATION_HOTEL_HOTEL_ID`
    FOREIGN KEY (`hotel_id`)
    REFERENCES `tam`.`hotel` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_HOTEL_RESERVATION_TRAVELER_TRAVELER_ID`
    FOREIGN KEY (`traveler_id`)
    REFERENCES `tam`.`pax` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_HOTEL_RESERVATION_PNR_PNR_ID`
    FOREIGN KEY (`pnr_id`)
    REFERENCES `tam`.`pnr` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tam`.`room_type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tam`.`room_type` (
  `room_type_code` VARCHAR(20) NOT NULL,
  `explanation` VARCHAR(200) NULL,
  PRIMARY KEY (`room_type_code`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tam`.`hotel_fare`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tam`.`hotel_fare` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `hotel_id` INT NOT NULL,
  `room_type_code` VARCHAR(20) NOT NULL,
  `buying_fare` DOUBLE NOT NULL,
  `selling_fare` DOUBLE NOT NULL,
  `gate_fare` DOUBLE NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `FK_HOTEl_FARE_HOTEL_HOTEL_ID_idx` (`hotel_id` ASC),
  CONSTRAINT `FK_HOTEl_FARE_HOTEL_HOTEL_ID`
    FOREIGN KEY (`hotel_id`)
    REFERENCES `tam`.`hotel` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tam`.`tour_tranportation_type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tam`.`tour_tranportation_type` (
  `code` VARCHAR(2) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`code`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tam`.`guide`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tam`.`guide` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `surname` VARCHAR(45) NOT NULL,
  `kokart_no` INT NOT NULL,
  `fare` DOUBLE NOT NULL,
  `currency` VARCHAR(3) NOT NULL,
  `contact_info_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `INX_GUIDE_CONTACT_INFO_CONTACT_INFO_ID` (`contact_info_id` ASC),
  CONSTRAINT `FK_GUIDE_CONTACT_INFO_CONTACT_INFO_ID`
    FOREIGN KEY (`contact_info_id`)
    REFERENCES `tam`.`contact_info` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tam`.`museum`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tam`.`museum` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `city_code` VARCHAR(3) NOT NULL,
  `fare_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `INX_MUSEUM_CITY_CITY_CODE` (`city_code` ASC),
  CONSTRAINT `FK_MUSEUM_CITY_CITY_CODE`
    FOREIGN KEY (`city_code`)
    REFERENCES `tam`.`city` (`code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tam`.`tour`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tam`.`tour` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `coordinator` VARCHAR(45) NOT NULL,
  `route` VARCHAR(45) NOT NULL,
  `dep_date` DATE NOT NULL,
  `ret_date` DATE NOT NULL,
  `transportation_type_code` VARCHAR(2) NULL,
  `transportation_fare` DOUBLE NULL,
  `hotel_fare` DOUBLE NULL,
  `catering_on_vehicle` VARCHAR(200) NULL,
  `catering_on_vehicle_fare` DOUBLE NULL,
  `policy_no` INT NULL,
  `policy_amount` DOUBLE NULL,
  `selling_amount` DOUBLE NOT NULL,
  `currency` VARCHAR(3) NULL,
  `note` VARCHAR(600) NULL,
  `guide_id` INT NOT NULL,
  `hotel_id` INT NULL,
  `museum_id` INT NULL,
  `user_id` INT NOT NULL,
  `record_date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `INX_TOUR_TRANPORTATION_TYPE_TT_CODE` (`transportation_type_code` ASC),
  INDEX `INX_TOUR_GUIDE_GUIDE_ID` (`guide_id` ASC),
  INDEX `INX_TOUR_HOTEL_HOTEL_ID` (`hotel_id` ASC),
  INDEX `INX_TOUR_MUSEUM_MUSEUM_ID` (`museum_id` ASC),
  INDEX `INX_TOUR_USER_USER_ID` (`user_id` ASC),
  CONSTRAINT `FK_TOUR_TRANPORTATION_TYPE_TT_CODE`
    FOREIGN KEY (`transportation_type_code`)
    REFERENCES `tam`.`tour_tranportation_type` (`code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_TOUR_GUIDE_GUIDE_ID`
    FOREIGN KEY (`guide_id`)
    REFERENCES `tam`.`guide` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_TOUR_HOTEL_HOTEL_ID`
    FOREIGN KEY (`hotel_id`)
    REFERENCES `tam`.`hotel` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_TOUR_MUSEUM_MUSEUM_ID`
    FOREIGN KEY (`museum_id`)
    REFERENCES `tam`.`museum` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_TOUR_USER_USER_ID`
    FOREIGN KEY (`user_id`)
    REFERENCES `tam`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tam`.`museum_fare`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tam`.`museum_fare` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `adult_fare` DOUBLE NOT NULL,
  `child_fare` DOUBLE NOT NULL,
  `discount_fare` DOUBLE NOT NULL COMMENT 'student,teacher,senior discount',
  `museum_id` INT NOT NULL,
  `currency` VARCHAR(3) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `INX_MUSEUM_FARE_MUSEUM_MUSEUM_ID` (`museum_id` ASC),
  CONSTRAINT `FK_MUSEUM_FARE_MUSEUM_MUSEUM_ID`
    FOREIGN KEY (`museum_id`)
    REFERENCES `tam`.`museum` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tam`.`restorant`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tam`.`restorant` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `adsress` VARCHAR(200) NULL,
  `phone` VARCHAR(18) NULL,
  `email` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tam`.`tour_restorant`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tam`.`tour_restorant` (
  `tour_id` INT NOT NULL AUTO_INCREMENT,
  `restorant_id` INT NOT NULL,
  `restorant_fare` DOUBLE NOT NULL,
  `currency` VARCHAR(3) NOT NULL,
  PRIMARY KEY (`tour_id`, `restorant_id`),
  INDEX `INX_TOUR_RESTORANT_RESTORANT_REST_ID` (`restorant_id` ASC),
  CONSTRAINT `FK_TOUR_RESTORANT_RESTORANT_REST_ID`
    FOREIGN KEY (`restorant_id`)
    REFERENCES `tam`.`restorant` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_TOUR_RESTORANT_TOUR_TOUR_ID`
    FOREIGN KEY (`tour_id`)
    REFERENCES `tam`.`tour` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tam`.`tour_pax`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tam`.`tour_pax` (
  `tour_id` INT NOT NULL,
  `pax_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`tour_id`, `pax_id`),
  INDEX `INX_TOUR_PAX_PAX_PAX_ID` (`pax_id` ASC),
  INDEX `INX_TOUR_PAX_USER_USER_ID` (`user_id` ASC),
  CONSTRAINT `FK_TOUR_PAX_TOUR_TOUR_ID`
    FOREIGN KEY (`tour_id`)
    REFERENCES `tam`.`tour` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_TOUR_PAX_PAX_PAX_ID`
    FOREIGN KEY (`pax_id`)
    REFERENCES `tam`.`pax` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_TOUR_PAX_USER_USER_ID`
    FOREIGN KEY (`user_id`)
    REFERENCES `tam`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tam`.`auction`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tam`.`auction` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `auction_name` VARCHAR(45) NULL,
  `registry_no` VARCHAR(20) NULL,
  `coordinator_name` VARCHAR(45) NOT NULL,
  `coordinator_surname` VARCHAR(45) NULL,
  `orginization_name` VARCHAR(45) NULL,
  `auction_date` DATETIME NULL,
  `contract_date` DATETIME NULL,
  `kick_off_date` DATETIME NULL,
  `due_date` DATETIME NULL,
  `estimated_cost` DOUBLE NULL,
  `contract_amount` DOUBLE NULL,
  `estimated_profit` DOUBLE NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tam`.`auction_item`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tam`.`auction_item` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `auction_id` INT NOT NULL,
  `item_name` VARCHAR(45) NOT NULL,
  `item_fare` DOUBLE NOT NULL DEFAULT 0,
  `İtem_count` INT NOT NULL DEFAULT 0,
  `total_amount` DOUBLE NOT NULL,
  `supliyer_company` VARCHAR(200) NOT NULL,
  `note` VARCHAR(200) NOT NULL,
  `type` VARCHAR(1) NOT NULL COMMENT 'M : Meterial\nS : Service',
  PRIMARY KEY (`id`),
  INDEX `INX_AUCTION_ITEM_AUCTION_AUCTION_ID` (`auction_id` ASC),
  CONSTRAINT `FK_AUCTION_ITEM_AUCTION_AUCTION_ID`
    FOREIGN KEY (`auction_id`)
    REFERENCES `tam`.`auction` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tam`.`auction_payment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tam`.`auction_payment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `auction_id` INT NULL,
  `name` VARCHAR(100) NULL,
  `amount` DOUBLE NULL,
  `currency` VARCHAR(3) NULL,
  `note` VARCHAR(200) NULL,
  `type` VARCHAR(1) NULL COMMENT 'C : Cost, amount is negative\nD : Deduction, amount is negative\nP : Payment, amount is positive',
  `ops_date` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `INX_BACKHAND_COST_AUCTION_AUCTION_ID` (`auction_id` ASC),
  CONSTRAINT `FK_BACKHAND_COST_AUCTION_AUCTION_ID`
    FOREIGN KEY (`auction_id`)
    REFERENCES `tam`.`auction` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
