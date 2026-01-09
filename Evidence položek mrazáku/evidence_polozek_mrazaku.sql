SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, 
SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8;
USE `mydb`;

-- -----------------------------------------------------
-- Table `kategorie`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `kategorie` (
  `id_kategorie` INT NOT NULL AUTO_INCREMENT,
  `nazev` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_kategorie`),
  UNIQUE INDEX `nazev_UNIQUE` (`nazev` ASC)
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `polozka`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `polozka` (
  `id_polozky` INT NOT NULL AUTO_INCREMENT,
  `nazev` VARCHAR(45) NOT NULL,
  `datum_expirace` DATE NOT NULL,
  `pocet_kusu` INT NOT NULL,
  `id_kategorie` INT NOT NULL,
  PRIMARY KEY (`id_polozky`),
  INDEX `fk_polozka_kategorie_idx` (`id_kategorie` ASC),
  CONSTRAINT `fk_polozka_kategorie`
    FOREIGN KEY (`id_kategorie`)
    REFERENCES `kategorie` (`id_kategorie`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
) ENGINE = InnoDB;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
