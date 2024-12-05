-- A New Schema was created, and a the table was imported via the Import Wizard

-- Viewing all the table to review the data
SELECT * FROM sleep_health_and_lifestyle_dataset;


DESCRIBE sleep_health_and_lifestyle_dataset;

SELECT COUNT(*) FROM sleep_health_and_lifestyle_dataset;

-- Looking for missing values in Sleep Disorder column

SELECT
	COUNT(*) - COUNT(`Sleep Disorder`) AS missing_values, 
    `Sleep Disorder`
FROM sleep_health_and_lifestyle_dataset
GROUP BY `Sleep Disorder`
HAVING missing_values > 0;

SELECT DISTINCT `Occupation` FROM sleep_health_and_lifestyle_dataset;
SELECT COUNT(DISTINCT `Occupation`) FROM sleep_health_and_lifestyle_dataset;

SELECT
  AVG(Age) AS mean,
  STD(Age) AS std_dev,
  MIN(Age) AS minimum,
  MAX(Age) AS maximum
FROM sleep_health_and_lifestyle_dataset;

-- Splitting the Blood Pressure into two columns Systolic and Diastolic
-- Adding the New columns to the Table


-- Creating the new columns
ALTER TABLE sleep_health_and_lifestyle_dataset
ADD COLUMN `Systolic` INT,
ADD COLUMN `Diastolic` INT;



SELECT
	`Blood Pressure`,
    SUBSTRING_INDEX(`Blood Pressure` , '/', 1) AS Systolic,
    SUBSTRING_INDEX(`Blood Pressure` , '/', -1) AS Diastolic
FROM sleep_health_and_lifestyle_dataset;

-- Updating the table
UPDATE sleep_health_and_lifestyle_dataset
SET 
    `Systolic` = SUBSTRING_INDEX(`Blood Pressure`, '/', 1),
    `Diastolic` = SUBSTRING_INDEX(`Blood Pressure`, '/', -1);


-- Give a score for the BMI Category

SELECT 
    `BMI Category`,
    CASE 
        WHEN `BMI Category` = 'Underweight' THEN 0
        WHEN `BMI Category` = 'Normal Weight' THEN 1
        WHEN `BMI Category` = 'Normal' THEN 2
        WHEN `BMI Category` = 'Overweight' THEN 3
        WHEN `BMI Category` = 'Obese' THEN 4
        ELSE NULL
    END AS `BMI Score`
FROM 
    sleep_health_and_lifestyle_dataset;
    
    -- Creating new column witht the score
ALTER TABLE sleep_health_and_lifestyle_dataset
ADD COLUMN `BMI Score` INT;

-- Updating the new column
UPDATE sleep_health_and_lifestyle_dataset
SET `BMI Score` =
    CASE 
        WHEN `BMI Category` = 'Underweight' THEN 0
        WHEN `BMI Category` = 'Normal Weight' THEN 1
        WHEN `BMI Category` = 'Normal' THEN 2
        WHEN `BMI Category` = 'Overweight' THEN 3
        WHEN `BMI Category` = 'Obese' THEN 4
        ELSE NULL
    END;
    
    
    -- Viewing the new Table 
    
    SELECT * FROM sleep_health_and_lifestyle_dataset;

    -- After the EDA in python I noticed the "Non" in columne "Sleep Disorder" was considered as null, this is why I updated this value to "No Disorder"

    UPDATE sleep_health_and_lifestyle_dataset
    SET `Sleep Disorder` = 'No Disorder'
    WHERE `Sleep Disorder` = 'None';
    
    SELECT * FROM sleep_health_and_lifestyle_dataset;
    
    
ALTER TABLE sleep_health_and_lifestyle_dataset
ADD COLUMN `Daily Steps Score` INT;

UPDATE sleep_health_and_lifestyle_dataset
SET `Daily Steps Score` =
    CASE 
        WHEN `Daily Steps` < 5000 THEN 1
        WHEN `Daily Steps` >= 5000 AND `Daily Steps` < 7500 THEN 2
        WHEN `Daily Steps` >= 7500 AND `Daily Steps` < 10000 THEN 3
        WHEN `Daily Steps` >= 10000 AND `Daily Steps` < 12000 THEN 4
        WHEN `Daily Steps` >= 12000 THEN 5
        ELSE NULL
    END;
    
    
ALTER TABLE sleep_health_and_lifestyle_dataset
ADD COLUMN `Blood Pressure Category` VARCHAR(20);

UPDATE sleep_health_and_lifestyle_dataset
SET `Blood Pressure Category` =
    CASE 
        WHEN `Systolic` <= 120 AND `Diastolic` <= 80 THEN 'Normal'
        WHEN `Systolic` >= 121 AND `Systolic` <= 129 AND `Diastolic` <= 80 THEN 'Elevated'
        WHEN `Systolic` >= 130 AND `Systolic` <= 139 AND `Diastolic` >= 81 AND `Diastolic` <= 89 THEN 'High'
        WHEN `Systolic` >= 140 OR `Diastolic` <= 90 THEN 'Hypertensive Crisis'
        ELSE 'Unknown'
    END;
    
    
SELECT * FROM sleep_health_and_lifestyle_dataset;
    
    
    
ALTER TABLE sleep_health_and_lifestyle_dataset
ADD COLUMN `Blood Pressure Score` INT;

-- Update the Blood Pressure Score based on Blood Pressure Category
UPDATE sleep_health_and_lifestyle_dataset
SET `Blood Pressure Score` =
    CASE 
        WHEN `Blood Pressure Category` = 'Normal' THEN 1
        WHEN `Blood Pressure Category` = 'Elevated' THEN 2
        WHEN `Blood Pressure Category` = 'High' THEN 3
        WHEN `Blood Pressure Category` = 'Hypertensive Crisis' THEN 4
        ELSE NULL 
    END;
    
    SELECT * FROM sleep_health_and_lifestyle_dataset;


    
