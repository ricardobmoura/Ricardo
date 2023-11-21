/*
Here is a summary of what we have learned so far.
	1. Basic operation in SQL such as INSERT/UPDATE/DELETE, etc.
	2. Creating Stored Procedure with no argument, one argument, and multiple arguments
	3. Triggers
	4. Try and Catch
	5. Join tables
	6. The combination of Stored Procedure and Joins 
	7. The combination of try and catch with Stored Procedure and triggers.
	
Today we will review every single concept mentioned above. This will prepare you for the midterm.
*/

-- Let's create two tables and insert some records into them using Stored procedure

CREATE TABLE VideoGame(
	ID INT,
	Title NVARCHAR(25),
	Studio NVARCHAR(30),
	ReleaseDate DATE
)

CREATE TABLE Billing(
	GameID INT,
	TrasactionAmount MONEY,
	TransactionDate DATE
)

-- the first question is in both above tables, we have a column for ID, but they are not primary key, how to update them?
ALTER TABLE VideoGame ADD CONSTRAINT PK_VideoGame PRIMARY KEY(ID)
-- Since in above table of VideoGame, the column ID can be null then it cannot be the primary key
-- the resolution is firstly make the column ID not null then we set the primary key
ALTER TABLE VideoGame ALTER COLUMN ID INT NOT NULL

-- We update the second table above too.
ALTER TABLE Billing ALTER COLUMN GameID INT NOT NULL
ALTER TABLE Billing ADD CONSTRAINT PK_Billing PRIMARY KEY (GameID) -- here we should mention the name of the column inside of ()

/*
CREATE Three tables as
  Promotion (GameTitle, Date)
  PremiumPlugin (gameID, Date, Rebate)
  Winners (UserID, Firstname, Lastname)
 
After creating these tables add (define) primary key for them.
*/

CREATE TABLE Promotion(
	GameTitle NVARCHAR(50),
	Date Date
)

CREATE TABLE PremiumPlugin(
	GameID INT,
	Date Date,
	Rebate INT
)

CREATE TABLE Winners(
	UserID INT,
	Firstname NVARCHAR(50),
	Lastname NVARCHAR(50)
)

DROP TABLE Promotion
ALTER TABLE Promotion
DROP CONSTRAINT PK_Promotion

ALTER TABLE Promotion ALTER COLUMN GameTitle NVARCHAR(50) NOT NULL
ALTER TABLE Promotion ADD CONSTRAINT PK_Promotion PRIMARY KEY (GameTitle)

ALTER TABLE PremiumPlugin ALTER COLUMN GameID INT NOT NULL
ALTER TABLE PremiumPlugin ADD CONSTRAINT PK_PremiumPlugin PRIMARY KEY (GameID)

ALTER TABLE Winners ALTER COLUMN UserID INT NOT NULL
ALTER TABLE Winners ADD CONSTRAINT PK_Winners PRIMARY KEY (UserID)

ALTER TABLE Winners ALTER COLUMN Firstname NVARCHAR(50)
ALTER TABLE Winners ALTER COLUMN Lastname NVARCHAR(50)

SELECT * FROM Promotion

--FOREIGN KEY (CustomerID) REFERENCES Customer_tbl(ID)

ALTER TABLE Promotion 
ADD CONSTRAINT FK_Promotion_PremiumPlugin FOREIGN KEY (PremiumPluginID) REFERENCES PremiumPlugin(GameID)

ALTER TABLE Promotion ADD PremiumPluginID INT

ALTER TABLE PremiumPlugin 
ADD CONSTRAINT FK_Winners FOREIGN KEY (UserID) REFERENCES Winners(UserID)

ALTER TABLE PremiumPlugin ADD UserID INT

ALTER TABLE Winners 
ADD CONSTRAINT FK_Promotion FOREIGN KEY (GameTitle) REFERENCES Promotion(GameTitle)

ALTER TABLE Winners ADD GameTitle NVARCHAR(50)
-- Ex. create PROCEDURES

CREATE PROCEDURE insertPromotion
	@GameTitle NVARCHAR(50),
	@Date DATE
AS
BEGIN 
	INSERT INTO Promotion(GameTitle,Date) VALUES (@GameTitle, @Date)
END

EXEC insertPromotion 'Ciberpunk', '2023-09-10'
EXEC insertPromotion 'Need For Speed', '2022-05-10'
EXEC insertPromotion 'GTA', '2021-02-11'
EXEC insertPromotion 'Resident Evil', '2023-01-22'
EXEC insertPromotion 'Mario Card', '2022-03-15'

CREATE PROCEDURE insertPremiumPlugin
	@GameID INT,
	@Date Date,
	@Rebate INT
AS
BEGIN 
	INSERT INTO PremiumPlugin(GameID, Date, Rebate) VALUES (@GameID, @Date, @Rebate)
END

EXEC insertPremiumPlugin '001', '2022-09-10', '50'
EXEC insertPremiumPlugin '002', '2021-05-10', '40'
EXEC insertPremiumPlugin '003', '2021-03-11', '30'
EXEC insertPremiumPlugin '004', '2022-01-12', '50'
EXEC insertPremiumPlugin '005', '2023-03-15', '40'

CREATE PROCEDURE insertWinners
	@UserID INT,
	@Firstname NVARCHAR(50),
	@Lastname NVARCHAR(50)
AS
BEGIN 
	INSERT INTO Winners(UserID, Firstname, Lastname) VALUES (@UserID, @Firstname, @Lastname)
END

EXEC insertWinners '001', 'John', 'Falcon'
EXEC insertWinners '002', 'Joe', 'Bacon'
EXEC insertWinners '003', 'Sarah', 'Summer'
EXEC insertWinners '004', 'Tim', 'Lord'
EXEC insertWinners '005', 'Quentin', 'Tarantino'

SELECT * FROM Promotion
SELECT * FROM PremiumPlugin
SELECT * FROM Winners