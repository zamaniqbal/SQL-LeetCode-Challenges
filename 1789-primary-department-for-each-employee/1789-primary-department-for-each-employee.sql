/* Write your T-SQL query statement below */
WITH cte AS
    (
    SELECT
        employee_id
        ,department_id
        ,primary_flag
        ,ROW_NUMBER() OVER(PARTITION BY employee_id ORDER BY primary_flag DESC) AS rn
    FROM employee
    )
SELECT
    employee_id
    ,department_id
FROM cte
WHERE rn = 1;