

-- Получить данные (время, цену на билет) о рейсах в город Томск из города Новосибирск

EXECUTE dbo.VIEW_DataTrip @CityDeparture = 'Новосибирск', @CityArrival = 'Томск';
