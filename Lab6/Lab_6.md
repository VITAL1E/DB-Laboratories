### Task 1
Sa se scrie o instructiune T-SQL, care ar popula co Joana Adresa _ Postala _ Profesor din tabelul profesori cu valoarea 'mun. Chisinau', unde adresa este necunoscuta.

![lab6_1](https://user-images.githubusercontent.com/43314952/50062699-43cf2980-01b1-11e9-8d05-6ffbd1df8f0f.PNG)

### Task 2
Sa se modifice schema tabelului grupe, ca să corespundă următoarelor cerințe:
a) Câmpul Cod_ Grupa să accepte numai valorile unice și sâ nu accepte valori necunoscute.
b) Sa se țina cont ca cheie primarii, deja, este definiții asupra coloanei Id_ Grupa.

![lab6_2](https://user-images.githubusercontent.com/43314952/50062708-4f225500-01b1-11e9-9949-abffe510ca1d.PNG)

### Task 3
La tabelul grupe, sa se adauge 2 coloane noi Sef_grupa și Prof_Indrumator, ambele de tip INT. Să se populeze cmpurile nou-create ### cu cele mai potrivite candidaturi in baza criteriilor de mai jos:
a) Șeful grupei trebuie sa aibă cea mai bună reușită (medie) din grupă la toate formele de evaluare și la toate disciplinele. Un student nu poate fi șef de grupă la mai multe grupe.
b) Profesorul îndrumător trebuie sa predea un număr maximal posibil de discipline la grupa dată. Daca nu există o singură candidatură, care corespunde primei cerințe, atunci este ales din grupul de candidați acel cu identificatorul (Id_Profesor) minimal. Un profesor nu poate fi indrumător la mai multe grupe.
c) Să se scrie instrucțiunile ALTER, SELECT, UPDATE necesare pentru crearea coloanelor în tabelul grupe, pentru selectarea candidaților și inserarea datelor.

![lab6_3](https://user-images.githubusercontent.com/43314952/50062714-58abbd00-01b1-11e9-863a-650aa3db7472.jpg)

### Task 4
Să se scrie o instrucțiune T-SQL, care ar mări toate notele de evaluare șefilor de grupe cu un
punct. Nota maximală (10) nu poate fi mărită.

![lab6_4](https://user-images.githubusercontent.com/43314952/50062728-695c3300-01b1-11e9-84a7-0d062556b4f9.PNG)

### Task 5
Să se creeze un tabel profesori_new, care include urmatoărele coloane: Id_Profesor,
Nume _ Profesor, Prenume _ Profesor, Localitate, Adresa _ 1, Adresa _ 2.
a) Coloana Id_Profesor trebuie să fie definită drept cheie primară și, in baza ei, să fie construit un index CLUSTERED.
b) Câmpul Localitate trebuie să posede proprietatea DEFAULT= 'mun. Chisinau'.
c) Sa se insereze toate datele din tabelul profesori in tabelul profesori_new. Să se scrie, cu acest scop, un număr potrivit de instrucțiuni T-SQL.

![lab6_5](https://user-images.githubusercontent.com/43314952/50062794-be984480-01b1-11e9-8e6f-8f1480983de3.PNG)

### Task 6
Să se insereze datele in tabelul orarul pentru Grupa= 'CIBJ 71' (Id_ Grupa= 1) pentru ziua de luni. Toate lecțiile vor avea loc in ### blocul de studii 'B'. Mai jos, sunt prezentate detaliile de inserare:
(ld_Disciplina = 107, Id_Profesor= 101, Ora ='08:00', Auditoriu = 202);
(Id_Disciplina = 108, Id_Profesor= 101, Ora ='11:30', Auditoriu = 501);
(ld_Disciplina = 119, Id_Profesor= 117, Ora ='13:00', Auditoriu = 501);

![lab6_6](https://user-images.githubusercontent.com/43314952/50062764-9d375880-01b1-11e9-94b9-db0588215612.PNG)

### Task 7
Să se scrie expresiile T-SQL necesare pentru a popula tabelul orarul pentru grupa INFl 71 ,ziua de luni.
Datele necesare pentru inserare trebuie sa fie colectate cu ajutorul instrucțiunii/instrucțiunilor
SELECT și introduse in tabelul-destinatie, știind că:
lectie #1 (Ora ='08:00', Disciplina = 'Structuri de date si algoritmi', Profesor ='Bivol Ion')
lectie #2 (Ora ='11 :30', Disciplina = 'Programe aplicative', Profesor ='Mircea Sorin')
lectie #3 (Ora ='13:00', Disciplina ='Baze de date', Profesor = 'Micu Elena')

![lab6_7](https://user-images.githubusercontent.com/43314952/50062739-77aa4f00-01b1-11e9-9c0c-f52ea7976e6a.PNG)
