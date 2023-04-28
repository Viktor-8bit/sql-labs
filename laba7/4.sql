


SELECT * FROM Provider;

SELECT [поств].[ID], [поств].Name FROM Provider as [поств] WHERE EXISTS (SELECT * FROM Store WHERE ID_Provider = [поств].ID )