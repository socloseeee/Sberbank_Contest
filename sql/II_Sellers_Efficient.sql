SELECT 
    e.id,
    e.name,
    s.sales_c,
    RANK() OVER (ORDER BY s.sales_c DESC) AS sales_rank_c,
    s.sales_s,
    RANK() OVER (ORDER BY s.sales_s DESC) AS sales_rank_s
FROM employee e
LEFT JOIN (
    SELECT 
        employee_id,
        COUNT(*) AS sales_c,
        SUM(price) AS sales_s
    FROM sales
    GROUP BY employee_id
) s ON e.id = s.employee_id;