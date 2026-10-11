CREATE PROCEDURE apply_regional_discount(
    region_name VARCHAR(20),
    discount_rate NUMERIC
)
LANGUAGE plpgsql
AS $procedure$
BEGIN
    UPDATE orders
    SET sales = sales * (1 - discount_rate)
    WHERE region = region_name;

    RAISE NOTICE 'Discount % applied to region %',
        discount_rate, region_name;
END;
$procedure$;

CALL apply_regional_discount('West', 0.10);