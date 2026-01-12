-- LEVEL 5 — ADVANCED SQL (WINDOW FUNCTIONS & CTE)

-- Q42. Rank cities based on total revenue (highest to lowest).
-- select c.city_name,sum(s.total) as total_revenue,rank() over (order by sum(s.total) desc) as revenue_rank from sales s
-- join customers cu on s.customer_id = cu.customer_id join city c on cu.city_id = c.city_id group by c.city_name;

-- Q43. Find the top-selling product in each city based on revenue.
 -- select city_name,product_name,total_revenue from (select c.city_name,p.product_name,sum(s.total) as total_revenue,
-- dense_rank() over (partition by c.city_id order by sum(s.total)desc) as rnk from sales s join products p on s.product_id = p.product_id
-- join customers cu on s.customer_id = cu.customer_id join city c on cu.city_id = c.city_id group by c.city_id, c.city_name, p.product_name)
-- ranked_products where rnk = 1;

-- Q44. Identify the top 3 highest-spending customers.
-- select customer_id,customer_name,total_spent from (select cu.customer_id,cu.customer_name,sum(s.total) as total_spent,
-- row_number() over (order by sum(s.total) desc) as row_num from sales s join customers cu on s.customer_id = cu.customer_id
-- group by cu.customer_id, cu.customer_name) t where row_num <= 3;

-- Q45. Use a CTE to classify cities as PROFIT or LOSS based on revenue vs rent.
--  with city_name_CTE as (select c.city_id,c.city_name , c.estimated_rent , sum(s.total) as total_Revenue from sales s join customers cu on cu.customer_id=
-- s.customer_id join city c on c.city_id = cu.city_id group by c.city_id,c.city_name ,c.estimated_rent) 
-- select city_name , total_Revenue , estimated_rent ,
-- CASE
--  when total_Revenue > estimated_rent then "profit"
--  else "loss" end as city_status from city_name_CTE ;

-- Q46.“What is the Month-over-Month (MoM) revenue growth for the business?”
-- select month,monthly_revenue,monthly_revenue - lag(monthly_revenue) over (order by month) as mom_revenue_change
-- from (select date_format(sale_date, '%Y-%m') as month,sum(total) as monthly_revenue from sales group by date_format(sale_date, '%Y-%m')) t
-- order by month;


