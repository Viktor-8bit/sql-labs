





-- возьмём авто с 4 id

EXECUTE dbo.UpdateCountOfPlaces @id_bus = 4, @add_places = 3;

SELECT * FROM Bus;
