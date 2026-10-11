WITH daily_sales AS (
    SELECT
        sales_date,
        SUM(total_amount) AS total_sales
    FROM flourmills_sales
    GROUP BY sales_date
)
SELECT
    sales_date,
    total_sales
FROM daily_sales
WHERE total_sales > 3000000
ORDER BY total_sales DESC
LIMIT 5;