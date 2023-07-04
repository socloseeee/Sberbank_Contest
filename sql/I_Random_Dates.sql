WITH RECURSIVE dates(date, rn) AS (
  VALUES(DATE('now'), 1)
  
  UNION ALL
  
  SELECT date(date, '+' || (2 + ABS(RANDOM()) % 6) || ' days'), rn + 1
  FROM dates
  WHERE rn < 100
)

SELECT date
FROM dates
LIMIT 100;
