/*
Char, VARCHAR, and NVARCHAR are designed in sql for
stroing string data. Remember that in programming
string means a set of characters.

VARCHAR: stsnds for variable character
		When the text (string) which we want to save
		does not follow the universal format of text
		which is also know as UINCODE then, we should 
		use VARCHAR.
		In fact format which they can be stored with 
		VARCHAR are ASCII and ISO variants. (ISO 8859)

NVARCHAR: denotes national variable character. It
			is used for storing those text data which 
			follow the UNICODE format. In fact, in terms
			of comprehensiveness, NVARCHAR is higher than
			VARCHAR.
*/


CREATE TABLE TableA(
ID INT NOT NULL PRIMARY KEY,
Value NVARCHAR(30)
)

CREATE TABLE TableB(
ID INT NOT NULL PRIMARY KEY,
VALUE NVARCHAR(30)
)

-- Now we insert records into this table

INSERT INTO TableA VALUES(1, 'FOX')
INSERT INTO TableA VALUES(2, 'COP')
INSERT INTO TableA VALUES(3, 'TAXI')
INSERT INTO TableA VALUES(6, 'WASHINGTON')
INSERT INTO TableA VALUES(7, 'DELL')
INSERT INTO TableA VALUES(5, 'ARIZONA')
INSERT INTO TableA VALUES(4, 'LINCOLN')
INSERT INTO TableA VALUES(10, 'LUCENT')

INSERT INTO TableB VALUES(1, 'TROT')
INSERT INTO TableB VALUES(2, 'CAR')
INSERT INTO TableB VALUES(3, 'CAB')
INSERT INTO TableB VALUES(6, 'MONUMENT')
INSERT INTO TableB VALUES(7, 'PC')
INSERT INTO TableB VALUES(8, 'MICROSOFT')
INSERT INTO TableB VALUES(9, 'APPLE')
INSERT INTO TableB VALUES(11, 'SCOTCH')

-- INNER JOIN

SELECT * FROM TableA INNER JOIN TableB ON TableA.ID = TableB.ID

-- LEFT OUTER JOIN
SELECT * FROM TableA LEFT OUTER  JOIN TableB ON TableA.ID = TableB.ID

-- RIGHT OUTER JOIN
SELECT * FROM TableA RIGHT OUTER  JOIN TableB ON TableA.ID = TableB.ID

-- FULL OUTER JOIN (combination of Left and Right Outer Join
SELECT * FROM TableA FULL OUTER  JOIN TableB ON TableA.ID = TableB.ID