USE master;
GO

ALTER DATABASE IceCreamShop
SET SINGLE_USER
WITH ROLLBACK IMMEDIATE;
GO

IF DB_ID('IceCreamShop') IS NOT NULL
BEGIN
    DROP DATABASE IceCreamShop;
END
GO

CREATE DATABASE IceCreamShop;
GO

USE IceCreamShop;
GO

CREATE TABLE IceCreamFlavors (
    ID INT PRIMARY KEY,
    Name NVARCHAR(255),
);
GO

CREATE TABLE IceCreams (
    ID INT PRIMARY KEY,
    Name NVARCHAR(255),
    Price DECIMAL(10, 2),
    StockQuantity INT,
    IceCreamFlavorID int not null foreign key references IceCreamFlavors(ID)
);
GO

CREATE TABLE Orders (
    ID INT PRIMARY KEY,
    OrderDate DATETIME,
    Quantity INT,
    TotalCost DECIMAL(10, 2)
);
GO

CREATE TABLE OrdersHistory (
    ID INT PRIMARY KEY,
    OrderID INT,
    IceCreamID INT,
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(ID),
    FOREIGN KEY (IceCreamID) REFERENCES IceCreams(ID)
);
GO

INSERT INTO IceCreamFlavors (ID, Name)
VALUES 
(1, 'Vanilla'),
(2, 'Chocolate'),
(3, 'Strawberry'),
(4, 'Chocolate'),
(5, 'Cookie Dough'),
(6, 'Pistachio'),
(7, 'Salted Caramel'),
(8, 'Coffee'),
(9, 'Mango'),
(10, 'Lemon');
GO

INSERT INTO IceCreams (ID, Name, Price, StockQuantity, IceCreamFlavorID)
VALUES 
(1, 'Delight', 3.99, 100, 1),
(2, 'Bliss', 4.99, 80, 2),
(3, 'Dream', 4.49, 60, 3),
(4, 'Fresh', 4.99, 50, 4),
(5, 'Monster', 5.49, 70, 5),
(6, 'Heaven', 5.99, 40, 6),
(7, 'Indulgence', 5.29, 55, 7),
(8, 'Buzz', 4.79, 75, 8),
(9, 'Tango', 4.59, 90, 9),
(10, 'Zest', 3.89, 110, 10);
GO

INSERT INTO Orders (ID, OrderDate, Quantity, TotalCost)
VALUES 
(1, '2023-08-01', 3, 15.47),
(2, '2023-08-02', 2, 9.98),
(3, '2023-08-03', 1, 4.99),
(4, '2023-08-04', 5, 26.95),
(5, '2023-08-05', 2, 9.58),
(6, '2023-08-06', 4, 18.96),
(7, '2023-08-07', 3, 13.77),
(8, '2023-08-08', 6, 30.54),
(9, '2023-08-09', 2, 9.78),
(10, '2023-08-10', 1, 4.99);
GO

INSERT INTO OrdersHistory (ID, OrderID, IceCreamID, Quantity)
VALUES 
(1, 1, 1, 1),
(2, 1, 2, 1),
(3, 1, 3, 1),
(4, 2, 4, 1),
(5, 2, 5, 1),
(6, 3, 6, 1),
(7, 4, 7, 2),
(8, 4, 8, 2),
(9, 4, 9, 1),
(10, 5, 10, 1),
(11, 5, 1, 1),
(12, 6, 2, 2),
(13, 6, 3, 2),
(14, 7, 4, 1),
(15, 7, 5, 1),
(16, 7, 6, 1),
(17, 8, 7, 2),
(18, 8, 8, 2),
(19, 8, 9, 2),
(20, 9, 10, 1),
(21, 9, 1, 1),
(22, 10, 2, 1);
GO

-- 1. Тригер, який відслідковує кількість порцій морозива, які залишилися на складі після кожного замовлення.
CREATE TRIGGER QuantityAfterInsert ON OrdersHistory
AFTER INSERT
AS 
    DECLARE @iceCreamID INT, @iceCream NVARCHAR(255), @flavor NVARCHAR(255), @quantity INT, @updateQuantity INT;

    SELECT @iceCreamID = Inserted.IceCreamID, @iceCream = IceCreams.Name, @flavor = IceCreamFlavors.Name, @quantity = Inserted.Quantity FROM Inserted
    JOIN IceCreams ON IceCreams.ID = Inserted.IceCreamID
    JOIN IceCreamFlavors ON IceCreamFlavors.ID = IceCreams.IceCreamFlavorID

    UPDATE IceCreams 
    SET StockQuantity = StockQuantity - @quantity
    WHERE ID = @iceCreamID

    SELECT @updateQuantity = StockQuantity FROM IceCreams WHERE ID = @iceCreamID

    IF (@updateQuantity < 0)
    BEGIN   
        PRINT 'Not enough ice cream';
        ROLLBACK TRANSACTION;
    END
    ELSE
    BEGIN
        PRINT CONCAT(@iceCream, ' ', @flavor, ' left in stock: ', @updateQuantity);
    END
GO


INSERT INTO OrdersHistory (ID, OrderID, IceCreamID, Quantity)
VALUES (38, 2, 3, 2);

-- 5. Тригер, який логує всі зміни в таблиці "Морозиво", такі як оновлення ціни або кількості порцій.
CREATE TABLE IceCreamsLogs (
    Id int primary key identity(1,1),
    Description nvarchar(max),
    CreateAt DATETIME default GETDATE()
)

CREATE TRIGGER IceCreamsLogsTrigger
ON IceCreams
AFTER INSERT, UPDATE, DELETE
AS 
    DECLARE @description nvarchar(max);

    IF EXISTS(SELECT * FROM Inserted) AND NOT EXISTS(SELECT * FROM Deleted)
    BEGIN 
        SET @description = 'Insert ice cream';
    END
    ELSE IF EXISTS(SELECT * FROM Inserted) AND EXISTS(SELECT * FROM Deleted)
    BEGIN 
        SET @description = 'Update ice cream';
    END
    ELSE IF EXISTS(SELECT * FROM Deleted) AND NOT EXISTS(SELECT * FROM Inserted)
    BEGIN 
        SET @description = 'Delete ice cream';
    END

    INSERT INTO IceCreamsLogs (Description) VALUES (@description);


INSERT INTO IceCreams (ID, Name, Price, StockQuantity, IceCreamFlavorID)
VALUES (122, 'Zes3t', 3.89, 110, 10);

UPDATE IceCreams 
SET StockQuantity = StockQuantity - 1
WHERE ID = 2

SELECT * FROM IceCreamsLogs



-- 6. Тригер, який автоматично додає новий вид морозива до таблиці "Морозиво" після введення нового смаку.
CREATE TRIGGER NewIceCreamAfterInsertFlavor 
ON IceCreamFlavors
AFTER INSERT
AS
    BEGIN   
        DECLARE @idFlavor int, @nameFlavor nvarchar(255), @maxIdIceCream int;

        SELECT @maxIdIceCream = MAX(ID) FROM IceCreams;
        SELECT @idFlavor = ID, @nameFlavor = Name FROM Inserted;
        INSERT INTO IceCreams (ID, Name, Price, StockQuantity, IceCreamFlavorID) 
        VALUES (@maxIdIceCream+1, CONCAT(@nameFlavor, ' Classic'), 0, 0, @idFlavor)
    END

INSERT INTO IceCreamFlavors VALUES (11, 'Coconut');
SELECT * FROM IceCreamFlavors
SELECT * FROM IceCreams