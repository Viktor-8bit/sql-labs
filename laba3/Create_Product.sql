



CREATE TABLE Product 
(
    ID int IDENTITY(1,1) PRIMARY KEY,
    Name varchar(255)  NOT NULL,
	Unit varchar(255) NOT NULL,
	Description varchar(255) NOT NULL,
	Category varchar(200) NOT NULL
);

