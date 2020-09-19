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
