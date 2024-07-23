-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE `population` (
    `index_column` INT  NULL ,
    `borough` VARCHAR(500)  NULL ,
    `total_population` VARCHAR(500)  NULL ,
    `pop_portion` VARCHAR(500)  NULL 
);

CREATE TABLE `Dog_Bite` (
    `index_column` INT  NULL ,
    `incident_date` DATE  NULL ,
    `breed` VARCHAR(200)  NULL ,
    `age` VARCHAR(200)  NULL ,
    `gender` VARCHAR(200)  NULL ,
    `spay_neuter_status` VARCHAR(200)  NULL ,
    `borough` VARCHAR(200)  NULL ,
    `zip_code` VARCHAR(200)  NULL 
);

CREATE TABLE `dogs_data` (
    `index_column` INT  NULL ,
    `incident_date` DATE  NULL ,
    `breed` VARCHAR(200)  NULL ,
    `age` INT  NULL ,
    `gender` VARCHAR(200)  NULL ,
    `spay_neuter_status` VARCHAR(200)  NULL 
);

CREATE TABLE `dog_locations` (
    `index_column` INT  NULL ,
    `incident_date` DATE  NULL ,
    `borough` VARCHAR(200)  NULL ,
    `zip_code` VARCHAR(200)  NULL 
);

CREATE TABLE `breed_borough` (
    `index_column` INT  NULL ,
    `incident_date` DATE  NULL ,
    `breed` VARCHAR(200)  NULL ,
    `borough` VARCHAR(200)  NULL 
);

ALTER TABLE `Dog_Bite` ADD CONSTRAINT `fk_Dog_Bite_borough` FOREIGN KEY(`borough`)
REFERENCES `population` (`borough`);

ALTER TABLE `dogs_data` ADD CONSTRAINT `fk_dogs_data_index_column` FOREIGN KEY(`index_column`)
REFERENCES `Dog_Bite` (`index_column`);

ALTER TABLE `dog_locations` ADD CONSTRAINT `fk_dog_locations_index_column` FOREIGN KEY(`index_column`)
REFERENCES `Dog_Bite` (`index_column`);

ALTER TABLE `dog_locations` ADD CONSTRAINT `fk_dog_locations_borough` FOREIGN KEY(`borough`)
REFERENCES `population` (`borough`);

ALTER TABLE `breed_borough` ADD CONSTRAINT `fk_breed_borough_index_column` FOREIGN KEY(`index_column`)
REFERENCES `Dog_Bite` (`index_column`);

ALTER TABLE `breed_borough` ADD CONSTRAINT `fk_breed_borough_borough` FOREIGN KEY(`borough`)
REFERENCES `population` (`borough`);

