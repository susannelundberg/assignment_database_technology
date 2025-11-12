INSERT INTO Phone(
    PhoneNumber
)VALUES(
    '021-1234567'
),(
    '040-1234567'
),(
    '021-7654321'
),(
    '040-7654321'
);

INSERT INTO Email(
    EmailAddress
)VALUES(
    'info@tvl.se'
),(
    'info@mejeriet.se'
),(
    'anna@tvl.se'
),(
    'olle@mejeriet.se'
);

INSERT INTO Contact(
    FirstName,
    LastName,
    SupplierId
)VALUES(
    'Anna',
    'Andersson',
    1
),(
    'Olle',
    'Olsson',
    1
);

INSERT INTO Supplier(
    Name
)VALUES(
    'Torrvaruleverantören'
),(
    'Mejeriet'
);

INSERT INTO
    ContactPhone (ContactId, PhoneId)
VALUES (1,3),
    (2, 4);

INSERT INTO ContactEmail(
    ContactId,
    EmailId
)VALUES(
    1,
    3
),(
    2,
    4
);

INSERT INTO
    SupplierPhone (SupplierId, PhoneId)
VALUES (1, 1),
    (2, 2);

INSERT INTO SupplierEmail(
    SupplierId,
    EmailId
)VALUES(
    1,
    1
),(
    2,
    2
);


INSERT INTO City(
    City
)VALUES(
    'Västerås'
),(
    'Malmö'
);

INSERT INTO PostalCode(
    PostalCode,
    CityId
)VALUES(
    '72246',
    1
),(
    '21109',
    2
);

INSERT INTO Address(
    AddressLine,
    PostalCodeId
)VALUES(
    'Vägen 1',
    1
),(
    'Gatan 2',
    2
);

INSERT INTO SupplierAddress(
    SupplierId,
    AddressId
)VALUES(
    1,
    1
),(
    2,
    2
);

INSERT INTO SupplierProducts(
    SupplierId,
    ProductsId
)VALUES(
    1,
    1
),(
    2,
    2
),(
    2,
    3
),(
    2,
    4
),(
    1,
    5
);

INSERT INTO Products(
    ArticleNumber,
    ProductName,
    PricePerKilo
)VALUES(
    'AA-11',
    'Vetemjöl',
    10
),(
    'BB-22',
    'Jäst',
    0.25
),(
    'CC-33',
    'Mjölk',
    12
),(
    'DD-44',
    'Smör',
    120
),(
    'EE-55',
    'Strösocker',
    15
),(
    'FF-66',
    'Salt',
    11
),(
    'GG-77',
    'Ägg',
    47
),(
    'HH-88',
    'Kanel',
    264
),(
    'II-99',
    'Pärlsocker',
    25
),(
    'JJ-10',
    'Sirap',
    25
),(
    'KK-11',
    'Rågsikt',
    25
);

INSERT INTO Recipe(
    RecipeName,
    Description
)VALUES(
    'Kanelbullar',
    'Så här gör du kanelbullar'
);

INSERT INTO Recipe(
    RecipeName,
    Description
)VALUES(
    'Sirapslimpa',
    'Så här gör du sirapslimpa'
);

INSERT INTO
    Recipe (RecipeName, Description)
VALUES (
        'Kokostoppar',
        'Så här gör du kokostoppar'
    );

INSERT INTO RecipeProducts(
    RecipeId,
    ProductsId,
    Amount,
    Unit
)VALUES(
    1,
    1,
    480,
    'gram'
),(
    1,
    2,
    25,
    'gram'
),(
    1,
    3,
    0.3,
    'liter'
),(
    1,
    4,
    150,
    'gram'
),(
    1,
    5,
    135,
    'gram'
),(
    1,
    6,
    1,
    'gram'
),(
    1,
    7,
    1,
    'styck'
),(
    1,
    8,
    6.5,
    'gram'
),(
    1,
    9,
    100,
    'gram'
);

INSERT INTO RecipeProducts(
    RecipeId,
    ProductsId,
    Amount,
    Unit
)VALUES(
    2,
    1,
    540,
    'gram'
),(
    2,
    2,
    50,
    'gram'
),(
    2,
    3,
    0.25,
    'liter'
),(
    2,
    4,
    100,
    'gram'
),(
    2,
    6,
    10,
    'gram'
),(
    2,
    10,
    0.1,
    'liter'
),(
    2,
    11,
    275,
    'gram'
);

INSERT INTO Inventory(
    ProductsId,
    Quantity,
    Unit
)VALUES(
    1,
    5000,
    'gram'
),(
    2,
    5000,
    'gram'
),(
    3,
    50,
    'liter'
),(
    4,
    2000,
    'gram'
),(
    5,
    5000,
    'gram'
),(
    6,
    1000,
    'gram'
),(
    7,
    50,
    'styck'
),(
    8,
    1000,
    'gram'
),(
    9,
    1000,
    'gram'
),(
    10,
    50,
    'liter'
),(
    11,
    1000,
    'gram'
);