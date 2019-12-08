--- How many movies are longer than 3 hours long? 1,751
SELECT COUNT (*) FROM title_basics
WHERE runtime_minutes > '180'
AND title_type = 'movie';



--- How many movies came out after the year 2010? 131,696
SELECT COUNT (*) FROM title_basics
WHERE start_year > '2010'
AND title_type = 'movie';



--- What's the imdb ID for "The Dark Knight"? tt0468569
SELECT tconst FROM title_basics
WHERE primary_title LIKE 'The Dark Knight'
AND title_type = 'movie';



--- How many movies that came out after 2000 are both Comedies and Horrors? 943
--https://www.w3schools.com/sql/sql_wildcards.asp might help for this query
SELECT COUNT (*) FROM title_basics
WHERE start_year > '2000'
AND genres = 'Comedy,Horror'
AND title_type = 'movie';



--- What are the different kinds of title_types in this table? https://www.dofactory.com/sql/select-distinct
SELECT DISTINCT title_type FROM title_basics;



--- Of these title_types, which has the most records? The least records? http://www.postgresqltutorial.com/postgresql-count-function/
SELECT MAX(title_type) FROM title_basics;
SELECT MIN(title_type) FROM title_basics;



--- How many entries have separate primary_titles and original_titles? 91,394
SELECT COUNT (*) FROM title_basics
WHERE primary_title <> original_title;



--- How many characters long is the longest title? https://w3resource.com/PostgreSQL/length-function.php
-- Returns the character count of the longest title: 408
SELECT MAX(LENGTH(primary_title)) FROM title_basics;

-- Returns the longest title
SELECT primary_title FROM title_basics
WHERE length(primary_title) = (SELECT max(length(primary_title)) FROM title_basics);



--- How many titles are either documentaries from the 1800s or Comedies from 2018 that are less than one hour long?
SELECT COUNT (*) FROM title_basics
WHERE genres = 'Documentary' AND start_year BETWEEN '1800' AND '1899'
OR
genres = 'Comedy' AND start_year = '2018' and runtime_minutes < '60';



--- My favorite title is tt3467114 . Which title is it?
SELECT primary_title FROM title_basics
WHERE tconst = 'tt3467114'