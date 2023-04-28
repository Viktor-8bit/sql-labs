

CREATE TABLE Client 
(
    ID int IDENTITY(1,1) PRIMARY KEY,
    Name varchar(255)  NOT NULL,
	Phone varchar(255) NOT NULL,
	Address varchar(255) NOT NULL,
	Sex varchar(1) NOT NULL
);

CREATE TABLE Employee 
(
    ID int IDENTITY(1,1) PRIMARY KEY,
    Name varchar(255)  NOT NULL,
	ID_Manager int,
	FOREIGN KEY (ID_Manager) REFERENCES Employee(ID)
);

CREATE TABLE Provider 
(
    ID int IDENTITY(1,1) PRIMARY KEY,
    Name varchar(255)  NOT NULL,
);

CREATE TABLE Product 
(
    ID int IDENTITY(1,1) PRIMARY KEY,
    Name varchar(255)  NOT NULL,
	Unit varchar(255) NOT NULL,
	Description varchar(255) NOT NULL,
	Category varchar(200) NOT NULL
);

CREATE TABLE Store 
(
    ID int IDENTITY(1,1) PRIMARY KEY,
    ID_Provider int  NOT NULL,
	ID_Product int NOT NULL,
	Quantity int NOT NULL,
	Price money NOT NULL,
	Datee date NOT NULL,
	
	FOREIGN KEY (ID_Provider) REFERENCES Provider(ID),
	FOREIGN KEY (ID_Product) REFERENCES Product(ID),
);

CREATE TABLE Deal 
(
    ID int IDENTITY(1,1) PRIMARY KEY,
    Datee date  NOT NULL,
	ID_Store int NOT NULL,
	ID_Client int NOT NULL,
	ID_Employee int NOT NULL,
	Quantity int NOT NULL, 
	Discount decimal(38, 2) NOT NULL,
	FOREIGN KEY (ID_Client) REFERENCES Client(ID),
	FOREIGN KEY (ID_Store) REFERENCES Store(ID),
	FOREIGN KEY (ID_Employee) REFERENCES Employee(ID)
);