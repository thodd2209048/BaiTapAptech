Use FptAptechBikeStore
GO

--select khach hang nao mua cai gi
select c.customer_id, first_name, 
		last_name, order_date, shipped_date
		from sales.customers as c INNER JOIN sales.orders o ON c.customer_id = o.customer_id
GO

select first_name, last_name, order_date,shipped_date, p.product_name, i.list_price
	from sales.customers c
	INNER JOIN sales.orders o
			ON o.customer_id = c.customer_id
	INNER JOIN sales.order_items i
			ON o.order_id = i.order_id
	INNER JOIN production.products p
			ON i.product_id = p.product_id
GO

SELECT * FROM sales.customers
	WHERE city = 'New York' OR last_name LIKE '%B%'
	ORDER BY last_name DESC;
GO

SELECT * FROM sales.orders WHERE store_id IN(1,2,3,6,9)
GO

SELECT customer_id, Count(order_id) orders
	FROM sales.orders WHERE customer_id IN (1,5,7,99)
	GROUP BY customer_id
	ORDER BY customer_id

SELECT * FROM sales.orders
GO

SELECT product_name, 
	--category_name, 
	--brand_name, 
	i.list_price order_price,
	p.list_price product_price

	FROM production.products p
	JOIN sales.order_items i ON p.product_id = i.product_id
GO

SELECT c.first_name Customer_firstname, c.last_name Customer_lastname, product_name, s.first_name Staff_firstname, s.last_name Staff_Lastname
	FROM sales.customers c
	INNER JOIN sales.orders o ON o.customer_id = c.customer_id
	INNER JOIN sales.order_items i ON i.order_id = o.order_id
	INNER JOIN sales.staffs s ON s.staff_id = o.staff_id
	INNER JOIN production.products p ON p.product_id = i.product_id
GO	
