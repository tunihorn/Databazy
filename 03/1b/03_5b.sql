WITH latest_purchase AS (
    SELECT
        customer_id,
        product_name,
        sales_date,
        total_amount,
        ROW_NUMBER() OVER (
            PARTITION BY customer_id
            ORDER BY sales_date DESC
        ) AS rn
    FROM flourmills_sales
)
SELECT
    customer_id,
    product_name,
    sales_date,
    total_amount
FROM latest_purchase
WHERE rn = 1
ORDER BY customer_id ASC;