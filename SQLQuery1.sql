
create table Employees
(
  EmployeeID int,
  Name varchar(30),
  DepartmentID int,
  Salary decimal(10,2)
);



create table Department
(
  DepartmentID int,
  Name varchar(30)
);


  
insert into Employees(EmployeeID,Name,DepartmentID,Salary) values
(1,'John Doe',1,60000.00),
(2,'Jane Smith',1,70000.00),
(3,'Alice Johnson',1,65000.00),
(4,'Bob Brown',1,75000.00),
(5,'Charlie Wilson',1,80000.00),
(6,'Eva Lee', 2 ,70000.00),
(7 ,'Michael Clark' ,2 ,75000.00),
(8, 'Sarah Davis', 2, 80000.00),
(9 ,'Ryan Harris', 2, 85000.00),
(10, 'Emily White', 2, 90000.00),
(11 ,'David Martinez' ,3 ,95000.00),
(12, 'Jessica Taylor' ,3 ,100000.00),
(13, 'William Rodriguez' ,3 ,105000.00);


insert into Department(DepartmentID,Name) values
(1,'Marketing'),
(2,'Research'),
(3,'Development');


WITH 
  OverallAvgSalary AS (
    SELECT AVG(Salary) AS OverallAvg
    FROM Employees
  ),
  DeptAvgSalary AS (
    SELECT 
      D.Name AS DepartmentName,
      COUNT(E.EmployeeID) AS NumberOfEmployees,
	  AVG(E.Salary) AS AvgSalary
    FROM 
      Employees E
      JOIN Department D ON E.DepartmentID = D.DepartmentID
    GROUP BY 
      D.Name
  )
SELECT 
  DepartmentName,
  AvgSalary,
  NumberOfEmployees
FROM 
  DeptAvgSalary
WHERE 
  AvgSalary > (SELECT OverallAvg FROM OverallAvgSalary);
