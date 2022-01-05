--zadatak 1.
/*Ispisati inicijale te godinu rođenja studenata iz tablice 'student'. Ispisati ime i prezime
najstarije studentice.*/
SELECT SUBSTRING(firstname, 1, 1) AS Prvo_slovo_imena, SUBSTRING(lastname, 1, 1) AS Prvo_Slovo_Prezimena, birthdate
FROM employee

SELECT firstname, lastname,  MIN(ALL birthdate)
FROM employee

--zadatak 2.
/*Ispisati ukupni broj studenata iz tablice student. Ispisati koliko ima različitih inicijala u tablici
student. Ispisati iz koliko različitih mjesta dolaze studenti fakulteta.*/
SELECT COUNT(lastname)
FROM employee

SELECT COUNT(*)
FROM 
	(SELECT DISTINCT SUBSTRING(firstname, 1, 1), SUBSTRING(lastname, 1, 1) 
	 FROM employee)

--zadatak 3.
/*Ispisati prosječnu ocjenu svih položenih predmeta u tablici 'ispit.'*/
SELECT COUNT(DISTINCT city)
FROM employee

--zadatak 4.
SELECT name, AVG(unitprice)
FROM track
ORDER BY AVG(unitprice) DESC
