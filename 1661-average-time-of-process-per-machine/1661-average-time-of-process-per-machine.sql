/* Write your T-SQL query statement below */
SELECT
    s.machine_id
    ,ROUND((SUM(e.timestamp) - SUM(s.timestamp))/COUNT(DISTINCT s.process_id),3) AS processing_time
FROM activity s
INNER JOIN activity e
    ON e.machine_id = s.machine_id
WHERE 
    s.activity_type = 'start'
    AND e.activity_type = 'end'
    AND s.process_id = e.process_id
GROUP BY s.machine_id;