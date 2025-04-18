# Bookstore Database Project - Documentation

## Overview

This document describes the MySQL database we designed and implemented for the Bookstore project. The database is designed to store and manage data related to the bookstore's operations, including books, authors, customers, and orders.

## Tools and Technologies

* MySQL
* Draw.io (for initial schema design)

## Database Design

The database consists of the following tables:

* **book:** Stores information about books (e.g., title, ISBN, publication date).
* **book\_author:** A junction table representing the many-to-many relationship between books and authors.
* **author:** Stores information about authors (e.g., name, biography).
* **book\_language:** Stores the languages of the books
* **publisher:** Stores information about book publishers.
* **Customer:** Stores information about customers (e.g., name, contact information).
* **customer\_address:** Stores multiple addresses for each customer.
* **address\_status:** Stores the status of an address.
* **address:** Stores address information.
* **country:** Stores countries information.
* **cust\_order:** Stores customer order information.
* **order\_line:** Stores the books included in each order.
* **shipping\_method:** Stores the shipping methods.
* **order\_history:** Stores the history of each order.
* **order\_status:** Stores the order statuses.

### Schema Diagram
[DATABASE DESIGN](design.png)  

## Implementation

The database was implemented using MySQL. The following SQL scripts were used:

* **Create Tables:** 
* **Data Loading:** 
* **User Management:** 
## Queries

The following queries demonstrate how to retrieve and analyze data from the database:

* [   For example:
    * "List all books published by 'Publisher A':"  `SELECT * FROM book WHERE publisher_id = (SELECT id FROM publisher WHERE name = 'Publisher A');`
    * "Find all orders placed by a specific customer:"  `SELECT * FROM cust_order WHERE customer_id = (SELECT id FROM Customer WHERE name = 'John Doe');`
    * "Show the order history for order #123": `SELECT * FROM order_history WHERE order_id = 123;`
    ]

## Conclusion

This project successfully implemented a MySQL database for a bookstore, demonstrating the ability to design a relational database, create tables, populate them with data, manage user access, and query the database for information retrieval.
