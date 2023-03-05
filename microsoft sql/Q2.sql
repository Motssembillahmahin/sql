----Task-6----
CREATE DATABASE PUST;
USE PUST
----Task-7----
CREATE TABLE CustomerAndSuppliers(
cusl_id CHAR(6) PRIMARY KEY CHECK(cusl_id LIKE'[C][0-9][0-9][0-9][0-9][0-9]'),
cusl_fname CHAR(15) NOT NULL,
cusl_lname CHAR(15),
cusl_address TEXT,
cusl_telno CHAR(12) CHECK(cusl_telno LIKE'[0][1][3-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
cusl_city CHAR(12) DEFAULT 'Pabna',
sales_amnt MONEY CHECK(sales_amnt>=0),
proc_amnt MONEY CHECK(proc_amnt>=0)
);


INSERT CustomerAndSuppliers
(cusl_id,cusl_fname,cusl_lname,cusl_address,cusl_telno,cusl_city,sales_amnt,proc_amnt) VALUES
('C00002','Robiul','Hossain','221/B Dhanmondi','01714775107','Dhaka',150,500)

SELECT * FROM CustomerAndSuppliers

CREATE TABLE Items(
item_id CHAR(6) PRIMARY KEY CHECK(item_id LIKE'[P][0-9][0-9][0-9][0-9][0-9]'),
item_name CHAR(12),
item_category CHAR(10),
item_price FLOAT(12) CHECK(item_price>=0),
item_quantity INT CHECK(item_quantity>=0),
item_last_sold DATE DEFAULT GETDATE()
);


INSERT items
(item_id,item_name,item_category,item_price,item_quantity) VALUES
('P00006','Monitor','Mechanical','10000','20')


SELECT *FROM Items;


CREATE TABLE Transactions(
tran_id CHAR(10) PRIMARY KEY CHECK(tran_id LIKE'[T][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
item_id CHAR(6) FOREIGN KEY(item_id) REFERENCES Items(item_id),
cusl_id CHAR(6) FOREIGN KEY(cusl_id) REFERENCES CustomerAndSuppliers(cusl_id),
tran_type CHAR(1) CHECK(tran_type = 'S' OR tran_type = 'O'),
tran_quantity INT CHECK(tran_quantity>=0),
tran_date DATETIME NOT NULL DEFAULT GETDATE()
);

INSERT Transactions
(tran_id,item_id,cusl_id,tran_type,tran_quantity) VALUES('T000000001','P00006','C00002','S',5000)

SELECT * FROM Transactions
