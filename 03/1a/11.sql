CREATE PROCEDURE get_sales_between(
    start_date DATE,
    end_date DATE
)
LANGUAGE plpgsql
AS $procedure$
DECLARE
    v_total NUMERIC(10,2);
BEGIN
    SELECT SUM(sales)
    INTO v_total
    FROM orders
    WHERE order_date BETWEEN start_date AND end_date;

    RAISE NOTICE 'Sales from % to %: %',
        start_date, end_date, v_total;
END;
$procedure$;

CALL get_sales_between('2024-01-01', '2024-03-31');