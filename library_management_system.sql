
#  Library management system project 1 : 


CREATE DATABASE librarydb;

USE librarydb;

# Books Table :

CREATE TABLE Books(
    book_id INT PRIMARY KEY,
    book_name VARCHAR(50),
    price INT
);

INSERT INTO Books VALUES
(101,'SQL',400),
(102,'Python',500),
(103,'Java',600);

SHOW DATABASES;

SHOW TABLES;

SELECT * FROM Books;

# Members Table :

CREATE TABLE Members(
    member_id INT PRIMARY KEY,
    member_name VARCHAR(50)
);

INSERT INTO Members VALUES
(1,'Ravi'),
(2,'Sita'),
(3,'Kiran');

SHOW TABLES;

SELECT * FROM Members;

# Borrow Table :

CREATE TABLE Borrow(
    borrow_id INT PRIMARY KEY,
    member_id INT,
    book_id INT,
    status VARCHAR(20),
    FOREIGN KEY(member_id) REFERENCES Members(member_id),
    FOREIGN KEY(book_id) REFERENCES Books(book_id)
);

INSERT INTO Borrow VALUES
(1,1,101,'Issued'),
(2,2,102,'Issued'),
(3,3,103,'Issued');

SHOW TABLES;

SELECT * FROM Borrow;

# Return Book Feature :

UPDATE Borrow
SET status='Returned'
WHERE borrow_id=1;

# View Returned Books :

SELECT *
FROM Borrow
WHERE status='Returned';

# Books Queries :

SELECT * FROM Books;

SELECT *
FROM Books
WHERE price > 400;

SELECT *
FROM Books
ORDER BY price DESC;

SELECT COUNT(*) AS TotalBooks
FROM Books;

SELECT AVG(price) AS AveragePrice
FROM Books;

SELECT
SUM(price) AS TotalPrice,
COUNT(*) AS TotalCount,
AVG(price) AS AveragePrice
FROM Books;

# Join Query :

SELECT
m.member_name,
b.book_name,
br.status
FROM Borrow br
JOIN Members m
ON br.member_id = m.member_id
JOIN Books b
ON br.book_id = b.book_id;

# Subquery :

SELECT *
FROM Books
WHERE price =
(
    SELECT MAX(price)
    FROM Books
);

# Group By :

SELECT
book_id,
COUNT(*) AS TotalBorrows
FROM Borrow
GROUP BY book_id;

# Having Clause :

SELECT
book_id,
COUNT(*) AS TotalBorrows
FROM Borrow
GROUP BY book_id
HAVING COUNT(*) > 1;
