SELECT *
FROM flourmills_sales AS f1
WHERE EXISTS (
    SELECT 1
    FROM flourmills_sales AS f2
    WHERE f2.region = f1.region
      AND EXTRACT(YEAR FROM f2.sales_date) = 2024
);