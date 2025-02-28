use superstore;

select * from `superstore sales data - sheet1`;
-- RFM Base Table
SELECT 
    customer_id,
    MAX(DATE_ADD('1899-12-30', INTERVAL order_date DAY)) AS last_purchase_date, 
    COUNT(order_id) AS frequency,  
    SUM(sales) AS monetary  
FROM `Superstore Sales Data - Sheet1`
GROUP BY customer_id
ORDER BY last_purchase_date DESC;

-- Recency, Frequency, and Monetary Values

SELECT 
    customer_id,
    DATEDIFF(CURRENT_DATE, DATE_ADD('1899-12-30', INTERVAL last_purchase_date DAY)) AS recency,
    frequency,
    monetary
FROM (
    SELECT 
        customer_id,
        MAX(order_date) AS last_purchase_date,
        COUNT(order_id) AS frequency,
        SUM(sales) AS monetary
    FROM `Superstore Sales Data - Sheet1`
    GROUP BY customer_id
) AS rfm_base;

-- RFM Scores

SELECT 
    customer_id,
    NTILE(5) OVER (ORDER BY recency ASC) AS r_score,
    NTILE(5) OVER (ORDER BY frequency ASC) AS f_score,
    NTILE(5) OVER (ORDER BY monetary ASC) AS m_score
FROM (
    SELECT 
        customer_id,
        DATEDIFF(CURRENT_DATE, MAX(DATE_ADD('1899-12-30', INTERVAL order_date DAY))) AS recency,  -- Calculate recency
        COUNT(order_id) AS frequency,  -- Calculate frequency
        SUM(sales) AS monetary  -- Calculate monetary value
    FROM `Superstore Sales Data - Sheet1`
    GROUP BY customer_id
) AS rfm_base;

-- customer categories 

WITH rfm_scores AS (
    SELECT 
        customer_id,
        NTILE(5) OVER (ORDER BY DATEDIFF(CURRENT_DATE, DATE_ADD('1899-12-30', INTERVAL last_purchase_date DAY)) DESC) AS r_score,
        NTILE(5) OVER (ORDER BY frequency ASC) AS f_score,
        NTILE(5) OVER (ORDER BY monetary ASC) AS m_score
    FROM (
        SELECT 
            customer_id,
            MAX(order_date) AS last_purchase_date,
            COUNT(order_id) AS frequency,
            SUM(sales) AS monetary
        FROM `Superstore Sales Data - Sheet1`
        GROUP BY customer_id
    ) AS base
)

SELECT 
    customer_id,
    CONCAT(r_score, f_score, m_score) AS rfm_score,
    CASE 
        WHEN r_score = 5 AND f_score = 5 AND m_score = 5 THEN 'Best Customers'
        WHEN r_score >= 4 AND f_score >= 4 THEN 'Loyal Customers'
        WHEN r_score >= 4 AND m_score >= 4 THEN 'Big Spenders'
        WHEN r_score <= 2 AND f_score <= 2 AND m_score <= 2 THEN 'Lost Customers'
        ELSE 'Others'
    END AS customer_segment
FROM rfm_scores;











