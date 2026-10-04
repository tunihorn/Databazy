SELECT DISTINCT
    f1.product_category
FROM flourmills_sales AS f1
WHERE EXISTS (
    SELECT 1
    FROM flourmills_sales AS f2
    WHERE f2.product_category = f1.product_category
    GROUP BY f2.product_category
    HAVING COUNT(DISTINCT f2.region) > 3
);