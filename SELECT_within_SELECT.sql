--All answers here are to this link: https://sqlzoo.net/wiki/SELECT_within_SELECT_Tutorial

--All answers here i got the smiley face

--1#
/*
List each country name where the population is larger than that of 'Russia'.

world(name, continent, area, population, gdp)
*/
SELECT name 
FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia')
--2#
/*
Show the countries in Europe with a per capita GDP greater than 'United Kingdom'.

Per Capita GDP
The per capita GDP is the gdp/population
*/
SELECT name
FROM world
  WHERE continent = 'Europe'
   AND gdp/population > (SELECT gdp/population FROM world
                         WHERE name = 'United Kingdom')

--3#
/*
List the name and continent of countries in the continents containing either Argentina or Australia. Order by name of the country.
*/
SELECT name, continent
FROM world
  WHERE continent = (SELECT continent FROM world WHERE name = 'Argentina') 
  OR continent = (SELECT continent FROM world WHERE name = 'Australia')
ORDER BY name

--4#
/*
Which country has a population that is more than Canada but less than Poland? Show the name and the population.
*/
SELECT name, population
FROM world
 WHERE population > (SELECT population FROM world WHERE name = 'Canada')
 AND population < (SELECT population FROM world WHERE name = 'Poland')
 
 --5#
/*
Germany (population 80 million) has the largest population of the countries in Europe. Austria (population 8.5 million) has 11% of the population of Germany.

Show the name and the population of each country in Europe. Show the population as a percentage of the population of Germany.

The format should be Name, Percentage for example:

name	  percentage
Albania	3%
Andorra	0%
Austria	11%
...	    ...
Decimal places
You can use the function ROUND to remove the decimal places.

Percent symbol %
You can use the function CONCAT to add the percentage symbol.
*/
SELECT name,                                                             
       CONCAT(ROUND(100*population/(SELECT population                    --This within SELECT give us the population of Germany
                                    FROM world                           --ROUND(100*germanypopulation) give us the the population of Germany in percentage
                                    WHERE name = 'Germany')),'%')        --CONCAT(percentagegermanypopulation, '%') add the % after the percentage value
FROM world                                                               --We want the name of these country (first SELECT) FROM world, WHERE continent = 'Europe'
WHERE continent = 'Europe'



