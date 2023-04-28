

CREATE TABLE Client 
(
    ID int IDENTITY(1,1) PRIMARY KEY,
    Name varchar(255)  NOT NULL,
	Phone varchar(255) NOT NULL,
	Address varchar(255) NOT NULL,
	Sex varchar(1) NOT NULL
);

