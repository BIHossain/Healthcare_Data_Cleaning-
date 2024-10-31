# Healthcare Data Cleaning Project

## Project Overview
This project demonstrates data-cleaning techniques on a healthcare dataset using SQL. The dataset includes common inconsistencies and errors found in healthcare data, such as duplicated records, inconsistent formats, missing values, and placeholder text. This project showcases how SQL can be used to clean and standardize data, making it ready for further analysis.

## Dataset Description
The dataset used in this project includes synthetic healthcare records with the following columns:

- **Patient_ID**: Unique identifier for each patient.
- **First_Name** & **Last_Name**: Patient's first and last names.
- **Date_of_Birth**: Patient’s date of birth.
- **Gender**: Patient's gender.
- **Blood_Pressure**: Blood pressure levels.
- **Cholesterol**: Cholesterol levels.
- **Diagnosis**: Medical condition of the patient.
- **Visit_Date**: Date of the patient's visit.
- **Medication**: Medication prescribed.
- **Notes**: Additional notes.
- **Age**: Patient age.

## Data Cleaning Steps
The following SQL queries were used to clean the dataset:

1. **Removing Duplicates**: Identified and removed duplicated records based on `Patient_ID`, `First_Name`, and `Last_Name`.
2. **Handling Missing Values**:
   - Replaced categorical placeholders like “Unknown” or “None” with NULL values where appropriate.
3. **Standardizing Date Formats**: Converted dates in `Date_of_Birth` and `Visit_Date` to `YYYY-MM-DD` format. For unknown values, set them as NULL.
4. **Normalizing Categorical Data**:
   - Standardized `Gender` values (e.g., converted "Unknown" and "Non-binary" to standardized terms).
   - Transformed `Blood_Pressure` and `Cholesterol` to numeric categories (e.g., replacing “high” with values based on domain knowledge).
5. **Data Validation and Consistency Checks**:
   - Ensured `Age` aligns with `Date_of_Birth` where both were present.
   - Removed or flagged inconsistent values in `Medication` and `Notes`.

## Project Files
- **[dataset.csv](./dataset.csv)**: CSV file containing the raw dataset.
- **[cleaning_queries.sql](./cleaning_queries.sql)**: SQL file with the data cleaning queries.
- **[sample_output.csv](./sample_output.csv)**: Cleaned dataset after SQL transformations.

## How to Use
1. Load the `dataset.csv` file into your SQL database.
2. Run each query from `cleaning_queries.sql` step-by-step to observe the cleaning process.
3. Verify the cleaned dataset by exporting the final result to `sample_output.csv`.

## Summary
This project demonstrates practical data-cleaning techniques on a healthcare dataset, transforming raw data into a structured, analysis-ready format. It highlights key SQL skills for managing real-world data inconsistencies and preparing healthcare data for analysis.
