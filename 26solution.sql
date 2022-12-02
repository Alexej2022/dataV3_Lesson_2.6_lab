# Lab 26 solution 
#1 In the table actor, which are the actors whose last names are not repeated? For example if you #1would sort the data in the table actor by last_name, you would see that there is Christian Arkoyd, #1Kirsten Arkoyd, and Debbie Arkoyd. These three actors have the same last name. So we do not #1want to include this last name in our output. Last name "Astaire" is present only one time with #1 #1actor "Angelina Astaire", hence we would want this in our output list.
#2 Which last names appear more than once? We would use the same logic as in the previous #2 #2question but this time we want to include the last names of the actors where the last name was #2 #2present more than once
#3 Using the rental table, find out how many rentals were processed by each employee.
#4Using the film table, find out how many films were released each year.
#5Using the film table, find out for each rating how many films were there.
#6What is the mean length of the film for each rating type. Round off the average lengths to two #decimal places
#7Which kind of movies (rating) have a mean duration of more than two hours?
#8Rank films by length (filter out the rows that have nulls or 0s in length column). In your output, #1only select the columns title, length, and the rank.

# Lab 26 solution 
#1 In the table actor, which are the actors whose last names are not repeated? For example if you #1would sort the data in the table actor by last_name, you would see that there is Christian Arkoyd, #1Kirsten Arkoyd, and Debbie Arkoyd. These three actors have the same last name. So we do not #1want to include this last name in our output. Last name "Astaire" is present only one time with #1 #1actor "Angelina Astaire", hence we would want this in our output list.
SELECT last_name, COUNT(last_name) AS number_of_times_repeated
FROM actor
GROUP BY last_name
HAVING number_of_times_repeated = 1;


#2 Which last names appear more than once? We would use the same logic as in the previous #2 #2question but this time we want to include the last names of the actors where the last name was #2 #2present more than once
SELECT last_name, COUNT(last_name) AS number_of_times_repeated
FROM actor
GROUP BY last_name
HAVING number_of_times_repeated > 1;


#3 Using the rental table, find out how many rentals were processed by each employee.
SELECT staff_id, COUNT(staff_id) AS employees rentals processed
FROM rental
GROUP BY staff_id;


#4 Using the film table, find out how many films were released each year.
SELECT release_year, title AS release_year_title
FROM film; 

#5Using the film table, find out for each rating how many films were there.
SELECT DISTINCT rating 
FROM film;

#6 What is the mean length of the film for each rating type. Round off the average lengths to two #decimal places


#7 Which kind of movies (rating) have a mean duration of more than two hours?


#8 Rank films by length (filter out the rows that have nulls or 0s in length column). In your output, #1only select the columns title, length, and the rank.
SELECT name, title, 
FROM film
ORDER BY name, title,