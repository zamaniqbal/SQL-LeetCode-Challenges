SELECT t.id
FROM weather t
CROSS JOIN weather y
WHERE
    DATEDIFF(day, y.recordDate, t.recordDate) = 1
    AND
    t.temperature > y.temperature;
