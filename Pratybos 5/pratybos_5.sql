-- 1. Išrinkite visus įrašus, tiek iš knygų tiek iš autorių lentelių, išrinkdami pasirinktinai du stulpelius.
SELECT authorId, name from Authors UNION SELECT bookId, authorId from Books;