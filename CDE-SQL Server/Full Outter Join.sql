CREATE SCHEMA pm;
GO


CREATE TABLE pm.projects(
    id INT PRIMARY KEY IDENTITY,
title VARCHAR(255) NOT NULL
);

CREATE TABLE pm.members(
    id INT PRIMARY KEY IDENTITY,
    name VARCHAR(120) NOT NULL,
    project_id INT,
    FOREIGN KEY (project_id) 
        REFERENCES pm.projects(id)
);


INSERT INTO 
    pm.projects(title)
VALUES
    ('New CRM for Project Sales'),
    ('ERP Implementation'),
    ('Develop Mobile Sales Platform');


INSERT INTO
    pm.members(name, project_id)
VALUES
    ('John Doe', 1),
    ('Lily Bush', 1),
    ('Jane Doe', 2),
    ('Jack Daniel', null);

select * from pm.projects;
select * from pm.members;

select *
from 
    pm.projects
full join 
    pm.members
    on projects.id = members.project_id;

-- Checking the same query on the left join
--select *
--from pm.projects
--left join 
--    pm.members
--    on projects.id = members.project_id;

-- Checking the same query on the right join
--select *
--from pm.projects
--right join 
--    pm.members
--    on projects.id = members.project_id;


-- Checking the same query on the right join; swapping the tabes
--select *
--from pm.members
--right join 
--    pm.projects
--    on projects.id = members.project_id;

-- Practice Questions!

--1. Show all customers and their orders (if any).
--If a customer hasn't placed an order yet, still show their name.
--If an order exists without a matching customer (hypothetical), show the order anyway.

select concat(first_name, ' ',last_name) as fullname, so.order_id 
from sales.customers sc
full join 
    sales.orders so 
    on sc.customer_id = so.customer_id;

