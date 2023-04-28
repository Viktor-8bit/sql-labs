SELECT [������].Name as [��������], SUM([����].Quantity) as [����������],

CASE
	WHEN SUM([����].Quantity) < 10 THEN '����'
	WHEN 10 <= SUM([����].Quantity) and SUM([����].Quantity) <= 100 THEN '����������'
	WHEN SUM([����].Quantity) > 100 THEN '���������'
END as [������]

FROM Store as [����] Inner Join Product as [������] ON [����].[ID_Product] = [������].ID

GROUP BY [������].Name 
