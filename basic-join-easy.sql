-- Given CITY and COUNTRY tables, query the names of all cities where the CONTINENT is 'Africa'.
-- CITY.CountryCode and COUNTRY.Code are matching key columns
SELECT city.name
FROM city
JOIN country
ON city.countryCode = country.code
WHERE country.continent = 'Africa';

-- query the sum of the populations of all cities where the CONTINENT is 'Asia'
SELECT SUM(city.population)
FROM city
JOIN country
ON city.countryCode = country.code
WHERE country.continent = 'Asia';

-- query the names of all the continents and their average city populations rounded down to the nearest integer
SELECT
    country.continent,
    FLOOR(AVG(city.population))
FROM city
JOIN country
ON city.countryCode = country.code
GROUP BY country.continent;