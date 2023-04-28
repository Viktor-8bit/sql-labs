



SELECT TOP(3)

������.Name

, ROUND(CAST(SUM([����].Quantity * [����].Price * (1 - [����].Discount / 100 )) as float), 2) as [����� ������]

, RANK() over ( ORDER BY SUM([����].Quantity * [����].Price * (1 - [����].Discount / 100 )) desc) as [������� �����]


FROM Employee as [������] 

 JOIN Deal as [����] ON [������].ID = [����].ID_Employee
 JOIN Store as [����] ON [����].ID = [����].ID_Store

GROUP BY ������.Name




--SELECT 

--������.Name, SUM([����].Quantity * [����].Price * (1 - [����].Discount / 100 )) FROM Deal as [����] 

--Inner JOIN Store as [����] ON [����].ID_Store = [����].ID
--Inner JOIN Employee as [������] ON [����].ID_Provider = [������].ID

--GROUP BY ������.Name;