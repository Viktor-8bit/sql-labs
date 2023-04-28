
SELECT 

������.Name as [�������]
, YEAR([����].Datee) as [���]
, MONTH([����].Datee) as [����]
, ROUND(CAST(SUM([����].Quantity * [����].Price * (1 - [����].Discount / 100 )) as float), 2) as [����� �����],

(ROUND(CAST(SUM([����].Quantity * [����].Price * (1 - [����].Discount / 100 )) as float), 2) - ISNULL(lag(ROUND(CAST(SUM([����].Quantity * [����].Price * (1 - [����].Discount / 100 )) as float), 2) ) over (order by ������.Name), 0)) as [������ � ����������] 


FROM Employee as [������] 

RIGHT JOIN Deal as [����] ON [������].ID = [����].ID_Employee
Inner JOIN Store as [����] ON [����].ID = [����].ID_Store

GROUP BY ������.Name, YEAR([����].Datee), MONTH([����].Datee);


--SELECT 3150000 - 1640000;