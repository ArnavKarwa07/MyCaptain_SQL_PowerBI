CREATE VIEW LowStockProducts AS
SELECT 
    ProductID, 
    Name, 
    StockQuantity, 
    Category 
FROM Product 
WHERE StockQuantity < 10;

SELECT * FROM LowStockProducts;

DELIMITER //
CREATE PROCEDURE AddNewProduct(
    IN p_Name VARCHAR(100),
    IN p_Description TEXT,
    IN p_Price DECIMAL(10, 2),
    IN p_StockQuantity INT,
    IN p_Weight DECIMAL(10, 2),
    IN p_Category VARCHAR(50)
)
BEGIN
    INSERT INTO Product (Name, Description, Price, StockQuantity, Weight, Category)
    VALUES (p_Name, p_Description, p_Price, p_StockQuantity, p_Weight, p_Category);
END //
DELIMITER ;

CALL AddNewProduct('Gold Bracelet', 'Luxury Gold Bracelet', 299.99, 15, 0.12, 'Bracelets');
select * from product;

DELIMITER //
CREATE FUNCTION GetTotalOrderValue(p_OrderID INT)
RETURNS DECIMAL(10, 2)
DETERMINISTIC
BEGIN
    DECLARE total DECIMAL(10, 2);

    SELECT SUM(Subtotal) INTO total
    FROM OrderDetail
    WHERE OrderID = p_OrderID;

    RETURN total;
END //
DELIMITER ;

SELECT GetTotalOrderValue(1) AS TotalValue;

 