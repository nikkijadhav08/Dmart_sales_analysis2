-- lab 1
-------------------------------------------------------------------
create database BankingDB;
use BankingDB;

create Table Customers(
CustomerID INT PRIMARY KEY,
Firstname VARCHAR(50),
Lastname VARCHAR(50),
Email VARCHAR(100),
Phone VARCHAR(15),
AccountCreations date
);

describe Customers;

---------------------------------------------------------------------
-- Lab 2
-----------------------------------------------------------------------
create table Accounts (
AccountID int,
AccountType varchar(20),
Balance Decimal(10,2)
);

create table Transactions (
TransactionID int,
TransactionDate Date,
Amount Decimal(10,2),
TransactionType varchar(20)
);


CREATE TABLE Branches (
    BranchID INT,
    BranchName VARCHAR(100),
    BranchAddress VARCHAR(200),
    BranchPhone VARCHAR(15)
);

CREATE TABLE AccountBranches ( 
		AssignmentDate DATE
);

CREATE TABLE Loans (
    LoanID INT,
    LoanAmount DECIMAL(10,2),
    InterestRate DECIMAL(5,2),
    StartDate DATE,
    EndDate DATE
);


ALTER TABLE Customers
ADD DateOfBirth DATE;

ALTER TABLE Customers
MODIFY Phone VARCHAR(20);

ALTER TABLE Accounts
ADD CONSTRAINT chk_MinBalance
CHECK (Balance >= 1000);

show create table accounts;

DROP TABLE AccountBranches;

ALTER TABLE Accounts
ADD CustomerID INT;

ALTER TABLE Customers
ADD PRIMARY KEY (CustomerID);

ALTER TABLE Accounts
ADD CONSTRAINT FK_Accounts_Customers
FOREIGN KEY (CustomerID)
REFERENCES Customers(CustomerID);


ALTER TABLE Customers
MODIFY FirstName VARCHAR(50) NOT NULL;

ALTER TABLE Customers
ADD CONSTRAINT uq_Email UNIQUE (Email);

ALTER TABLE Accounts
Add BranchID int;

ALTER TABLE Branches
ADD PRIMARY KEY (BranchID);


ALTER TABLE Accounts
ADD CONSTRAINT FK_Accounts_Branch
FOREIGN KEY (BranchID)
REFERENCES Branches(BranchID);

select * from Accounts;

-- Accounts → Connect with Branches
-- Add a foreign key on BranchID that references Branches(BranchID).
alter table Branches add primary key(BranchID);
alter table Accounts add BranchID int;
ALTER TABLE Accounts
ADD CONSTRAINT FK_Accounts_Branches
FOREIGN KEY (BranchID)
REFERENCES Branches(BranchID);

-- Transactions → Connect with Accounts
-- Add a foreign key on AccountID that references Accounts(AccountID).
alter table Accounts add primary key(AccountID);
alter table Transactions add AccountID int;
ALTER TABLE Transactions
ADD CONSTRAINT FK_Transactions_Accounts
FOREIGN KEY (AccountID)
REFERENCES Accounts(AccountID);

-- Loans → Connect with Customers
--  a foreign key on CustomerID that references Customers(CustomerID).
-- Add a foreign key on AccountID that references Accounts(AccountID).
alter table Loans add CustomerID int;
ALTER TABLE Loans
ADD CONSTRAINT FK_Loans_Customers
FOREIGN KEY (CustomerID)
REFERENCES Customers(CustomerID);







-------------------------------------------------
 -- LAB 1 
-- -----------------------------------------------

create database BankingDB;

use BankingDB;

create table customers (
CustomerID int primary key, 
Firstname Varchar  (50),
Lastname varchar (50),
Email varchar (100),
Phone varchar (15), 
AccountCreations date 
);

describe Customers;

-- --------------------------------------------------
-- LAB 2 
-- ---------------------------------------------------

CREATE TABLE Accounts (
    AccountID INT,
    AccountType VARCHAR(20),
    Balance DECIMAL(10,2)
);

CREATE TABLE Transactions (
    TransactionID INT,
    TransactionDate DATE,
    Amount DECIMAL(10,2),
    TransactionType VARCHAR(20)
);

CREATE TABLE Branches (
    BranchID INT,
    BranchName VARCHAR(100),
    BranchAddress VARCHAR(200),
    BranchPhone VARCHAR(15)
);

CREATE TABLE AccountBranches ( 
		AssignmentDate DATE
);

CREATE TABLE Loans (
    LoanID INT,
    LoanAmount DECIMAL(10,2),
    InterestRate DECIMAL(5,2),
    StartDate DATE,
    EndDate DATE
);

-- added dateofbirth column to customers table
ALTER TABLE Customers ADD COLUMN  DateOfBirth DATE;
describe customers;

-- modify existing column 
alter table Customers modify phone varchar (20);

--  Constraints can also be added using ALTER to enforce business rules.
-- Adding a minimum balance rule to the Accounts table.
alter table Accounts add constraint chk_MinBalance
check (Balance >= 1000);

show create table accounts;

-- use  drop for deleting the table AccountBranches 
drop table AccountBranches;

-- Apply constraint for banking data

-- Apply pk to customers id

-- add customerID column in accounts table 
alter table Accounts add customerID int;

-- Connect Customers and Accounts table using FK
alter table Accounts 
add constraint fk_Accounts_Customers
foreign key(CustomerID)
references Customers(CustomerID);

-- apply not null to firstname ccolumn in Customers table 
alter table Customers modify FirstName varchar(50) Not Null;

-- apply unique constraint to get unique customer email
alter table Customers
 add constraint uq_Email unique (Email);
 
 -- Activity 
 
-- Accounts → Connect with Branches
-- Add a foreign key on BranchID that references Branches(BranchID).
alter table Branches add primary key(BranchID);
alter table Accounts add BranchID int;
ALTER TABLE Accounts
ADD CONSTRAINT FK_Accounts_Branches
FOREIGN KEY (BranchID)
REFERENCES Branches(BranchID);

-- Transactions → Connect with Accounts
-- Add a foreign key on AccountID that references Accounts(AccountID).
alter table Accounts add primary key(AccountID);
alter table Transactions add AccountID int;
ALTER TABLE Transactions
ADD CONSTRAINT FK_Transactions_Accounts
FOREIGN KEY (AccountID)
REFERENCES Accounts(AccountID);

-- Loans → Connect with Customers
--  a foreign key on CustomerID that references Customers(CustomerID).
-- Add a foreign key on AccountID that references Accounts(AccountID).
alter table Loans add CustomerID int;
ALTER TABLE Loans
ADD CONSTRAINT FK_Loans_Customers
FOREIGN KEY (CustomerID)
REFERENCES Customers(CustomerID);

describe Branches;
describe Accounts;
describe Loans;
describe Customers;

INSERT INTO Customers
(CustomerID, FirstName, LastName, Email, Phone, DateOfBirth)
VALUES
(103, 'Amit', 'Patel', 'amit.patel@gmail.com', '9876500001', '1995-06-18'),
(104, 'Sneha', 'Joshi', 'sneha.joshi@gmail.com', '9876500002', '1997-09-12'),
(105, 'Rohan', 'Kulkarni', 'rohan.k@gmail.com', '9876500003', '1993-11-25');


--  Insert 4 Records into Accounts Table
INSERT INTO Accounts
(AccountID, CustomerID, AccountType, Balance)
VALUES
(202, 102, 'Current', 40000),
(203, 103, 'Savings', 35000),
(204, 104, 'Current', 60000),
(205, 105, 'Savings', 45000);


-- Insert 5 Records into Transactions Table
INSERT INTO Transactions
(TransactionID, AccountID, TransactionDate, Amount, TransactionType)
VALUES
(301, 201, '2025-05-10', 5000, 'Deposit'),
(302, 202, '2025-05-11', 2500, 'Withdraw'),
(303, 203, '2025-05-12', 10000, 'Deposit'),
(304, 204, '2025-05-13', 3000, 'Withdraw'),
(305, 205, '2025-05-14', 7000, 'Deposit');

-- Insert 5 Records into Branches Table
INSERT INTO Branches
(BranchID, BranchName, BranchAddress, BranchPhone)
VALUES
(2, 'Pune Branch', 'Shivaji Nagar, Pune', '0202222222'),
(3, 'Nashik Branch', 'College Road, Nashik', '0253222222'),
(4, 'Nagpur Branch', 'Sitabuldi, Nagpur', '0712333333'),
(5, 'Navi Mumbai Branch', 'Vashi, Navi Mumbai', '0224444444');
select * from Branches;

-- Insert 5 Records into Loans Table
INSERT INTO Loans
(LoanID, LoanAmount, InterestRate, StartDate, EndDate, CustomerID)
VALUES
(301, 500000, 8.50, '2025-01-15', '2030-01-15', 101),
(302, 300000, 9.25, '2025-02-10', '2028-02-10', 102),
(303, 750000, 8.75, '2025-03-20', '2032-03-20', 103),
(304, 250000, 10.00, '2025-04-05', '2029-04-05', 104),
(305, 1000000, 7.95, '2025-05-12', '2035-05-12', 105);

INSERT INTO Accounts
(AccountID, CustomerID, AccountType, Balance)
VALUES
(201,101,'Savings',25000);

select * from Customers;

INSERT INTO Accounts
(AccountID, CustomerID, AccountType, Balance)
VALUES
(201,101,'Savings',25000);


SET SQL_SAFE_UPDATES=0;
UPDATE Customers
SET Phone='9999999999'
WHERE CustomerID=101;

USE bankingdb;

-- 1. Customers (Parent) - 2 samples
INSERT INTO Customers (CustomerID, FirstName, Lastname, Email, phone, AccountCreations) 
VALUES (101, 'Rahul', 'Sharma', 'rahul101@gmail.com', '9876543210', '2024-01-15');

INSERT INTO Customers (CustomerID, FirstName, Lastname, Email, phone, AccountCreations) 
VALUES (102, 'Priya', 'Patil', 'priya102@gmail.com', '9876543211', '2024-02-10');

-- 2. Branches (Parent)
INSERT INTO Branches (BranchID, BranchName, BranchAddress, BranchPhone)
VALUES (1, 'Pune Main', 'MG Road Pune', '020-123456');

-- 3. Now Accounts (Child) - THIS WILL WORK NOW
INSERT INTO Accounts (AccountID, CustomerID, BranchID, AccountType, Balance)
values (201, 101, 1, 'Savings', 25000);

SET SQL_SAFE_UPDATES=0;
UPDATE Customers
SET Phone='9999999999'
WHERE CustomerID=101;
SET SQL_SAFE_UPDATES=1;

select * from Customers;

SELECT * FROM Customers
WHERE CustomerID = 101;

UPDATE Customers
SET Email='rahul.sharma@gmail.com'
WHERE CustomerID=101;




SET SQL_SAFE_UPDATES=0;
delete from Transactions where TransactionID = 302;
SET SQL_SAFE_UPDATES=1;

SELECT * FROM Transactions;

DELETE FROM Accounts
WHERE AccountID = 202;

SELECT * FROM Accounts;
------------------------------------------------------------------------------------------
-- lab 4
-----------------------------------------------------------------------------------------
SELECT * FROM Customers;

SELECT FirstName, LastName, Email, Phone
FROM Customers;


SELECT *
FROM Accounts
WHERE AccountType = 'Savings';

SELECT *
FROM Accounts
WHERE Balance > 25000;

SELECT *
FROM Transactions
WHERE Amount BETWEEN 5000 AND 20000;

SELECT *
FROM Customers
WHERE CustomerID IN (101,102,103);

SELECT *
FROM Customers
WHERE FirstName LIKE 'R%';
-- Activity
select * from Accounts 
where AccountType = 'Current';

select * from Accounts
where Balance < 15000;

select * from Transactions 
where Amount between 1000 and 10000;

select * from Customers where CustomerID in (104,105);

select * from Customers where LastName like 'S%';





-- task 3

SELECT *
FROM Customers
ORDER BY FirstName ASC;

SELECT *
FROM Accounts
ORDER BY Balance DESC;

SELECT DISTINCT AccountType
FROM Accounts;

SELECT *
FROM Accounts
ORDER BY Balance DESC
LIMIT 3;

SELECT *
FROM Transactions
LIMIT 5 OFFSET 2;

-- Activity

SELECT *
FROM Customers
ORDER BY Lastname ASC;

SELECT *
FROM Transactions
order by Amount desc
LIMIT 5;

select distinct TransactionType from Transactions;

SELECT *
FROM Transactions
limit 4 offset 3;

SELECT *
FROM Transactions
limit 3, 4;

-- task 4

SELECT *
FROM Customers
WHERE Phone IS NULL;

SELECT *
FROM Customers
WHERE Email IS NOT NULL;

SET SQL_SAFE_UPDATES=0;

UPDATE Customers SET 
Phone='9876543210', 
AccountCreations='2024-01-10', 
DateOfBirth='1998-04-15' 
WHERE CustomerID=101;

UPDATE Customers SET 
Phone='9988776655', 
AccountCreations='2024-02-10', 
DateOfBirth='2000-09-20',
Email='priya@gmail.com'
WHERE CustomerID=102;

UPDATE Customers SET 
Phone='9876500001', 
AccountCreations='2024-01-15', 
DateOfBirth='1995-06-18' 
WHERE CustomerID=103;

UPDATE Customers SET 
Phone='9876500002', 
AccountCreations='2024-03-05', 
DateOfBirth='1997-09-12' 
WHERE CustomerID=104;

UPDATE Customers SET 
Phone='9876500003', 
AccountCreations='2024-03-10', 
DateOfBirth='1993-11-25' 
WHERE CustomerID=105;

SET SQL_SAFE_UPDATES=1;

SELECT * FROM Customers WHERE Email IS NOT NULL;

-- Activity

-- 1. Customers WITHOUT email (should be 0 rows because you fixed all emails)
SELECT *
FROM Customers
WHERE Email IS NULL;

-- 2. Accounts where Balance is available (all accounts have balance)
SELECT *
FROM Accounts
WHERE Balance IS NOT NULL;

-- task 5

SELECT AccountID,
       Balance,
       CASE
           WHEN Balance >= 50000 THEN 'Premium Account'
           WHEN Balance >= 25000 THEN 'Standard Account'
           ELSE 'Basic Account'
       END AS AccountCategory
FROM Accounts;

-- activity
SELECT 
    TransactionID,
    Amount,
    CASE
        WHEN Amount >= 10000 THEN 'High Transaction'
        WHEN Amount >= 5000 THEN 'Medium Transaction'
        ELSE 'Low Transaction'
    END AS TransactionCategory
FROM Transactions;

-- task 6
SELECT AccountID,
       Balance,
       RANK() OVER (ORDER BY Balance DESC) AS BalanceRank
FROM Accounts;

SELECT TransactionID,
       Amount,
       SUM(Amount) OVER (ORDER BY TransactionDate) AS RunningTotal
FROM Transactions;

SELECT TransactionID,
       Amount,
       AVG(Amount) OVER () AS AverageTransaction
FROM Transactions;
-----------------------------------------------------------------

-- lab 5
---------------------------------------------------------------------------------
SELECT * FROM Customers WHERE FirstName LIKE 'A%';

SELECT * FROM Customers WHERE Email LIKE '%gmail%';

SELECT * FROM Customers WHERE LastName LIKE '%kar';

-- Activity

select * from Customers where FirstName Like 'R%';

select * from Customers where email like '%yahoo%';

select * from Customers where LastName like 'P%';

select * from Customers where phone like '%99';

-- task 2

SELECT * FROM Accounts
WHERE AccountType IN ('Savings', 'Current');

SELECT * FROM Transactions
WHERE TransactionType IN ('Deposit', 'Withdraw');

SELECT * FROM Customers
WHERE CustomerID IN (101,102,105);

-- Activity

SELECT * FROM Accounts
WHERE AccountType IN ('Savings', 'Salary');

select * from Transactions 
where TransactionType in ('Payment', 'Deposit');

select * from Customers
where CustomerID in (103, 104);

select * from Accounts
where AccountID in (101);

-- task 3

SELECT * FROM Customers
ORDER BY LastName ASC;

SELECT * FROM Accounts
ORDER BY Balance DESC;

-- Activity

select * from Customers
order by FirstName asc;

select * from Accounts
order by AccountType asc;

select * from Transactions
order by amount desc;

select * from Customers
order by DateofBirth asc;

-- task 4

SELECT * FROM Accounts
ORDER BY Balance DESC LIMIT 5;

SELECT * FROM Customers LIMIT 3;

SELECT * FROM Transactions LIMIT 5 OFFSET 3;

select * from Transactions order by amount desc limit 3;

select * from Customers limit 4;

select * from Accounts 
limit 3 offset 2;

select * from Transactions order by transactiondate desc limit 5;

-- task 5

SELECT * FROM Accounts WHERE AccountType = 'Savings'
ORDER BY Balance DESC;

SELECT * FROM Customers
WHERE FirstName LIKE 'S%'
LIMIT 5;

SELECT * FROM Transactions
WHERE TransactionType IN ('Deposit','Withdraw')
ORDER BY TransactionDate DESC;
----------------------------------------------------------------------------
-- LAB 6


-- task 1

select * from customers;

SELECT FirstName,
UPPER(FirstName) AS UpperCaseName
FROM customers;

SELECT FirstName,
LOWER(FirstName) AS LowerCaseName
FROM customers;

SELECT FirstName,
LENGTH(FirstName) AS NameLength
FROM customers;

SELECT FirstName,
LEFT(FirstName,3) AS Initials
FROM customers;

SELECT CONCAT(FirstName,' - ',LastName) AS FullName
FROM customers;

SELECT ROUND(1256.75) AS Rounded_Value;

SELECT CEIL(1256.25) AS Ceiling_Value;

SELECT FLOOR(1256.75) AS Floor_Value;

SELECT ABS(-2500) AS Absolute_Value;

SELECT MOD(25,4) AS Remainder;

select * from customers;

SELECT CURDATE(); 

SELECT NOW();

SELECT CustomerID,
YEAR(DateOfBirth) AS BirthYear
FROM customers;

SELECT CustomerID,
MONTH(DateOfBirth) AS BirthMonth
FROM customers;

SELECT CustomerID,
DATEDIFF(CURDATE(),DateOfBirth) AS Days
FROM customers;

-- comparison function

SELECT FirstName, DateOfBirth,
    IF(YEAR(DateOfBirth) <= 1995,
       'Adult', 'Young') AS Category
FROM Customers;

SELECT FirstName,
IFNULL(Phone, 'Not Available') AS PhoneNumber
FROM Customers;

SELECT GREATEST(
'2000-09-20',
'1995-06-18',
'1997-09-12',
'1993-11-25'
) AS LatestBirthDate;

SELECT LEAST(
'2000-09-20',
'1995-06-18',
'1997-09-12',
'1993-11-25'
) AS EarliestBirthDate;

SELECT FirstName,
NULLIF(FirstName,'Priya') AS Result
FROM Customers;
-- Aggregate function

SELECT SUM(Balance) as total_balance
FROM Accounts;

SELECT AVG(Balance) AS average_balance
FROM Accounts;

SELECT MAX(Balance) AS highest_balance
FROM Accounts;

SELECT MIN(Balance) AS lowest_balance
FROM Accounts;

SELECT COUNT(*) AS total_accounts
FROM Accounts;

SELECT 
    AccountType,
    SUM(Balance) AS TotalBalance
FROM Accounts
GROUP BY AccountType
having sum(balance) > 25000;

---------------------------------------------------------------------

-- LAB; 7
-------------------------------------------------------------------------------
-- task 1
-- task 2
select * from loans;

select loanid,customerid,loanamount,
rank() over(order by loanamount desc) as "loan_rank"
from loans;

-- task 3
select
    LoanID,
    CustomerID,
    LoanAmount,
    DENSE_RANK() OVER(
        ORDER BY LoanAmount DESC
    ) AS DenseRank
FROM Loans;

-- task 4
select
    LoanID,
    CustomerID,
    LoanAmount,
    ROW_NUMBER() OVER(
        ORDER BY LoanAmount DESC
    ) AS RowNumber
FROM Loans;

-- task 5
SELECT
    LoanID,
    CustomerID,
    LoanAmount,
    ROW_NUMBER() OVER(
        PARTITION BY CustomerID
        ORDER BY LoanAmount DESC
    ) AS RowNum
FROM Loans;

-- task 6
Select
    LoanID, CustomerID,LoanAmount,
    SUM(LoanAmount) OVER(
        ORDER BY LoanAmount DESC
    ) AS RunningTotal
from Loans;

-- task 7
SELECT
    LoanID,
    CustomerID,
    LoanAmount,
    LAG(LoanAmount) OVER(
        ORDER BY LoanAmount DESC
    ) AS PreviousLoanAmount
FROM Loans;

-- task 8
SELECT
    LoanID, CustomerID, LoanAmount,
    LEAD(LoanAmount) OVER(
        ORDER BY LoanAmount DESC
    ) AS NextLoanAmount
FROM Loans;

-- lag function: retrieve the values from the previous row in the result set.
-- use to compare current record with the immediately preceding record
------------------------------------------------------------------------------------------
-- lab 8
-------------------------------------------------------------------
-- task 1

SELECT
    a.AccountID, a.AccountType, a.Balance,
    t.TransactionID,
    t.TransactionDate,
    t.TransactionType,
    t.Amount
FROM Accounts a
INNER JOIN Transactions t
ON a.AccountID = t.AccountID;

-- task 2
SELECT
    a.AccountID, a.AccountType, a.Balance,
    t.TransactionID,
    t.TransactionDate,
    t.TransactionType,
    t.Amount
FROM Accounts a
LEFT JOIN Transactions t
ON a.AccountID = t.AccountID;

-- task 3
SELECT
    a.AccountID, a.AccountType, a.Balance,
    t.TransactionID,
    t.TransactionDate,
    t.TransactionType,
    t.Amount
FROM Accounts a
INNER JOIN Transactions t
ON a.AccountID = t.AccountID
WHERE t.TransactionType = 'Deposit';

-- task 4
SELECT a.AccountID, a.AccountType, a.Balance, t.TransactionID, t.TransactionDate, t.TransactionType, 
t.Amount
FROM Accounts a
inner join Transactions t
ON a.AccountID = t.AccountID
where a.Balance > 30000
order by a.Balance desc;

------------------------------------------------------------------
-- lab 9
-------------------------------------------------------------------
-- task 1

select * from transactions;


SELECT AVG(Amount)
FROM Transactions;

SELECT *
FROM Transactions
WHERE Amount >
(
    SELECT AVG(Amount)
    FROM Transactions
);

-- task 2
SELECT
    AccountID,
    AccountType,
    Balance,
    CustomerID
FROM Accounts
WHERE Balance >
(
    SELECT AVG(Balance)
    FROM Accounts
)
ORDER BY Balance DESC;

-- task 3
SELECT
    AccountID,
    AccountType,
    Balance,
    CustomerID
FROM Accounts
WHERE AccountID IN
(
    SELECT AccountID
    FROM Transactions
    WHERE TransactionType = 'Deposit'
);

-- task 4
SELECT AccountID, AccountType, Balance, CustomerID FROM Accounts
WHERE Balance =
(
    SELECT MAX(Balance)
    FROM Accounts
);
-----------------------------------------------------------------------------
-- lab 10
-----------------------------------------------------------------------------
-- task 1
CREATE VIEW High_Balance_Accounts AS
SELECT
    AccountID,
    AccountType,
    Balance,
    CustomerID
FROM Accounts
WHERE Balance > 30000;

-- task 2

SELECT * FROM High_Balance_Accounts;

-- task 3
CREATE OR REPLACE VIEW High_Balance_Accounts AS
SELECT
    a.AccountID, a.AccountType, a.Balance, a.CustomerID,
    t.TransactionID,
    t.TransactionDate,
    t.TransactionType,
    t.Amount
FROM Accounts a
INNER JOIN Transactions t
ON a.AccountID = t.AccountID
WHERE a.Balance > 30000;

-- task 4
SELECT
    AccountID,
    AccountType,
    Balance,
    CustomerID,
    TransactionID,
    TransactionDate,
    TransactionType,
    Amount
FROM High_Balance_Accounts
ORDER BY Balance DESC;
----------------------------------------------------------------------------------------






