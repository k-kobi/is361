-- Kobi Kobi IS361 Project 1
-- This database is used for students registering for cooking school

-- Drop tables if exist to rerun script
DROP TABLE IF EXISTS Student_Courses;
DROP TABLE IF EXISTS Students;
DROP TABLE IF EXISTS Courses;

-- Create students table w/ student name, email, age, and registration date
CREATE TABLE Students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    student_name VARCHAR(100) NOT NULL, 
    student_age INT,
    email VARCHAR(100) NOT NULL UNIQUE,
    registration_date DATE
);

-- Inserting data into students
INSERT INTO Students (student_name, email, student_age, registration_date)
VALUES 
('Kobi Kobi', 'kobi@macaulay.cuny.edu', 21, '2024-10-10'),
('Meow Meow', 'Meow@meow.com', 4, '2024-09-30'),
('Woof Woof', 'woof@woof.com', 5, '2024-09-28'),
('Rawr Rawr', 'rawr@rawr.com', 6, '2024-09-27');

-- Create courses table with course name, instructor name, class day, and course fee
CREATE TABLE Courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,  
    instructor_name VARCHAR(100) NOT NULL,
    class_day VARCHAR(100) NOT NULL,
    course_fee INT    
);

-- Insert data into the Courses table
INSERT INTO Courses (course_name, instructor_name, class_day, course_fee)
VALUES 
('Cutting With a Knife', 'Mr. Cutter', 'Wednesday', 300),
('Searing Basics', 'Mrs. Searer', 'Monday', 350),
('Steaks!', 'Mrs. Steak', 'Friday', 400),
('All Things Vegetables', 'Mr. Veggies', 'Thursday' , 200);

-- Create table to see which students are taking which classes
CREATE TABLE Student_Courses (
    student_courses_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    course_id INT,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

-- Insert data into the student courses table
INSERT INTO Student_Courses (student_id, course_id)
VALUES
(1, 1),
(1, 2),
(2, 2), 
(3, 3),
(4, 1),
(4, 4);

-- Now, lets show which students are taking which courses, along with the other relevant course info
SELECT 
    Students.student_name,               
    Courses.course_name,                 
    Courses.instructor_name,             
    Courses.class_day,                   
    Courses.course_fee                   
FROM 
    Student_Courses                      
JOIN 
    Students ON Student_Courses.student_id = Students.student_id  
JOIN 
    Courses ON Student_Courses.course_id = Courses.course_id      
ORDER BY 
    Students.student_name;