-- =========================================================================
-- PROJECT: Retail Data Warehouse (51,000 Transactions)
-- AUTHOR: Akshay Jain
-- PURPOSE: ETL Pipeline from Excel Staging to Star Schema
-- TABLES: fact_sales, dm_managers, dim_date
-- =========================================================================

-- STEP 1: DIMENSION MODELING (Managers)
-- -------------------------------------------------------------------------
CREATE OR Replace view vw_dim_managers AS
SELECT 
    Person AS Regional_Manager,
    Region
FROM people;

-- STEP 2: ANALYTICAL FACT TABLE (Sales & Returns)
-- -------------------------------------------------------------------------
CREATE OR REPLACE VIEW vw_Fact_Sales AS 
SELECT 
    o.Row_ID, 
    o.Order_ID, 
    o.Order_Date, 
    o.Ship_Date, 
    o.Customer_ID, 
    o.Segment,       -- Added this for your Page 2 visuals!
    o.Category, 
    o.Sub_Category, 
    o.Product_ID, 
    o.Region, 
    o.Sales, 
    o.Profit, 
    o.Quantity, 
    o.Shipping_Cost,
    -- Returns logic
    CASE WHEN r.Returned = 'Yes' THEN 1 ELSE 0 END AS Is_Returned 
FROM orders o 
LEFT JOIN returns r ON o.Order_ID = r.Order_ID;