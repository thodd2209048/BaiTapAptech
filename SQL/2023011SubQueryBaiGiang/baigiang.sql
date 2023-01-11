--Subquerry with IN, NOT In

USE FptAptechBikeStore
GO

select product_name, list_price 
from production.products 
where brand_id 
IN (select brand_id 
        from production.brands 
		where brand_name like 'Electra' or brand_name like 'Trek')
go

select * from production.products
where list_price >= 
	(select avg(list_price) from production.products
	where list_price < 1000)
GO

select * from sales.customers
where not exists (select customer_id from sales.orders)
go

select * from sales.customers c
where exists (select customer_id from sales.orders o
				where c.customer_id = o.customer_id and year(order_date) = 2018) 
go

--subquery in from

select avg(order_staff) avg_order_by_staff
from(
select staff_id, count(order_id) order_staff
from sales.orders
group by staff_id) t;
GO

select 
	order_id,
	order_date,
	(select max(list_price) 
		from sales.order_items i
		where
		i.order_id = o.order_id) as max_price
from sales.orders
order by order_date desc
go

--index: chi muc
--giup tang toc do cau lenh truy van
--Co 2 loai index: 1. clustered index va non-clustered index

CREATE TABLE production.images(
	image_id int not null,
	image_name varchar(250)
)

--insert data
insert into	
	production.images(image_id, image_name)
	values (1, 'image1'),
			(2, 'image2'),
			(3, 'image3');
GO
-- select
select image_id, image_name from production.images where image_id = 3;