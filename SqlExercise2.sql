/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
SELECT p.Name AS 'Product', c.Name AS 'Category'
FROM Products AS p
INNER JOIN Categories AS c
ON c.CategoryID = p.CategoryID
WHERE c.Name = 'Computers' ;
 
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
SELECT p.Name, p.Price, r.Rating
FROM Products as p
INNER JOIN Reviews as r
ON p.ProductID = r.ProductID
WHERE r.Rating = 5;
 
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
SELECT e.FirstName, e.LastName, SUM(s.Quantity) as Total
FROM Employees as e
INNER JOIN Sales as s
ON e.EmployeeID = s.EmployeeID
GROUP BY e.EmployeeID
ORDER BY Total DESC
LIMIT 2;

/* joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT d.Name AS Department, c.Name AS Category
FROM Departments AS d
INNER JOIN Categories as c
ON d.DepartmentID = c.DepartmentID
WHERE c.Name = 'Appliances' OR c.Name = 'Games';

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
 SELECT p.Name, SUM(s.Quantity) AS 'Total Sold', SUM(s. Quantity * s.PricePerUnit) AS 'Total Revenue'
 FROM Products AS p
 INNER JOIN Sales AS s
 ON p.ProductID = s.ProductID
 WHERE p.Name = "Eagles: Hotel California";
 

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
SELECT p.Name AS Product, r.Rating, r.Reviewer, r.Comment
FROM Reviews AS r
INNER JOIN Products AS p
ON p.ProductID = r.ProductID
WHERE p.Name = 'Visio TV' AND r.Rating = 1;


-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return the employeeID, the employee's first and last name, the name of each product, how many of that product they sold */
SELECT e.EmployeeID, e.FirstName, e.LastName, p.Name AS Product, SUM(s.Quantity) AS 'Total Sold'
FROM Employees AS e
INNER JOIN Sales AS s ON e.EmployeeID = s.EmployeeID 
INNER JOIN Products as p ON s.ProductID = p.ProductID
GROUP BY e.EmployeeID, p.ProductID
ORDER BY e.FirstNAme;

