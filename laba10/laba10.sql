
SET IDENTITY_INSERT Groups ON;

INSERT INTO Groups(ID, name, specialty, curator, warden)
VALUES(5, 'КИ29-15Б', 4, NULL, NULL)

UPDATE Students SET ID_Group=((SELECT TOP(1) ID FROM Groups ORDER BY ID DESC)) WHERE ID_Group = 2;

UPDATE Groups SET warden = (SELECT warden FROM Groups WHERE ID = 2 ), 
curator = (SELECT curator FROM Groups WHERE ID = 2) WHERE ID=5;

DELETE Groups WHERE ID = 2;


--отмена изменений
INSERT INTO Groups(ID, name, specialty, curator, warden) VALUES(2, 'КИ20-11Б', 3, NULL, NULL) --2	КИ20-11Б	3	111112	10000000011

UPDATE Groups SET warden = (SELECT warden FROM Groups WHERE ID = 5 ), 
curator = (SELECT curator FROM Groups WHERE ID = 5) WHERE ID= 2;

UPDATE Students SET ID_Group= 2 WHERE ID_Group = 5;

DELETE Groups WHERE ID = 5;


