/* Write your T-SQL query statement below */
SELECT
   v.customer_id
    ,COUNT(v.visit_id) AS count_no_trans
FROM visits v
LEFT JOIN transactions t
ON t.visit_id = v.visit_id
WHERE t.transaction_id IS NULL
GROUP BY v.customer_id;