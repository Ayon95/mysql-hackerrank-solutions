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