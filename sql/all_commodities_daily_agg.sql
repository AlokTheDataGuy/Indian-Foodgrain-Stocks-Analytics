# CREATION:
-- DROP VIEW IF EXISTS all_commodities_daily;
-- CREATE VIEW all_commodities_daily AS
-- SELECT
--   date,
--   year,
--   month,
--   Commodity_Name,
--   commodity_id,
--   region,
--   district_name,
--   district_code,
--   stock
-- FROM wheat_cleaned
-- UNION ALL
-- SELECT date, year, month, Commodity_Name, commodity_id, region, district_name, district_code, stock
-- FROM rice_raw_cleaned
-- UNION ALL
-- SELECT date, year, month, Commodity_Name, commodity_id, region, district_name, district_code, stock
-- FROM rice_parboiled_cleaned
-- UNION ALL
-- SELECT date,  year, month, Commodity_Name, commodity_id, region, district_name, district_code, stock
-- FROM paddy_cleaned;

-- Select * from all_commodities_daily limit 10 ;
-- Select COUNT(*) from all_commodities_daily ;

# ----------------------------------------------------------------------------------------

# Multi-Commodity Comparison Table
-- SELECT Year, Month, 
-- 	SUM(CASE WHEN Commodity_Name='Wheat(Including URS)' THEN Stock END) AS Wheat_Stock,
-- 	SUM(CASE WHEN Commodity_Name='Rice-Raw' THEN Stock END) AS RiceRaw_Stock,
-- 	SUM(CASE WHEN Commodity_Name='Rice-Parboiled' THEN Stock END) AS RiceParboiled_Stock,
-- 	SUM(CASE WHEN Commodity_Name='Paddy' THEN Stock END) AS Paddy_Stock
-- FROM all_commodities_daily
-- GROUP BY Year, Month;

# ----------------------------------------------------------------------------------------

# National daily totals:

-- DROP VIEW IF EXISTS v_national_daily;
-- CREATE VIEW v_national_daily AS
-- SELECT
--   date,
--   commodity_name,
--   SUM(stock) AS national_stock
-- FROM all_commodities_daily
-- GROUP BY date, commodity_name;

# ----------------------------------------------------------------------------------------

# State (region) daily totals:

-- DROP VIEW IF EXISTS v_state_daily;
-- CREATE VIEW v_state_daily AS
-- SELECT
--   date,
--   commodity_name,
--   region,
--   SUM(stock) AS state_stock
-- FROM all_commodities_daily
-- GROUP BY date, commodity_name, region;

# ----------------------------------------------------------------------------------------

# District daily totals:

-- DROP VIEW IF EXISTS v_district_daily;
-- CREATE VIEW v_district_daily AS
-- SELECT
--   date,
--   commodity_name,
--   region,
--   district_name,
--   district_code,
--   SUM(stock) AS district_stock
-- FROM all_commodities_daily
-- GROUP BY date, commodity_name, region, district_name, district_code;

# ----------------------------------------------------------------------------------------

# District % of State (contribution to state):

-- DROP VIEW IF EXISTS v_district_pct_of_state;
-- CREATE VIEW v_district_pct_of_state AS
-- SELECT
--   d.date,
--   d.commodity_name,
--   d.region,
--   d.district_name,
--   d.district_code,
--   d.district_stock,
--   s.state_stock,
--   ROUND(100.0 * d.district_stock / NULLIF(s.state_stock,0), 6) AS pct_of_state     # NULLIF avoids division-by-zero; pct will be NULL if state_stock = 0.
-- FROM v_district_daily d
-- JOIN v_state_daily s
--   ON d.date = s.date
--   AND d.commodity_name = s.commodity_name
--   AND d.region = s.region;

# ----------------------------------------------------------------------------------------

# State % of National (contribution to India): 

-- DROP VIEW IF EXISTS v_state_pct_of_national;
-- CREATE VIEW v_state_pct_of_national AS
-- SELECT
--   s.date,
--   s.commodity_name,
--   s.region,
--   s.state_stock,
--   n.national_stock,
--   ROUND(100.0 * s.state_stock / NULLIF(n.national_stock,0), 6) AS pct_of_national
-- FROM v_state_daily s
-- JOIN v_national_daily n
--   ON s.date = n.date
--   AND s.commodity_name = n.commodity_name;


# ----------------------------------------------------------------------------------------

# District % of National (direct)

-- DROP VIEW IF EXISTS v_district_pct_of_national;
-- CREATE VIEW v_district_pct_of_national AS
-- SELECT
--   d.date,
--   d.commodity_name,
--   d.region,
--   d.district_name,
--   d.district_code,
--   d.district_stock,
--   n.national_stock,
--   ROUND(100.0 * d.district_stock / NULLIF(n.national_stock,0), 8) AS pct_of_national
-- FROM v_district_daily d
-- JOIN v_national_daily n
--   ON d.date = n.date
--   AND d.commodity_name = n.commodity_name;

# ----------------------------------------------------------------------------------------

# Daily % change (DoD) — district, state, national

-- DROP VIEW IF EXISTS v_district_daily_change;
-- CREATE VIEW v_district_daily_change AS
-- SELECT
--   date,
--   commodity_name,
--   region,
--   district_name,
--   district_code,
--   district_stock,
--   LAG(district_stock) OVER (PARTITION BY commodity_name, region, district_name ORDER BY date) AS prev_stock,
--   ROUND(100.0 * (district_stock - LAG(district_stock) OVER (PARTITION BY commodity_name, region, district_name ORDER BY date))
--        / NULLIF(LAG(district_stock) OVER (PARTITION BY commodity_name, region, district_name ORDER BY date),0),4) AS pct_change_day
-- FROM v_district_daily;

# ----------------------------------------------------------------------------------------

# Rolling averages (7-day and 30-day)

-- DROP VIEW IF EXISTS v_district_rolling;
-- CREATE VIEW v_district_rolling AS
-- SELECT
--   date,
--   commodity_name,
--   region,
--   district_name,
--   district_code,
--   district_stock,
--   ROUND(AVG(district_stock) OVER (PARTITION BY commodity_name, region, district_name ORDER BY date 
--         ROWS BETWEEN 6 PRECEDING AND CURRENT ROW), 4) AS ma_7,
--   ROUND(AVG(district_stock) OVER (PARTITION BY commodity_name, region, district_name ORDER BY date 
--         ROWS BETWEEN 29 PRECEDING AND CURRENT ROW), 4) AS ma_30
-- FROM v_district_daily;


# ----------------------------------------------------------------------------------------


# Concentration index (HHI) — state-level measure of how concentrated stock is across districts

-- DROP VIEW IF EXISTS v_state_hhi_daily;
-- CREATE VIEW v_state_hhi_daily AS
-- SELECT
--   s.date,
--   s.commodity_name,
--   s.region,
--   ROUND(SUM(POW(d.district_stock / NULLIF(s.state_stock,0), 2)) * 10000,6) AS hhi_10000  -- scaled by 10000
-- FROM v_state_daily s
-- JOIN v_district_daily d
--   ON s.date = d.date AND s.commodity_name = d.commodity_name AND s.region = d.region
-- GROUP BY s.date, s.commodity_name, s.region;

# ----------------------------------------------------------------------------------------

# Compact contribution summary table (store important metrics per day):

-- DROP TABLE IF EXISTS contribution_summary_daily;
-- CREATE VIEW contribution_summary_daily AS
-- SELECT
--   d.date,
--   d.commodity_name,
--   d.region,
--   d.district_name,
--   d.district_code,
--   d.district_stock,
--   s.state_stock,
--   n.national_stock,
--   ROUND(100.0 * d.district_stock / NULLIF(s.state_stock,0),6) AS pct_of_state,
--   ROUND(100.0 * d.district_stock / NULLIF(n.national_stock,0),8) AS pct_of_national,
--   ROUND(100.0 * (d.district_stock - LAG(d.district_stock) OVER (PARTITION BY d.commodity_name, d.region, d.district_name ORDER BY d.date)
--         ) / NULLIF(LAG(d.district_stock) OVER (PARTITION BY d.commodity_name, d.region, d.district_name ORDER BY d.date),0),4) AS pct_change_day,
--   ROUND(AVG(d.district_stock) OVER (PARTITION BY d.commodity_name, d.region, d.district_name ORDER BY d.date ROWS BETWEEN 6 PRECEDING AND CURRENT ROW),4) AS ma_7
-- FROM v_district_daily d
-- JOIN v_state_daily s ON d.date = s.date AND d.commodity_name = s.commodity_name AND d.region = s.region
-- JOIN v_national_daily n ON d.date = n.date AND d.commodity_name = n.commodity_name;

# ----------------------------------------------------------------------------------------

Select * from v_state_hhi_daily limit 10