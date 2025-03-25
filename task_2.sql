-- -- Ensure we are using the correct database
-- USE alx_book_store;

-- -- Create the authors table
-- CREATE TABLE IF NOT EXISTS Authors (
--     author_id INT AUTO_INCREMENT PRIMARY KEY,
--     author_name VARCHAR(215) NOT NULL
-- );

-- -- Create the books table
-- CREATE TABLE IF NOT EXISTS Books (
--     book_id INT AUTO_INCREMENT PRIMARY KEY,
--     title VARCHAR(130) NOT NULL,
--     author_id INT,
--     price DOUBLE NOT NULL,
--     publication_date DATE,
--     FOREIGN KEY (author_id) REFERENCES authors(author_id) ON DELETE SET NULL
-- );

-- -- Create the customers table
-- CREATE TABLE IF NOT EXISTS Customers (
--     customer_id INT AUTO_INCREMENT PRIMARY KEY,
--     customer_name VARCHAR(215) NOT NULL,
--     email VARCHAR(215) UNIQUE NOT NULL,
--     address TEXT NOT NULL
-- );

-- -- Create the orders table
-- CREATE TABLE IF NOT EXISTS Orders (
--     order_id INT AUTO_INCREMENT PRIMARY KEY,
--     customer_id INT NOT NULL,
--     order_date DATE NOT NULL,
--     FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE
-- );

-- -- Create the order_details table
-- CREATE TABLE IF NOT EXISTS order_details (
--     orderdetail_id INT AUTO_INCREMENT PRIMARY KEY,
--     order_id INT NOT NULL,
--     book_id INT NOT NULL,
--     quantity DOUBLE NOT NULL CHECK (quantity > 0),
--     FOREIGN KEY (order_id) REFERENCES orders(order_id) ON DELETE CASCADE,
--     FOREIGN KEY (book_id) REFERENCES books(book_id) ON DELETE CASCADE
-- );


-- Ensure the database exists
CREATE DATABASE IF NOT EXISTS alx_book_store;
USE alx_book_store;

-- Creating Authors table
CREATE TABLE IF NOT EXISTS Authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    author_name VARCHAR(215) NOT NULL
);

-- Creating Books table
CREATE TABLE IF NOT EXISTS Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(130) NOT NULL,
    author_id INT NOT NULL,
    price DOUBLE NOT NULL,
    publication_date DATE,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id) ON DELETE CASCADE
);

-- Creating Customers table
CREATE TABLE IF NOT EXISTS Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(215) NOT NULL,
    email VARCHAR(215) UNIQUE NOT NULL,
    address TEXT NOT NULL
);

-- Creating Orders table (Fixed missing foreign key for customer_id)
CREATE TABLE IF NOT EXISTS Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id) ON DELETE CASCADE
);

-- Creating Order_Details table
CREATE TABLE IF NOT EXISTS Order_Details (
    orderdetailid INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    book_id INT NOT NULL,
    quantity DOUBLE NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id) ON DELETE CASCADE,
    FOREIGN KEY (book_id) REFERENCES Books(book_id) ON DELETE CASCADE
);
