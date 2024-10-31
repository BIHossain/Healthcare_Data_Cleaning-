
-- Removing Duplicates
DELETE FROM healthcare_data
WHERE rowid NOT IN (
    SELECT MIN(rowid)
    FROM healthcare_data
    GROUP BY Patient_ID, First_Name, Last_Name
);

-- Handling Missing Values by Replacing Categorical Placeholders
UPDATE healthcare_data SET Gender = NULL WHERE Gender IN ('Unknown', 'None');
UPDATE healthcare_data SET Diagnosis = NULL WHERE Diagnosis IN ('Unknown', 'None');
UPDATE healthcare_data SET Medication = NULL WHERE Medication IN ('Unknown', 'None');

-- Adding Flags for Missing Data
ALTER TABLE healthcare_data ADD COLUMN Is_Blood_Pressure_Missing BOOLEAN;
ALTER TABLE healthcare_data ADD COLUMN Is_Cholesterol_Missing BOOLEAN;
ALTER TABLE healthcare_data ADD COLUMN Is_Gender_Missing BOOLEAN;
ALTER TABLE healthcare_data ADD COLUMN Is_Diagnosis_Missing BOOLEAN;

UPDATE healthcare_data SET Is_Blood_Pressure_Missing = CASE WHEN Blood_Pressure IS NULL OR Blood_Pressure IN ('high', 'normal', 'borderline') THEN 1 ELSE 0 END;
UPDATE healthcare_data SET Is_Cholesterol_Missing = CASE WHEN Cholesterol IS NULL OR Cholesterol IN ('high', 'borderline') THEN 1 ELSE 0 END;
UPDATE healthcare_data SET Is_Gender_Missing = CASE WHEN Gender IS NULL THEN 1 ELSE 0 END;
UPDATE healthcare_data SET Is_Diagnosis_Missing = CASE WHEN Diagnosis IS NULL THEN 1 ELSE 0 END;

-- Standardizing Date Formats for Date_of_Birth and Visit_Date
UPDATE healthcare_data SET Date_of_Birth = CASE WHEN Date_of_Birth LIKE '__/__/____' THEN STRFTIME('%Y-%m-%d', Date_of_Birth) ELSE Date_of_Birth END;
UPDATE healthcare_data SET Visit_Date = CASE WHEN Visit_Date LIKE '__/__/____' THEN STRFTIME('%Y-%m-%d', Visit_Date) ELSE Visit_Date END;
