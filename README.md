
## Sample Output

### Display All Books

```sql
SELECT * FROM Books;
```

Output:

| book_id | book_name | price |
|----------|------------|-------|
| 101 | SQL | 400 |
| 102 | Python | 500 |
| 103 | Java | 600 |

### Display All Members

```sql
SELECT * FROM Members;
```

Output:

| member_id | member_name |
|-----------|-------------|
| 1 | Ravi |
| 2 | Sita |
| 3 | Kiran |

### Display Borrow Records

```sql
SELECT * FROM Borrow;
```

Output:

| borrow_id | member_id | book_id | status |
|------------|-----------|---------|---------|
| 1 | 1 | 101 | Issued |
| 2 | 2 | 102 | Issued |
| 3 | 3 | 103 | Issued |

### Return Book

```sql
UPDATE Borrow
SET status='Returned'
WHERE borrow_id=1;
```

Output:

```text
Query OK, 1 row affected
```

### View Returned Books

```sql
SELECT * FROM Borrow
WHERE status='Returned';
```

Output:

| borrow_id | member_id | book_id | status |
|------------|-----------|---------|---------|
| 1 | 1 | 101 | Returned |

### Count Total Books

```sql
SELECT COUNT(*) AS TotalBooks
FROM Books;
```

Output:

| TotalBooks |
|------------|
| 3 |

### Average Book Price

```sql
SELECT AVG(price) AS AveragePrice
FROM Books;
```

Output:

| AveragePrice |
|--------------|
| 500 |

### Total Price of All Books

```sql
SELECT SUM(price) AS TotalPrice
FROM Books;
```

Output:

| TotalPrice |
|------------|
| 1500 |

### Join Query

```sql
SELECT m.member_name,
       b.book_name,
       br.status
FROM Borrow br
JOIN Members m
ON br.member_id = m.member_id
JOIN Books b
ON br.book_id = b.book_id;
```

Output:

| member_name | book_name | status |
|-------------|-----------|---------|
| Ravi | SQL | Returned |
| Sita | Python | Issued |
| Kiran | Java | Issued |

### Most Expensive Book (Subquery)

```sql
SELECT *
FROM Books
WHERE price =
(
 SELECT MAX(price)
 FROM Books
);
```

Output:

| book_id | book_name | price |
|----------|------------|-------|
| 103 | Java | 600 |

### Group By Query

```sql
SELECT book_id,
       COUNT(*) AS TotalBorrows
FROM Borrow
GROUP BY book_id;
```

Output:

| book_id | TotalBorrows |
|----------|-------------|
| 101 | 1 |
| 102 | 1 |
| 103 | 1 |
+----------------+
