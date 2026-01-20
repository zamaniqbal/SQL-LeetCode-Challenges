/* Write your T-SQL query statement below */
SELECT
    query_name
    ,ROUND(AVG(rating * 1.0 / position), 2) AS quality
    ,ROUND(SUM(CASE WHEN rating < 3 then 1 else 0 end) * 100.0 / count(*), 2) as poor_query_percentage
FROM queries
GROUP BY query_name;