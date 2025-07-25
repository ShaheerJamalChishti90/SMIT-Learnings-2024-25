----SELECT
----    product_id,
----    product_name,
----    store_id,
----    0 AS quantity
----FROM
----    production.products
----CROSS JOIN sales.stores
----ORDER BY
----    product_name,
----    store_id;

--SELECT
--    s.store_id,
--    p.product_id,
--    ISNULL(sales, 0) sales
--FROM
--    sales.stores s
--CROSS JOIN production.products p
--LEFT JOIN (
--    SELECT
--        s.store_id,
--        p.product_id,
--        SUM (quantity * i.list_price) sales
--    FROM
--        sales.orders o
--    INNER JOIN sales.order_items i ON i.order_id = o.order_id
--    INNER JOIN sales.stores s ON s.store_id = o.store_id
--    INNER JOIN production.products p ON p.product_id = i.product_id
--    GROUP BY
--        s.store_id,
--        p.product_id
--) c ON c.store_id = s.store_id
--AND c.product_id = p.product_id
--WHERE
--    sales IS NULL
--ORDER BY
--    product_id,
--    store_id;



CREATE SCHEMA VehicleDB;
go;
CREATE TABLE VehicleDB.Car_model (
    Car_model_id INT PRIMARY KEY,
    Car_model_name VARCHAR(50)
);

INSERT INTO VehicleDB.Car_model (Car_model_id, Car_model_name)
VALUES
    (1, 'Camry'),
    (2, 'Corolla'),
    (3, 'Prius');

CREATE TABLE VehicleDB.Color_name (
    Color_id INT PRIMARY KEY,
    Color_name VARCHAR(50)
);

INSERT INTO VehicleDB.Color_name (Color_id, Color_name)
VALUES
    (1, 'Black'),
    (2, 'Red'),
    (3, 'Silver');

select * from VehicleDB.Car_model;
select * from VehicleDB.Color_name;

select * from VehicleDB.Car_model cross join VehicleDB.Color_name;

