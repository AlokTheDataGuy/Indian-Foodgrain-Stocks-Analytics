-- CREATE DATABASE foodgrain_stocks;

-- GRANT ALL PRIVILEGES ON foodgrain_stocks.* TO 'pyuser'@'localhost';
-- FLUSH PRIVILEGES;

-- # Checking Data:
-- SELECT COUNT(*) FROM paddy_raw;
-- SELECT COUNT(*) FROM rice_parboiled_raw;
-- SELECT COUNT(*) FROM rice_raw_raw;
-- SELECT COUNT(*) FROM wheat_raw;

-- SELECT * FROM paddy_raw LIMIT 10;
-- SELECT * FROM rice_parboiled_raw LIMIT 10;
-- SELECT * FROM rice_raw_raw LIMIT 10;
-- SELECT * FROM wheat_raw LIMIT 10;

-- # ---------------------------------------------------------------------------------------------------------------

-- # FOR PADDY:

-- # Fixing date columns:
-- ALTER TABLE paddy_raw ADD COLUMN Date_Raw DATE;
-- 	-- UPDATE paddy_raw
-- 	-- SET Date_Raw = STR_TO_DATE(DATE, '%Y-%m-%d');
-- ALTER TABLE paddy_raw DROP COLUMN Date;
-- ALTER TABLE paddy_raw RENAME COLUMN Date_Raw TO Date;
-- SELECT Date FROM paddy_raw WHERE Date IS NULL;  # Checking whether inconsistent data leads to NULL.

-- # Renaming with Suitable Names:
-- ALTER TABLE paddy_raw 
-- 	RENAME COLUMN Code TO Region,
-- 	RENAME COLUMN Individual_Date TO Day_Of_Month;

-- # Fixing Datatypes:
-- ALTER TABLE paddy_raw 
--     MODIFY COLUMN Commodity_Id INT, # Don't need big int for normal integer data.
--     MODIFY COLUMN Individual_Date INT,
--     MODIFY COLUMN Month INT,
--     MODIFY COLUMN Year INT,
--     MODIFY COLUMN Region VARCHAR(100), # Don't need Text, it's overkill, VARCHAR is indexable.
--     MODIFY COLUMN District_Name VARCHAR(100),
--     MODIFY COLUMN District_Code VARCHAR(20),
--     MODIFY COLUMN Commodity_Name VARCHAR(50);


-- # Cleaning State Names:
-- UPDATE paddy_raw
-- SET Region = Replace(Region, 'Region Name: ', '');
-- SELECT DISTINCT(Region) FROM paddy_raw;  # Checking distinct names.

-- # Removing Redundant Columns:
-- SELECT
-- 	COUNT(*)
-- FROM paddy_raw
-- WHERE Total_stock = Commodity_Stock;  # That is same as the total count(64968), that means columns are redundant and should drop one of them.

-- ALTER TABLE paddy_raw DROP COLUMN Commodity_Stock; 


-- # ---------------------------------------------------------------------------------------------------------------
# Now I will repeat the process for other tables, since they have same column names and datatypes.
-- # ---------------------------------------------------------------------------------------------------------------


-- # FOR RICE_PB
-- ALTER TABLE rice_parboiled_raw ADD COLUMN Date_Raw DATE;
-- UPDATE rice_parboiled_raw
-- SET Date_Raw = STR_TO_DATE(DATE, '%Y-%m-%d');
-- ALTER TABLE rice_parboiled_raw DROP COLUMN Date;
-- ALTER TABLE rice_parboiled_raw RENAME COLUMN Date_Raw TO Date;
-- SELECT Date FROM rice_parboiled_raw WHERE Date IS NULL;


-- ALTER TABLE rice_parboiled_raw 
--   CHANGE COLUMN Code Region VARCHAR(100),
--   CHANGE COLUMN Individual_Date Day_Of_Month INT;

-- ALTER TABLE rice_parboiled_raw 
--     MODIFY COLUMN Commodity_Id INT, # Don't need big int for normal integer data.
--     MODIFY COLUMN Month INT,
--     MODIFY COLUMN Year INT,
--     MODIFY COLUMN Region VARCHAR(100), # Don't need Text, it's overkill, VARCHAR is indexable.
--     MODIFY COLUMN District_Name VARCHAR(100),
--     MODIFY COLUMN District_Code VARCHAR(20),
--     MODIFY COLUMN Commodity_Name VARCHAR(50);
--     
-- UPDATE rice_parboiled_raw
-- SET Region = TRIM(Region),
--     Region = REPLACE(Region, 'Region Name: ', '');
--     
-- SELECT 
--   SUM(CASE WHEN Commodity_Stock IS NULL THEN 1 ELSE 0 END) AS commodity_stock_nulls,
--   SUM(CASE WHEN ABS(Total_stock - Commodity_Stock) > 0.0001 THEN 1 ELSE 0 END) AS mismatches
-- FROM rice_parboiled_raw;

-- ALTER TABLE rice_parboiled_raw DROP COLUMN Commodity_Stock;    
-- # ---------------------------------------------------------------------------------------------------------------

-- # FOR RICE_RAW
-- ALTER TABLE rice_raw_raw ADD COLUMN Date_Raw DATE;
-- UPDATE rice_raw_raw
-- SET Date_Raw = STR_TO_DATE(DATE, '%Y-%m-%d');
-- ALTER TABLE rice_raw_raw DROP COLUMN Date;
-- ALTER TABLE rice_raw_raw RENAME COLUMN Date_Raw TO Date;
-- SELECT Date FROM rice_raw WHERE Date IS NULL;


-- ALTER TABLE rice_raw_raw 
--   CHANGE COLUMN Code Region VARCHAR(100),
--   CHANGE COLUMN Individual_Date Day_Of_Month INT;
--   
--   
-- ALTER TABLE rice_raw_raw 
--     MODIFY COLUMN Commodity_Id INT, # Don't need big int for normal integer data.
--     MODIFY COLUMN Month INT,
--     MODIFY COLUMN Year INT,
--     MODIFY COLUMN Region VARCHAR(100), # Don't need Text, it's overkill, VARCHAR is indexable.
--     MODIFY COLUMN District_Name VARCHAR(100),
--     MODIFY COLUMN District_Code VARCHAR(20),
--     MODIFY COLUMN Commodity_Name VARCHAR(50);
--     

-- UPDATE rice_raw_raw
-- SET Region = TRIM(Region),
--     Region = REPLACE(Region, 'Region Name: ', '');
--     
-- SELECT 
--   SUM(CASE WHEN Commodity_Stock IS NULL THEN 1 ELSE 0 END) AS commodity_stock_nulls,
--   SUM(CASE WHEN ABS(Total_stock - Commodity_Stock) > 0.0001 THEN 1 ELSE 0 END) AS mismatches
-- FROM rice_raw_raw;

-- ALTER TABLE rice_raw_raw DROP COLUMN Commodity_Stock;

-- # ---------------------------------------------------------------------------------------------------------------

-- # FOR WHEAT
-- ALTER TABLE wheat_raw ADD COLUMN Date_Raw DATE;
-- UPDATE wheat_raw
-- SET Date_Raw = STR_TO_DATE(DATE, '%Y-%m-%d');
-- ALTER TABLE wheat_raw DROP COLUMN Date;
-- ALTER TABLE wheat_raw RENAME COLUMN Date_Raw TO Date;
-- SELECT Date FROM wheat_raw WHERE Date IS NULL;

-- ALTER TABLE wheat_raw 
--   CHANGE COLUMN Code Region VARCHAR(100),
--   CHANGE COLUMN Individual_Date Day_Of_Month INT;

-- ALTER TABLE wheat_raw 
--     MODIFY COLUMN Commodity_Id INT, # Don't need big int for normal integer data.
--     MODIFY COLUMN Month INT,
--     MODIFY COLUMN Year INT,
--     MODIFY COLUMN Region VARCHAR(100), # Don't need Text, it's overkill, VARCHAR is indexable.
--     MODIFY COLUMN District_Name VARCHAR(100),
--     MODIFY COLUMN District_Code VARCHAR(20),
--     MODIFY COLUMN Commodity_Name VARCHAR(50);

-- UPDATE wheat_raw
-- SET Region = TRIM(Region),
--     Region = REPLACE(Region, 'Region Name: ', '');

-- SELECT 
--   SUM(CASE WHEN Commodity_Stock IS NULL THEN 1 ELSE 0 END) AS commodity_stock_nulls,
--   SUM(CASE WHEN ABS(Total_stock - Commodity_Stock) > 0.0001 THEN 1 ELSE 0 END) AS mismatches
-- FROM wheat_raw;

-- ALTER TABLE wheat_raw DROP COLUMN Commodity_Stock;
-- # ---------------------------------------------------------------------------------------------------------------

# Extra Checks:

-- SELECT 
--   SUM(Date IS NULL) AS null_dates,
--   SUM(Stock IS NULL) AS null_stock,
--   SUM(District_Name IS NULL) AS null_district
-- FROM paddy_raw; 
-- -- null_dates 0, null_stock	0, null_district 0 

-- SELECT COUNT(*) AS non_positive_stock FROM paddy_raw WHERE Stock <= 0;
-- -- non_positive_stock 0

-- SELECT COUNT(*) - COUNT(DISTINCT CONCAT_WS('|',Date,Region,District_Name,District_Code,Stock)) AS duplicate_rows
-- FROM paddy_raw;
-- -- duplicate_rows 0

-- SELECT DISTINCT District_Code FROM paddy_raw WHERE TRIM(District_Code) = '' OR District_Code REGEXP '[^A-Za-z0-9]';
-- -- no result




