SELECT *
FROM employee
ORDER BY birthdate ASC

SELECT firstname,lastname,birthdate
FROM employee
WHERE birthdate < '1973-08-29 00:00:00'
ORDER BY lastname ASC

SELECT customer.firstname, customer.lastname, customer.city, employee.firstname, employee.lastname, employee.city
FROM customer, employee
WHERE customer.city = employee.city
