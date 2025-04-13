
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
