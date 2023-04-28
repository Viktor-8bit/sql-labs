





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

