




SELECT [оснв].Name as [Сотрдник], ISNULL( (SELECT Name FROM Employee WHERE ID = [оснв].ID_Manager), 'не опредлн') as [Начальник]  FROM Employee as [оснв] 
RIGHT JOIN Employee as [клон] ON [клон].ID = [оснв].ID