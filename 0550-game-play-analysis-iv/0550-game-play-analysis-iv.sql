/* Write your T-SQL query statement below */
WITH day1 AS
    (
    SELECT
        player_id
        ,event_date
        ,ROW_NUMBER() OVER(PARTITION BY player_id ORDER BY event_date ASC) AS rn
    FROM activity
    ),
    day2 AS
    (
    SELECT
        player_id
        ,event_date AS event_date_2
    FROM day1
    WHERE
        rn = 2
    )
SELECT
ROUND(
        SUM(CASE 
            WHEN DATEDIFF(day,day1.event_date,day2.event_date_2) = 1 THEN 1
            ELSE 0
        END) * 1.00
        / COUNT(DISTINCT day1.player_id), 2
    ) AS fraction
FROM day1
LEFT JOIN day2
    ON day1.player_id = day2.player_id
WHERE day1.rn = 1;