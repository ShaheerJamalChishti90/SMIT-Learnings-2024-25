---- Create the database
--CREATE DATABASE PracticeDB;
--GO

---- Use the database
--USE PracticeDB;
--GO

---- Create schema
--CREATE SCHEMA Sales;
--GO

---- Create table
--CREATE TABLE Sales.Orders (
--    OrderID INT PRIMARY KEY,
--    CustomerID INT,
--    ProductID INT,
--    Quantity INT,
--    Price DECIMAL(10, 2),
--    OrderDate DATE
--);
--GO


-- Insert 30 rows for rich practice
--INSERT INTO Sales.Orders (OrderID, CustomerID, ProductID, Quantity, Price, OrderDate)
--VALUES
--(1, 101, 1, 5, 50.00, '2025-07-01'),
--(2, 102, 2, 2, 25.00, '2025-07-01'),
--(3, 101, 3, 1, 30.00, '2025-07-02'),
--(4, 103, 1, 3, 50.00, '2025-07-03'),
--(5, 102, 3, 4, 30.00, '2025-07-04'),
--(6, 101, 2, 2, 25.00, '2025-07-05'),
--(7, 104, 1, 6, 50.00, '2025-07-06'),
--(8, 103, 2, 3, 25.00, '2025-07-07'),
--(9, 102, 1, 4, 50.00, '2025-07-08'),
--(10, 101, 3, 2, 30.00, '2025-07-09'),
--(11, 105, 2, 1, 25.00, '2025-07-10'),
--(12, 101, 1, 5, 50.00, '2025-07-11'),
--(13, 104, 2, 2, 25.00, '2025-07-12'),
--(14, 103, 3, 3, 30.00, '2025-07-13'),
--(15, 105, 1, 4, 50.00, '2025-07-14'),
--(16, 102, 2, 3, 25.00, '2025-07-15'),
--(17, 104, 3, 2, 30.00, '2025-07-16'),
--(18, 101, 2, 6, 25.00, '2025-07-17'),
--(19, 105, 3, 1, 30.00, '2025-07-18'),
--(20, 103, 1, 5, 50.00, '2025-07-19'),
--(21, 102, 1, 3, 50.00, '2025-07-20'),
--(22, 104, 2, 2, 25.00, '2025-07-21'),
--(23, 101, 3, 4, 30.00, '2025-07-22'),
--(24, 105, 2, 3, 25.00, '2025-07-23'),
--(25, 102, 3, 5, 30.00, '2025-07-24'),
--(26, 104, 1, 1, 50.00, '2025-07-25'),
--(27, 101, 1, 2, 50.00, '2025-07-26'),
--(28, 103, 2, 2, 25.00, '2025-07-27'),
--(29, 105, 3, 3, 30.00, '2025-07-28'),
--(30, 102, 2, 4, 25.00, '2025-07-29');


-- This is how i can use the group by clause
-- Basically grouping from customer's id to know how much each customer spent the money on buying stuff
select o.CustomerID, sum(o.Price) as Money_Spent from Sales.Orders o group by o.CustomerID;

-- Similarly, Getting the total quantity ordered by the each customer
select o.CustomerID, sum(o.Quantity) as Total_Products_Orders, sum(o.Price) as Total_Price from Sales.Orders o group by o.CustomerID;

select * from Sales.Orders

select o.CustomerID, o.ProductID, sum(o.Quantity) total_quantity_ordered, sum(o.Price) as Price, year(o.OrderDate) order_year from Sales.Orders o group by o.ProductID, o.CustomerID, o.OrderDate order by o.CustomerID;

