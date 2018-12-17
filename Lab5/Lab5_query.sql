USE universitatea

DECLARE @N1 int , @N2 int, @N3 int;
DECLARE @MAI_MARE int;
SET @N1 = 60 * RAND();
SET @N2 = 60 * RAND();
SET @N3 = 60 * RAND();
SET @MAI_MARE = @N1;
IF @MAI_MARE < @N2
   SET @MAI_MARE = @N2;
IF @MAI_MARE < @N3
   SET @MAI_MARE = @N3;

PRINT @N1;
PRINT @N2;
PRINT @N3;
PRINT 'Mai mare = ' + CAST(@MAI_MARE AS VARCHAR(2));





DECLARE @nume_disciplina VARCHAR(20) = 'Baze de date'
DECLARE @test VARCHAR(20) = 'Testul 1'
DECLARE @note TABLE (nota INT)

INSERT INTO @note(nota) VALUES (6)
INSERT INTO @note(nota) VALUES (8)

SELECT DISTINCT TOP 10 studenti.Nume_Student, studenti.Prenume_Student
FROM studenti_reusita 
	INNER JOIN studenti
		ON studenti_reusita.Id_Student = studenti.Id_Student
	INNER JOIN discipline 
		ON discipline.Id_Disciplina = studenti_reusita.Id_Disciplina
WHERE discipline.Disciplina = @nume_disciplina AND studenti_reusita.Tip_Evaluare = @test
	AND studenti_reusita.Nota NOT IN (SELECT nota FROM @note)




DECLARE @N1 INT , @N2 INT, @N3 INT;
DECLARE @MAI_MARE INT;
SET @N1 = 60 * RAND();
SET @N2 = 60 * RAND();
SET @N3 = 60 * RAND();
SET @MAI_MARE = @N1;
SET @MAI_MARE = CASE 
WHEN  @MAI_MARE < @N2 AND @N3 < @N2
THEN  @N2
WHEN @MAI_MARE < @N3 and @N2<@N3
THEN  @N3
ELSE @MAI_MARE
END   
PRINT @N1;
PRINT @N2;
PRINT @N3;
PRINT 'Mai mare = ' + CAST( @MAI_MARE AS VARCHAR(2));





DECLARE @N1 INT , @N2 INT, @N3 INT;
DECLARE @MAI_MARE INT;
SET @N1 = 60 * RAND();
SET @N2 = 60 * RAND();
SET @N3 = 60 * RAND() ;
SET @MAI_MARE = @N1;

BEGIN TRY
IF @N1 = @N2 OR @N1 = @N3 OR @N2 = @N3 
    RAISERROR ('Some numbers have the same value', 1,1)
ELSE
BEGIN
IF @MAI_MARE < @N2
   SET @MAI_MARE = @N2;
IF @MAI_MARE < @N3
   SET @MAI_MARE = @N3;
PRINT @N1;
PRINT @N2;
PRINT @N3;
PRINT 'Mai mare = ' + CAST(@MAI_MARE AS VARCHAR(2));
END
END TRY

BEGIN CATCH
PRINT 'Error occured' 
PRINT 'Details of error'
PRINT 'Number of error:' + CAST(ERROR_NUMBER() AS VARCHAR(20))
PRINT 'Level of severity:' + CAST(ERROR_SEVERITY() AS VARCHAR(20))
PRINT 'Error status:' + CAST(ERROR_STATE() AS VARCHAR(20))
PRINT 'Error line:' + CAST(ERROR_LINE() AS VARCHAR(20))
END CATCH






DECLARE @Tip_Evaluare VARCHAR(20) = 'Testul 1' ;
DECLARE @Nume_Disciplina VARCHAR(20)= 'Baze de date';

BEGIN TRY

IF @Tip_Evaluare = null 
  RAISERROR ('Tip_Evaluare is not known',3,3)
ELSE IF @Nume_Disciplina = null
  RAISERROR ('Nume_Disciplina is not known',3,3)

ELSE
SELECT TOP 10 Nume_Student, Prenume_Student 
FROM studenti
WHERE Id_Student IN (	
	SELECT IIF(Nota <> 6 AND Nota <> 8, Id_Student, null)
	 FROM studenti_reusita, discipline
	WHERE studenti_reusita.Id_Disciplina = discipline.Id_Disciplina
	AND Tip_Evaluare = @Tip_Evaluare AND Disciplina = @Nume_Disciplina
)
END TRY
BEGIN CATCH
PRINT 'Error occured' 
PRINT 'Details of error'
PRINT 'Number of error:' + CAST(ERROR_NUMBER() AS VARCHAR(20))
PRINT 'Level of severity:' + CAST(ERROR_SEVERITY() AS VARCHAR(20))
PRINT 'Error status:' + CAST(ERROR_STATE() AS VARCHAR(20))
PRINT 'Error line:' + CAST(ERROR_LINE() AS VARCHAR(20))
END CATCH