SELECT within SELECT (SQLZOO)

1. List each country name where the population is larger than that of 'Russia'.

SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia')

2. Show the countries in Europe with a per capita GDP greater than 'United Kingdom'.

SELECT NAME
FROM   world
WHERE  continent = 'Europe'
       AND gdp / population > (SELECT gdp / population
                               FROM   world
                               WHERE  NAME = 'United Kingdom') ORDER BY NAME

3.List the name and continent of countries in the continents containing either Argentina or Australia. Order by name of the country.
SELECT NAME,
       continent
FROM   world
WHERE  continent IN (SELECT continent
                     FROM   world
                     WHERE  NAME = 'Argentina'
                             OR NAME = 'Australia') 

4. Which country has a population that is more than United Kingom but less than Germany? Show the name and the population.
SELECT NAME,
       population
FROM   world
WHERE  population > (SELECT population
                     FROM   world
                     WHERE  NAME = 'United Kingdom')
       AND population < (SELECT population
                         FROM   world
                         WHERE  NAME = 'Germany') 

5. Germany (population 80 million) has the largest population of the countries in Europe. Austria (population 8.5 million) has 11% of the population of Germany.

Show the name and the population of each country in Europe. Show the population as a percentage of the population of Germany.

SELECT NAME,
       Concat(Round(100 * population / (SELECT population
                                        FROM   world
                                        WHERE  NAME = 'Germany'), 1), '%')
FROM   world
WHERE  continent = 'Europe' 
