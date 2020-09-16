/*SELECT NAMES

Pattern Matching Strings
This tutorial uses the LIKE operator to check names. We will be using the SELECT command on the table world:
*/

--1#
/*
You can use WHERE name LIKE 'B%' to find the countries that start with "B".

The % is a wild-card it can match any characters
Find the country that start with Y
*/
SELECT name FROM world
  WHERE name LIKE 'Y%'

--2# 
/*
Find the countries that end with y
*/

SELECT name FROM world
  WHERE name LIKE '%Y'
  
--3#
/*
Luxembourg has an x - so does one other country. List them both.

Find the countries that contain the letter x
*/
SELECT name FROM world
  WHERE name LIKE '%X%'
  
--4#
/*
Iceland, Switzerland end with land - but are there others?

Find the countries that end with land
*/
SELECT name FROM world
  WHERE name LIKE '%LAND'

--5#
/*
Columbia starts with a C and ends with ia - there are two more like this.

Find the countries that start with C and end with ia
*/
SELECT name FROM world
  WHERE name LIKE 'C%ia'

--6#
/*
Greece has a double e - who has a double o?

Find the country that has oo in the name
*/
SELECT name FROM world
  WHERE name LIKE '%oo%'

--7#
/*
Bahamas has three a - who else?

Find the countries that have three or more a in the name
*/
SELECT name FROM world
  WHERE name LIKE '%a%a%a%'
