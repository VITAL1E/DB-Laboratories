-- Ex 1

CREATE VIEW NUME_PRENUME_ST 
      AS 
      SELECT studenti.id_student, studenti.Nume_Student, studenti.Prenume_Student
      FROM studenti.studenti
      WHERE studenti.Nume_Student like '%u'
      select * from NUME_PRENUME_ST
      --drop view NUME_PRENUME_ST;
      CREATE VIEW STUDENT_INFO 
      AS 
      SELECT studenti.studenti.Nume_Student, studenti.studenti.Prenume_Student, NOTA
      FROM studenti.studenti
      INNER JOIN studenti.studenti_reusita
      ON STUDENTI.Id_Student= studenti_reusita.Id_Student
      WHERE Nota > 6



-- Ex 2

  INSERT INTO NUME_PRENUME_ST (Id_Student,Nume_Student, Prenume_Student)
  VALUES (332,'Marius', 'Chetrusca')
  UPDATE NUME_PRENUME_ST SET Nume_Student='Lucianuu' WHERE Nume_Student='Suciu'
  DELETE FROM NUME_PRENUME_ST WHERE id_student=151 

  INSERT INTO profesori_new 
  VALUES (222,'MIRANILON', 'BOTHER', 'MUN. UNGHENI', 'STR. NICOLAE DONICI',12)
  UPDATE profesori_new SET Id_Profesor=150 WHERE Id_Profesor=221
  DELETE profesori_new WHERE Id_Profesor=150
  SELECT * FROM profesori_new
  SELECT * FROM NUME_PRENUME_ST



-- Ex 3

ALTER VIEW NUME_PRENUME_ST
  WITH SCHEMABINDING 
  AS 
  SELECT distinct studenti.id_student, studenti.Nume_Student, studenti.Prenume_Student
  FROM studenti.studenti
  WHERE studenti.Nume_Student like '%u'
  WITH CHECK OPTION;
  SELECT * FROM NUME_PRENUME_ST

  ALTER VIEW profesori_view 
  WITH SCHEMABINDING
  AS
  SELECT Nume_Profesor, Prenume_Profesor, Localitate
  FROM  dbo.profesori_new
  WHERE  (Localitate = 'mun. Chisinau') 
  WITH CHECK OPTION;
  SELECT * FROM profesori_view

  ALTER VIEW STUDENT_INFO 
  WITH SCHEMABINDING
  AS 
  SELECT DISTINCT studenti.studenti.Nume_Student, studenti.studenti.Prenume_Student, NOTA
  FROM studenti.studenti
  INNER JOIN studenti.studenti_reusita
  ON STUDENTI.Id_Student= studenti_reusita.Id_Student
  WHERE Nota>8
  WITH CHECK OPTION;
  SELECT * FROM STUDENT_INFO



-- Ex 4

  INSERT INTO NUME_PRENUME_ST
  VALUES( 22, 'Nicu','Ilianov')
  INSERT INTO profesori_view
  VALUES('Gheorghe', 'Leahu', 'mun. Chisinau')
  INSERT INTO STUDENT_INFO
  VALUES('MARIA', 'VELICOVA', 10)
  UPDATE STUDENT_INFO SET NOTA=8 WHERE Nota=10



-- Ex 5

WITH DISCIPLINE_CTE(Disciplina, AVERAGE)
  AS (
  Select plan_studii.discipline.disciplina, cast(avg(nota*1.0)as decimal(6,4)) as Average
  from studenti.studenti_reusita 
  INNER join plan_studii.discipline
  On studenti.studenti_reusita.Id_Disciplina=plan_studii.discipline.Id_Disciplina
  Group by  plan_studii.discipline.disciplina
  Having cast(avg(nota*1.0)as decimal(6,4)) < (
  Select cast(avg(nota*1.0)as decimal(6,4)) Average
  from studenti.studenti_reusita
  INNER JOIN plan_studii.discipline
  On studenti.studenti_reusita.Id_Disciplina=plan_studii.discipline.Id_Disciplina
  Where  plan_studii.discipline.disciplina='Baze de date')
      )
  SELECT Disciplina 
  FROM DISCIPLINE_CTE
  WHERE AVERAGE>6.7963


  with PROFESORI_CTE(NUME, PRENUME)
  AS
  (
   SELECT distinct cadre_didactice.profesori.Nume_Profesor, cadre_didactice.profesori.Prenume_Profesor
  FROM studenti.studenti_reusita
  INNER JOIN cadre_didactice.profesori
  ON studenti.studenti_reusita.Id_Profesor=cadre_didactice.profesori.Id_Profesor
  WHERE Id_Disciplina not in( 
  SELECT discipline.Id_Disciplina
  FROM plan_studii.discipline
  WHERE discipline.Nr_ore_plan_disciplina>60)
  )
  SELECT NUME, PRENUME
  FROM PROFESORI_CTE
  WHERE PRENUME LIKE '%n%'



-- Ex 6

DECLARE @GRAPH TABLE  
  (	ID_NODE SMALLINT,
    ID_EX_NODE SMALLINT,
    NAME_NODE VARCHAR(20)
  ) 
  INSERT @GRAPH
  VALUES 
       (3,NULL,'LEAF_3'),
       (2,3,'LEAF_2'),
       (2,4,'LEAF_2'),
       (4,NULL,'LEAF_4'),
       (1,2,'LEAF_1'),
       (0,1,'LEAF_0'),
       (0,5,'LEAF_0'),
       (5,NULL,'LEAF_5');
  WITH ORIENTED_GRAPH
  AS
  (
    SELECT *,3 AS INIT_NODE
    FROM @GRAPH
    WHERE ID_NODE=3
      AND ID_EX_NODE IS NULL
   UNION ALL 
    SELECT GRAPH.*, INIT_NODE - 1
    FROM @GRAPH AS GRAPH
    INNER JOIN ORIENTED_GRAPH
    ON GRAPH.ID_EX_NODE=ORIENTED_GRAPH.ID_NODE
    WHERE INIT_NODE>=0
  )
  SELECT * FROM ORIENTED_GRAPH
