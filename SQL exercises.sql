--SQL exercises - Simple SELECT statement

--1.Find the model number, speed and hard drive capacity for all the PCs with prices below $500. Result set: model, speed, hd.
SELECT model,speed,hd
FROM PC
WHERE price < 500

--2.List all printer makers. Result set: maker.
SELECT DISTINCT maker
FROM Product
WHERE type = 'printer'

--3.Find the model number, RAM and screen size of the laptops with prices over $1000.
SELECT model, ram, screen
FROM Laptop
WHERE price > 1000

--4.Find all records from the Printer table containing data about color printers.
SELECT *
FROM Printer
WHERE color = 'y'

--5.Find the model number, speed and hard drive capacity of PCs cheaper than $600 having a 12x or a 24x CD drive.
SELECT model, speed, hd
FROM PC
WHERE price < 600 AND (cd = '12x' OR cd = '24x')

--6.For each maker producing laptops with a hard drive capacity of 10 Gb or higher, find the speed of such laptops. Result set: maker, speed.
SELECT DISTINCT Product.maker, Laptop.speed
FROM Product, Laptop
WHERE Laptop.model = Product.model AND hd >= 10

--7.Get the models and prices for all commercially available products (of any type) produced by maker B.
SELECT Product.model, PC.price
FROM PC INNER JOIN Product 
ON PC.model = Product.model
WHERE Product.maker = 'B'
UNION
SELECT Product.model, Laptop.price
FROM Laptop INNER JOIN Product 
ON Laptop.model = Product.model
WHERE Product.maker = 'B'
UNION
SELECT Product.model, Printer.price
FROM Printer INNER JOIN Product 
ON Printer.model = Product.model
WHERE Product.maker = 'B'

--8.Find the makers producing PCs but not laptops.
SELECT maker
FROM Product
WHERE type = 'pc'
EXCEPT
  SELECT maker 
  FROM Product 
  WHERE type = 'laptop'

--9.Find the makers of PCs with a processor speed of 450 MHz or more. Result set: maker.
SELECT maker
FROM Product LEFT JOIN PC 
ON Product.model = PC.model
WHERE PC.speed >= 450
GROUP BY maker

--10.Find the printer models having the highest price. Result set: model, price.
SELECT model, price
FROM Printer
WHERE price = (
	SELECT MAX(price) 
	FROM Printer
)
--11.Find out the average speed of PCs.
SELECT AVG(speed) as Average_Speed
FROM PC

--12.Find out the average speed of the laptops priced over $1000.
SELECT AVG(speed) AS Average_Speed
FROM Laptop
WHERE price > 1000

--13.Find out the average speed of the PCs produced by maker A.
SELECT AVG(pc.speed) AS Average_Speed
FROM Product LEFT JOIN PC
ON Product.model = PC.model
WHERE Product.maker = 'A'

--14.For the ships in the Ships table that have at least 10 guns, get the class, name, and country.
SELECT Ships.class, Ships.name, Classes.country
FROM Classes, Ships
WHERE Classes.class = Ships.class AND Classes.numGuns >= 10

--15.Get hard drive capacities that are identical for two or more PCs. Result set: hd.
SELECT hd
FROM PC
GROUP BY hd
HAVING COUNT(hd) >= 2

--16.Get pairs of PC models with identical speeds and the same RAM capacity. Each resulting pair should be displayed only once, i.e. (i, j) but not (j, i).
SELECT DISTINCT pc1.model, pc2.model, pc1.speed, pc1.ram
FROM PC AS pc1 JOIN PC AS pc2
ON pc1.speed = pc2.speed AND pc1.ram = pc2.ram
WHERE pc1.model > pc2.model

--17.Get the laptop models that have a speed smaller than the speed of any PC. Result set: type, model, speed.
