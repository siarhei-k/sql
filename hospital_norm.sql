-- -----------------------------------------------------
-- Table `hospital_norm`.`HeadDoctor`
-- -----------------------------------------------------
CREATE TABLE `HeadDoctor` (
  `idHeadDoctor` INT NULL,
  PRIMARY KEY (`idHeadDoctor`),
  UNIQUE INDEX `idHeadDoctor_UNIQUE` (`idHeadDoctor` ASC));


-- -----------------------------------------------------
-- Table `hospital_norm`.`Doctor`
-- -----------------------------------------------------
CREATE TABLE `Doctor` (
  `idDoctor` INT NOT NULL,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `phone` VARCHAR(45) NOT NULL,
  `speciality_number` INT NOT NULL,
  `speciality` VARCHAR(45) NOT NULL,
  `idHeadDoctor` INT NOT NULL,
  PRIMARY KEY (`idDoctor`),
  UNIQUE INDEX `idDoctor_UNIQUE` (`idDoctor` ASC),
  UNIQUE INDEX `idHeadDoctor_UNIQUE` (`idHeadDoctor` ASC),
  CONSTRAINT `idHeadDoctor`
    FOREIGN KEY (`idHeadDoctor`)
    REFERENCES `hospital_norm`.`HeadDoctor` (`idHeadDoctor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `hospital_norm`.`Patient`
-- -----------------------------------------------------
CREATE TABLE `Patient` (
  `idPatient` INT NOT NULL,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `phone` VARCHAR(45) NOT NULL,
  `e-mail` VARCHAR(45) NOT NULL,
  `adress` VARCHAR(45) NOT NULL,
  `date_added` DATE NOT NULL,
  `idDoctor` INT NOT NULL,
  PRIMARY KEY (`idPatient`),
  CONSTRAINT `idDoctor`
    FOREIGN KEY (`idDoctor`)
    REFERENCES `hospital_norm`.`Doctor` (`idDoctor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `hospital_norm`.`Appoitment`
-- -----------------------------------------------------
CREATE TABLE `Appoitment` (
  `idAppoitment` INT NOT NULL,
  `appoitment_date` DATETIME NOT NULL,
  `doctor` INT NOT NULL,
  `patient` INT NOT NULL,
  `blood_pressure` VARCHAR(10) NOT NULL,
  `pulse` TINYINT(10) NOT NULL,
  `treatment_notes` CHAR NOT NULL,
  PRIMARY KEY (`idAppoitment`),
  UNIQUE INDEX `idDoctor_UNIQUE` (`doctor` ASC),
  UNIQUE INDEX `idPatient_UNIQUE` (`patient` ASC),
  CONSTRAINT `doctor`
    FOREIGN KEY (`doctor`)
    REFERENCES `hospital_norm`.`Doctor` (`idDoctor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `patient`
    FOREIGN KEY (`patient`)
    REFERENCES `hospital_norm`.`Patient` (`idPatient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `hospital_norm`.`Allergies`
-- -----------------------------------------------------
CREATE TABLE `Allergies` (
  `idAllergies` INT NOT NULL AUTO_INCREMENT,
  `allergy` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`idAllergies`),
  UNIQUE INDEX `idAllergies_UNIQUE` (`idAllergies` ASC),
  UNIQUE INDEX `allergy_UNIQUE` (`allergy` ASC));


-- -----------------------------------------------------
-- Table `hospital_norm`.`patient_allergies`
-- -----------------------------------------------------
CREATE TABLE `patient_allergies` (
  `allergic_patient` INT NOT NULL,
  `allergies` INT NOT NULL,
  CONSTRAINT `allergic_patient`
    FOREIGN KEY (`allergic_patient`)
    REFERENCES `hospital_norm`.`Patient` (`idPatient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `allergies`
    FOREIGN KEY (`allergies`)
    REFERENCES `hospital_norm`.`Allergies` (`idAllergies`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `hospital_norm`.`Medicines`
-- -----------------------------------------------------
CREATE TABLE `Medicines` (
  `idMedicines` INT NOT NULL AUTO_INCREMENT,
  `medicine` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`idMedicines`));


-- -----------------------------------------------------
-- Table `hospital_norm`.`appoitment_medicines`
-- -----------------------------------------------------
CREATE TABLE `appoitment_medicines` (
  `appointment` INT NOT NULL,
  `medicines` INT NOT NULL,
  CONSTRAINT `appointment`
    FOREIGN KEY (`appointment`)
    REFERENCES `hospital_norm`.`Appoitment` (`idAppoitment`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `medicines`
    FOREIGN KEY (`medicines`)
    REFERENCES `hospital_norm`.`Medicines` (`idMedicines`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
