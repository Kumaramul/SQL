-- answer 1
SELECT bb.book_id, COUNT(*) as Number_of_times FROM borrowed_books bb  GROUP BY  bb.book_id ORDER BY Number_of_times DESC LIMIT 10;

-- answer 2
DELIMITER //
CREATE PROCEDURE get_average_days(IN b_id INT, OUT avg_days FLOAT)
BEGIN
  SELECT  AVG(DATEDIFF(bb.return_date, bb.borrow_date)) INTO avg_days FROM borrowed_books bb WHERE bb.book_id=b_id GROUP BY bb.book_id;
END //
DELIMITER ;
-- CALL get_average_days(8, @A);
-- select @A;

-- answer 3
SELECT bb.user_id FROM borrowed_books bb  GROUP BY  bb.user_id ORDER BY COUNT(*) DESC LIMIT 1;


-- answer 4
CREATE INDEX idx_publication_year ON books(publication_year);

-- answer 5
SELECT bk.* from books bk where bk.publication_year=2020 AND bk.book_id NOT IN (SELECT bb.book_id from borrowed_books bb) ;

-- answer 6
SET @author_name = 'HHH';  
SELECT DISTINCT(bb.user_id) FROM borrowed_books bb LEFT JOIN  books bk on bk.book_id=bb.book_id where bk.author=@author_name;