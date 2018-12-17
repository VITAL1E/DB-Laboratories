### Task 1
Creati o diagrama a bazei de date, folosind forma de vizualizare standard, structura căreia este
descrisă la inceputul sarcinilor practice din capitolul 4.

![lab7_1](https://user-images.githubusercontent.com/43314952/50063115-85f96a80-01b3-11e9-8c53-41cbb077da11.PNG)

### Task 2
Să se adauge constrângeri referențiale (legate cu tabelele studenti și profesori) necesare
coloanelor Sef_grupa și Prof_Indrumător (sarcina3, capitolul 6) din tabelul grupe.

![lab7_2](https://user-images.githubusercontent.com/43314952/50063126-8c87e200-01b3-11e9-9608-ddc00e0b2427.PNG)

### Task 3
La diagrama construitii, sa se adauge și tabelul orarul definit in capitolul 6 al acestei lucrari:
tabelul orarul contine identificatorul disciplinei (ld_Disciplina), identificatorul profesorului
(Id_Profesor) și blocul de studii (Bloc). Cheia tabelului este constituita din trei cfunpuri:
identificatorul grupei (Id_ Grupa), ziua lectiei (Z1), ora de inceput a lectiei (Ora) , sala unde
are loc lectia (Auditoriu).

![lab7_3](https://user-images.githubusercontent.com/43314952/50063124-8c87e200-01b3-11e9-90fb-699ac3793a8c.PNG)

### Task 4
Tabelul orarul trebuie sa contina ~i 2 chei secundare: (Zi, Ora, Id_ Grupa, Id_ Profesor) ~i
(Zi, Ora, ld_Grupa, ld_Disciplina).

![lab7_4](https://user-images.githubusercontent.com/43314952/50063125-8c87e200-01b3-11e9-9120-eb00e1d4398e.PNG)

### Task 5
În diagrama, de asemenea, trebuie sa se defineasca constrangerile referentiale (FK-PK) ale
atributelor ld_Disciplina, ld_Profesor, Id_ Grupa din tabelului orarul cu atributele tabelelor respective.

![lab7_5](https://user-images.githubusercontent.com/43314952/50063237-22bc0800-01b4-11e9-9be0-7d13c52481ed.PNG)

### Task 6
Creati, in baza de date universitatea, trei scheme noi: cadre_didactice, plan_studii ~i studenti.
Transferati tabelul profesori din schema dbo in schema cadre didactice, tinand cont de
dependentelor definite asupra tabelului mentionat. in același mod să se trateze tabelele orarul,
discipline care apartin schemei plan_studii și tabelele studenti, studenti_reusita, care apartin
schemei studenti. Se scrie instructiunile SQL respective.

![lab7_6](https://user-images.githubusercontent.com/43314952/50063157-bb05bd00-01b3-11e9-944a-6aea1e3f122b.PNG)

### Task 7
Modificati 2-3 interogari asupra bazei de date universitatea prezentate in capitolul 4 astfel ca
numele tabelelor accesate sa fie descrise in mod explicit, tinand cont de faptul ca tabelele au
fost mutate in scheme noi.

![lab7_7](https://user-images.githubusercontent.com/43314952/50063251-323b5100-01b4-11e9-97e7-ed51c55677ee.PNG)

### Task8
Creati sinonimele respective pentru a simplifica interogarile construite in exercitiul precedent
și reformulati interogarile, folosind sinonimele create.

![lab7_8](https://user-images.githubusercontent.com/43314952/50063262-3d8e7c80-01b4-11e9-9fbb-b27c80c13be1.PNG)
