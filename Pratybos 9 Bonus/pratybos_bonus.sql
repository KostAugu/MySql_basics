SELECT n.newsId, n.date, n.text, c1.date, c1.text FROM News as n
LEFT JOIN Comments as c1
ON n.newsId = c1.newsId 
LEFT JOIN Comments c2 ON (n.newsId = c2.newsId AND 
    (c1.date < c2.date OR c1.date = c2.date AND c1.commentId < c2.commentId))
WHERE c2.commentId IS NULL 
ORDER BY n.date DESC LIMIT 10;
