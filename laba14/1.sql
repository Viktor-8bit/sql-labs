





--CREATE DATABASE laba14;
--DROP DATABASE laba14;


CREATE TABLE City
(
    ID INT IDENTITY(1,1) PRIMARY KEY,
    Name VARCHAR(255) NOT NULL
);

CREATE TABLE Client 
(
    ID INT IDENTITY(1,1) PRIMARY KEY,
    Surname VARCHAR(255), -- фамилия 
    Name VARCHAR(255) NOT NULL, -- имя
    Patronymic VARCHAR(255), -- отчество
    Info VARCHAR(255) -- информация о клиенте
);

CREATE TABLE Bus
(
    ID INT IDENTITY(1,1) PRIMARY KEY,
    Trademark VARCHAR(255) NOT NULL, -- марка автобуса
    QuantityPlace INT NOT NULL, -- число свободных мест
    StateNumber VARCHAR(6) NOT NULL, -- номер
);

CREATE TABLE Driver 
(
    ID INT IDENTITY(1,1) PRIMARY KEY,
    Surname VARCHAR(255), -- фамилия 
    Name VARCHAR(255) NOT NULL, -- имя
    Patronymic VARCHAR(255), -- отчество
    ID_City INT, -- ID родного города
    FOREIGN KEY (ID_City) REFERENCES City(ID),
);

CREATE TABLE TicketOffice
(
    ID INT IDENTITY(1,1) PRIMARY KEY,
    ID_City INT, -- ID родного города
    FOREIGN KEY (ID_City) REFERENCES City(ID),
    Address VARCHAR(255) -- адресс филиала выдавшего билет
);

CREATE TABLE Routee -- маршрут
(
    ID INT IDENTITY(1,1) PRIMARY KEY,
    --WeekDay INT NOT NULL, -- можно не добавлять 
    TimeDeparture TIME NOT NULL, -- время отправления
    TravelTime INT NOT NULL,    -- время путешествия
    ID_CityDeparture INT NOT NULL, -- откуда город
    FOREIGN KEY (ID_CityDeparture) REFERENCES City(ID),
    ID_CityArrival INT NOT NULL, -- куда город
    FOREIGN KEY (ID_CityArrival) REFERENCES City(ID),
    Price FLOAT NOT NULL, -- цена
    MIN_QuantityPlace INT
);

CREATE TABLE Trip -- конкретный рейс
(    
    ID INT IDENTITY(1,1) PRIMARY KEY,
    ID_Routee INT NOT NULL, -- id маршрута
    FOREIGN KEY (ID_Routee) REFERENCES Routee(ID),
    ID_Bus INT, -- id автобуса
    FOREIGN KEY (ID_Bus) REFERENCES Bus(ID),
    ID_Driver INT, -- id водителя
    FOREIGN KEY (ID_Driver) REFERENCES Driver(ID),
    DateDeparture DATE NOT NULL -- дата отправления
);

CREATE TABLE Ticket
(
    ID INT IDENTITY(1,1) PRIMARY KEY,
    ID_TicketOffice INT, -- id офиса продавшего билет
    FOREIGN KEY (ID_TicketOffice) REFERENCES TicketOffice(ID),
    ID_Trip INT, -- id путешествия
    FOREIGN KEY (ID_Trip) REFERENCES Trip(ID),
    DateOfSale DATE NOT NULL, -- дата продажи
    ID_Client INT NOT NULL,  -- id клиента
    FOREIGN KEY (ID_Client) REFERENCES Client(ID),
);
-- 8 / 8