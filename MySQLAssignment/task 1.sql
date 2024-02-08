-- /////////////////////////////////////////// Task 1: Database Design //////////////////////////////////////////////////////////////
drop database techshop;
-- 1. CREATE THE DATABASE NAMES "TECHSHOP".
		CREATE DATABASE TechShop;


-- 2. DEFINE THE SCHEMA FOR THE CUSTOMERS, PRODUCTS, ORDERS, ORDERDETAILS AND INVENTORY TABLES BASED ON THE PROVIDED SCHEMAS.
		USE TechShop;
		
        -- CUSTOMERS TABLE
		CREATE TABLE Customers (
			CustomerID INT AUTO_INCREMENT PRIMARY KEY,  
			FirstName VARCHAR(50),
			LastName VARCHAR(50),
			Email VARCHAR(100),
			Phone VARCHAR(20),
			Address VARCHAR(255)
		);

		-- PRODUCTS TABLE
		CREATE TABLE Products (
			ProductID INT AUTO_INCREMENT PRIMARY KEY,
			ProductName VARCHAR(100),
			Descriptions TEXT,
			Price DECIMAL(10, 2)
		);

		-- ORDERS TABLE
		CREATE TABLE Orders (
			OrderID INT AUTO_INCREMENT PRIMARY KEY,
			CustomerID INT,
			OrderDate DATE,
			TotalAmount DECIMAL(10, 2),
            Statuss VARCHAR(20),
			FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
		);

		-- ORDERDETAILS TABLE
		CREATE TABLE OrderDetails (
			OrderDetailID INT AUTO_INCREMENT PRIMARY KEY,
			OrderID INT,
			ProductID INT,
			Quantity INT,
			FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
			FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
		);

		-- INVENTORY TABLE
		CREATE TABLE Inventory (
			InventoryID INT AUTO_INCREMENT PRIMARY KEY,
			ProductID INT,
			QuantityInStock INT,
			LastStockUpdate DATE,
			FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
		);

--  I'm using the auto-increment function so that it will automatically increment the ID, 
-- and we don't have to manually enter it. Its default value is set to 1.


-- 3. CREATE AN ERD (ENTITY RELATIONSHIP DIAGRAM) FOR THE DATABASE.
-- In EER diagram.


-- 4. CREATE APPROPRIATE PRIMARY KEY AND FOREIGN KEY CONSTRAINTS FOR REFERENTIAL INTEGRITY.
		-- already mentioned in question 2.


-- 5. INSERT ATLEAST 10 SAMPLE RECORDS INTO EACH OF THE FOLLOWING TABLES:-
		-- Insert into Customers
		INSERT INTO Customers (FirstName, LastName, Email, Phone, Address)
		VALUES
			('Aarav', 'Kumar', 'aarav.kumar@email.com', '9876543210', '123 New Delhi St'),
			('Aditi', 'Sharma', 'aditi.sharma@email.com', '8765432109', '456 Mumbai St'),
			('Arjun', 'Singh', 'arjun.singh@email.com', '7654321098', '789 Kolkata St'),
			('Ishaan', 'Patel', 'ishaan.patel@email.com', '6543210987', '234 Bangalore St'),
			('Ananya', 'Rao', 'ananya.rao@email.com', '5432109876', '567 Hyderabad St'),
			('Ayesha', 'Verma', 'ayesha.verma@email.com', '4321098765', '890 Chennai St'),
			('Rohan', 'Mishra', 'rohan.mishra@email.com', '3210987654', '123 Pune St'),
			('Sanya', 'Gupta', 'sanya.gupta@email.com', '2109876543', '456 Ahmedabad St'),
			('Kabir', 'Shah', 'kabir.shah@email.com', '1098765432', '789 Jaipur St'),
			('Tara', 'Dixit', 'tara.dixit@email.com', '9876543210', '234 Lucknow St');

		select * from customers;

		-- Insert into Products
		INSERT INTO Products (ProductName, Descriptions, Price)
		VALUES
			('Smartphone', 'Latest smartphone with advanced features', 19999.99),
			('Laptop', 'Powerful laptop with high-performance specs', 49999.99),
			('Headphones', 'Noise-canceling headphones with superior sound quality', 999.99),
			('Tablet', 'Compact tablet for on-the-go use', 14999.99),
			('Smartwatch', 'Feature-rich smartwatch with health monitoring', 7999.99),
			('Camera', 'High-resolution digital camera for photography enthusiasts', 29999.99),
			('Bluetooth Speaker', 'Portable speaker with Bluetooth connectivity', 2499.99),
			('Gaming Console', 'Next-gen gaming console for immersive gaming experience', 34999.99),
			('Fitness Tracker', 'Fitness band with heart rate monitoring and activity tracking', 1499.99),
			('Wireless Earbuds', 'True wireless earbuds with long battery life', 3999.99);
		
        select * from products;

		-- Insert into Orders
		INSERT INTO Orders (CustomerID, OrderDate, TotalAmount, Statuss)
		VALUES
			(1, '2024-01-14', 19999.99, 'Shipped'),
			(2, '2024-01-15', 49999.99, 'Cancelled'),
			(3, '2024-01-16', 999.99, 'Processing'),
			(4, '2024-01-17', 14999.99, 'Shipped'),
			(5, '2024-01-18', 7999.99, 'Cancelled'),
			(6, '2024-01-19', 29999.99, 'Processing'),
			(7, '2024-01-20', 2499.99,'Shipped'),
			(8, '2024-01-21', 34999.99, 'Cancelled'),
			(9, '2024-01-22', 1499.99, 'Processing'),
			(10, '2024-01-23', 3999.99, 'Shipped');
            
		select * from orders;

		-- Insert into OrderDetails
		INSERT INTO OrderDetails (OrderID, ProductID, Quantity)
		VALUES
			(1, 1, 2),
			(2, 2, 1),
			(3, 3, 3),
			(4, 4, 1),
			(5, 5, 2),
			(6, 6, 1),
			(7, 7, 4),
			(8, 8, 1),
			(9, 9, 5),
			(10, 10, 2);

		select * from orderdetails;

		-- Insert into Inventory
		INSERT INTO Inventory (ProductID, QuantityInStock, LastStockUpdate)
		VALUES
			(1, 15, '2024-01-14'),
			(2, 10, '2024-01-15'),
			(3, 20, '2024-01-16'),
			(4, 8, '2024-01-17'),
			(5, 12, '2024-01-18'),
			(6, 5, '2024-01-19'),
			(7, 30, '2024-01-20'),
			(8, 6, '2024-01-21'),
			(9, 25, '2024-01-22'),
			(10, 18, '2024-01-23');

		select * from inventory;

