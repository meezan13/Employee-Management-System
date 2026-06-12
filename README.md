# Employee Management System (EMS)



## Project Overview
The Employee Management System (EMS) is a web-based application developed using Java Servlets, JSP, JDBC, MySQL, and Apache Tomcat. The system helps administrators manage employee records efficiently while providing employees with access to their personal profiles.
The project implements authentication, employee management, email notifications, validation, and database integration in a user-friendly environment.



## Technologies Used
* Java
* JSP (Java Server Pages)
* Servlets
* JDBC
* MySQL Database
* Apache Tomcat 10
* HTML
* CSS
* JavaMail API
* GitHub



## Features

### Administrator Features
* Secure Login Authentication
* Add New Employee
* Update Employee Details
* Delete Employee Records
* View Employee Records
* Pagination Support
* Employee Sorting
* Email Notifications
* Validation and Error Handling

### Employee Features
* Employee Login
* Employee Dashboard
* View Personal Profile
* Forgot Password Facility
* Account Notifications



## Email Notification System
Automatic email notifications are sent for:
* Employee Account Creation
* Employee Record Update
* Employee Account Deletion
* Forgot Password Requests



## Database Design


### Employees Table

| Field       | Description           |
| ----------- | --------------------- |
| emp_id      | Employee ID           |
| name        | Employee Name         |
| designation | Employee Designation  |
| department  | Employee Department   |
| email       | Employee Email        |
| phone       | Employee Phone Number |
| salary      | Employee Salary       |


### Users Table

| Field    | Description      |
| -------- | ---------------- |
| username | Login Username   |
| password | Login Password   |
| role     | Admin / Employee |



## Validation Implemented
* Duplicate email prevention
* Employee ID validation
* Login validation
* Required field validation
* Error handling using custom message page
* Employee update restrictions



## Project Modules

### Authentication Module
* Login
* Logout
* Forgot Password

### Employee Management Module
* Add Employee
* Update Employee
* Delete Employee
* View Employees

### Employee Self-Service Module
* Employee Dashboard
* My Profile



## Deployment
The project is deployed using:
* Apache Tomcat Server
* WAR File Deployment



## How To Run

1. Install Java JDK
2. Install Apache Tomcat 10
3. Install MySQL
4. Create the database using the provided SQL file
5. Configure database credentials
6. Configure EmailUtility credentials
7. Deploy EMS.war into Tomcat webapps folder
8. Start Tomcat Server
9. Open: http://localhost:8080/EMS/login.jsp



## Project Highlights
* Role-Based Access Control
* Email Notification Integration
* MySQL Database Connectivity
* Pagination and Sorting
* Professional User Interface
* Secure Authentication
* WAR Deployment Ready



## Developed By
**Meezan Ahmed**
