-- 1. Ensure the session allows local loading

SET GLOBAL local_infile = 1;

/* BULK LOAD LOGIC:
Used local-infile for high-performance ingestion of 51,000 rows

LOAD DATA LOCAL INFILE 'C:/Users/SID/Downloads/Orders.csv' 
INTO TABLE Orders 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\r\n' 
IGNORE 1 ROWS
(Row_ID, Order_ID, @var_order_date, @var_ship_date, Ship_Mode, Customer_ID, Customer_Name, Segment, Postal_Code, City, State, Country, Region, Market, Product_ID, Product_Name, Sub_Category, Category, Sales, Quantity, Discount, Profit, Shipping_Cost, Order_Priority)
SET 
  Order_Date = STR_TO_DATE(@var_order_date, '%d-%m-%Y'), 
  Ship_Date = STR_TO_DATE(@var_ship_date, '%d-%m-%Y');

-- 3. The Handshake (Verification)
SELECT COUNT(*) AS Total_Rows_Imported FROM Orders;