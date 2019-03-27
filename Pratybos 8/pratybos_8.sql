CREATE TABLE Authors_with_books (
  id INT NOT NULL AUTO_INCREMENT,
  bookId INT NULL,
  authorId INT NULL,
  PRIMARY KEY (id));
  
INSERT INTO Authors_with_books (bookId, authorId) SELECT bookId, authorId FROM Books;

ALTER TABLE Books DROP authorId;

ALTER TABLE Authors CHARACTER SET 'utf8' COLLATE = 'utf8_lithuanian_ci';
ALTER TABLE Authors CHANGE COLUMN name name VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_lithuanian_ci' NOT NULL;

ALTER TABLE Books CHARACTER SET 'utf8' COLLATE = 'utf8_lithuanian_ci';
ALTER TABLE Books CHANGE COLUMN title title VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_lithuanian_ci' NOT NULL;
