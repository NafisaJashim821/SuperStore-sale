use superstore;

select * from `superstore sales data - sheet1`;

SELECT * FROM `Superstore Sales Data - Sheet1` LIMIT 10;


-- Order_Date to Proper Date Format

ALTER TABLE `Superstore Sales Data - Sheet1`
MODIFY COLUMN Order_Date DATE;


UPDATE `Superstore Sales Data - Sheet1`
SET Order_Date = DATE_ADD('1899-12-30', INTERVAL Order_Date DAY);

--  Searching  Missing data

SELECT * FROM `Superstore Sales Data - Sheet1`
WHERE Order_Date IS NULL OR Sales IS NULL;






 













