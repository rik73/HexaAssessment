CREATE DATABASE LoanManagementSystem;

USE LoanManagementSystem;

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY IDENTITY(1,1),
    Name VARCHAR(100) NOT NULL,
    EmailAddress VARCHAR(100) NOT NULL,
    PhoneNumber VARCHAR(20) NOT NULL,
    Address VARCHAR(200) NOT NULL,
    CreditScore INT NOT NULL
);

CREATE TABLE Loans (
    LoanId INT PRIMARY KEY IDENTITY(1,1),
    CustomerId INT FOREIGN KEY REFERENCES Customers(CustomerID),
    PrincipalAmount DECIMAL(10, 2) NOT NULL,
    InterestRate DECIMAL(5, 2) NOT NULL,
    LoanTerm INT NOT NULL,
    LoanType VARCHAR(20) NOT NULL,
    LoanStatus VARCHAR(20) NOT NULL
);

CREATE TABLE HomeLoans (
    LoanId INT PRIMARY KEY FOREIGN KEY REFERENCES Loans(LoanId),
    PropertyAddress VARCHAR(200) NOT NULL,
    PropertyValue DECIMAL(10, 2) NOT NULL
);

CREATE TABLE CarLoans (
    LoanId INT PRIMARY KEY FOREIGN KEY REFERENCES Loans(LoanId),
    CarModel VARCHAR(100) NOT NULL,
    CarValue DECIMAL(10, 2) NOT NULL
);

