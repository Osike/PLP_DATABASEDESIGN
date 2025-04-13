-- Create a user for general book queries
CREATE USER 'bookstore_user'@'%' IDENTIFIED BY '12345678NAOMI'; -- So onthis line we have made Naomi to be the bookstore user
GRANT SELECT ON bookstore_db.book TO 'bookstore_user'@'%';
GRANT SELECT ON bookstore_db.author TO 'bookstore_user'@'%';

-- Create a user for order management
CREATE USER 'order_manager'@'localhost' IDENTIFIED BY '12345678WAYNE'; -- So onthis line we have made Wayne to be the order manger
GRANT SELECT, INSERT, UPDATE ON bookstore_db.cust_order TO 'order_manager'@'localhost';
GRANT SELECT, INSERT, UPDATE ON bookstore_db.order_line TO 'order_manager'@'localhost';

-- Create a user for administrative tasks
CREATE USER 'bookstore_admin'@'localhost' IDENTIFIED BY '12345678SHAD'; -- So onthis line we have made Shadrack to be the admin
GRANT ALL PRIVILEGES ON bookstore_db.* TO 'bookstore_admin'@'localhost';


-- This SQL script creates a database schema for a bookstore application, including tables for books, authors, customers, orders, and more.
-- Table: book
CREATE DATABASE bookstore;
USE bookstore;
    CREATE TABLE book (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    isbn VARCHAR(20) NOT NULL UNIQUE,
    language_id INT,
    publisher_id INT,
    publication_date DATE,
    price DECIMAL(10, 2) NOT NULL,
    stock_quantity INT NOT NULL,
    FOREIGN KEY (language_id) REFERENCES book_language(language_id),
    FOREIGN KEY (publisher_id) REFERENCES publisher(publisher_id)
);
-- Create the author table
CREATE TABLE author (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    birthdate DATE,
    biography TEXT
);

-- Create the book_author table (for the many-to-many relationship between books and authors)
CREATE TABLE book_author (
    book_id INT,
    author_id INT,
    PRIMARY KEY (book_id, author_id),
    FOREIGN KEY (book_id) REFERENCES book(book_id),
    FOREIGN KEY (author_id) REFERENCES author(author_id)
);
-- Create the publisher table
CREATE TABLE publisher (
    publisher_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    address VARCHAR(255),
    phone VARCHAR(20)
);
-- Creating table book_language
-- This table stores the languages in which books are available
CREATE TABLE book_language (
	language_id INT PRIMARY KEY AUTO_INCREMENT ,
    language VARCHAR (100)
    
);

-- Create Country Table
CREATE TABLE Country (
  countryID INT PRIMARY KEY,
  countryName VARCHAR(50)
);

-- Insert into Country
INSERT INTO Country (countryID, countryName) VALUES
(1, 'Kenya'),
(2, 'Nigeria'),
(3, 'Ghana'),
(4, 'South Africa'),
(5, 'Botswana'),
(6, 'Namibia'),
(7, 'Uganda');

-- Create AddressStatus Table
CREATE TABLE AddressStatus (
  statusID INT PRIMARY KEY,
  statusName VARCHAR(50)
);

-- Insert into AddressStatus
INSERT INTO AddressStatus (statusID, statusName) VALUES
(1, 'Current'),
(2, 'Old');

-- Create Customers Table
CREATE TABLE Customers (
  customerID INT PRIMARY KEY,
  firstName VARCHAR(100),
  lastName VARCHAR(100),
  customerPhone VARCHAR(20),
  customerEmail VARCHAR(100)
);

-- Insert into Customers 
INSERT INTO Customers (customerID, firstName, lastName, customerPhone, customerEmail) VALUES
(1, 'Grace', 'Ncube', '+254791161779', 'gracencube@gmail.com'),
(2, 'John', 'Okonkwo', '+254732061268', 'johnokonkwo@gmail.com'),
(3, 'Mary', 'Mensah', '+254733769789', 'marymensah@gmail.com'),
(4, 'Peter', 'Botha', '+254740169085', 'peterbotha@gmail.com'),
(5, 'Susan', 'Sechele', '+254768394206', 'susansechele@gmail.com'),
(6, 'James', 'Abiola', '+254763141614', 'jamesabiola@gmail.com'),
(7, 'Alice', 'Chilufya', '+254715735365', 'alicechilufya@gmail.com'),
(8, 'David', 'Matemba', '+254734272688', 'davidmatemba@gmail.com'),
(9, 'Nancy', 'Tshabalala', '+254717473634', 'nancytshabalala@gmail.com'),
(10, 'Paul', 'Adu', '+254723006174', 'pauladu@gmail.com'),
(11, 'Faith', 'Molefe', '+254793352494', 'faithmolefe@gmail.com'),
(12, 'Brian', 'Anyango', '+254720107415', 'briananyango@gmail.com'),
(13, 'Esther', 'Abebe', '+254726513862', 'estherabebe@gmail.com'),
(14, 'Samuel', 'Mugisha', '+254712661657', 'samuelmugisha@gmail.com'),
(15, 'Lilian', 'Mutale', '+254772830106', 'lilianmutale@gmail.com'),
(16, 'George', 'Makonnen', '+254716217970', 'georgemakonnen@gmail.com'),
(17, 'Mercy', 'Ndhlovu', '+254717517056', 'mercyndhlovu@gmail.com'),
(18, 'Kevin', 'Ngwenya', '+254779700645', 'kevinngwenya@gmail.com'),
(19, 'Brenda', 'Onyango', '+254756563837', 'brendaonyango@gmail.com'),
(20, 'Charles', 'Mulenga', '+254782512870', 'charlesmulenga@gmail.com'),
(21, 'Victor', 'Achieng', '+254726224505', 'victorachieng@gmail.com'),
(22, 'Ann', 'Kagiso', '+254720321225', 'annkagiso@gmail.com'),
(23, 'Daniel', 'Maponya', '+254711813608', 'danielmaponya@gmail.com'),
(24, 'Rose', 'Musonda', '+254737755846', 'rosemusonda@gmail.com'),
(25, 'Joseph', 'Ofori', '+254743460214', 'josephofori@gmail.com'),
(26, 'Emily', 'Tadesse', '+254735303940', 'emilytadesse@gmail.com'),
(27, 'Kennedy', 'Chikwe', '+254728456699', 'kennedychikwe@gmail.com'),
(28, 'Cynthia', 'Acheampong', '+254716906263', 'cynthiaacheampong@gmail.com'),
(29, 'Elijah', 'Moyo', '+254745474445', 'elijahmoyo@gmail.com'),
(30, 'Agnes', 'Mpofu', '+254795666382', 'agnesmpofu@gmail.com'),
(31, 'Michael', 'Ajayi', '+254731639292', 'michaelajayi@gmail.com'),
(32, 'Ruth', 'Chirwa', '+254714192483', 'ruthchirwa@gmail.com'),
(33, 'Edwin', 'Bekele', '+254761104531', 'edwinbekele@gmail.com'),
(34, 'Lucy', 'Thwala', '+254742542971', 'lucythwala@gmail.com'),
(35, 'Martin', 'Mutombo', '+254754059679', 'martinmutombo@gmail.com'),
(36, 'Janet', 'Ncube', '+254729460699', 'janetncube@gmail.com'),
(37, 'Stephen', 'Tambo', '+254758402980', 'stephentambo@gmail.com'),
(38, 'Carol', 'Maseko', '+254743365554', 'carolmaseko@gmail.com'),
(39, 'Eric', 'Nkosi', '+254778635325', 'ericnkosi@gmail.com'),
(40, 'Jane', 'Gondwe', '+254747919526', 'janegondwe@gmail.com'),
(41, 'Anthony', 'Adesina', '+254725774984', 'anthonyadesina@gmail.com'),
(42, 'Dorothy', 'Kalema', '+254714620806', 'dorothykalema@gmail.com'),
(43, 'Benjamin', 'Owusu', '+254739372347', 'benjaminowusu@gmail.com'),
(44, 'Beatrice', 'Mbatha', '+254754759330', 'beatricembatha@gmail.com'),
(45, 'Nicholas', 'Zuma', '+254753522378', 'nicholaszuma@gmail.com'),
(46, 'Florence', 'Nkandu', '+254747119840', 'florencenkandu@gmail.com'),
(47, 'Patrick', 'Okeke', '+254773424468', 'patrickokeke@gmail.com'),
(48, 'Irene', 'Sibanda', '+254776403994', 'irenesibanda@gmail.com'),
(49, 'Simon', 'Makhosi', '+254744294867', 'simonmakhosi@gmail.com'),
(50, 'Hannah', 'Ngugi', '+254790203536', 'hannahngugi@gmail.com');

-- Create Address Table
CREATE TABLE Address (
  addressID INT PRIMARY KEY,
  city VARCHAR(100),
  street VARCHAR(100),
  streetName VARCHAR(100),
  countryID INT,
  statusID INT,
  FOREIGN KEY (countryID) REFERENCES Country(countryID),
  FOREIGN KEY (statusID) REFERENCES AddressStatus(statusID)
);

-- Insert into Address
INSERT INTO Address (addressID, city, street, streetName, countryID, statusID) VALUES
(1, 'Nairobi', 'Hilltop Rd', '12 Hilltop Rd', 1, 1),
(2, 'Kampala', 'Maple Ave', '5 Maple Ave', 7, 2),
(3, 'Accra', 'Main St', '89 Main St', 3, 1),
(4, 'Lagos', 'Broadway', '77 Broadway', 2, 1),
(5, 'Cape Town', 'Second Ave', '301 Second Ave', 4, 2),
(6, 'Windhoek', 'Oak Lane', '44 Oak Lane', 6, 2),
(7, 'Nairobi', 'Main St', '19 Main St', 1, 2),
(8, 'Kampala', 'Victoria Rd', '333 Victoria Rd', 7, 1),
(9, 'Accra', 'Broadway', '56 Broadway', 3, 2),
(10, 'Lagos', 'Maple St', '123 Maple St', 2, 1),
(11, 'Cape Town', 'Hilltop Rd', '711 Hilltop Rd', 4, 2),
(12, 'Windhoek', 'Second Ave', '64 Second Ave', 6, 1),
(13, 'Nairobi', 'Oak Lane', '90 Oak Lane', 1, 1),
(14, 'Kampala', 'Main St', '213 Main St', 7, 1),
(15, 'Accra', 'Second Ave', '71 Second Ave', 3, 2),
(16, 'Lagos', 'Victoria Rd', '29 Victoria Rd', 2, 1),
(17, 'Cape Town', 'Maple St', '82 Maple St', 4, 2),
(18, 'Windhoek', 'Broadway', '104 Broadway', 6, 1),
(19, 'Gaborone', 'Main St', '305 Main St', 5, 1),
(20, 'Gaborone', 'Second Ave', '506 Second Ave', 5, 2),
(21, 'Nairobi', 'Park St', '201 Park St', 1, 2),
(22, 'Kampala', 'Forest Ln', '402 Forest Ln', 7, 1),
(23, 'Accra', 'River Rd', '18 River Rd', 3, 1),
(24, 'Lagos', 'Hilltop Rd', '409 Hilltop Rd', 2, 2),
(25, 'Cape Town', 'Palm Dr', '820 Palm Dr', 4, 1),
(26, 'Windhoek', 'Spring St', '714 Spring St', 6, 1),
(27, 'Nairobi', 'Grove Ln', '11 Grove Ln', 1, 1),
(28, 'Kampala', 'Second Ave', '390 Second Ave', 7, 2),
(29, 'Accra', 'Main St', '56 Main St', 3, 1),
(30, 'Lagos', 'Broadway', '308 Broadway', 2, 1),
(31, 'Cape Town', 'Hilltop Dr', '99 Hilltop Dr', 4, 1),
(32, 'Windhoek', 'Victoria Rd', '250 Victoria Rd', 6, 2),
(33, 'Gaborone', 'Maple St', '410 Maple St', 5, 1),
(34, 'Gaborone', 'Broadway', '899 Broadway', 5, 2),
(35, 'Nairobi', 'Main St', '98 Main St', 1, 2),
(36, 'Kampala', 'Broadway', '502 Broadway', 7, 2),
(37, 'Accra', 'Second Ave', '633 Second Ave', 3, 1),
(38, 'Lagos', 'Oak Lane', '39 Oak Lane', 2, 1),
(39, 'Cape Town', 'Victoria Rd', '470 Victoria Rd', 4, 2),
(40, 'Windhoek', 'Main St', '911 Main St', 6, 2),
(41, 'Nairobi', 'Hilltop Rd', '74 Hilltop Rd', 1, 1),
(42, 'Kampala', 'Maple St', '65 Maple St', 7, 2),
(43, 'Accra', 'Park Ave', '188 Park Ave', 3, 1),
(44, 'Lagos', 'Forest Ln', '20 Forest Ln', 2, 1),
(45, 'Cape Town', 'Main St', '455 Main St', 4, 2),
(46, 'Windhoek', 'Hilltop Dr', '162 Hilltop Dr', 6, 1),
(47, 'Gaborone', 'Second Ave', '377 Second Ave', 5, 2),
(48, 'Gaborone', 'Victoria Rd', '890 Victoria Rd', 5, 1),
(49, 'Kampala', 'Oak Lane', '43 Oak Lane', 7, 2),
(50, 'Accra', 'Broadway', '512 Broadway', 3, 2),
(51, 'Lagos', 'Palm Dr', '273 Palm Dr', 2, 1),
(52, 'Nairobi', 'Spring St', '688 Spring St', 1, 1),
(53, 'Cape Town', 'Forest Ln', '741 Forest Ln', 4, 1),
(54, 'Gaborone', 'Spring St', '821 Spring St', 5, 1),
(55, 'Kampala', 'Lakeview Rd', '225 Lakeview Rd', 7, 1),
(56, 'Accra', 'Palm Dr', '940 Palm Dr', 3, 2),
(57, 'Lagos', 'River Rd', '303 River Rd', 2, 2),
(58, 'Cape Town', 'Oak Lane', '603 Oak Lane', 4, 2),
(59, 'Windhoek', 'Park St', '812 Park St', 6, 2),
(60, 'Nairobi', 'Spring St', '118 Spring St', 1, 1),
(61, 'Kampala', 'Main St', '614 Main St', 7, 1),
(62, 'Accra', 'Maple St', '270 Maple St', 3, 1),
(63, 'Lagos', 'Hilltop Rd', '459 Hilltop Rd', 2, 2),
(64, 'Cape Town', 'Broadway', '371 Broadway', 4, 1),
(65, 'Windhoek', 'Victoria Rd', '920 Victoria Rd', 6, 2),
(66, 'Gaborone', 'Main St', '615 Main St', 5, 2),
(67, 'Nairobi', 'Grove Ln', '118 Grove Ln', 1, 1),
(68, 'Kampala', 'Palm Dr', '303 Palm Dr', 7, 2),
(69, 'Accra', 'Oak Lane', '887 Oak Lane', 3, 1),
(70, 'Lagos', 'Forest Ln', '121 Forest Ln', 2, 1),
(71, 'Cape Town', 'River Rd', '564 River Rd', 4, 2),
(72, 'Windhoek', 'Hilltop Dr', '450 Hilltop Dr', 6, 1),
(73, 'Gaborone', 'Second Ave', '234 Second Ave', 5, 1),
(74, 'Nairobi', 'Maple St', '444 Maple St', 1, 2),
(75, 'Kampala', 'Hilltop Dr', '301 Hilltop Dr', 7, 1),
(76, 'Accra', 'Park Ave', '308 Park Ave', 3, 2),
(77, 'Lagos', 'Palm Dr', '110 Palm Dr', 2, 1),
(78, 'Cape Town', 'Oak Lane', '993 Oak Lane', 4, 1),
(79, 'Windhoek', 'Broadway', '471 Broadway', 6, 2);

-- Create CustomerAddress Table
CREATE TABLE CustomerAddress (
  customerID INT,
  addressID INT,
  FOREIGN KEY (customerID) REFERENCES Customers(customerID),
  FOREIGN KEY (addressID) REFERENCES Address(addressID)
);

-- Insert into CustomerAddress
INSERT INTO CustomerAddress (customerID, addressID) VALUES
(5, 10), 
(5, 44),
(12, 2),
(12, 59), 
(36, 4), 
(36, 25), 
(36, 55),
(1, 20), 
(1, 5),
(2, 6), 
(2, 22),
(3, 43), 
(3, 29),
(4, 1), 
(4, 46),
(6, 13), 
(6, 64),
(7, 33), 
(7, 77),
(8, 41), 
(8, 18),
(9, 17), 
(9, 9),
(10, 7), 
(10, 40),
(11, 12), 
(11, 58),
(13, 2), 
(13, 60),
(14, 18), 
(14, 35),
(15, 26), 
(15, 38),
(16, 4), 
(16, 27),
(17, 25), 
(17, 62),
(18, 14), 
(18, 32),
(19, 36), 
(19, 54),
(20, 31), 
(20, 71),
(21, 39),
(22, 42),
(23, 3),
(24, 10),
(25, 24),
(26, 30),
(27, 32),
(28, 15),
(29, 40),
(30, 8),
(31, 35),
(32, 11),
(33, 45),
(34, 19),
(35, 23),
(37, 50),
(38, 47),
(39, 49),
(40, 37),
(41, 53),
(42, 52),
(43, 51),
(44, 26),
(45, 31),
(46, 34),
(47, 6),
(48, 1),
(49, 22),
(50, 9);



-- Table: shipping_method 
-- List of all available shipping methods (e.g., Express, Standard)
CREATE TABLE shipping_method (
    shipping_method_id INT AUTO_INCREMENT PRIMARY KEY,
    method_name VARCHAR(100) NOT NULL
);

-- Table: order_status
-- List of all possible statuses (e.g., Pending, Delivered, Cancelled)
CREATE TABLE order_status (
    order_status_id INT AUTO_INCREMENT PRIMARY KEY,
    status_name VARCHAR(50) NOT NULL
);

-- Table: cust_order
-- Stores each order placed by a customer, including shipping method, status, and total amount
CREATE TABLE cust_order (
    order_id INT AUTO_INCREMENT PRIMARY KEY,                
    customer_id INT NOT NULL,                               
    order_date DATE NOT NULL,                               
    shipping_method_id INT NOT NULL,                        
    order_status_id INT NOT NULL,                           
    total_amount DECIMAL(10,2) NOT NULL,                   

    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (shipping_method_id) REFERENCES shipping_method(shipping_method_id),
    FOREIGN KEY (order_status_id) REFERENCES order_status(order_status_id)
);

-- Table: order_line
-- Contains line items for each order, showing which books were purchased, how many, and at what price
 CREATE TABLE order_line (
    order_line_id INT AUTO_INCREMENT PRIMARY KEY,           
    order_id INT NOT NULL,                                 
    book_id INT NOT NULL,                                   
    quantity INT NOT NULL CHECK (quantity > 0),             
    price DECIMAL(10, 2) NOT NULL,                          

    FOREIGN KEY (order_id) REFERENCES cust_order(order_id),
    FOREIGN KEY (book_id) REFERENCES book(book_id)
);

-- Table: shipping_method 
-- List of all shipping methods available
CREATE TABLE shipping_method (
    shipping_method_id INT AUTO_INCREMENT PRIMARY KEY,
    method_name VARCHAR(100) NOT NULL
);

-- Table: order_history
-- Tracks status changes for each order (order history)
CREATE TABLE order_history (
    history_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    status_id INT NOT NULL,
    history_date DATE NOT NULL,
    FOREIGN KEY (order_id) REFERENCES cust_order(order_id),
    FOREIGN KEY (status_id) REFERENCES order_status(order_status_id)
);

-- Table: order_status
-- List of all possible statuses (e.g., Pending, Delivered, Cancelled)
CREATE TABLE order_status (
    order_status_id INT AUTO_INCREMENT PRIMARY KEY,
    status_name VARCHAR(50) NOT NULL
);

