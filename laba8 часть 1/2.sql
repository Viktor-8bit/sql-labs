SELECT [������].Name as [��������], SUM([����].Quantity) as [����������]

FROM Store as [����] Inner Join Product as [������] ON [����].ID_Product = [������].ID

GROUP BY [������].Name  

HAVING SUM([����].Quantity) BETWEEN 1 and 10

