-- LEVEL 3 (BUSINESS ANALYSIS QUERIES)

-- Q25. Which are the top 3 revenue-generating cities?
-- select c.city_name , sum(s.total) as total_revenue from sales s join customers cu on cu.customer_id=s.customer_id join city c on 
-- c.city_id = cu.city_id group by c.city_name order by total_revenue desc limit 3 ;

-- Q26. Which cities have high rent but low revenue? 
-- select c.city_name,c.estimated_rent,sum(s.total) as total_revenue,(c.estimated_rent - sum(s.total)) as loss_amount
-- from sales s join customers cu on cu.customer_id = s.customer_id join city c on c.city_id = cu.city_id
-- group by c.city_name, c.estimated_rent having c.estimated_rent > sum(s.total) order by loss_amount desc;

-- Q27. Which products generate higher-than-average revenue and also have an average customer rating of at least 4?
-- select p.product_id , p.product_name , sum(s.total) as total_revenue , avg(s.rating) as avg_rating from sales s join products p
-- on s.product_id = p.product_id group by p.product_id , p.product_name 
-- having sum(s.total)>(select avg(total_revenue) from (select sum(total) as total_revenue from sales group  by product_id )t) 
-- and avg(s.rating) >= 4 order by total_revenue desc;

-- Q28. Which products are low-performing (low revenue (lower_than_average_income & low rating)?
-- select p.product_id , p.product_name , sum(s.total) as total_revenue , avg(s.rating) as avg_rating from sales s join products p
-- on s.product_id = p.product_id group by p.product_id , p.product_name 
-- having sum(s.total)<(select avg(total_revenue) from (select sum(total) as total_revenue from sales group  by product_id )t) 
-- and avg(s.rating) < 4 order by total_revenue asc;

-- Q29. Which cities have high population but low sales revenue?
-- select c.city_name , c.population ,  sum(s.total) as total_revenue from sales s join customers cu on s.customer_id = cu.customer_id 
-- join city c on c.city_id = cu.city_id group by c.city_name , c.population order by total_revenue asc , c.population desc;

-- Q30. Which customers are high-value customers?    
-- select cu.customer_id , cu.customer_name , sum(s.total) as total_spent from sales s join customers cu on cu.customer_id = s.customer_id 
-- group by cu.customer_id , cu.customer_name having sum(s.total) > (select avg(total_value) from (select sum(sales.total) as total_value 
-- from sales group by sales.customer_id)a) order by total_spent desc;

-- Q31. What percentage of total revenue does each city contribute?
-- select c.city_id , c.city_name ,  sum(s.total) as total_city_revenue , round(sum(s.total)/(select sum(total) from sales ) *100,2)
-- as percentage_contribution from sales s join customers cu on s.customer_id = cu.customer_id join city c on c.city_id = cu.city_id
-- group by c.city_id , c.city_name order by percentage_contribution desc ;

-- Q32. Which products are sold only in specific cities (not across all cities)?
-- select p.product_name,count(distinct c.city_id) as city_count from products p join sales s on s.product_id=p.product_id 
-- join customers cu on cu.customer_id = s.customer_id
-- join city c on c.city_id= cu.city_id group by p.product_name having count(distinct c.city_id)< (select count(*) from city) 
-- order by city_count desc; 

-- Q33. Do city rankings (city_rank) align with actual revenue performance?
-- select c.city_name , c.city_rank , sum(s.total) as total_revenue from sales s join customers cu on cu.customer_id = s.customer_id join city c 
-- on c.city_id = cu.city_id group by c.city_name , c.city_rank order by total_revenue desc  , city_rank asc;

-- Q34. Which cities generate high revenue with fewer customers?
-- select c.city_name , count(distinct cu.customer_id) as total_customers , sum(s.total) as total_revenue ,
-- round(sum(s.total)/count(distinct cu.customer_id) ,2) as revenue_per_customer from sales s join customers cu on cu.customer_id=s.customer_id 
-- join city c on c.city_id = cu.city_id group by c.city_name order by revenue_per_customer desc ;






