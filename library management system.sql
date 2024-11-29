-- Step 1: Create the database
CREATE DATABASE school_library;
USE school_library;

-- Step 2: Create tables

-- a. Books Table
CREATE TABLE books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(255),
    genre VARCHAR(100),
    total_copies INT NOT NULL DEFAULT 1,
    available_copies INT NOT NULL DEFAULT 1
);

-- b. Students Table
CREATE TABLE students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    class VARCHAR(50),
    email VARCHAR(100),
    phone_number VARCHAR(15)
);

-- c. Borrow Records Table
CREATE TABLE borrow_records (
    record_id INT AUTO_INCREMENT PRIMARY KEY,
    book_id INT,
    student_id INT,
    borrow_date DATETIME DEFAULT current_timestamp(),
    return_date DATE,
    status ENUM('Borrowed', 'Returned') DEFAULT 'Borrowed',
    FOREIGN KEY (book_id) REFERENCES books(book_id) ON DELETE CASCADE,
    FOREIGN KEY (student_id) REFERENCES students(student_id) ON DELETE CASCADE
);

-- Step 3: Insert sample data

-- Sample books
INSERT INTO books (title, author, genre, total_copies, available_copies) VALUES
('The Great Gatsby', 'F. Scott Fitzgerald', 'Fiction', 5, 5),
('1984', 'George Orwell', 'Dystopian', 3, 3),
('To Kill a Mockingbird', 'Harper Lee', 'Classic', 4, 4),
('Pride and Prejudice', 'Jane Austen', 'Romance', 6, 6),
('The Catcher in the Rye', 'J.D. Salinger', 'Classic', 2, 2),
('The Hobbit', 'J.R.R. Tolkien', 'Fantasy', 7, 7),
('Harry Potter and the Sorcerer\'s Stone', 'J.K. Rowling', 'Fantasy', 8, 8);

-- Sample students
INSERT INTO students (name, class, email, phone_number) VALUES
('Alice Johnson', '10-A', 'alice.johnson@example.com', '1234567890'),
('Bob Smith', '11-B', 'bob.smith@example.com', '0987654321'),
('Charlie Davis', '9-C', 'charlie.davis@example.com', '1122334455'),
('Diana Brown', '12-A', 'diana.brown@example.com', '5566778899'),
('Edward Wilson', '10-B', 'edward.wilson@example.com', '9988776655');

-- Sample borrow records
INSERT INTO borrow_records (book_id, student_id, borrow_date, status) VALUES
(1, 1, '2024-11-20', 'Borrowed'), -- Alice borrowed "The Great Gatsby"
(3, 2, '2024-11-18', 'Returned'), -- Bob borrowed "To Kill a Mockingbird"
(5, 3, '2024-11-15', 'Borrowed'), -- Charlie borrowed "The Catcher in the Rye"
(7, 4, '2024-11-16', 'Borrowed'); -- Diana borrowed "Harry Potter and the Sorcerer’s Stone"

select * from books;
select * from students;
select * from borrow_records;