/*Day 18

curdate==>>'2024-05-24'

Aggregations and Grouping
understand aggrigation funtion annd grouping  data using the group by clause
*/
select curdate();
-- find total order amount for each customer
select * ,sum( total_amount),count(*)from order_details 
group by customer_id
order by sum( total_amount) desc
limit 5;

-- find avg salary for each department.

-- get max and min of quantity of order for each product.

SELECT product_id, 
       MAX(quantity) AS max_quantity, 
       MIN(quantity) AS min_quantity
FROM order_details
GROUP BY product_id;
/*
-- calculate total quantity and total order amount  for each  order..
select order_id ,sum(quantity),sum(total_amount) from order_details
group by order_id;
-- GROUP BY order_id groups the results by order_id, ensuring that the totals are calculated for each order.

*/

-- find avg age and no of eployee for each job title
select job_title,avg(age),count(*) as no_of_emp
from employee 
group by job_title;

-- get total no of product for each category

select c.category_id,c.category_name,count(p.product_id) from category c
join product p
on  c.category_id= p.category_id
group by c.category_id;

-- calculate avg rating and no of reviews for each product
select p.product_name, avg(r.rating) as avg_rating
from product p
join rating r
on p.product_id=r.product_id
group by p.product_id,p.product_name

-- find customer with lowest and highest order amount 
select c.customer_id,c.customer_name,o.total_amount,count(*)
from customer c
join order_details o
on c.customer_id=o.customer_id
group by c.customer_id;

-- calcualte total sales amount and numver of order for each month

select sum(total_amount), month(order_date),count(*) from order_details
group by month(order_date);

-- find avg price and number of product for each supplier
select p.product_id,round(avg(p.price)),s.supplier_id,s.supplier_name,count(*)
from product p
join supplier s
on p.supplier_id=s.supplier_id
group by s.supplier_id,s.supplier_name;
/*GROUP BY s.supplier_id, s.supplier_name: Groups the results by supplier ID and 
supplier name to ensure the calculations are performed for each supplier.*/


-- get max and min of price for each category
select c.category_id,c.category_name,min(p.price),max(p.price),count(*)
from category c
right join product p
on c.category_id=p.category_id
group by c.category_id,c.category_name;
/*Your query is close, but you should use the LEFT JOIN instead of the RIGHT JOIN 
since you're starting with the category table and then joining the product table. */

-- calculate no.of reviews,and avg rating for each product category..

SELECT 
    c.category_id,
    c.category_name,
    COUNT(r.review_id) AS num_reviews,
    AVG(r.rating) AS avg_rating
FROM category c
LEFT JOIN product p ON c.category_id = p.category_id
LEFT JOIN rating r ON p.product_id = r.product_id
GROUP BY c.category_id, c.category_name;

