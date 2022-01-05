--SQL exercises - Simple SELECT statement

--1.Find the model number, speed and hard drive capacity for all the PCs with prices below $500. Result set: model, speed, hd.
SELECT model,speed,hd
FROM pc
WHERE price < 500

--2.List all printer makers. Result set: maker.
SELECT DISTINCT maker
FROM product
WHERE type = 'printer'

--3.Find the model number, RAM and screen size of the laptops with prices over $1000.
SELECT model, ram, screen
FROM laptop
WHERE price > 1000

--4.Find all records from the Printer table containing data about color printers.
SELECT *
FROM printer
WHERE color = 'y'

--5.Find the model number, speed and hard drive capacity of PCs cheaper than $600 having a 12x or a 24x CD drive.
SELECT model, speed, hd
FROM pc
WHERE price < 600 AND (cd = '12x' OR cd = '24x')

--6.For each maker producing laptops with a hard drive capacity of 10 Gb or higher, find the speed of such laptops. Result set: maker, speed.
