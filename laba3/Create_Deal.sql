




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

