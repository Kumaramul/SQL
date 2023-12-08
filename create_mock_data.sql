create database test_sql;
use test_sql;

CREATE TABLE books (
    book_id int NOT NULL,
    title varchar(255),
    author varchar(255),
    publication_year year,
    isbn varchar(255),
	PRIMARY KEY(book_id)
);


CREATE TABLE users (
    user_id int NOT NULL,
    first_name varchar(255),
    last_name varchar(255),
    email varchar(255),
    registration_date date,
    PRIMARY KEY(user_id)
);


CREATE TABLE borrowed_books  (
    borrow_id  int NOT NULL,
    user_id int,
	book_id int,
	borrow_date date,
    return_date date,
    PRIMARY KEY(borrow_id),
    FOREIGN KEY(user_id) REFERENCES users(user_id)  ON DELETE CASCADE,
	FOREIGN KEY(book_id) REFERENCES books(book_id)  ON DELETE CASCADE
);


INSERT INTO books (book_id, title, author,  publication_year, isbn)
VALUES 
(1,'A', 'AAA', 1995, '11-111'),
 (2,'B', 'BBB', 1995, '11-112'),
 (3,'C', 'CCC', 1997, '11-113'),
 (4,'D', 'DDD', 1994, '11-114'),
 (5,'E', 'EEE', 1995, '11-115'),
 (6,'F', 'FFF', 1996, '11-116'),
 (7,'G', 'GGG', 1997, '11-117'),
(8,'H', 'HHH', 1997, '11-117'),
(9,'I', 'HHH', 2020, '11-117'),
(10,'J', 'JJJ', 2020, '11-117'),
(11,'K', 'JJJ', 2020, '11-117')
 ;


INSERT INTO users (user_id, first_name,last_name, email,  registration_date)
VALUES 
(1,'Jhon', 'cena', 'jhonc@gmail.com', '1995-05-01'),
(2,'Jhon', 'kumar', 'jhonk@gmail.com', '1995-02-05'),
(3,'Shivam', 'Singh', 'shivams@gmail.com', '1995-06-08'),
(4,'Jhon', 'cena', 'jhonc@gmail.com', '1995-06-08')
;



INSERT INTO borrowed_books (borrow_id, user_id, book_id, borrow_date,  return_date)
VALUES 
 (1, 2, 5,  '2023-12-04', '2024-12-04'),
 (2,1, 4,  '2023-12-04', '2024-12-04'),
 (3,3, 3,  '2023-12-01', '2024-12-04'),
 (4,2, 2,  '2023-12-02', '2024-12-04'),
 (5,3, 1,  '2023-12-03', '2024-12-04'),
 (6,1, 7,  '2023-12-01', '2024-12-04'),
 (7,2, 6,  '2023-12-03', '2024-12-04'),
 (8,1, 5,  '2023-12-02', '2024-12-04'),
 (9,1, 4,  '2023-11-01', '2024-12-04'),
 (10,3, 3,  '2023-11-04', '2024-12-04'),
 (11,2, 2,  '2023-11-01', '2024-12-04'),
 (12,1, 1,  '2023-12-04', '2024-12-04'),
 (13,3, 5,  '2023-12-02', '2024-12-04'),
 (14,1, 4,  '2023-11-03', '2024-12-04'),
 (15,2, 3,  '2023-11-04', '2024-12-04'),
 (16,3, 4,  '2023-12-01', '2024-12-04'),
 (17,1, 4,  '2023-12-01', '2024-12-04'),
  (18,2, 8,  '2023-12-01', '2024-01-11'),
  (19,3, 8,  '2023-10-15', '2023-11-15'),
  (20,3, 10,  '2023-10-12', '2023-11-15')
;
