


CREATE TABLE Employee 
(
    ID int IDENTITY(1,1) PRIMARY KEY,
    Name varchar(255)  NOT NULL,
	ID_Manager int,
	FOREIGN KEY (ID_Manager) REFERENCES Employee(ID)
);

