


SELECT [�����].Name, 

Year([����].Datee) as [���], 

datename(month, [����].Datee) as [�����],

ROUND(CAST(SUM([����].Quantity * [����].Price * (1 - [����].Discount / 100 )) as float), 2) as [�����]

FROM Deal as [����] Inner Join Store as [����] ON [����].ID_Store = [����].ID

Inner Join Product as [�����] ON [����].ID_Product = [�����].ID

GROUP BY [�����].Name, Year([����].Datee), datename(month, [����].Datee);



--SELECT [�����].Name, Year([����].Datee) as [���], 

--datename(month, [����].Datee) as [�����] FROM Deal as [����] Inner Join Store as [����] ON [����].ID_Store = [����].ID

--Inner Join Product as [�����] ON [����].ID_Product = [�����].ID;