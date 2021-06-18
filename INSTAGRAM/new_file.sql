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

