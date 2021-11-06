-- select all fields of American cities from CITY table with population larger than 10000
select *
from CITY
where COUNTRYCODE = 'USA' and POPULATION > 100000;

-- select the NAME field of American cities from CITY table with population larger than 120000
select NAME
from CITY
where COUNTRYCODE = 'USA' and POPULATION > 120000;

-- select the city whose id is 1661
select * from CITY where ID = 1661;

-- select CITY and STATE fields from the STATION table
select CITY, STATE from STATION;

-- get a list of city names from STATION table for cities that have an even ID number
-- exclude duplicates from the result set
select distinct CITY
from STATION
where ID % 2 = 0;

-- get the difference between the total number of CITY records and the number of distinct CITY records
select count(CITY) - count(distinct CITY)
from STATION;

-- generate a result set containing the name and letter count of the smallest and the largest city
-- if there are multiple smallest or largest cities, then choose the first one when ordered alphabetically
(select CITY, char_length(CITY)
from STATION
order by char_length(CITY), CITY
limit 1)
union
(select CITY, char_length(CITY)
from STATION
order by char_length(CITY) desc, CITY
limit 1);

-- query a list of city names that start with vowels (a, e, i, o, u)
-- exclude duplicates
select distinct CITY
from STATION
where CITY like 'a%' or CITY like 'e%' or CITY like 'i%' or CITY like 'o%' or CITY like 'u%';
-- solution using regexp
select distinct CITY
from STATION
where CITY regexp '^[aeiou].*';

-- query a list of city names that end with vowels (a, e, i, o, u)
-- exclude duplicates
select distinct CITY
from STATION
where CITY regexp '.*[aeiou]$';

-- query a list of city names that start and end with vowels (a, e, i, o, u)
-- exclude duplicates
select distinct CITY
from STATION
where CITY regexp '^[aeiou].*[aeiou]$';

-- query a list of city names that do not start with vowels (a, e, i, o, u)
-- exclude duplicates
select distinct CITY
from STATION
where CITY regexp '^[^aeiou].*';

-- query a list of city names that do not end with vowels (a, e, i, o, u)
-- exclude duplicates
select distinct CITY
from STATION
where CITY regexp '.*[^aeiou]$';

-- query a list of city names that do not start with vowels or end with vowels (a, e, i, o, u)
-- exclude duplicates
select distinct CITY
from STATION
where CITY regexp '^[^aeiou].*' or CITY regexp '.*[^aeiou]$';

-- select the names of students who have more than 75 marks
-- order the result set by the last three letters of a student's name
-- in case, multiple students have names with similar last three letters, then sort them by id (ascending)
SELECT name
FROM students
WHERE marks > 75
ORDER BY SUBSTRING(name, -3), id;

-- select the names of employees whose salary is more than $2000 and have been employed for less than 10 months
-- order the result set by employee id (ascending)
SELECT name
FROM employee
WHERE salary > 2000 AND months < 10
ORDER BY employee_id;

