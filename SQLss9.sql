--Ví dụ 1:
SELECTWorkOrderID, SUM (ActualResourceHrs) AS TotalHours PerWorkOrder FROM
Production.WorkOrderRouting GROUP BY WorkorderID

--Ví dụ 2:
SELECT WorkorderID, SUM (ActualResourceHrs) AS TotalHoursPerWorkOrder
FROM Production.WorkOrderRouting WHERE WorkOrderID<50 GROUP BY WorkOrderID

--Ví dụ 3:
SELECT Class, AVG (ListPrice) AS 'AverageListPrice' FROM Production.Product GROUP
BY Class

--Ví dụ 4:
SELECT [Group], SUM (SalesYTD) AS 'TotalSales' FROM Sales. SalesTerritory WHERE
[Group] LIKE 'N%' OR [Group) LIKE 'E%' GROUP BY ALL [Group]

--Ví dụ 5:
SELECT [Group], SUM (SalesYTD) AS 'TotalSales' FROM Sales.SalesTerritory WHERE
[Group] LIKE 'PS' GROUP BY ALL (Group] HAVING SUM (SalesYTD) < 6000000

--Ví dụ 6:
SELECT Name, CountryRegionCode, SUM (SalesYTD) AS TotalSales FROM Sales.
SalesTerritory WHERE Name <> 'Australia'ANDName<> 'Canada' GROUP BY
Name, CountryRegionCode WITH CUBE

--Ví dụ 7:
SELECT Name, CountryRegionCode, SUM (SalesYTD) AS TotalSales FROM
Sales.SalesTerritory
WHERE Name <> 'Australia'AND Name<> 'Canada' GROUPBY
Name, CountryRegionCode
WITH ROLLUP

--Ví dụ 8:
SELECT AVG( [UnitPrice]) AS AvgunitPrice, MIN([OrderQty]) AS MinQty,
MAX ([UnitPriceDiscount]) AS MaxDiscount
FROM Sales.SalesOrderDetail;

--Ví dụ 9:
SELECT SalesOrderID, AVG (UnitPrice) AS AvgPrice FROM Sales.SalesOrderDetail;

--Ví dụ 10:
SELECTMIN (OrderDate) AS Earliest, MAX (OrderDate) AS Latest FROM
Sales.SalesorderHeader;

--Ví dụ 11:
DECLARE @Cityl geography
SET @Cityl =geography::STPolyFromText (
'POLYGON ( (175.3-41.5, 178.3-37.9, 172.8-34.6, 175.3-41.5))', 4326)
DECLARE @City2 geography
SET @City2 =geography::STPolyFromText (
 'POLYGON ((169.3-46.6, 174.3-41.6, 172.5-40.7, 166.3-45.8, 169.3-46.6))',
4326)
DECLARE @CombinedCitygeography @Cityl.STUnion (@City2)
SELECT @CombinedCity

--Ví dụ 13:
SELECT Geography::UnionAggregate (SpatialLocation) AS AVGLOcation
FROM Person.Address
WHERE City 'London';

--Ví dụ 14:
SELECT Geography::EnvelopeAggregate (SpatialLocation) AS Location
FROM Person.Address WHERE City='London'

--Ví dụ 15:
DECLARE @CollectionDemo TABLE (
shape geometry, shapeType nvarchar (50)
INSERT INTO eCollection Demo (shape, shapeType) VALUES ('CURVEPOLYGON (
CIRCULARSTRING (2 3, 4 1, 6 3, 4 5, 2 3))', 'Circle'),
('POLYGON ( (1 1, 4 1, 4 5, 1 5, 1 1))', 'Rectangle');
SELECT geometry::CollectionAggregate (shape) FROM@CollectionDemo;

--Ví dụ 16:
SELECT Geography::ConvexHullAggregate (SpatialLocation) AS Location
FROM Person.Address
WHERE City= 'London'

--Ví dụ 17:
SELECT DueDate, ShipDate FROM Sales.SalesOrderHeader WHERE
Sales.SalesOrderHeader.OrderDate= (SELECT MAX (OrderDate)
FROM Sales.SalesOrderHeader)

--Ví dụ 18:
SELECT FirstName, LastName FROM Person. Person
WHERE Person. Person.BusinessEntityID IN (SELECT BusinessEntityID
FROMHumanResources.Employee WHERE JobTitle='Research and Development Manager');

--Ví dụ 19:
SELECT FirstName, LastName FROM Person. Person AS A WHERE EXISTS (SELECT
FROMHumanResources.Employee As BWHERE JobTitle='Research and Development Manager'
AND A.BusinessEntityID-B.BusinessEntityID);

--Ví dụ 20:
SELECT LastName, FirstName FROM Person. Person WHERE BusinessEntityID IN (SELECT
BusinessEntityID FROM Sales.SalesPerson WHERE TerritoryID IN
  (SELECT TerritoryID
  FROM Sales.SalesTerritory
        WHERE Name='Canada')
)

--Ví dụ 21:
SELECT e.BusinessEntityID FROM Person.BusinessEntityContact e WHERE
e.ContactTypeID IN (
SELECT c.ContactTypeID FROM
Person.ContactType c
WHERE YEAR (e.ModifiedDate) >=2012
)

--Ví dụ 22:
SELECT A.First Name, A. LastName, B.JobTitle
FROM Person.Person A
JOIN
HumanResources.EmployeeB ON
A.BusinessEntityID= B.BusinessEntityID;

--Ví dụ 23:
SELECTA.FirstName, A.LastName, B.JobTitle
FROM Person. Person A
INNER JOIN HumanResources. Employee B
         ON
A.BusinessEntityID= B.BusinessEntityID;

--Ví dụ 24:
SELECT A.CustomerID, B.DueDate, B.ShipDate FROM Sales.Customer A LEFT OUTER JOIN
Sales.SalesOrderHeader B
ON
A.CustomerID= B.CustomerIDAND YEAR (B.DueDate) <2019;

--Ví dụ 25:
SELECT P. Name, s.SalesOrderID FROMSales.SalesOrderDetails
RIGHT OUTER JOIN
Production. Product P
ON P. ProductID=S.ProductID;

--Ví dụ 26:
SELECT
   pl. ProductID,
     pl.Color,
   pl.Name,
   p2. Name
  FROM
    Production. Product pl
INNER JOIN Production.Product p2 ON pl.Color = p2.Color
ORDER BY pl.ProductID

--Ví dụ 27:
SET IDENTITY_INSERT (Person). [AddressType] ON
MERGE INTO [Person].[AddressType] AS Target
USING (VALUES
  (1, 'Billing')
 , (2, 'Home')
  (3, 'Headquarters')
 , (4, 'Primary')
 , (5, 'Shipping')
  (6, 'Archival')
 ,(7, 'Contact')
  (8, 'Alternative')
 ) AS Source
([AddressTypeID], (Name]) ON (Target. [AddressTypeID] = Source. [AddressTypeID])
WHEN MATCHED AND (Target. (Name] <> Source. [Name]) THEN
    UPDATE SET [Name] = Source. [Name]
WHEN NOT MATCHED BY TARGET THEN
 INSERT ( [AddressTypeID], [Name]) VALUES (Source. [AddressTypeID], Source. [Name])
WHEN NOT MATCHED BY SOURCE THEN
   DELETE
OUTPUT Saction, Inserted. [AddressTypeID], Inserted.Name,
Deleted. [AddressTypeID], Deleted.Name;

--Ví dụ 28:
WITHCTE OrderYear AS
SELECT YEAR (OrderDate) AS OrderYear, CustomerID
FROM Sales.SalesOrderHeader
SELECTOrderYear, COUNT (DISTINCT CustomerID) AS CustomerCount FROM
CTE OrderYear
GROUP BY OrderYear;

--Ví dụ 29:
WITH CTE_Students
AS (
StudentCode, S.Name, C.cityName, St.Status FROM Student S
INNER JOIN City C
         ON S.CityCode - c.cityCode INNER
JOIN Status St
ON S.StatusId = St.StatusId)
StatusRecord This is the second CTE being defined --
AS (
SELECT Status, COUNT (Name) AS CountofStudents FROM
CTE Students
GROUP BY Status
SELECT * FROM StatusRecord

--Ví dụ 30:
SELECT Product.ProductId FROM Production. Product UNION
SELECT ProductId FROM Sales.SalesOrderDetail

--Ví dụ 31:
SELECT Product.ProductId FROM Production.Product UNIONALL
SELECT ProductId FROM Sales.SalesOrderDetail

--Ví dụ 32:
SELECT Product.ProductIdFROMProduction.Product
INTERSECT
SELECT ProductId FROM Sales.SalesOrderDetail

--Ví dụ 33:
SELECT Product.ProductIdFROMProduction.Product
INTERSECT
SELECT ProductId FROM Sales.SalesOrderDetail

--Ví dụ 34:
SELECT TOP 5 SUM (SalesYTD) AS TotalSalesYTD, Name FROM Sales.SalesTerritory
GROUP BY Name

--Ví dụ 35:
-Pivot tablewith one row and six columns
SELECT TOP 5 'TotalSalesYTD' AS GrandTotal,
[Northwest), [Northeast), [Central], (Southwest], [Southeast] FROM
(SELECT TOP5 Name, SalesYTD FROM Sales.SalesTerritory) AS SourceTable PIVOT
(SUM (SalesYTD) FOR Name IN ([Northwest], [Northeast), (Central], Southwest),
[Southeast]) ) AS PivotTable;

--Ví dụ 36:
SELECT SalesYear, TotalSales FROM
    SELECT * FROM
        SELECT YEAR (SOH.OrderDate) AS SalesYear,
               SOH.SubTotal AS TotalSales
        FROM sales.SalesOrderHeader SOH
             JOIN sales.SalesOrderDetail soD ON SOH.SalesOrderId
SOD.SalesOrderId
     ) AS Sales PIVOT (SUM (TotalSales) FOR SalesYear IN([2011],
                                                         (2012],
                                                         [2013),
                                                         (2014])) AS PVT
) T UNPIVOT (TotalSales FOR SalesYear IN([2011),
                                          [2012],
                                          [2013],
                                          [2014])) AS upvt;
                                         