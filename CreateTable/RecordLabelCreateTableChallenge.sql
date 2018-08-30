SELECT s.AlbumId, a.Title, COUNT(s.SongId)
FROM Song s
JOIN Album a ON s.AlbumId = a.AlbumId
GROUP BY s.AlbumId
ORDER BY COUNT(s.SongId) DESC
LIMIT 1;

SELECT g.GenreId, g.Label, COUNT(s.SongId)
FROM Song s
JOIN Genre g ON g.GenreId = s.GenreId
GROUP BY s.GenreId
ORDER BY COUNT(s.SongId) DESC
LIMIT 1;


SELECT r.LabelName, COUNT (a.AlbumId)
FROM RecordLabel r
JOIN Album a ON r.LabelId = a.RecordLabelId
GROUP BY r.LabelName
ORDER BY COUNT (a.AlbumId) DESC
LIMIT 1;


