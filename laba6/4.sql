SELECT (SELECT Name FROM Client WHERE Deal.ID_Client = Client.ID) as [покупатель] FROM Deal WHERE GETDATE() < DateAdd(DAY, 30, Datee);