CREATE DATABASE Seller_Inventory;
USE Seller_Inventory;

CREATE TABLE Product (
    Product_ID INT PRIMARY KEY,
    Product_Name VARCHAR(100) NOT NULL
);

CREATE TABLE Seller (
    Seller_ID VARCHAR(10) PRIMARY KEY,
    Seller_Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Phone VARCHAR(15) UNIQUE,
    Address VARCHAR(200) NOT NULL
);


CREATE TABLE Inventory (
    Inventory_ID INT AUTO_INCREMENT PRIMARY KEY,
    Product_ID INT NOT NULL,
    Seller_ID VARCHAR(10) NOT NULL,
    Stock_Quantity INT NOT NULL CHECK (Stock_Quantity >= 0),
    Stock_Status VARCHAR(20) NOT NULL,
    Last_Updated DATETIME DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (Product_ID)
        REFERENCES Product(Product_ID),

    FOREIGN KEY (Seller_ID)
        REFERENCES Seller(Seller_ID)
);



INSERT INTO Product
(Product_ID, Product_Name)
VALUES
(101, 'Laptop'),
(102, 'Mobile Phone'),
(103, 'Headphones'),
(104, 'Keyboard');



INSERT INTO Seller
(Seller_ID, Seller_Name, Email, Phone, Address)
VALUES
('S105', 'Electro Mart', 'electromart@gmail.com',
 '9876501111', 'Kochi');



INSERT INTO Inventory
(Product_ID, Seller_ID, Stock_Quantity, Stock_Status)
VALUES
(101, 'S105', 25, 'Available'),
(102, 'S105', 15, 'Available');



SELECT
    s.Seller_Name,
    p.Product_ID,
    p.Product_Name,
    i.Stock_Quantity
FROM Seller s
INNER JOIN Inventory i
    ON s.Seller_ID = i.Seller_ID
INNER JOIN Product p
    ON i.Product_ID = p.Product_ID
WHERE s.Seller_ID = 'S105';


SELECT
    s.Seller_ID,
    s.Seller_Name,
    COUNT(DISTINCT i.Product_ID) AS Product_Count
FROM Seller s
LEFT JOIN Inventory i
    ON s.Seller_ID = i.Seller_ID
GROUP BY s.Seller_ID, s.Seller_Name;



UPDATE Seller
SET Phone = '9876502222',
    Email = 'electromart_new@gmail.com'
WHERE Seller_ID = 'S105';



SELECT *
FROM Seller
WHERE Seller_ID = 'S105';