-- Создаем рекурсивную CTE (Common Table Expression) с именем "dates"
WITH RECURSIVE dates(date, rn) AS (
  -- Устанавливаем начальное значение даты как текущую дату и значение rn равным 1
  VALUES(DATE('now'), 1)
  -- Рекурсивно генерируем последующие даты и увеличиваем значение rn на 1
  UNION ALL
  SELECT date(date, '+' || (2 + ABS(RANDOM()) % 6) || ' days'), rn + 1 
  FROM dates 
  -- Ограничиваем количество рекурсивных итераций до 100
  WHERE rn < 100
)
-- Выводим результат - столбец "date" из CTE "dates" с ограничением в 100 строк
SELECT date 
FROM dates 
LIMIT 100;