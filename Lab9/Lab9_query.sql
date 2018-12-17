--- Ex 1

use universitatea2
go
drop procedure if exists procedure_1_ex16;
go
create procedure procedure_1_ex16
	@Nr_ore int = 60
as 
select distinct studenti.studenti.Nume_Student, studenti.studenti.Prenume_Student,studenti.studenti_reusita.Id_Profesor
from studenti.studenti_reusita ,studenti.studenti , plan_studii.discipline
where studenti.studenti_reusita.Id_Student= studenti.studenti.Id_student
and studenti.studenti_reusita.Id_Disciplina = plan_studii.discipline.Id_Disciplina
and plan_studii.discipline.Nr_ore_plan_disciplina < @Nr_ore;
execute procedure_1_ex16



-- Ex 2
 
use universitatea2
go
drop procedure if exists procedure_2_meu;
go
create procedure procedure_2_meu
	@nume varchar(255) = 'Dan',
	@prenume varchar(255) = 'David',
	@nota int = 9
as
select DISTINCT(plan_studii.discipline.Disciplina), plan_studii.discipline.Id_Disciplina, studenti.studenti_reusita.Nota
from studenti.studenti_reusita , studenti.studenti , plan_studii.discipline							
where studenti.studenti_reusita.Id_Student= studenti.studenti.Id_student
and studenti.studenti_reusita.Id_Disciplina= plan_studii.discipline.Id_Disciplina
and studenti.studenti.Nume_Student= @nume 
and studenti.studenti.Prenume_Student=@prenume 
and studenti.studenti_reusita.Nota = @nota
execute procedure_2_meu



--- Ex 2

DROP PROCEDURE IF EXISTS Ex_2Lab9;
GO

CREATE PROCEDURE Ex_2Lab9
   @nr_studenti SMALLINT = NULL OUTPUT
AS  
SELECT @nr_studenti =  COUNT(DISTINCT studenti.studenti_reusita.Id_Student) 
FROM studenti.studenti_reusita
WHERE Nota = NULL or Nota < 5 

DECLARE @nr_studenti SMALLINT
EXEC Ex_2Lab9 @nr_studenti OUTPUT
PRINT 'Numărul de studenti care nu au sustinut cel putin o forma de evaluare este = ' + cast(@nr_studenti as VARCHAR(255))



--- Ex 3

DROP PROCEDURE IF EXISTS Ex_3Lab9
GO
CREATE PROCEDURE Ex_3Lab9 
@Id_Student INTEGER =99,
@nume_Student VARCHAR(50)='Roibu',
@prenume_Student VARCHAR(50)='Vitalie',
@birth_data DATE='1999-01-03',
@address VARCHAR(500)='mun. Chisinau',
@cod_grupa VARCHAR (255)='FAF171',
@Id_grupa INT= NULL OUTPUT
AS
INSERT INTO studentii
VALUES (@Id_Student, @nume_Student, @prenume_Student, @birth_data, @address)
INSERT INTO reusita
VALUES (@Id_Student,105,110,(SELECT Id_Grupa from grupe where Cod_Grupa=@cod_grupa),'Reusita curenta', NULL,'2018-12-02')
EXEC Ex_3Lab9 
go
select * from studentii
select * from reusita where Id_Student=99



--- Ex 4

DROP PROCEDURE IF EXISTS Ex_4Lab9 
GO
CREATE PROCEDURE Ex_4Lab9 
@Nume_prof_vechi VARCHAR(255)= 'Avram',
@Prenume_prof_vechi VARCHAR(255)='Sanda',
@Nume_prof_nou VARCHAR(255)='Badiu',
@Prenume_prof_nou VARCHAR(255)='Alexandra',
@Disciplina VARCHAR(255)= 'Proiectarea sistemelor informatice'

AS
IF exists ( SELECT * FROM reusita  WHERE Id_Disciplina = (SELECT Id_Disciplina 
															FROM disciplinele
															WHERE Disciplina= @Disciplina)
									and Id_Profesor = (SELECT Id_Profesor 
													   FROM cadre_didactice.profesori
													   where Nume_Profesor = @Nume_prof_vechi and Prenume_Profesor= @Prenume_prof_vechi)
		  )								         
BEGIN 
UPDATE cadre_didactice.profesori SET Nume_Profesor = @Nume_prof_nou,
									Prenume_Profesor=@Prenume_prof_nou where Nume_Profesor = @Nume_prof_vechi
																			and Prenume_Profesor = @Prenume_prof_vechi
END
ELSE BEGIN  PRINT 'Something went wrong, check the input parameters'
END
EXEC Ex_4Lab9
select * from cadre_didactice.profesori 


select *
from cadre_didactice.profesori
where Nume_Profesor='Avram' and Prenume_Profesor='Sanda'
select *
from cadre_didactice.profesori,reusita
where cadre_didactice.profesori.Id_Profesor= reusita.Id_Profesor
and Nume_Profesor='Badiu' and Prenume_Profesor='Alexandra'



--- Ex 5

DROP PROCEDURE IF EXISTS Ex_5Lab9
GO
CREATE PROCEDURE Ex_5Lab9 
@disciplina VARCHAR(50)='Sisteme de operare'
AS
DECLARE @studentList TABLE (Id_Student int, Media float)
INSERT INTO @studentList
	SELECT TOP (3) reusita.Id_Student, AVG(cast (Nota as float)) as Media
	FROM reusita, disciplinele
	WHERE disciplinele.Id_Disciplina = reusita.Id_Disciplina
	AND Disciplina = @disciplina
	GROUP BY reusita.Id_Student
	ORDER BY Media desc		
SELECT cod_grupa,
	studentii.Id_Student, 
	CONCAT(Nume_Student, ' ', Prenume_Student) as Nume, 
	Disciplina, 
	nota AS Nota_Veche, 
	iif(nota > 9, 10, nota + 1) AS Nota_Noua 
    FROM reusita, disciplinele, grupe, studentii
	WHERE disciplinele.id_disciplina = reusita.id_disciplina
	AND grupe.Id_Grupa = reusita.Id_Grupa
	AND  studentii.Id_Student = reusita.Id_Student
	AND studentii.Id_Student in (select Id_Student from @studentList)
	AND Disciplina = @disciplina
	AND Tip_Evaluare = 'Examen'
DECLARE @id_Disciplina SMALLINT =(SELECT  Id_Disciplina  FROM disciplinele
                                  WHERE   Disciplina = @disciplina)
UPDATE reusita
SET reusita.Nota = (CASE WHEN nota >= 9 THEN 10 ELSE nota + 1 END)
WHERE Tip_Evaluare = 'Examen'
AND Id_Disciplina = @id_Disciplina
AND Id_Student in (select Id_Student from @studentList)
go

execute Ex_5Lab9



--- Ex 6

DROP FUNCTION IF EXISTS Ex_6_1_Lab9
GO
CREATE FUNCTION Ex_6_1_Lab9 (@Nr_ore_pe_disciplina  SMALLINT )
RETURNS TABLE
AS
RETURN
(select distinct studentii.Nume_Student, studentii.Prenume_Student, reusita.Id_Profesor
from reusita , studentii , plan_studii.discipline
where reusita.Id_Student= studentii.Id_student
 and reusita.Id_Disciplina = plan_studii.discipline.Id_Disciplina
 and Nr_ore_plan_disciplina < @Nr_ore_pe_disciplina)
go
select *from Ex_6_1_Lab9(60)

DROP FUNCTION IF EXISTS Ex_6_2_Lab9
GO
CREATE FUNCTION Ex_6_2_Lab9 (@Numele_Student VARCHAR(55),@Prenume_Student VARCHAR(55), @Nota SMALLINT )
RETURNS TABLE
AS
RETURN
(select DISTINCT(plan_studii.discipline.Disciplina), plan_studii.discipline.Id_Disciplina, reusita.Nota
from reusita , studentii , plan_studii.discipline							
where reusita.Id_Student= studentii.Id_student
and reusita.Id_Disciplina= plan_studii.discipline.Id_Disciplina
and studentiI.Nume_Student= @Numele_Student 
and studentii.Prenume_Student= @Prenume_Student
and reusita.Nota = @Nota)

select * from Ex_6_2_Lab9 ('Dan','David',9)



--- Ex 7

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



--- Ex 8

DROP FUNCTION IF EXISTS Ex_8_Lab9
 GO
CREATE FUNCTION Ex_8_Lab9(@Nume_Prenume_Student VARCHAR(255))
RETURNS TABLE
AS
RETURN
(SELECT CONCAT(Nume_Student,'  ', Prenume_Student) AS Nume_Prenume_Student ,Disciplina, Nota, Data_Evaluare
FROM reusita, studentii, plan_studii.discipline 
WHERE reusita.Id_Student=studentii.Id_Student
	and  plan_studii.discipline.Id_Disciplina=reusita.Id_Disciplina
	and reusita.Id_Student = ( SELECT Id_Student FROM studentii WHERE CONCAT(Nume_student,'  ',Prenume_student)= @Nume_Prenume_Student)
)
GO
DECLARE @NUME_PRENUME_STUDENT VARCHAR(255)
SET @NUME_PRENUME_STUDENT=(SELECT CONCAT(Nume_Student,'  ',Prenume_Student)
						FROM studentii
						WHERE studentii.Nume_Student='Danci')
SELECT * FROM  Ex_8_Lab9(@NUME_PRENUME_STUDENT)



--- Ex 9

DROP FUNCTION IF EXISTS Ex_9_Lab9
GO 
CREATE FUNCTION Ex_9_Lab9(@Cod_Grupa VARCHAR(50), @Is_Good VARCHAR(50))
RETURNS @TABLE TABLE
        (Nume_Prenume_Student VARCHAR(255), Cod_Grupa VARCHAR(10), Nota_Medie DECIMAL(4,2), Is_Good VARCHAR(20)) AS
BEGIN
IF @Is_Good IN ('Sarguincios')
   INSERT @TABLE
   SELECT top(1) CONCAT(Nume_Student,' ',Prenume_Student) AS Nume_Prenume_Student, Cod_Grupa AS Grupa, cast(avg(nota*1.0)as decimal(4,2)) AS Nota_Medie, @Is_Good AS Is_Good
    FROM reusita, grupe,studentii 
	WHERE reusita.Id_Student=studentii.Id_Student 
		  and reusita.Id_Grupa=grupe.Id_Grupa
		  and Cod_grupa= @COD_GRUPA
		  AND Nota IS NOT NULL
	GROUP BY Nume_Student,Prenume_Student,Cod_Grupa
	ORDER BY Nota_Medie DESC
ELSE IF @Is_Good IN ('Slab')
    INSERT @TABLE
	SELECT top(1) CONCAT(Nume_Student,' ',Prenume_Student) AS Nume_Prenume_Student, Cod_Grupa AS Grupa, cast(avg(nota*1.0)as decimal(4,2)) AS Nota_Medie, @Is_Good AS Is_Good
    FROM reusita, grupe,studentii 
	WHERE reusita.Id_Student=studentii.Id_Student 
		  and reusita.Id_Grupa=grupe.Id_Grupa
		  and Cod_grupa= @COD_GRUPA
		  AND Nota IS NOT NULL
	GROUP BY Nume_Student,Prenume_Student,Cod_Grupa
	ORDER BY Nota_Medie ASC
RETURN
END
GO
SELECT * FROM Ex_9_Lab9('INF171','Sarguincios')
SELECT * FROM Ex_9_Lab9('INF171','Slab')