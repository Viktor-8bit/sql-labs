


SELECT [����].Name as [�����], ISNULL([���].Name, '�� ��������') as [����������], ISNULL( CAST([����].Quantity as CHAR(255)), '��� �����') as [���������]

FROM Store as [����] 

RIGHT JOIN Product as [����] ON [����].ID_Product = [����].ID 

LEFT JOIN Deal as [����] ON [����].ID_Store = [����].ID

LEFT JOIN Client as [���] ON [����].ID_Client = [���].ID