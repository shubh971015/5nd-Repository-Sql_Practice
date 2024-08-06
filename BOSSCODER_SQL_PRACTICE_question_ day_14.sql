/*Day 20
Advanced Database Concepts
*/
/*understand  views and their usage as wll as indexing optimize tech*/
-- find  list product and their quantity 
create view  product_quantity as 
select * from inventory_1;
select * from product_quantity;


-- optimizeing slow performing quering using proper indexing  technique

-- calculate  view to display the total sales  amount  for each product..
create view product_sales as 
select p.product_name, o.total_amount from product p
join order_details o
on p.product_id= o.product_id
group by p.product_id,p.product_name
  
-- optimize query that retrieves the order  for specific customer,sorting them order date  in descending.


