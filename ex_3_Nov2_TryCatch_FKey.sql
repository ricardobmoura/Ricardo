/*
now lwt's create a table and implement the INSERT command with try and catch block
*/
CREATE TABLE Customer_tbl(
	ID INT NOT NULL PRIMARY KEY,
	orderType NVARCHAR(50),
	DateofOrder DATE
)
-- now we INSERT a record into this table but we use the try catch block
-- we do not need to explicitely mention the name or type of the exception, we can use general
-- terms as below

BEGIN TRY
	INSERT INTO Customer_tbl VALUES (1001, 'TV', '2023-10-18')
	PRINT 'order inserted successfully'
END TRY
BEGIN CATCH
	PRINT 'An exception happened: ' + ERROR_MESSAGE() 
END CATCH

SELECT * FROM Customer_tbl

-- now we run the above quey with one intentional mistake and check if the catch can handle it or not

BEGIN TRY
	INSERT INTO Customer_tbl VALUES (1001, 11, '2023-10-18')
	PRINT 'order inserted successfully'
END TRY
BEGIN CATCH
	PRINT 'An exception happened: ' + ERROR_MESSAGE() 
END CATCH

-- the above query is not correct and the catch block detects it correctly

-- we create another table and practice try and catch block for join operations
CREATE TABLE OrderDetails_tbl(
	OrderID INT NOT NULL PRIMARY KEY,
	CustomerId INT NOT NULL,
	ProductName NVARCHAR(100),
	OrderDates DATE,
	Quantity INT,
	FOREIGN KEY (CustomerID) REFERENCES Customer_tbl(ID)
	-- the baove line means we are connecting the two tables above with their primary keys
	-- in fact, the above line means, the column CustomerID in the current table which is 
	-- OrderDetail_tbl should get matched with the column ID in the table Customer_tbl
	-- a forein key is a key in table which the same column in another table is a primary key
	-- CustomerID in the current table is not a primary key but since we are attaching it
	-- into the Column ID inside of the table Customer_tbl and ID is a primary key in this
	-- table then, CustomerID will be marked as a foreing key.
	-- Defining a foregn key has nothing to do with join, becasue joining tables is for retrieving
	-- information from both of them, but the foreign key is just an identifier.
)

SELECT * FROM Customer_tbl
SELECT * FROM OrderDetails_tbl

INSERT INTO Customer_tbl VALUES
(1002, 'Laptop', '2022-09-11'),
(1003, 'GPU', '2023-06-14')

INSERT INTO OrderDetails_tbl VALUES
(12, '1001', 'Sony', '2023-10-18', 10),
(15, '1002', 'Mac', '2022-09-11', 5),
(24, '1003', 'Dell', '2023-06-14', 4)

-- now we implement the join operation and use the try and catch block
BEGIN TRY
	SELECT
		o.OrderID,
		c.ID AS CustomerID,
		c.orderType,
		o.ProductName,
		o.OrderDates,
		o.Quantity
		FROM OrderDetails_tbl o -- we name the table OrderDetails_tbl to o for simplicity
		INNER JOIN Customer_tbl c ON o.CustomerId = c.ID
END TRY
BEGIN CATCH
	PRINT 'An error occured: ' + ERROR_MESSAGE()
END CATCH

-- we want to see multiple JOIN, so let's create another table and see how it works.
CREATE TABLE Product_tbl(
	ProductID INT PRIMARY KEY,
	ProductName NVARCHAR(100)
)
-- now we insert some records into this table
INSERT INTO Product_tbl VALUES
(54, 'Sony'),
(67, 'Mac'),
(92, 'Dell')

-- here we run nested joins
BEGIN TRY
	SELECT
		od.OrderID,
		c.orderType,
		p.ProductName,
		od.OrderDates
		FROM OrderDetails_tbl od
		INNER JOIN Customer_tbl c ON od.CustomerId = c.ID
		INNER JOIN Product_tbl p ON od.ProductName = p.ProductName
END TRY
BEGIN CATCH
	PRINT 'AN error occured: '+ ERROR_MESSAGE()
END CATCH

SELECT * FROM Customer_tbl
SELECT * FROM OrderDetails_tbl
SELECT * FROM Product_tbl

-- TASK OUTTER JOIN

BEGIN TRY
	SELECT
		od.OrderID,
		c.orderType,
		p.ProductName
		FROM OrderDetails_tbl od
		RIGHT OUTER JOIN Customer_tbl c ON od.CustomerId = c.ID
		RIGHT OUTER JOIN Product_tbl p ON od.ProductName = p.ProductName
END TRY
BEGIN CATCH
	PRINT 'AN error occured: '+ ERROR_MESSAGE()
END CATCH