-- ///////////////////////////////////// Task 2: Database Design ///////////////////////////////////////

-- 1. WRITE AN SQL QUERY TO RETRIEVE THE NAMES AND EMAILS OF ALL THE CUSTOMERS.
		select FirstName, LastName, Email from Customers;


-- 2. WRITE AN SQL QUERY TO LIST ALL ORDERS EITH THEIR ORDER DATES AND CORRESPONSING CUSTOMER NAMES.
		select Orders.OrderID, Orders.OrderDate, Customers.FirstName, Customers.LastName from Orders
		join Customers on Orders.CustomerID = Customers.CustomerID;


-- 3. WRITE AN SQL QUERY TO INSERT A NEW CUSTOMER RECORD INTO THE CUSTOMERS TABLE. INCLUDE CUSTOMER 
--    INFORMATION SUCH AS NAME, EMAIL, AND ADDRESS.
		insert into Customers (CustomerID, FirstName, LastName, Email, Phone, Address)
		values (11, 'Khushi', 'Jain', 'khushijain@example.com', '9876543210', '123 New Street, City');


-- 4. WRITE AN SQL QUERY TO UPDATE THE PRICES OF ALL THE ELECTRONICS GADGETS IN THE PRODUCTS TABLE 
--    BY INCREASING THEM BY 10%.
		update Products set Price = Price * 1.10;
		
        
-- 5. WRITE AN SQL QUERY TO DELETE A SPECIFIC RECORD AND ITS ASSOCIATED ORDER DETAILS FROM THE "ORDERS" AND "ORDERDETAILS"
--    TABLES. ALLOW USERS TO INPUT THE ORDER ID AS A PARAMETER.
		set @OrderIDToDelete = 1;

		DELETE FROM OrderDetails
		WHERE OrderID = @OrderIDToDelete;

		DELETE FROM Orders
		WHERE OrderID = @OrderIDToDelete;


-- 6. Write an SQL query to insert a new order into the "Orders" table. Include the customer ID,
-- order date, and any other necessary information.
		insert into Orders (OrderID, CustomerID, OrderDate, TotalAmount)
		values (11, 4, '2024-01-25', 8999.99);
        
        
-- 7. Write an SQL query to update the contact information (e.g., email and address) of a specific
-- customer in the "Customers" table. Allow users to input the customer ID and new contact
-- information.
		SET @CustomerIDToUpdate = 3;

		UPDATE Customers
		SET Email = 'new.email@email.com', Address = 'New Updated Address'
		WHERE CustomerID = @CustomerIDToUpdate;

        
-- 8. Write an SQL query to recalculate and update the total cost of each order in the "Orders"
-- table based on the prices and quantities in the "OrderDetails" table.
-- Update the total cost of each order in the "Orders" table
		UPDATE Orders
		SET TotalAmount = (
			SELECT SUM(od.Quantity * p.Price)
			FROM OrderDetails od
			JOIN Products p ON od.ProductID = p.ProductID
			WHERE od.OrderID = Orders.OrderID
		)


-- 9. Write an SQL query to delete all orders and their associated order details for a specific
-- customer from the "Orders" and "OrderDetails" tables. Allow users to input the customer ID
-- as a parameter.
		SET @CustomerIDToDelete = 5;

		DELETE FROM OrderDetails
		WHERE OrderID IN (SELECT OrderID FROM Orders WHERE CustomerID = @CustomerIDToDelete);

		DELETE FROM Orders
		WHERE CustomerID = @CustomerIDToDelete;


-- 10. Write an SQL query to insert a new electronic gadget product into the "Products" table,
-- including product name, category, price, and any other relevant details.
		insert into Products (ProductID, ProductName, Descriptions, Price)
		values (11, 'T.V.', 'High-definition smart TV with advanced features', 3599.99);


-- 11. Write an SQL query to update the status of a specific order in the "Orders" table (e.g., from
-- "Pending" to "Shipped"). Allow users to input the order ID and the new status.
		SET @OrderIDToUpdate = 1;
		UPDATE Orders
		SET Status = 'Shipped'
		WHERE OrderID = @OrderIDToUpdate;



-- 12. Write an SQL query to calculate and update the number of orders placed by each customer
-- in the "Customers" table based on the data in the "Orders" table.
		UPDATE Customers
		SET Orders = (
			SELECT COUNT(OrderID)
			FROM Orders
			WHERE Customers.CustomerID = Orders.CustomerID
		);
