/* Write your T-SQL query statement below */
WITH cte AS 
    (
    SELECT
        product_id
        ,year
        ,quantity
        ,price
        ,RANK() OVER(PARTITION BY product_id ORDER BY year ASC) AS rn
    FROM sales
    )
SELECT
    product_id
    ,year AS first_year
    ,quantity
    ,price
FROM cte
WHERE rn = 1;