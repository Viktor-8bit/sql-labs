/****** Script for SelectTopNRows command from SSMS  ******/







SELECT ID_Manager,  Surname, Name, Patronymic, (SELECT TOP(1) Surname + ' ' + Name + ' ' + Patronymic From Employee WHERE ID = POP.ID_Manager ) AS Manager FROM Employee AS POP;