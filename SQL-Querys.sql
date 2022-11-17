/* ================================= */

USE Laba_10
GO

/* ================================= */
/* =============== 1 =============== */

SELECT FirstName, LastName, Groupid
FROM Student

/* ================================= */
/* =============== 2 =============== */

SELECT *
FROM Learn
WHERE HoursCount > 130 AND HoursCount < 300

/* ================================= */
/* =============== 3 =============== */

SELECT *
FROM Student
WHERE MONTH(DateOfBirth) > 4 AND MONTH(DateOfBirth) < 9

/* ================================= */
/* =============== 4 =============== */

SELECT *
FROM Student
WHERE LastName LIKE '%��'

/* ================================= */
/* =============== 5 =============== */

SELECT Groupid AS �����, COUNT(Groupid) AS [ʳ������ ��������]
FROM Student
GROUP BY Groupid

/* ================================= */
/* =============== 6 =============== */

SELECT S.StudID, S.FirstName, S.LastName, S.Groupid, CASE SS.Rating
														WHEN NULL THEN 'NULL'
														ELSE AVG(SS.Rating)
													 END AS Rating_AVG
FROM Student S, SubjectSuccess SS
WHERE S.StudID = SS.StudID
GROUP BY S.StudID, S.FirstName, S.LastName, S.Groupid

/* ================================= */
/* =============== 7 =============== */

SELECT S.FirstName, S.LastName, L.PredmetID, L.TeacherName, SS.Rating
FROM Student S, Learn L, SubjectSuccess SS
WHERE S.StudID = SS.StudID AND L.PredmetID = SS.PredmetID

/* ================================= */
/* =============== 8 =============== */

INSERT INTO Student
	VALUES	(10012, 120, '�����', '�������', '2003/06/26');
GO

INSERT INTO SubjectSuccess
	VALUES	(10012, 1010, 2),
			(10012, 1009, 2),
			(10012, 1008, 2),
			(10012, 1007, 2);
GO

/* ================================= */
/* =============== 9 =============== */

DELETE S FROM Student S
WHERE 3 <= 
			(
				SELECT COUNT(SS.Rating)
				FROM SubjectSuccess SS
				WHERE S.StudID = SS.StudID AND SS.Rating = 2
			)
GO

/* ================================= */
/* =============== 10 ============== */

UPDATE SubjectSuccess
	SET Rating = 3
	WHERE 
			(
				SELECT COUNT(SS.Rating)
				FROM SubjectSuccess SS
				WHERE SubjectSuccess.StudID = SS.StudID AND SS.Rating = 2
			) BETWEEN 1 AND 2
GO