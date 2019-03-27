-- 1. Suskaičiuokite kiek knygų kiekvieno autoriaus yra duomenų bazėje (įtraukdami autorius, kurie neturi knygų, bei neįtraukdami šių autorių).
-- Kartu su autoriais, kurie neturi knygų:
SELECT Authors.name, COUNT(Books.bookId) AS book_count FROM Authors LEFT JOIN Books ON Books.authorId = Authors.authorId GROUP BY Authors.name;
-- Tik autoriai, kurie turi knygas:
SELECT Authors.name, COUNT(Books.bookId) AS book_count FROM Authors LEFT JOIN Books ON Books.authorId = Authors.authorId GROUP BY Authors.name HAVING book_count > 0;

-- 2. Pašalinkite autorius, kurie neturi knygų.
DELETE Authors FROM Authors LEFT JOIN Books ON Authors.authorId = Books.authorId WHERE Books.bookId IS NULL;