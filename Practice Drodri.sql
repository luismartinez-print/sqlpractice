SELECT Employee.BusinessEntityID
FROM HumanResources.Employee
WHERE "manager" OR "supervisor" OR "chief" OR "vice president"
ORDER BY 'JobTitles', ASC;


