


SELECT * FROM Provider;

SELECT [�����].[ID], [�����].Name FROM Provider as [�����] WHERE EXISTS (SELECT * FROM Store WHERE ID_Provider = [�����].ID )