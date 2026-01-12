-- LEVEL 4 — SUBQUERY-BASED ANALYSIS

-- Q35. Which products have a price higher than the average product price?
-- select product_name, Price from products where price > (select avg(Price) from products) order by Price desc ;

-- Q36. Which customers have spent more than the average customer spend?
-- select cu.customer_id , cu.customer_name , sum(s.total) as total_spent_by_customer from sales s join customers cu on 
-- cu.customer_id = s.customer_id group by cu.customer_id , cu.customer_name having sum(s.total) > (select avg(total_sales) from 
-- (select sum(sales.total) as total_sales from sales group by sales.customer_id)s) order by total_spent_by_customer desc;

-- Q37. Which cities generate revenue higher than the average city revenue?
-- select c.city_id , c.city_name , sum(s.total) as total_revenue from sales s join customers cu on cu.customer_id = s.customer_id 
-- join city c on c.city_id = cu.city_id group by city_id , city_name having sum(s.total) > (select avg(total_sales) from (select sum(sales.total) 
-- as total_sales from sales join customers on customers.customer_id=sales.customer_id  group by customers.city_id)s)
-- order by total_revenue desc ;

-- Q38. Which products have total revenue greater than the average product revenue?
-- select p.product_id , p.product_name , sum(s.total) as total_revenue from sales s join products p on p.product_id = s.product_id 
-- group by p.product_id , p.product_name having sum(s.total) > (select avg(revenue) from (select sum(total) as revenue from sales group by 
-- product_id)d) order by total_revenue desc ; 

-- Q39. Which cities have an average customer rating below the overall average rating?
-- select c.city_id , c.city_name , avg(s.rating) as avg_rating from sales s join customers cu on cu.customer_id = s.customer_id 
-- join city c on c.city_id = cu.city_id group by c.city_id , c.city_name having avg(s.rating) < (select avg(rating) as overall_avg_rating from 
-- sales) order by avg_rating asc;

-- Q40. Which products have never received the highest rating (e.g., rating = 5)?
-- select p.product_id,p.product_name from products p where p.product_id not in(select distinct s.product_id from sales s where s.rating = 5);

-- Q41. Which cities have total revenue lower than the city with the highest revenue?
-- select c.city_id , c.city_name , sum(s.total) as total_revenue from sales s join customers cu on cu.customer_id = s.customer_id join city c 
-- on c.city_id = cu.city_id group by c.city_id , c.city_name having sum(s.total) < (select max(total_sales) from (select sum(sales.total) 
-- as total_sales from sales join customers on sales.customer_id = customers.customer_id group by customers.city_id)a) order by total_revenue desc;

