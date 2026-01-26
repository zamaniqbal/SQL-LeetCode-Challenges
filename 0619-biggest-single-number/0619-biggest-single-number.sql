/* Write your T-SQL query statement below */
WITH cte AS
    (
    SELECT
        num
        ,COUNT(num) AS count_num
    FROM mynumbers
    GROUP BY num
    HAVING COUNT(num) = 1
    )
SELECT ISNULL(MAX(num),NULL) AS num
FROM cte;