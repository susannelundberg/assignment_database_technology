-- Recept
SELECT * FROM Recipe;

-- Ta bort ett recept
DELETE FROM Recipe WHERE Id = 3;

-- Leverantör med adress
SELECT
    Name,
    AddressLine,
    PostalCode,
    City
FROM Supplier
INNER JOIN SupplierAddress ON Supplier.Id = SupplierAddress.SupplierId
INNER JOIN Address ON SupplierAddress.AddressId = Address.Id
INNER JOIN PostalCode ON Address.PostalCodeId = PostalCode.Id
INNER JOIN City ON PostalCode.CityId = City.Id;

-- Leverantör med respektive kontakt
SELECT
    Name,
    PhoneSupplier.PhoneNumber,
    EmailSupplier.EmailAddress,
    FirstName || ' ' || LastName AS Contact,
    PhoneContact.PhoneNumber,
    EmailContact.EmailAddress
FROM
    Supplier
    INNER JOIN SupplierPhone ON SupplierPhone.SupplierId = Supplier.Id
    INNER JOIN Phone AS PhoneSupplier ON SupplierPhone.PhoneId = PhoneSupplier.Id
    INNER JOIN Contact ON Contact.SupplierId = Supplier.Id
    INNER JOIN ContactPhone ON ContactPhone.ContactId = Contact.Id
    INNER JOIN Phone AS PhoneContact ON ContactPhone.PhoneId = PhoneContact.Id
    INNER JOIN SupplierEmail ON SupplierEmail.SupplierId = Supplier.Id
    INNER JOIN Email AS EmailSupplier ON SupplierEmail.EmailId = EmailSupplier.Id
    INNER JOIN ContactEmail ON ContactEmail.ContactId = Contact.Id
    INNER JOIN Email AS EmailContact ON ContactEmail.EmailId = EmailContact.Id;


-- Produkt och leverantör
SELECT
    ProductName,
    ArticleNumber,
    PricePerKilo AS 'Kr/Kg',
    Name AS Supplier,
    PhoneNumber,
    EmailAddress
FROM
    Supplier
    INNER JOIN SupplierProducts ON Supplier.Id = SupplierProducts.SupplierId
    INNER JOIN Products ON Products.Id = SupplierProducts.ProductsId
    INNER JOIN SupplierPhone ON SupplierPhone.SupplierId = Supplier.Id
    INNER JOIN Phone ON SupplierPhone.PhoneId = Phone.Id
    INNER JOIN SupplierEmail ON SupplierEmail.SupplierId = Supplier.Id
    INNER JOIN Email ON SupplierEmail.EmailId = Email.Id;

-- Produkter
SELECT
    ProductName,
    ArticleNumber,
    PricePerKilo
FROM Products
ORDER BY ProductName;

-- Recept på kanelbullar med produkter
SELECT
    RecipeName,
    ProductName,
    Amount,
    Unit,
    PricePerKilo AS 'Kr/Kg'
FROM Recipe INNER JOIN RecipeProducts
    ON Recipe.Id = RecipeProducts.RecipeId INNER JOIN Products
    ON Products.Id = RecipeProducts.ProductsId
WHERE Recipe.Id = 1;

-- Recept på sirapslimpa med produkter
SELECT
    RecipeName,
    ProductName,
    Amount,
    Unit,
    PricePerKilo AS 'Kr/Kg'
FROM Recipe INNER JOIN RecipeProducts
    ON Recipe.Id = RecipeProducts.RecipeId INNER JOIN Products
    ON Products.Id = RecipeProducts.ProductsId
WHERE RecipeName LIKE '%sirap%';

-- Uppdatera mängden av en produkt
UPDATE Inventory
SET
    Quantity = Quantity - (
        SELECT
            SUM(Amount)
        FROM RecipeProducts
        WHERE RecipeProducts.ProductsId = Inventory.ProductsId
    )
WHERE
    ProductsId = (
        SELECT
            Id
        FROM Products
        WHERE ProductName LIKE 'vetemjöl'
    );

-- Tabell med uppdaterad produktmängd
SELECT
    ProductName,
    Quantity,
    Inventory.Unit
FROM Inventory
    INNER JOIN Products ON Products.Id = Inventory.ProductsId
ORDER BY Quantity;

-- Tabell som visar gram-produkt med minsta mängd
SELECT
ProductName,
MIN(Quantity),
Inventory.Unit
FROM Inventory
INNER JOIN Products ON Products.Id = Inventory.ProductsId
WHERE Inventory.Unit = 'gram';

-- Tabell som visar total åtgång av produkter för alla recept
SELECT ProductName, SUM(Amount) AS Amount, Unit FROM RecipeProducts
INNER JOIN Products ON Products.Id = RecipeProducts.ProductsId
GROUP BY ProductName;