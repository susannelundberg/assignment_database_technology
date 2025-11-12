DROP TABLE IF EXISTS Phone;
CREATE TABLE Phone(
    Id INTEGER PRIMARY KEY AUTOINCREMENT,
    PhoneNumber VARCHAR(10) NOT NULL
);

DROP TABLE IF EXISTS Email;
CREATE TABLE Email(
    Id INTEGER PRIMARY KEY AUTOINCREMENT,
    EmailAddress VARCHAR(30) NOT NULL UNIQUE
);

DROP TABLE IF EXISTS Supplier;

CREATE TABLE Supplier (
    Id INTEGER PRIMARY KEY AUTOINCREMENT,
    Name VARCHAR(40) NOT NULL UNIQUE
);

DROP TABLE IF EXISTS Contact;
CREATE TABLE Contact(
    Id INTEGER PRIMARY KEY AUTOINCREMENT,
    FirstName VARCHAR(20) NOT NULL,
    LastName VARCHAR(20) NOT NULL,
    SupplierId INTEGER,
    FOREIGN KEY(SupplierId) REFERENCES Supplier(Id)
);


DROP TABLE IF EXISTS ContactPhone;
CREATE TABLE ContactPhone (
    ContactId INTEGER,
    PhoneId INTEGER,
    PRIMARY KEY(ContactId, PhoneId),
    FOREIGN KEY(ContactId) REFERENCES Contact(Id),
    FOREIGN KEY(PhoneId) REFERENCES Phone(Id)
);

DROP TABLE IF EXISTS ContactEmail;
CREATE TABLE ContactEmail (
    ContactId INTEGER,
    EmailId INTEGER,
    PRIMARY KEY(ContactId, EmailId),
    FOREIGN KEY(ContactId) REFERENCES Contact(Id),
    FOREIGN KEY(EmailId) REFERENCES Email(Id)
);

DROP TABLE IF EXISTS SupplierPhone;
CREATE TABLE SupplierPhone (
    SupplierId INTEGER,
    PhoneId INTEGER,
    PRIMARY KEY(SupplierId, PhoneId),
    FOREIGN KEY(SupplierId) REFERENCES Supplier(Id),
    FOREIGN KEY(PhoneId) REFERENCES Phone(Id)
);

DROP TABLE IF EXISTS SupplierEmail;
CREATE TABLE SupplierEmail (
    SupplierId INTEGER,
    EmailId INTEGER,
    PRIMARY KEY(SupplierId, EmailId),
    FOREIGN KEY(SupplierId) REFERENCES Supplier(Id),
    FOREIGN KEY(EmailId) REFERENCES Email(Id)
);

DROP TABLE IF EXISTS City;
CREATE TABLE City(
    Id INTEGER PRIMARY KEY AUTOINCREMENT,
    City VARCHAR(20)
);

DROP TABLE IF EXISTS PostalCode;
CREATE TABLE PostalCode (
    Id INTEGER PRIMARY KEY AUTOINCREMENT,
    PostalCode VARCHAR(5),
    CityId INTEGER,
    FOREIGN KEY(CityId) REFERENCES City(Id)
);

DROP TABLE IF EXISTS Address;
CREATE TABLE Address(
    Id INTEGER PRIMARY KEY AUTOINCREMENT,
    AddressLine VARCHAR(20),
    PostalCodeId INTEGER,
    FOREIGN KEY(PostalCodeId) REFERENCES PostalCode(Id)
);

DROP TABLE IF EXISTS SupplierAddress;
CREATE TABLE SupplierAddress(
    SupplierId INTEGER,
    AddressId INTEGER,
    PRIMARY KEY(SupplierId, AddressId),
    FOREIGN KEY(SupplierId) REFERENCES Supplier(Id),
    FOREIGN KEY(AddressId) REFERENCES Address(Id)
);

DROP TABLE IF EXISTS Products;
CREATE TABLE Products(
    Id INTEGER PRIMARY KEY AUTOINCREMENT,
    ArticleNumber VARCHAR(10) UNIQUE,
    ProductName VARCHAR(20) UNIQUE,
    PricePerKilo FLOAT
);

DROP TABLE IF EXISTS SupplierProducts;
CREATE TABLE SupplierProducts(
    SupplierId INTEGER,
    ProductsId INTEGER,
    PRIMARY KEY(SupplierId, ProductsId),
    FOREIGN KEY (SupplierId) REFERENCES Supplier(Id),
    FOREIGN KEY (ProductsId) REFERENCES Products(Id)
);

DROP TABLE IF EXISTS Inventory;
CREATE TABLE Inventory(
    ProductsId INTEGER,
    Quantity FLOAT,
    Unit VARCHAR(10)
);

DROP TABLE IF EXISTS Recipe;
CREATE TABLE Recipe(
    Id INTEGER PRIMARY KEY AUTOINCREMENT,
    RecipeName VARCHAR(30) UNIQUE,
    Description VARCHAR(250)
);

DROP TABLE IF EXISTS RecipeProducts;
CREATE TABLE RecipeProducts(
    RecipeId INTEGER,
    ProductsId INTEGER,
    Amount FLOAT,
    Unit VARCHAR(10),
    PRIMARY KEY(RecipeId, ProductsId),
    FOREIGN KEY (RecipeId) REFERENCES Recipe(Id),
    FOREIGN KEY (ProductsId) REFERENCES Products(Id)
);