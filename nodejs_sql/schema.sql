CREATE TABLE users (
    email VARCHAR(255) PRIMARY KEY,
    created_at TIMESTAMP DEFAULT NOW()
);

INSERT INTO users (email) VALUES
('Katie34@yahoo.com'), ('Tunde@gmail.com');

EX1 

SELECT * FROM users ORDER BY created_at LIMIT 1;

EX2

SELECT * FROM users ORDER BY created_at LIMIT 1;

EX3

SELECT 
    MONTHNAME(created_at) AS month, 
    COUNT(MONTHNAME(created_at)) AS counts 
FROM users 
GROUP BY month;

EX4

SELECT COUNT(email) AS yahoo_users FROM users WHERE email LIKE '%yahoo%';

EX5


SELECT 
    CASE
        WHEN email LIKE '%yahoo%' THEN 'yahoo'
        WHEN email LIKE '%gmail%' THEN 'gmail'
        WHEN email LIKE '%hotmail%' THEN 'hotmail'
        ELSE 'other'
    END AS providers,
    COUNT(*) AS total_users
FROM users GROUP BY providers;










