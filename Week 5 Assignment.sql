-- Kobi Kobi IS 361 Week 5 Assignment 
-- 1) create new database
CREATE DATABASE Video_Reviews;
USE Video_Reviews;

-- 2) create table of videos
CREATE TABLE videos (
    video_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL, 
    length_mins INT NOT NULL,
    url VARCHAR(255) NOT NULL  
);

INSERT INTO videos (title, length_mins, url) 
VALUES 
('Power BI Tutorial for Beginners', 12, 'https://www.youtube.com/watch?v=NNSHu0rkew8'),
('Hands-On Power BI Tutorial 📊 Beginner to Pro [Full Course] 2023 Edition⚡', 182, 'https://www.youtube.com/watch?v=77jIzgvCIYY'),
('What is Power BI?', 1, 'https://www.youtube.com/watch?v=yKTSLffVGbk');

-- 3) create a second table of user reviews
CREATE TABLE reviews (
    review_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(100) NOT NULL, 
    rating INT,
    review_text TEXT, 
    video_id INT,
    FOREIGN KEY (video_id) REFERENCES videos(video_id) 
);

INSERT INTO reviews (username, rating, review_text, video_id)
VALUES
('Louis', 5, 'very helpful yay', 1),
('Sonya', 4, 'still confused', 1),
('Kobi', 3, 'yayyyy good video', 2);

-- 4) join statement
SELECT v.video_id, v.title, v.length_mins, v.url, r.username, r.rating, r.review_text
FROM videos v
JOIN reviews r ON v.video_id = r.video_id;
