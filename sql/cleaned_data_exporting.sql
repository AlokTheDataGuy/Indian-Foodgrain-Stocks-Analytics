-- # For all_commodities_daily
-- SELECT *
-- FROM all_commodities_daily
-- INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/all_commodities_daily.csv'
-- FIELDS TERMINATED BY ',' 
-- ENCLOSED BY '"'
-- LINES TERMINATED BY '\n';


-- # For national_daily
-- SELECT *
-- FROM v_national_daily
-- INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/national_daily.csv'
-- FIELDS TERMINATED BY ',' 
-- ENCLOSED BY '"'
-- LINES TERMINATED BY '\n';


-- # For state_daily
-- SELECT *
-- FROM v_state_daily
-- INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/state_daily.csv'
-- FIELDS TERMINATED BY ',' 
-- ENCLOSED BY '"'
-- LINES TERMINATED BY '\n';


-- # For district_daily - (Didn't work for this, due to lot of data, so had to use python)
-- SELECT *
-- FROM v_district_daily
-- INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/district_daily.csv'
-- FIELDS TERMINATED BY ',' 
-- ENCLOSED BY '"'
-- LINES TERMINATED BY '\n';



