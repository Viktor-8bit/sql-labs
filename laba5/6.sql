SELECT COUNT(ID) as '���������� ������ �� �������� ���' FROM Deal WHERE DATEPART(WEEKDAY, Datee) in (3, 7, 5);

SELECT *, DATEPART(WEEKDAY, Datee) FROM Deal;