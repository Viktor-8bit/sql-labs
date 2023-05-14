
DROP TABLE Ticket;

DROP TABLE Trip;

DROP TABLE Routee;

DROP TABLE TicketOffice;

DROP TABLE Driver;

DROP TABLE Bus;

DROP TABLE Client;

DROP TABLE City;

-- 1
DROP PROCEDURE VIEW_DataTrip;

-- 2
DROP FUNCTION VIEW_TicketOffice;

-- 3
DROP VIEW VIEW_TicketOfice_Profit_from_TOMSK;

-- 4
DROP PROCEDURE VIEW_DriveCount;

-- 5
-- тригеры не дропаем

-- 6
DROP PROCEDURE ByTicket;

-- 7
DROP FUNCTION CountBus;

-- 8
DROP FUNCTION dbo.FreePlaces;

-- 9
DROP FUNCTION dbo.CashTicketOffic;

-- 10
DROP FUNCTION dbo.AVGTickets;

-- 11
DROP FUNCTION dbo.MoreAVGTickets;

-- 12
DROP PROCEDURE dbo.RefundClientTicket;

-- 13
DROP VIEW dbo.TripInfo;

-- 14
DROP FUNCTION dbo.CountOfTickets;

-- 15 тригер не дропаем

-- 16
DROP FUNCTION dbo.GetListRoutee;

-- 17
DROP PROCEDURE dbo.UpdateCountOfPlaces