CREATE DATABASE ig_clone;
USE ig_clone;


CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT NOW()
);

#example of putting a data
INSERT INTO users (username) VALUES
    ('TOM Brady'),
    ('YOUR mom');