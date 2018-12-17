### Task 1
Sa se creeze proceduri stocate in baza exercitiilor (2 exercitii) din capitolul 4. Parametrii de
intrare trebuie sa corespunda criteriilor din clauzele WHERE ale exercitiilor respective.

![lab9_1](https://user-images.githubusercontent.com/43314952/50061514-d10e8000-01a9-11e9-987c-c079c43b4f52.PNG)

![lab9_2](https://user-images.githubusercontent.com/43314952/50061529-f26f6c00-01a9-11e9-8904-2f8dce522fc2.PNG)

### Task 2
Sa se creeze o procedura stocata, care nu are niciun parametru de intrare și poseda un
parametru de ieșire. Parametrul de ieșire trebuie sa returneze numarul de studenti, care nu au
sustinut cel putin o forma de evaluare (nota mai mica de 5 sau valoare NULL).

![lab9_ 2](https://user-images.githubusercontent.com/43314952/50061558-33678080-01aa-11e9-8fbe-c09a677abe14.PNG)

### Task 3
Sa se creeze o procedura stocata, care ar insera in baza de date informatii despre un student
nou. In calitate de parametri de intrare sa serveasca datele personale ale studentului nou si
Cod_ Grupa. Sa se genereze toate intrarile-cheie necesare in tabelul studenti_reusita. Notele
de evaluare sa fie inserate ca NULL.

![lab9_3](https://user-images.githubusercontent.com/43314952/50061630-d7512c00-01aa-11e9-9343-cd1b17ffb6d7.PNG)

### Task 4
Fie ca un profesor se elibereaza din functie la mijlocul semestrului. Sa se creeze o procedura
stocata care ar reatribui inregistrarile din tabelul studenti_reusita unui alt profesor. Parametri
de intrare: numele si prenumele profesorului vechi, numele si prenumele profesorului nou,
disciplina. in cazul in care datele inserate sunt incorecte sau incomplete, sa se afiseze un
mesaj de avertizare.

![lab9_4](https://user-images.githubusercontent.com/43314952/50061657-0a93bb00-01ab-11e9-8c23-189df2e49b8e.PNG)

### Task 5
Sa se creeze o procedura stocata care ar forma o lista cu primii 3 cei mai buni studenti la o
disciplina, si acestor studenti sa le fie marita nota la examenul final cu un punct (nota
maximala posibila este 10). in calitate de parametru de intrare, va servi denumirea disciplinei.
Procedura sa returneze urmatoarele campuri: Cod_ Grupa, Nume_Prenume_Student,
Disciplina, Nota Veche, Nota Noua.

![lab9_5](https://user-images.githubusercontent.com/43314952/50061668-24350280-01ab-11e9-9d23-7ea2263c5c88.PNG)

### Task 6
Sa se creeze functii definite de utilizator in baza exercitiilor (2 exercitii) din capitolul 4.
Parametrii de intrare trebuie sa corespunda criteriilor din clauzele WHERE ale exercitiilor
respective.

![lab9_6_1](https://user-images.githubusercontent.com/43314952/50061685-3adb5980-01ab-11e9-8c97-026360cfde05.PNG)
![lab8_6_2](https://user-images.githubusercontent.com/43314952/50061693-47f84880-01ab-11e9-8a65-7265c3ed383f.PNG)

### Task 7
Sa se scrie funcția care ar calcula varsta studentului. Sa se definească următorul format al functiei:
<nume functie>(<Data_Nastere_Student>).

![lab9_7](https://user-images.githubusercontent.com/43314952/50061709-5cd4dc00-01ab-11e9-98ea-a4cbe143b93d.PNG)

### Task 8
Sa se creeze o functie definită de utilizator, care ar returna datele referitoare la reușita unui student. Se definește următorul format al functiei:
Să fie afișat tabelul cu următoarele câmpuri:Nume_Prenume_Student, Disticplina, Nota, Data_Evaluare.

![image](https://user-images.githubusercontent.com/43314952/50061729-82fa7c00-01ab-11e9-8431-9ecc37ed89a3.png)

### Task 9
Se cere realizarea unei funcții definite de utilizator, care ar găsi cel mai sârguincios sau cel mai slab student dintr-o grupă. Se definește următorul format al funcției: (, ). Parametrul poate accepta valorile "sârguincios" sau "slab", respectiv. Funcția să returneze un tabel cu următoarele câmpuri Grupa, Nume_Prenume_Student, Nota Medie , is_good. Nota Medie să fie cu precizie de 2 ecimale.

![lab9_9](https://user-images.githubusercontent.com/43314952/50061767-b2a98400-01ab-11e9-8362-33f1ac20f47b.PNG)
