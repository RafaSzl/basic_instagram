EXERCISE 2

SELECT 
    id, username, created_at, DAYNAME(created_at) AS name_of_the_day, COUNT(DAYNAME(created_at)) AS count_of_the_day
FROM users 
GROUP BY DAYNAME(created_at) ORDER BY count_of_the_day DESC;


EXERCISE 3

SELECT * FROM users 
LEFT JOIN photos 
ON users.id = photos.user_id
WHERE photos.id IS NULL;

# PAMIETAJ ZE PRZY NULL NIE MOZESZ DAC ZNAKU = ROWNA SIE BO NIE ZADZIALA
EXERCISE 4

SELECT 
    photo_id, 
    count(photo_id), 
    users.id, username 
FROM likes 
LEFT JOIN users 
ON users.id = likes.user_id 
GROUP BY photo_id 
ORDER BY count(photo_id); #ZLE I TRZEBA NAPISAC OD NOWAALTER


SELECT photo_id, photos.user_id, likes.user_id AS lista_osob_co_polajkowala , likes.photo_id, username, count(*) AS total
FROM photos 
LEFT JOIN likes
ON photos.id = likes.photo_id
LEFT JOIN users
ON photos.user_id = users.id
GROUP BY photos.id
ORDER BY total DESC
LIMIT 1;


EXERCISE 5

SELECT users.id, username, count(*)
FROM users
LEFT JOIN photos ON users.id = photos.user_id
LEFT JOIN comments ON users.id = comments.user_id
LEFT JOIN likes ON users.id = comments.user_id
GROUP BY users.id;





































