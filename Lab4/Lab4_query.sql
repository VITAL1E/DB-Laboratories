DROP PROCEDURE IF EXISTS Lab9_3
GO
CREATE PROCEDURE Lab9_3
@Id_Student INTEGER = 99,
@nume_Student VARCHAR(50) = 'Roibu',
@prenume_Student VARCHAR(50) = 'Vitalie',
@birth_data DATE = '1999-01-03',
@address VARCHAR(500) = 'mun. Chisinau',
@cod_grupa VARCHAR(255) = 'TI171',
@Id_grupa INT = NULL OUTPUT
AS
INSERT INTO studenti
VALUES (@Id_Student, @nume_Student, @prenume_Student, @birth_data, @address)
INSERT INTO studenti_reusita
VALUES (@Id_Student, 105, 110, (SELECT Id_Grupa FROM grupe WHERE Cod_grupa=@cod_grupa), 'Reusita curenta', NULL, '2018-12-11')
EXEC Lab9_3
GO 
SELECT * FROM studenti



DROP FUNCTION IF EXISTS Ex_7_Lab9
GO
CREATE FUNCTION Ex_7_Lab9 (@Data_Nastere_Student DATE )
RETURNS INT
 BEGIN
 DECLARE @Student_Age INT
 SELECT @Student_Age = (SELECT (YEAR(GETDATE()) - YEAR(@Data_Nastere_Student) - CASE 
 						WHEN (MONTH(@Data_Nastere_Student) >= MONTH(GETDATE())) AND  DAY(@Data_Nastere_Student)> DAY(GETDATE())
						THEN  1
						ELSE  0
						END))
 RETURN @Student_Age
 END
 select dbo.Ex_7_Lab9('1995.06.23') as Vârsta_persoanei



