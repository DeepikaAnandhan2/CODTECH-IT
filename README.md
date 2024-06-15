##### NAME: DEEPIKA A
##### COMPANY: CODTECH IT SOLUTIONS
##### ID: CT08DS1842
##### DOMAIN: SQL
##### DURATION: 10Th JUNE 2024 to 10Th JULY 2024
##### MENTOR: MUZAMMIL
## OVERVIEW OF THE PROJECT
### PROJECT: ONLINE RETAIL STORE DATABASE
![image](https://github.com/DeepikaAnandhan2/CODTECH-IT/assets/145033159/7b9de270-48a1-4d55-9f0f-7f20e66ec3fa)



### OBJECTIVE: 
The objective of this project is to develop a database for an online retail store, including products, customers, orders,
and payments. This project involves more complex queries and database design.
Designing tables for products, customers, orders, and payments using SQL queries to
handle customer orders and payment processing.
### KEY ACTIVITIES:
#### Product Management:
Adding new products available for rent,
Updating product details and availability,
Viewing product inventory.
#### Customer Management:
Registering new customers, 
Updating customer details,
Viewing customer information.
#### Rental Order Management:
Placing new rental orders,
Tracking rental periods,
Managing returns and updating product availability,
Viewing order history.
#### Payment Management:
Processing payments for rental orders,
Managing payment status,
Viewing payment history.
#### Reporting and Queries:
Generating reports on rentals, customers, and payments.
Querying data for insights and decision-making.
### TECHNOLOGIES USED:
#### Database Management System:
**MySQL**: This will be the core database engine for storing and managing your data.
#### Database Management Tool:
**MySQL Workbench**: A unified visual tool for database architects, developers, and DBAs. It provides data modeling, SQL development, and comprehensive administration tools for server configuration, user administration, backup, and more.
### KEY INSIGHTS:
#### 1. Data Integrity and Relationships
Primary and Foreign Keys: Ensure each table has a primary key for unique identification and foreign keys to maintain referential integrity. For example, CustomerID in RentalOrders links to the Customers table, ensuring every order is associated with a valid customer.
Consistency: Use constraints to enforce data consistency. For example, the Stock in the Products table should not be negative, and TotalAmount in RentalOrders should reflect the sum of rental prices.
#### 2. Efficient Data Retrieval
Indexing: Create indexes on columns frequently used in WHERE clauses or JOIN conditions to speed up query performance. For example, indexing ProductID, CustomerID, and OrderID can improve lookup times.
Normalization: Normalize tables to reduce redundancy and improve data integrity. For example, separate product details and rental details into different tables to avoid data duplication.
#### 3. Handling Transactions
#### 4. Scalability and Performance
#### 5. Security



