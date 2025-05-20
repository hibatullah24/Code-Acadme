-- Create the database
CREATE DATABASE LibraryDB;
USE LibraryDB;

-- Create Authors table
CREATE TABLE Authors (
    AuthorID INT PRIMARY KEY,
    AuthorName VARCHAR(100)
);

-- Create Books table (each book linked to one author)
CREATE TABLE Books (
    BookID INT PRIMARY KEY,
    Title VARCHAR(200),
    AuthorID INT,
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);

-- Insert sample authors
INSERT INTO Authors (AuthorID, AuthorName) VALUES
(1, 'George Orwell'),
(2, 'J.K. Rowling'),
(3, 'Jane Austen');

-- Insert sample books
INSERT INTO Books (BookID, Title, AuthorID) VALUES
(101, '1984', 1),
(102, 'Animal Farm', 1),
(103, 'Harry Potter and the Sorcerer''s Stone', 2),
(104, 'Harry Potter and the Chamber of Secrets', 2),
(105, 'Pride and Prejudice', 3);

-- Query to retrieve all books by a specific author (e.g., J.K. Rowling)
SELECT 
    a.AuthorName,
    b.Title
FROM 
    Authors a
JOIN 
    Books b ON a.AuthorID = b.AuthorID
WHERE 
    a.AuthorName = 'J.K. Rowling';
