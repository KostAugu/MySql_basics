-- 1. Papildykite autorių lentelę 2 įrašais;
INSERT INTO Authors (name) VALUES ('V. Anton Spraul'), ('Anthony DeBarros');

-- 2. Papildykite knygų lentelę, 3 įrašais apie knygas, kurių autorius įrašėte prieš tai.
INSERT INTO Books (authorId, title, year) VALUES (8, 'Think Like a Programmer', 2012), (8, 'How Software Works', 2015), (9, 'Practical SQL', 2018);

-- 3. Pakeiskite vienos knygos autorių į kitą.
UPDATE Books SET authorId = 9 WHERE bookId = 10;
