
--Theoretical order
--From/Joins
--Where and ON clauses
--Group By
--Having
--Selecting
--Dinstict
--Order By

--Question #1
SELECT      COUNT(*) AS 'MaritalStatus', Employee.MaritalStatus
FROM        HumanResources.Employee
GROUP BY    Employee.MaritalStatus;

--Question #2
SELECT      MAX(Product.ListPrice), MIN(Product.ListPrice), AVG(Product.ListPrice)
FROM        Production.Product
WHERE       Product.FinishedGoodsFlag = 1

--Question #3
SELECT      MAX(ModifiedDate) AS 'LastUpdate', Person.Name, Person.LastName
FROM        HumanResources.Employee
INNER JOIN  HumanResources.EmployeePayHistory
ON          Employee.BusinessEntityID = EmployeePayHistory.BusinessEntityID
INNER JOIN  Person.Person
ON          Employee.BusinessEntityID = Person.BusinessEntityID
WHERE       Employee.CurrentFlag = 1
ORDER BY    3, 2
-- Figure out how it works to output the negative or positive change in the variable

--Question #4
SELECT      COUNT(*) AS 'TotalWOrkORders', Product.Name
FROM        Production.Product
INNER JOIN  Production.WorkOrder
ON          Product.ProductID = WorkOrder.ProductID
GROUP BY    Product.Name  --Try if this thing gives you a mnistake if you place product.productID
HAVING      COUNT(*) > 1100

--Question #5
SELECT      MAX(ModifiedDate) AS 'LastUpdate', Person.Name, Person.LastName, EmployeePayHistory.Rate
FROM        HumanResources.Employee
INNER JOIN  HumanResources.EmployeePayHistory
ON          Employee.BusinessEntityID = EmployeePayHistory.BusinessEntityID
INNER JOIN  Person.Person
ON          Employee.BusinessEntityID = Person.BusinessEntityID
WHERE       Employee.CurrentFlag = 1
ORDER BY    3, 2

--Question #6
SELECT      Department.Name, Shift.Name, COUNT(*) AS 'NumberOfEmployees'
FROM        HumanResources.Employee
INNER JOIN  HumanResources.EmployeeDepartmentHistory
ON          Employee.BusinessEntityID = EmployeeDepartmentHistory.BusinessEntityID
INNER JOIN  Employee.Shift
ON          EmployeeDepartmentHistory.ShifID = Shift.ShiftID
INNER JOIN  HumanResources.Department
ON          EmployeeDepartmentHistory.DepartmentID = Department.DepartmentID
WHERE       Employee.CurrentFlag = 1 AND EmployeeDepartmentHistory.EndDate IS NULL
GROUP BY    Department.Name, Shift.Name

--#Question #7
SELECT      COUNT(*) AS 'NumberOrders', SUM(Sales.TotalDue) AS 'Revenue', AVG(TotalDue) AS 'RevenuePerOrder'
FROM        Sales.SalesOrderHeader
WHERE       DATEPART(YEAR, SalesOrderHeader.OrderDate) = 2012
GROUP BY    DATENAME(DAY, SalesOrderHeader.OrderDate)

--Question #8 --check this one tomorrow
SELECT      Product.Name, Product.ListPrice, Product.Inve
FROM        Production.Product
INNER JOIN  Production.ProductInventory
ON          Product.ProductID = ProductInventory.ProductID
WHERE       Product.FinishedGoodsFlag = 1 AND (GETDATE() < SellEndDate AND SellEndDate is NULL)

