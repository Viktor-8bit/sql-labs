
SELECT [�����].Name as [������������],  datename(month, [����].Datee) as [�����],

YEAR([����].Datee) as [���],

ROUND(CAST(SUM([����].Quantity * [����].Price * (1 - [����].Discount / 100 )) as float), 2) as [�����]

FROM Deal as [����] Inner Join Store as [����] ON [����].ID = [����].ID_Store

Inner Join Product as [�����] ON [�����].ID = [����].ID_Product

WHERE [����].ID_Store = 4 


GROUP BY [����].ID_Store, YEAR([����].Datee), datename(month, [����].Datee)
, [�����].Name

HAVING ROUND(CAST(SUM([����].Quantity * [����].Price * (1 - [����].Discount / 100 )) as float), 2) < 300;


--SELECT

--[�����].Name as [������������], 

--datename(month, [����].Datee) as [�����] ,

--YEAR([����].Datee) as [���],

--ROUND(CAST(([����].Quantity * [����].Price * (1 - [����].Discount / 100 )) as float), 2) as [check]

--FROM Deal as [����] 

--Inner Join Store as [����] ON [����].ID = [����].ID_Store

--Inner Join Product as [�����] ON [�����].ID = [����].ID_Product 


--WHERE [����].ID_Store = 4


