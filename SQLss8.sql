--Ví dụ 1:
SELECT LEFT ('International',5)

--Ví dụ 2:
USE AdventureWorks2019
SELECT * FROM HumanResources.Employee
GO

--Ví dụ 3:
USE AdventureWorks2019
SELECT LocationID, CostRate FROM Production. Location
GO

--Ví dụ 4:
USE AdventureWorks2019
SELECT Name +':'+CountryRegionCode +'->'+Group FROM Sales.SalesTerritory
GO

--Ví dụ 5:
USE AdventureWorks2019
SELECT Name +':'+ CountryRegionCode +'->'+ [Group] AS NameRegionGroup FROM
Sales.Sales Territory
GO

--Ví dụ 6:
USE AdventureWorks2019
SELECT ModifiedDate as 'ChangedDate' FROM Person.Person
GO

--Ví dụ 7:
USE AdventureWorks2019
SELECT ProductID, StandardCost, StandardCost *0.15AS Discount FROM
Production.ProductCostHistory
GO

--Ví dụ 8:
USE AdventureWorks2019
SELECT DISTINCT StandardCost FROMProduction.ProductCostHistory
GO

--Ví dụ 9:
USE AdventureWorks2019
SELECT DISTINCT StandardCost FROMProduction.ProductCostHistory
GO

--Ví dụ 10:
USE AdventureWorks2019
SELECT * FROMProduction.ProductCostHistoryWHERE EndDate='2013-05-29 00:00: 00.000'
GO

--Ví dụ 11:
USE AdventureWorks2019
SELECT FROM Person. Address WHERE City3'Bothell'
GO

--Ví dụ 12:
USE AdventureWorks2019
SELECT * FROM HumanResources.Department WHERE DepartmentID<10
GO

--Ví dụ 13:
USE AdventureWorks2019
SELECT * FROM Person. Address WHERE AddressID > 900 AND City 'Seattle'
GO

--Ví dụ 14:
USE AdventureWorks2019
SELECT * FROM Person.Address WHERE AddressID > 900 OR City=' Seattle'
GO

--Ví dụ 15:
USE AdventureWorks2019
SELECT * FROM Person. Address WHERE NOT AddressID =5
GO

--Ví dụ 16:
SELECT WorkOrderID, SUM (ActualResourceHrs) FROMProduction.WorkOrderRouting GROUP
BY WorkOrderID
GO

--Ví dụ 17:
USE AdventureWorks2019
SELECT WorkorderID, SUM (ActualResourceHrs) FROM Production.WorkOrderRouting
GROUP BY WorkOrderID HAVING WorkorderID <50
GO

--Ví dụ 18:
SELECT FROM Sales.SalesTerritory ORDER BY SalesLastYear
GO

--Ví dụ 19:
CREATE TABLE Person. PhoneBilling (Bill IDint PRIMARY KEY, MobileNumberbigint
UNIQUE, CallDetails xml)
GO

--Ví dụ 20:
USE AdventureWorks2019
INSERT INTO Person.PhoneBilling VALUES (100,9833276605,
'<Info><Call>Local</Call><Time>45 minutes</Time><Charges>200</Charges>
</Info>')
SELECT CallDetails FROM Person. PhoneBilling
GO

--Ví dụ 21:
DECLARE @xmlvar xml
SELECT @xmlvar='<Employee name="Joan" />'

--Ví dụ 22:
CREATE XML SCHEMA COLLECTION SoccerSchemaCollection
AS N'<xsd:schema xmlns:xsd="http://www.w3.org/2001/XMLSchema">
<xsd:element name="MatchDetails">
<xsd:complexType>
<xsd:complexContent>
<xsd:restriction base="xsd:anyType">
<xsd:sequence>
<xsd:element name="Team" minOccurs="0" maxOccurs="unbounded">
<xsd:complexType>
<xsd:complexContent>
<xsd:restriction base="xsd:anyType">
<xsd:sequence />
<xsd:attribute name="country" type="xsd:string" />
<xsd:attribute name="score" type="xsd:string" />
</xsd:restriction>
</xsd:complexContent>
</xsd:complexType>
</xsd:element>
</xsd:sequence>
</xsd:restriction>
</xsd:complexContent>
</xsd:complexType>
</xsd:element>
</xsd:schema>'
GO
--Ví dụ 23:
CREATE TABLE SoccerTeam ( TeamID int identity not null, TeamInfo xml
(SoccerSchemaCollection) )

--Ví dụ 24:
INSERT INTO SoccerTeam (7eamInfo) VALUES ('<MatchDetaila><Team country="Australia"
score-"3"></Team><Team country="Zimbabwe" score-"2"></Team><Team
country="England" score-"4"></Team></MatchDetaila>')

--Ví dụ 25:
DECLARE @team xml (SoccerSchemaCollection)
SET @team ='<MatchDetails><Team country="Australia"></Team></MatchDetails>'
SELECT eteam
GO


