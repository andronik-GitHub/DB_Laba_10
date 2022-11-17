
/*

CREATE DATABASE Laba_10
GO


USE Laba_10
GO

*/


/* =============================================== */


CREATE TABLE Student
(
	StudID INT NOT NULL,
	Groupid INT NOT NULL,
	FirstName NVARCHAR(30) NOT NULL,
	LastName NVARCHAR(30) NOT NULL,
	DateOfBirth DATE NOT NULL,

	PRIMARY KEY (StudID)
);
GO

CREATE TABLE Learn
(
	PredmetID INT NOT NULL,
	TeacherName NVARCHAR(50) NOT NULL,
	HoursCount INT NOT NULL,

	PRIMARY KEY (PredmetID)
);
GO

CREATE TABLE SubjectSuccess
(
	StudID INT NOT NULL,
	PredmetID INT NOT NULL,
	Rating INT NULL,

	PRIMARY KEY (StudID, PredmetID)
);
GO


/* =============================================== */


ALTER TABLE SubjectSuccess
	ADD CONSTRAINT [CK_SubjectSuccess_Rating] CHECK ((Rating>=(1) AND Rating<=(5))),
	CONSTRAINT FK_SubjectSuccess_To_Student FOREIGN KEY([StudID]) REFERENCES Student ([StudID]) ON DELETE CASCADE,
	CONSTRAINT FK_SubjectSuccess_To_Learn FOREIGN KEY(PredmetID) REFERENCES Learn (PredmetID) ON DELETE CASCADE
GO


/* =============================================== */


INSERT INTO Learn
	VALUES	(1001, '������ ��������� ����������',	120),
			(1002, '������ ˳�� ������������',	180),
			(1003, '������ ������ ��������',		240),
			(1004, '��������� ��������� ����������', 80),
			(1005, '��������� ³���� ����������',	290),
			(1006, '������ ����� ����������',		300),
			(1007, '�������� ������� ���������',	140),
			(1008, '�������� �������� ��������',	380),
			(1009, '������ �������� ��������',		170),
			(1010, '��������� ������� �����',	340);
GO

/*
SELECT * FROM Learn
GO
*/

INSERT INTO Student
	VALUES	(10001, 120, '������',		'�������',		'2003/02/02'),
			(10002, 144, '�����',		'��������',		'2004/04/15'),
			(10003, 143, '������',		'������',		'2004/10/29'),
			(10004, 120, '������',		'���������',	'2002/08/16'),
			(10005, 122, '����',		'���������',	'2004/05/08'),
			(10006, 141, '�����',		'������',		'2003/04/10'),
			(10007, 144, '���������',	'������',		'2003/12/28'),
			(10008, 141, '������',		'�������',		'2004/07/19'),
			(10009, 122, '���������',	'��������',		'2004/03/18'),
			(10010, 121, '³����',		'������',		'2003/07/01'),
			(10011, 120, '���',		'������',		'2004/10/15');
GO

/*
SELECT * FROM Student
GO
*/


INSERT INTO SubjectSuccess
	VALUES	(10001, 1007, 2),
			(10003, 1009, 5),
			(10010, 1010, 3),
			(10008, 1003, 4),
			(10011, 1008, NULL),
			(10008, 1001, 5),
			(10009, 1007, 2),
			(10004, 1002, NULL),
			(10005, 1005, 4),
			(10007, 1001, 3);
GO

/*
SELECT * FROM SubjectSuccess
GO
*/


/* =============================================== */

/*

DROP TABLE SubjectSuccess
DROP TABLE Student
DROP TABLE Learn
GO

*/

