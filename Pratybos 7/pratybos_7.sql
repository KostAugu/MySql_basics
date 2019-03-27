-- 1. Knygos gali turėti vieną ir daugiau autorių.
CREATE TABLE Authors_with_books (
  id INT NOT NULL AUTO_INCREMENT,
  bookId INT NULL,
  authorId INT NULL,
  PRIMARY KEY (id));

-- 2. Sutvarkyti duomenų bazės duomenis, jei reikia papildykite naujais.  
INSERT INTO Authors_with_books (bookId, authorId) SELECT bookId, authorId FROM Books;
ALTER TABLE Books DROP authorId;

INSERT INTO Authors (name) VALUES ('Eric Meyer');
SET @author_id1 = LAST_INSERT_ID();
INSERT INTO Authors (name) VALUES ('Estelle Weyl');
SET @author_id2 = LAST_INSERT_ID();
INSERT INTO Books (title, year) VALUES ('CSS: The Definitive Guide', 2017);
SET @book_id = LAST_INSERT_ID();
INSERT INTO Authors_with_books (bookId, authorId) VALUES(@book_id, @author_id1);
INSERT INTO Authors_with_books (bookId, authorId) VALUES(@book_id, @author_id2);

INSERT INTO Authors (name) VALUES ('Alex Banks');
SET @author_id1 = LAST_INSERT_ID();
INSERT INTO Authors (name) VALUES ('Eve Porcello');
SET @author_id2 = LAST_INSERT_ID();
INSERT INTO Books (title, year) VALUES ('Learning React', 2017);
SET @book_id = LAST_INSERT_ID();
INSERT INTO Authors_with_books (bookId, authorId) VALUES(@book_id, @author_id1);
INSERT INTO Authors_with_books (bookId, authorId) VALUES(@book_id, @author_id2);

-- 3. Išrinkite visas knygas su jų autoriais. (autorius, jei jų daugiau nei vienas atskirkite kableliais)

SELECT title, 
year, 
(case when count(awb.authorId) > 1 then group_concat(name SEPARATOR ', ') else name end) as author_name 
FROM Books as b 
LEFT JOIN Authors_with_books as awb ON b.bookId = awb.bookId 
LEFT JOIN Authors as a ON a.authorId = awb.authorId 
group by b.bookId 
having author_name is not null;

-- 4. Sutvarkykite knygų lentelę, kad galėtumėte išsaugoti originalų knygos pavadinimą. (Pavadinime išsaugokite, lietuviškas raides kaip ą,ė,š ir pan.)
ALTER TABLE Books CHARACTER SET 'utf8' COLLATE = 'utf8_lithuanian_ci';
ALTER TABLE Books CHANGE COLUMN title title VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_lithuanian_ci' NOT NULL;

