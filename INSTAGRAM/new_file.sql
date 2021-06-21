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

# 1 ROZWIAZANIE
SELECT avg(pictures) AS average_photos # w zewnetrznej petli robi average function
FROM 
( 
    SELECT count(photos.id) as pictures # w wewnetrznej petli robi grup photos by users
    FROM users
    LEFT JOIN photos
    ON photos.user_id = users.id
    GROUP BY users.id
) AS average;

# 2 ROZWIAZANIE
SELECT 
    COUNT(image_url) AS num_photos,
    COUNT(DISTINCT users.id) AS num_users,
    COUNT(image_url)/COUNT(DISTINCT users.id) AS average_photos
FROM users
LEFT JOIN photos
	ON users.id = photos.user_id;

# 3 ROZWIAZANIE

SELECT ((SELECT COUNT(*) FROM photos)/ (SELECT COUNT(*) FROM users));


EXERCISE 6

SELECT tag_id, tag_name, COUNT(photo_tags.photo_id) AS photos_tagged 
FROM photo_tags
LEFT JOIN tags
ON photo_tags.tag_id = tags.id
GROUP BY tag_id
ORDER BY photos_tagged DESC LIMIT 5;


EXERCISE 7

SELECT username, count(photo_id),
    CASE
        WHEN count(photo_id) = (SELECT COUNT(*) FROM photos) THEN "probably a bot"
        ELSE "Maybe not bot"
    
    END AS bot_probability
FROM users
LEFT JOIN likes
ON users.id = likes.user_id 
GROUP BY users.id
HAVING bot_probability = "probably a bot";


































