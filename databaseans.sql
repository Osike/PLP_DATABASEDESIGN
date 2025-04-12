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
