-- Основной запрос выбирает идентификатор сотрудника, его имя, количество продаж и сумму продаж.
-- Также добавляет столбцы с рангом продаж по количеству (sales_rank_c) и по сумме (sales_rank_s).
-- Внешнее соединение LEFT JOIN используется для включения всех сотрудников из таблицы "employee", даже если у них нет продаж.
SELECT
    e.id,
    e.name,
    s.sales_c,
    RANK() OVER (ORDER BY s.sales_c DESC) AS sales_rank_c,
    s.sales_s,
    RANK() OVER (ORDER BY s.sales_s DESC) AS sales_rank_s
FROM employee e
LEFT JOIN (
    -- Подзапрос считает количество продаж (sales_c) и сумму продаж (sales_s) для каждого сотрудника
    SELECT 
        employee_id,
        COUNT(*) AS sales_c,
        SUM(price) AS sales_s
    FROM sales
    GROUP BY employee_id
) s ON e.id = s.employee_id;