




SELECT [����].Name as [��������], ISNULL( (SELECT Name FROM Employee WHERE ID = [����].ID_Manager), '�� �������') as [���������]  FROM Employee as [����] 
RIGHT JOIN Employee as [����] ON [����].ID = [����].ID