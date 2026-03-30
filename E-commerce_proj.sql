Create database shop_analytics;
use shop_analytics;
CREATE TABLE customers (
    custid INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(25),
    city VARCHAR(20)
);
CREATE TABLE orders (
    orderid INT,
    custid INT,
    orderdate DATE,
    amount DECIMAL(10 , 2 ),
    FOREIGN KEY (custid)
        REFERENCES customers (custid)
);
insert into customers values 
(1,'Amit','Mumbai'),
(2,'Priya','Pune'),
(3,'Suresh','Mumbai');
insert into orders values
(1,1,'2025-12-01',500.00),
(2,1,'2026-01-10',1200.00),
(3,2,'2025-11-15',300.00);
select c.name,o.orderid,o.orderdate from orders o inner join customers c using (custid);
select c.name,o.orderid,o.orderdate,o.amount from orders o join customers c using (custid) where c.city='Mumbai' and o.amount>1000;
select c.city,sum(o.amount) as Total_sales from customers c join orders o using(custid) group by c.city order by Total_sales desc; 
select c.city,c.name from customers c join orders o using(custid) where o.orderid is Null;
select c.name,sum(o.amount) as total_spent from customers c join orders o using(custid) group by c.custid order by total_spent desc limit 1;
select date_format(orderdate,'%Y-%m') as order_month, sum(amount) as monthly_revenue from orders group by order_month;
select c.name,c.city,count(o.orderid) as order_count from customers c join orders o using(custid) group by c.name,c.city having order_count>1; 
select avg(amount) as avg_orderamount from orders;
SELECT 
    name,
    CASE
        WHEN city = 'Mumbai' THEN 'local'
        ELSE 'outstation'
    END AS customer_category
FROM
    customers;
select orderid,amount from orders where amount>(select avg(amount) as avg_amount from orders); 

