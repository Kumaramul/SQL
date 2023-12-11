-- answer 1 --

SELECT bb.book_id, COUNT(*) as Number_of_times FROM borrowed_books bb  GROUP BY  bb.book_id ORDER BY Number_of_times DESC LIMIT 10;

-- answer 2 --

DELIMITER //
CREATE PROCEDURE get_average_days(IN b_id INT, OUT avg_days FLOAT)
BEGIN
  SELECT  AVG(DATEDIFF(bb.return_date, bb.borrow_date)) INTO avg_days FROM borrowed_books bb WHERE bb.book_id=b_id ;
END //
DELIMITER ;

-- CALL get_average_days('8', @A);
-- select @A;

-- answer 3 --

SELECT u.*  FROM users u where u.user_id IN (SELECT bb.user_id  FROM borrowed_books bb  group by  bb.user_id having count(bb.user_id) >=
ALL(SELECT COUNT(bb.user_id ) FROM borrowed_books bb  group by  bb.user_id)
 );

-- answer 4 --

CREATE INDEX idx_publication_year ON books(publication_year);

-- answer 5 --

SELECT bk.* from books bk where bk.publication_year=2020 AND bk.book_id NOT IN (SELECT bb.book_id from borrowed_books bb) ;

-- answer 6 --

SET @author_name = 'HHH';  
SELECT u.* FROM borrowed_books bb  LEFT JOIN users u on u.user_id=bb.user_id LEFT JOIN  books bk on bk.book_id=bb.book_id  where bk.author=@author_name;

-- answer 7 --

DELIMITER //
CREATE TRIGGER update_date_return 
BEFORE  UPDATE
ON borrowed_books FOR EACH ROW
BEGIN
IF new.return_date= old.return_date THEN
	SET new.return_date = CURDATE();
END IF;
END ;

-- update  borrowed_books set return_date= return_date where borrow_id=18;

