WITH merged_transfers AS (
    SELECT from_id AS acc, tdate AS dt_from,
        LEAD(tdate) OVER (PARTITION BY from_id ORDER BY tdate) AS dt_to,
        -amount AS balance
    FROM transfers

    UNION ALL

    SELECT to_id AS acc, tdate AS dt_from,
        LEAD(tdate) OVER (PARTITION BY to_id ORDER BY tdate) AS dt_to,
        amount AS balance
    FROM transfers
),

calculated_balances AS (
    SELECT
        acc,
        dt_from,
        CASE WHEN LEAD(dt_from) OVER (PARTITION BY acc ORDER BY dt_from) IS NOT NULL THEN LEAD(dt_from) OVER (PARTITION BY acc ORDER BY dt_from) ELSE '3000-01-01' END AS dt_to,
        SUM(balance) OVER (PARTITION BY acc ORDER BY dt_from) AS balance
    FROM merged_transfers
)

SELECT
    acc,
    dt_from,
    dt_to,
    balance
FROM calculated_balances
ORDER BY acc, dt_from;
