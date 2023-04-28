



--DROP DATABASE Decanat;
--CREATE DATABASE Decanat;

CREATE TABLE Specialties 
(
    ID int IDENTITY(1,1) PRIMARY KEY, --ID
	specialty_code varchar(255)  NOT NULL, --���� (����. 09.03.02)
	name varchar(255) NOT NULL,			--������������
	form_of_learning varchar(255) check(form_of_learning = '�����' or form_of_learning = '�������' or form_of_learning = '���� �������' ) NOT NULL, --����� ��������
	lvl varchar(255) check(lvl = '�����������' or lvl = '�����������' or lvl = '������������' or lvl = '�����������' ) NOT NULL, --������� �����������/�����������/������������/�����������
	duration_of_training int NOT NULL, --����������������� �������� (� ���������)
	descript varchar(255) NOT NULL --��������
);

CREATE TABLE Groups
(
	ID int IDENTITY(1,1),
    CONSTRAINT ID_key PRIMARY KEY (ID), --ID
	name varchar(255) NOT NULL,
	specialty int, --������������� (���� ��� �� )
	--FOREIGN KEY (specialty) REFERENCES Specialties(ID), --ID_������
	CONSTRAINT FK_specialty FOREIGN KEY (specialty)
					REFERENCES Specialties(ID),
	curator varchar(6) NOT NULL  --������� ��������� �����
);

CREATE TABLE Students 
(
	grade_book_number varchar(11),
	CONSTRAINT Student_id PRIMARY KEY (grade_book_number), --����� �������� ������
	surname varchar(255), --�������
	name varchar(255), --���
	first_name varchar(255), --��������
	ID_Group int,
	CONSTRAINT Group_key FOREIGN KEY (ID_Group) REFERENCES Groups(ID), --ID_������
	year_of_entry date NOT NULL ---��� �����������
);

ALTER TABLE Groups ADD 	
					warden varchar(11), --��������  (����� �������� ������) �������� ����� �� ���� ��������
					--FOREIGN KEY (warden) REFERENCES Students(grade_book_number),
					CONSTRAINT FK_TempSales_SalesReason FOREIGN KEY (warden)
					REFERENCES Students(grade_book_number);

CREATE TABLE Teachers 
(
	talismanic_number varchar(6) PRIMARY KEY,  --������� ��������� �����
	surname varchar(255), --�������
	name varchar(255), --���
	first_name varchar(255), --��������
	degree varchar(255),  --������ �������
	scientific_status varchar(255), --������ ������
	department varchar(255) --�������
);

CREATE TABLE Disciplines 
(
    ID int IDENTITY(1,1) PRIMARY KEY,
	name varchar(255) NOT NULL, --��������
	specialty varchar(255) NOT NULL, --�������������
	semester int NOT NULL, --�������
	volume_in_hours int NOT NULL, --����� (� �����)
	reporting varchar(255) check(reporting = '�������' or reporting = '�����' or reporting = '��������' or reporting = '�����������' ) --���������� (�������/�����/��������/�����������)
);

CREATE TABLE Research --��������
(
    ID int IDENTITY(1,1) PRIMARY KEY,
	grade_book_number varchar(11),
	FOREIGN KEY (grade_book_number) REFERENCES Students(grade_book_number), --����� �������� ������ �������� grade_book_number
	ID_Discipline int,
	FOREIGN KEY (ID_Discipline) REFERENCES Disciplines(ID),					--ID_���������� 
	handover_date date,														--���� �����
	score int																--������
);

CREATE TABLE Teaching 
(
    ID int IDENTITY(1,1) PRIMARY KEY,
	ID_Discipline int,
	FOREIGN KEY (ID_Discipline) REFERENCES Disciplines(ID),
	talismanic_number varchar(6), --��������� �����
	FOREIGN KEY (talismanic_number) REFERENCES 	Teachers(talismanic_number)

);
