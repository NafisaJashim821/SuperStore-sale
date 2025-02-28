SELECT * FROM nafisa.rfm;
use nafisa;
SELECT MIN(STR_TO_DATE(`ORDERDATE.1`, '%d/%m/%Y')) AS first_order_date 
FROM rfm;

SHOW COLUMNS FROM rfm;


