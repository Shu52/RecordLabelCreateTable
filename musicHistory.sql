SELECT Label FROM GENRE;
SELECT * FROM  Artist;
INSERT INTO Artist
 (ArtistName, YearEstablished)
 VALUES
 ("Jordan's Bluegrass Band",1990);
 
 SELECT *
 FROM Artist
 WHERE ArtistName = "Jisie"
 OR ArtistName Like "jordan%";
 
 SELECT a.Title, s.Title 
 FROM Album a
 LEFT JOIN Song s
 ON s.AlbumId = a.AlbumId;
 
 SELECT a.Title, s.Title 
 FROM Song s
 LEFT JOIN Album a
 ON s.AlbumId = a.AlbumId;
 
SELECT s.AlbumId, a.Title, COUNT(s.SongId)
FROM Song s
JOIN Album a ON s.AlbumId = a.AlbumId
Group BY s.AlbumId; 

 SELECT a.Title, MAX (a.AlbumLength)
 FROM Album a;
 
--Query all of the entries in the Genre table
SELECT * FROM Genre;
--Using the INSERT statement, add one of your favorite artists to the Artist table.
INSERT INTO Artist VALUES (null,"Train", 1993);
--Using the INSERT statement, add one, or more, albums by your artist to the Album table.
INSERT INTO Album VALUES (null,"Train", "1998", 56, "Aware", 31, 2);
INSERT INTO Album VALUES (null,"Drops of Jupiter", "2001", 48, "Columbia", 31, 2);
--Using the INSERT statement, add some songs that are on that album to the Song table.
INSERT INTO Song VALUES (null, "Meet Virginia", 4, "02/24/1998", 2, 31, 23);
INSERT INTO Song VALUES (null, "I Am", 4, "02/24/1998", 2, 31, 23);
INSERT INTO Song VALUES (null, "If You Leave", 3, "02/24/1998", 2, 31, 23);
INSERT INTO Song VALUES (null, "Homesick", 4, "02/24/1998", 2, 31, 23);
INSERT INTO Song VALUES (null, "She's on Fire", 3, "03/27/2001", 2, 31, 24);
INSERT INTO Song VALUES (null, "I Wish You Would", 4, "03/27/2001", 2, 31, 24);
INSERT INTO Song VALUES (null, "Drops of Jupiter", 4, "03/27/2001", 2, 31, 24);
INSERT INTO Song VALUES (null, "It's About You", 4, "03/27/2001", 2, 31, 24);
--Write a SELECT query that provides the song titles, album title, and artist name for all of the data you just entered in. Use the LEFT JOIN keyword sequence to connect the tables, and the WHERE keyword to filter the results to the album and artist you added.

--Reminder: Direction of join matters. Try the following statements and see the difference in results.

SELECT a.Title, s.Title FROM Album a LEFT JOIN Song s ON s.AlbumId = a.AlbumId;
SELECT a.Title, s.Title FROM Song s LEFT JOIN Album a ON s.AlbumId = a.AlbumId;


SELECT a.Title, s.Title, b.ArtistName
FROM Song s 
LEFT JOIN Album a 
ON s.AlbumId = a.AlbumId
LEFT JOIN Artist b
ON s.ArtistId = b.ArtistId
WHERE b.ArtistName = "Train";

--Using SELECT and LEFT JOIN, write a query that displays the song title, the song duration, the album label, and the genre name for every song.
SELECT a.Title, s.Title, s.SongLength, a.Label, g.Label
FROM Song s 
LEFT JOIN Album a 
ON s.AlbumId = a.AlbumId
LEFT JOIN Genre g
ON s.GenreId = g.GenreId;
--Using a WHERE clause, modify the previous query to only show the information for songs that have a duration of 250 or greater.
SELECT a.Title, s.Title, s.SongLength, a.Label, g.Label
FROM Song s 
LEFT JOIN Album a 
ON s.AlbumId = a.AlbumId
LEFT JOIN Genre g
ON s.GenreId = g.GenreId
WHERE s.SongLength >= 250;
--Write a SELECT statement to display how many songs exist for each album. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
SELECT s.AlbumId, a.Title, COUNT(s.SongId)
FROM Song s
JOIN Album a 
ON s.AlbumId = a.AlbumId
Group BY s.AlbumId;

--Write a SELECT statement to display how many songs exist for each artist. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
SELECT a.ArtistName, COUNT(s.SongId)
FROM Song s
JOIN Artist a
ON s.ArtistId = a.ArtistId
GROUP BY s.ArtistId;
--Write a SELECT statement to display how many songs exist for each genre. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
SELECT g.Label, COUNT (s.SongID)
FROM Song s
JOIN Genre g
ON s.GenreId = g.GenreId
GROUP BY s.GenreId;
--Write a SELECT statement to display how many artists exist for each genre. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
SELECT g.Label, COUNT (a.ArtistId)
FROM Artist a
JOIN Song s
ON s.ArtistId = a.ArtistId
JOIN Genre g
ON s.GenreId = g.GenreId
GROUP BY g.GenreId;
--Using MAX() function, write a select statement to find the album with the longest duration. The result should display the album title and the duration.
SELECT a.Title, MAX(a.AlbumLength)
FROM Album a;
--Using MAX() function, write a select statement to find the song with the longest duration. The result should display the song title and the duration.
SELECT s.Title, MAX(s.SongLength)
FROM Song s;
--Modify the previous query to also display the title of the album.
SELECT s.Title, a.Title, MAX(s.SongLength)
FROM Song s
JOIN Album a
ON s.AlbumId = a.AlbumId;