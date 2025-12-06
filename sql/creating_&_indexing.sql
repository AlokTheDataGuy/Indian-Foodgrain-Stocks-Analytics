-- # FOR PADDY:

# Creating new cleaned table:
-- DROP TABLE IF EXISTS paddy_cleaned;
-- CREATE TABLE paddy_cleaned AS
-- SELECT DISTINCT
--   Commodity_Id,
--   Total_stock,
--   Region,
--   Day_Of_Month,
--   District_Name,
--   Month,
--   Year,
--   Commodity_Name,
--   District_Code,
--   Stock,
--   Date
-- FROM paddy_raw;

# INDEXING:
-- ALTER TABLE paddy_cleaned ADD INDEX idx_paddy_date (Date);
-- ALTER TABLE paddy_cleaned ADD INDEX idx_paddy_region (Region);
-- ALTER TABLE paddy_cleaned ADD INDEX idx_paddy_district (District_Name);
-- ALTER TABLE paddy_cleaned ADD INDEX idx_paddy_year_month (Year, Month);

# FINAL COUNT:
-- SELECT COUNT(*) FROM paddy_cleaned;

-- # ---------------------------------------------------------------------------------------------------------------
# Now I will repeat the process for other tables, since they have same column names and datatypes.
-- # ---------------------------------------------------------------------------------------------------------------

-- # FOR RICE_PARBOILED

-- DROP TABLE IF EXISTS rice_parboiled_cleaned;
-- CREATE TABLE rice_parboiled_cleaned AS
-- SELECT DISTINCT
--   Commodity_Id,
--   Total_stock,
--   Region,
--   Day_Of_Month,
--   District_Name,
--   Month,
--   Year,
--   Commodity_Name,
--   District_Code,
--   Stock,
--   Date
-- FROM rice_parboiled_raw;

-- ALTER TABLE rice_parboiled_cleaned ADD INDEX idx_rp_date (Date);
-- ALTER TABLE rice_parboiled_cleaned ADD INDEX idx_rp_region (Region);
-- ALTER TABLE rice_parboiled_cleaned ADD INDEX idx_rp_district (District_Name);
-- ALTER TABLE rice_parboiled_cleaned ADD INDEX idx_rp_year_month (Year, Month);

-- SELECT COUNT(*) FROM rice_parboiled_cleaned;

-- # --------------------------------------------------------------------------------------------------------------

-- # FOR RICE_RAW

-- DROP TABLE IF EXISTS rice_raw_cleaned;
-- CREATE TABLE rice_raw_cleaned AS
-- SELECT DISTINCT
--   Commodity_Id,
--   Total_stock,
--   Region,
--   Day_Of_Month,
--   District_Name,
--   Month,
--   Year,
--   Commodity_Name,
--   District_Code,
--   Stock,
--   Date
-- FROM rice_raw_raw;

-- ALTER TABLE rice_raw_cleaned ADD INDEX idx_rr_date (Date);
-- ALTER TABLE rice_raw_cleaned ADD INDEX idx_rr_region (Region);
-- ALTER TABLE rice_raw_cleaned ADD INDEX idx_rr_district (District_Name);
-- ALTER TABLE rice_raw_cleaned ADD INDEX idx_rr_year_month (Year, Month);

-- SELECT COUNT(*) FROM rice_raw_cleaned;


-- # --------------------------------------------------------------------------------------------------------------

-- # FOR WHEAT

-- DROP TABLE IF EXISTS wheat_cleaned;
-- CREATE TABLE wheat_cleaned AS
-- SELECT DISTINCT
--   Commodity_Id,
--   Total_stock,
--   Region,
--   Day_Of_Month,
--   District_Name,
--   Month,
--   Year,
--   Commodity_Name,
--   District_Code,
--   Stock,
--   Date
-- FROM wheat_raw;

-- ALTER TABLE wheat_cleaned ADD INDEX idx_wheat_date (Date);
-- ALTER TABLE wheat_cleaned ADD INDEX idx_wheat_region (Region);
-- ALTER TABLE wheat_cleaned ADD INDEX idx_wheat_district (District_Name);
-- ALTER TABLE wheat_cleaned ADD INDEX idx_wheat_year_month (Year, Month);

-- SELECT COUNT(*) FROM wheat_cleaned;

-- # --------------------------------------------------------------------------------------------------------------









































