/* Write your T-SQL query statement below */
SELECT 
    e.employee_id,
    e.name,
    COUNT(m.employee_id) AS reports_count,
    ROUND(AVG(m.age*1.0),0) AS average_age
FROM employees e
INNER JOIN employees m
    ON m.reports_to = e.employee_id
GROUP BY e.employee_id, e.name
ORDER BY e.employee_id;