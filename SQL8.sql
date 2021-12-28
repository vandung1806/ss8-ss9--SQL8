USE AdventureWorks2019
GO
--Lấy ra dữ liệu của bảng Contact có ContactTypeID >= 3 và ContactTypeID <= 9
-SELECT *
FROM Person.ContactType
WHERE ContactTypeID >= 3 AND ContactTypeID <= 9
--Lấy ra dữ liệu của bảng Contact có ContactTypeID trong đoạn [3, 9]
SELECT * FROM Person.ContactType
WHERE ContactTypeID BETWEEN 3 AND 9
--Lấy ra dữ liệu của bảng Contact có ContactTypeID trong tập hợp (3, 5, 9)
SELECT * FROM Person.ContactType
WHERE ContactTypeID IN (1,3,5,9)

--Lấy ra những Contact có LastName kết thúc bởi ký tự e
SELECT * FROM Person.Person
WHERE LastName LIKE '%e'
--Lấy ra những Contact có LastName bắt đầu bởi ký tự R hoặc A kết thúc bởi ký tự e
SELECT FROM Person.Person
WHERE LastName LIKE '[RA]%e'
--Lấy ra những Contact có LastName có 4 ký tự bắt đầu bởi ký tự R hoặc A kết thúc bởi ký tự
SELECT FROM Person.Person
WHERE LastName LIKE '[RA]_e'

--Sử dụng DISTINCT các dữ liệu trùng lặp bị loại bỏ
SELECT DISTINCT Title FROM Person.Person

--Sử dụng GROUP BY các dữ liệu trùng lặp được gộp thành nhóm
SELECT Title
FROM Person. Person 
GROUP BY Title

--do đó ta có thể sử dụng được với các hàm tập hợp
SELECT Title, COUNT(*) [Title Number]
FROM Person.Person
GROUP BY Title

--GROUP BY với ALL sẽ lấy ra các hàng bị loại bỏ bởi mệnh đề WHERE
--( Vì mệnh đề WHERE sẽ lọc kết quả sau khi đã đuược gộp nhóm)
SELECT Title, COUNT (*) [Title Number]
FROM Person. Person
WHERE Title LIKE 'Mr%'
GROUP BY ALL Title

--GROUP BY với HAVING: mệnh đề HAVING sẽ lọc kết quả trong lúc được gộp nhóm
SELECT Title, COUNT(*) [Title Number]
FROM Person. Person
WHERE Title like 'Mr%'
GROUP BY ALL Title
HAVING COUNT (*) > 10 I

--GROUP BY với CUBE: Sẽ có thêm một hàng siêu kết hợp gộp tất cả các hàng trong tập trả về
SELECT Title, COUNT(*) [Title Number]
FROM Person.Person
GROUP BY Title WITH CUBE

--GROUP BY với CUBE: Sẽ có thêm các hàng siêu kết hợp gộp tất cả các hàng trong tập trả về
SELECT Title, COUNT(*) [Title Number]
FROM Person. Person
GROUP BY Title WITH ROLLUP

--ORDER BY dùng để sắp xếp kết quả trả về
SELECT FROM Person. Person
ORDER BY FirstName, LastName DESC

SELECT * FROM Person.Person
SELECT * FROM HumanResqurces. Employee

--Truy vấn con
SELECT FROM Person.Person
WHERE BusinessEntityID in (
    SELECT BusinessEntityID
    FROM HumanResources. Employee)

--Truy vấn quan hệ sử dụng EXIST
SELECT * FROM Person. Person C
WHERE EXIST (
        SELECT BusinessEntityID
        FROM HumanResources. Employee
        WHERE BusinessEntityID=C.BusinessEntityID)

--Kết hợp dữ liệu sử dụng UNION
SELECT ContactTypeID, Name
FROM Person.ContactType
WHERE ContactTypeID IN (1,2,3,4,5,6)
uNION
SELECT ContactTypeID, Name
FROM Person.ContactType
WHERE ContactTypeID IN (1,3,5,7)

-- UNION với ALL không loại bỏ giá trị trùng lặp
SELECT ContactTypeID, Name
FROM Person.ContactType
                           I
WHERE ContactTypeID IN (1,2,3,4,5,6)
UNION ALL
SELECT ContactTypeID, Name
FROM Person.ContactType
WHERE ContactTypeID IN (1,3,5,7)

-- UNION với ALL không loại bỏ giá trị trùng lặp
SELECT ContactTypeID, Name
FROM Person.ContactType
WHERE ContactTypeID IN (1,2,3,4,5,6)
UNION ALL
SELECT ContactTypeID, Name
FROM Person.ContactType
WHERE ContactTypeID IN (1,3,5,7)

--Sử dụng INNER JOIN
SELECT *
FROM HumanResources. Employee AS e
   INNER JOIN Person.Person AS p
   ON e. BusinessEntityID = p.BusinessEntityID 
ORDER BY p. LastName

--MULTIPLE OPERATOR
SELECT DISTINCT p1.ProductSubcategoryID, p1.ListPrice
FROM Production.Product p1 INNER JOIN Production.Product p2
   ON p1.ProductSubcategoryID = p2.ProductSubcategoryID AND p1. ListPrice <> p2.ListPrice
WHERE p1. ListPrice < $15 AND p2. ListPrice < $15
ORDER BY ProductSubcategoryID;


