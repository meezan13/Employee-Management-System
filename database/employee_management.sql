CREATE DATABASE employee_management;

USE employee_management;

CREATE TABLE users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(50) NOT NULL,
    role VARCHAR(20) NOT NULL
);

CREATE TABLE employees (
    emp_id VARCHAR(10) PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    department VARCHAR(50) NOT NULL,
    salary DECIMAL(10,2) NOT NULL,
    email VARCHAR(100) NOT NULL,
    phone VARCHAR(15) NOT NULL
);

INSERT INTO users(username,password,role)
VALUES
('admin','admin123','Admin');