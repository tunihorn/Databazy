WITH RECURSIVE date_range AS (
    SELECT
        MIN(sales_date) AS start_date,
        MAX(sales_date) AS end_date
    FROM flourmills_sales
),
calendar AS (
    SELECT
        start_date AS sales_date,
        end_date
    FROM date_range

    UNION ALL

    SELECT
        sales_date + 1,
        end_date
    FROM calendar
    WHERE sales_date < end_date
)
SELECT sales_date
FROM calendar
ORDER BY sales_date ASC;