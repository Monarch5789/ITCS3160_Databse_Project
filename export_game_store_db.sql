--
-- File generated with SQLiteStudio v3.4.17 on Wed Apr 23 16:22:35 2025
--
-- Text encoding used: UTF-8
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: Customer
CREATE TABLE IF NOT EXISTS Customer (Customer_ID INTEGER PRIMARY KEY ON CONFLICT ROLLBACK AUTOINCREMENT NOT NULL UNIQUE DEFAULT (1), First_Name VARCHAR (20), Last_Name VARCHAR (20), Phone_Number VARCHAR (50) NOT NULL DEFAULT "(555)555-5555", Address VARCHAR (250), Is_Rewards_Member BOOLEAN);
INSERT INTO Customer (Customer_ID, First_Name, Last_Name, Phone_Number, Address, Is_Rewards_Member) VALUES (1, 'test', NULL, '(555)555-5555', NULL, NULL);
INSERT INTO Customer (Customer_ID, First_Name, Last_Name, Phone_Number, Address, Is_Rewards_Member) VALUES (2, 'John', 'Doe', '555-1234', '123 Main St, Springfield, IL', 1);
INSERT INTO Customer (Customer_ID, First_Name, Last_Name, Phone_Number, Address, Is_Rewards_Member) VALUES (3, 'Jane', 'Smith', '555-5678', '456 Elm St, Lincoln, NE', 0);
INSERT INTO Customer (Customer_ID, First_Name, Last_Name, Phone_Number, Address, Is_Rewards_Member) VALUES (4, 'Alice', 'Johnson', '555-8765', '789 Oak St, Madison, WI', 1);
INSERT INTO Customer (Customer_ID, First_Name, Last_Name, Phone_Number, Address, Is_Rewards_Member) VALUES (5, 'Bob', 'Williams', '555-4321', '101 Pine St, Denver, CO', 0);
INSERT INTO Customer (Customer_ID, First_Name, Last_Name, Phone_Number, Address, Is_Rewards_Member) VALUES (6, 'Emily', 'Davis', '555-2468', '202 Maple St, Austin, TX', 1);

-- Table: Employee
CREATE TABLE IF NOT EXISTS Employee (Employee_ID INTEGER NOT NULL DEFAULT (110) UNIQUE PRIMARY KEY, First_Name VARCHAR (20), Last_Name VARCHAR (20), Employee_Type VARCHAR (20), Salary DOUBLE);
INSERT INTO Employee (Employee_ID, First_Name, Last_Name, Employee_Type, Salary) VALUES (1, 'Lightning', 'McQueen', 'Cashier', 45000.0);
INSERT INTO Employee (Employee_ID, First_Name, Last_Name, Employee_Type, Salary) VALUES (2, 'Shrek', 'Ogreman', 'Cashier', 43000.0);
INSERT INTO Employee (Employee_ID, First_Name, Last_Name, Employee_Type, Salary) VALUES (3, 'Darth', 'Vader', 'Manager', 60000.0);
INSERT INTO Employee (Employee_ID, First_Name, Last_Name, Employee_Type, Salary) VALUES (4, 'SpongeBob', 'Squarepants', 'Sales Associate', 40000.0);
INSERT INTO Employee (Employee_ID, First_Name, Last_Name, Employee_Type, Salary) VALUES (5, 'Tony', 'Stank', 'Cashier', 42000.0);
INSERT INTO Employee (Employee_ID, First_Name, Last_Name, Employee_Type, Salary) VALUES (6, 'Hugh', 'Jazz', 'Cashier', 41000.0);
INSERT INTO Employee (Employee_ID, First_Name, Last_Name, Employee_Type, Salary) VALUES (7, 'Ben', 'Dover', 'Manager', 60000.0);

-- Table: Owner
CREATE TABLE IF NOT EXISTS Owner (Owner_ID INTEGER PRIMARY KEY UNIQUE NOT NULL DEFAULT (101), First_Name VARCHAR (20), Last_Name VARCHAR (20), Salary DOUBLE);

-- Table: Product
CREATE TABLE IF NOT EXISTS Product (Product_ID INTEGER PRIMARY KEY UNIQUE NOT NULL DEFAULT (201), Title VARCHAR (100), Genre VARCHAR (20) NOT NULL DEFAULT Fighting, Platform VARCHAR (7), Price DOUBLE NOT NULL DEFAULT (80.0), Publisher VARCHAR (50), Release_Date DATE DEFAULT (1 - 1 - 2000) NOT NULL, Stock_Quantity INTEGER DEFAULT (0) NOT NULL);
INSERT INTO Product (Product_ID, Title, Genre, Platform, Price, Publisher, Release_Date, Stock_Quantity) VALUES (1, 'The Last of Us Part II', 'Fighting', 'PlayStation 5', 80.0, NULL, -2000, 2);
INSERT INTO Product (Product_ID, Title, Genre, Platform, Price, Publisher, Release_Date, Stock_Quantity) VALUES (2, 'Halo Infinite', 'Fighting', 'Xbox Series X', 80.0, NULL, -2000, 5);
INSERT INTO Product (Product_ID, Title, Genre, Platform, Price, Publisher, Release_Date, Stock_Quantity) VALUES (3, 'Animal Crossing: New Horizons', 'Fighting', 'Nintendo Switch', 80.0, NULL, -2000, 1);
INSERT INTO Product (Product_ID, Title, Genre, Platform, Price, Publisher, Release_Date, Stock_Quantity) VALUES (4, 'Cyberpunk 2077', 'Fighting', 'PC', 80.0, NULL, -2000, 3);
INSERT INTO Product (Product_ID, Title, Genre, Platform, Price, Publisher, Release_Date, Stock_Quantity) VALUES (5, 'God of War Ragnarok', 'Fighting', 'PlayStation 5', 80.0, NULL, -2000, 6);
INSERT INTO Product (Product_ID, Title, Genre, Platform, Price, Publisher, Release_Date, Stock_Quantity) VALUES (6, 'Forza Horizon 5', 'Fighting', 'Xbox Series X', 80.0, NULL, -2000, 2);
INSERT INTO Product (Product_ID, Title, Genre, Platform, Price, Publisher, Release_Date, Stock_Quantity) VALUES (7, 'Super Smash Bros. Ultimate', 'Fighting', 'Nintendo Switch', 80.0, NULL, -2000, 8);

-- Table: Sales
CREATE TABLE IF NOT EXISTS Sales (
    Order_ID INTEGER PRIMARY KEY NOT NULL,
    Product_ID INTEGER NOT NULL,
    Product_Price FLOAT(5,2),
    Cashier_ID INTEGER NOT NULL,
    Customer_ID INTEGER,

    FOREIGN KEY (Product_ID) REFERENCES Product(Product_Id),
    FOREIGN KEY (Cashier_ID) REFERENCES Employee(Employee_Id),
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_Id)
);
INSERT INTO Sales (Order_ID, Product_ID, Product_Price, Cashier_ID, Customer_ID) VALUES (1001, 1, 80.0, 4, 2);
INSERT INTO Sales (Order_ID, Product_ID, Product_Price, Cashier_ID, Customer_ID) VALUES (1002, 1, 80.0, 4, 3);
INSERT INTO Sales (Order_ID, Product_ID, Product_Price, Cashier_ID, Customer_ID) VALUES (1003, 2, 80.0, 4, 2);
INSERT INTO Sales (Order_ID, Product_ID, Product_Price, Cashier_ID, Customer_ID) VALUES (1004, 3, 80.0, 6, 4);
INSERT INTO Sales (Order_ID, Product_ID, Product_Price, Cashier_ID, Customer_ID) VALUES (1005, 5, 80.0, 7, 5);

COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
