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

SELECT * FROM TableA INNER JOIN TableB ON
TableA.ID = TableB.ID

/*
The above query means: Please return all those records
from TableA and TableB which they have the same ID

Threfore, if two records from the above tables do not
have the same ID, nothing will returned.
*/

/*
It is possible to get the above result with another
query. This time without a join clause
*/

SELECT * FROM TableA, TableB WHERE
TableA.ID = TableB.ID

/*
Quick summary:
Inner join returns records of the tables which they are
in common.

In the INNER JOIN caluse we have the commad of ON which
specifies a condition for joining table. If we replace 
the join command with simple SELECT query then we need
to use the WHERE caluse instead of ON.

*/

SELECT * FROM TableA INNER JOIN TableB 
ON TableA.ID >= TableB.ID
/*
The condition above ON TableA.ID > TableB.ID specifies
that we want to join records where ID column in TableA
is greater that the ID column in TableB

Discussion on Final Result:

The result is a dataset containing all the columns from 
both TableA and TableB but only records where the ID is
TableA is greater than the ID in TableB.
*/

SELECT * FROM TableA LEFT OUTER JOIN TableB
ON TableA.ID = TableB.ID

/*
The above query returns all the inforamtion about
TableA including those records which both tables have.
If there is/are records which do not exist in TableA
then, a null value will appear on the resulting table
*/

SELECT * FROM TableA RIGHT OUTER JOIN TableB
ON TableA.ID = TableB.ID

/*
RIGHT OUTER JOIN is the same as LEFT OUTER JOIN
but the priority is with right table. Thus, if there is
no matching record with the left table, NULL will be
returned.
*/

SELECT * FROM TableA FULL OUTER JOIN TableB
ON TableA.ID = TableB.ID

/*
Comparing the results from the above queries confirms that
FULL OUTER JOIN is the combintaion of both
LEFT OUTER JOIN and RIGHT OUTER JOIN
*/