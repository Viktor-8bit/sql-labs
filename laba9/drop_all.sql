



DROP TABLE IF EXISTS Teaching; --0

ALTER TABLE Groups Drop CONSTRAINT IF EXISTS FK_TempSales_SalesReason;
ALTER TABLE Groups Drop CONSTRAINT IF EXISTS FK_specialty;
ALTER TABLE Groups Drop COLUMN IF EXISTS warden;

ALTER TABLE Students DROP CONSTRAINT IF EXISTS Group_key

DROP TABLE IF EXISTS Research;

ALTER TABLE Students DROP CONSTRAINT IF EXISTS Student_id

DROP TABLE IF EXISTS Students; --0

ALTER TABLE Groups DROP CONSTRAINT IF EXISTS ID_key;

DROP TABLE Groups; --0

DROP TABLE IF EXISTS Specialties; --0

DROP TABLE IF EXISTS Disciplines; --0

DROP TABLE IF EXISTS Teachers; --0[ID]

