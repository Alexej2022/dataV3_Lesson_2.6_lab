#1 In the table actor, which are the actors whose last names are not repeated? For example if you would sort the data in the table actor by last_name, you would see that there is Christian Arkoyd, Kirsten Arkoyd, and Debbie Arkoyd. These three actors have the same last name. So we do not want to include this last name in our output. Last name "Astaire" is present only one time with actor "Angelina Astaire", hence we would want this in our output list.
#This query retrieves the last name and count of the last name from the 'actor' table and groups the results by last name. It also filters the results to only include last names that appear exactly once by using the HAVING clause with the condition "count(last_name) = 1".
USE sakila;
select last_name, count(last_name) as count_ln
from actor
group by last_name
having count(last_name) = 1 ;

#2 Which last names appear more than once? We would use the same logic as in the previous question but this time we want to include the last names of the actors where the last name was present more than once
# retrieves the last name and count of the last name from the 'actor' table and groups the results by last name. It also filters the results to only include last names that appear more than once by using the HAVING clause with the condition "count(last_name) > 1".
select last_name, count(last_name) as count_ln
from actor
group by  last_name
having count(last_name) > 1 ;

#3 Using the rental table, find out how many rentals were processed by each employee.
# This retrieves the staff ID and count of rental IDs from the 'rental' table and groups the results by staff ID. The result will show the number of rentals made by each staff member, as indicated by the count of rental IDs and the label "rentals".
select staff_id, count(rental_id) as rentals
from rental
group by staff_id;

#4 Using the film table, find out how many films were released each year.
#retrieves the release year and count of film IDs from the 'film' table and groups the results by release year. The result will show the number of films released in each year, as indicated by the count of film IDs and the label "films_releases".

select release_year, count(film_id) as films_releases
from film
group by release_year;

#5 Using the film table, find out for each rating how many films were there.
# This query  retrieves the rating and count of film IDs from the 'film' table and groups the results by rating. The result will show the number of films with each rating, as indicated by the count of film IDs and the label "films".
select rating, count(film_id) as films
from film
group by rating;

#6 What is the mean length of the film for each rating type. Round off the average lengths to two decimal places
# This query retrieves the rating, count of film IDs and the average length rounded to 2 decimal places from the 'film' table and groups the results by rating. The result will show the number of films with each rating, the average duration of films with each rating and the count of film IDs with the respective labels "films", "avg_duration".
select rating, count(film_id) as films, round(avg(length),2) as avg_duration
from film
group by rating;

#7 Which kind of movies (rating) have a mean duration of more than two hours?
# This query retrieves the rating, count of film IDs and the average length rounded to 2 decimal places from the 'film' table and groups the results by rating. It also filters the results to only include ratings for films with an average length greater than 120 minutes by using the HAVING clause with the condition "avg(length) > 120". The result will show the number of films with each rating, the average duration of films with each rating, and the count of film IDs with the respective labels "films", "avg_duration", for only those ratings where the average film length is greater than 120 minutes.
select rating, count(film_id) as films, round(avg(length),2) as avg_duration
from film
group by rating
having avg(length) > 120;

#8 Rank films by length (filter out the rows that have nulls or 0s in length column). In your output, only select the columns title, length, and the rank.
# retrieves the title, length, and a calculated length rank from the 'film' table. The length rank is calculated using a CASE statement and is determined by the length of the film, with values less than 60 being labeled as "short", values between 60 and 100 being labeled as "medium", and values greater than 100 being labeled as "long". The query only includes films with a non-null length value greater than 0, and the result is ordered by length in ascending order.
select title,
       length,
       case when length < 60 THEN 'short'
       when length between 60 AND 100 THEN 'medium'
       ELSE 'long' END as length_rank
from film
where length IS NOT NULL and length > 0
order by length;