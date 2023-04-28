/****** Script for SelectTopNRows command from SSMS  ******/



INSERT INTO Employee(Name, ID_Manager) 
VALUES
('Федорова Екатерина Львовна', null),
('Владимирова Надежда Георгиевна', null),
('Ларионова Вероника Максимовна', null),
('Жуков Богдан Никитич', null),
('Андреев Мирон Гордеевич', null),
('Попова Виктория Игоревна', null),
('Максимова София Павловна', null);





UPDATE Employee SET ID_Manager = 1 WHERE ID in (2, 3);
UPDATE Employee SET ID_Manager = 2 WHERE ID in (4, 5);
UPDATE Employee SET ID_Manager = 3 WHERE ID in (6, 7);


SELECT TOP (1000) [ID]
      ,[Surname]
      ,[Name]
      ,[Patronymic]
      ,[ID_Manager]
  FROM [trading_company].[dbo].[Employee]