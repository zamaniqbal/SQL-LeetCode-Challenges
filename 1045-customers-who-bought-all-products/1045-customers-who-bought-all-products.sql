/* Write your T-SQL query statement below */
SELECT
    DISTINCT customer_id
FROM customer
GROUP BY customer_id
HAVING COUNT(DISTINCT product_key) IN
    (
    SELECT COUNT(*)
    FROM product
    );