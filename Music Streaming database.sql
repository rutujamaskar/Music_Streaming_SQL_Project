create database MusicDB;
use MusicDB;
show databases;
CREATE TABLE Users(
  user_id INT PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  email VARCHAR(100) UNIQUE NOT NULL,
  country VARCHAR(50),
  subscription_id INT
);
INSERT INTO Users VALUES (1, 'Riya Mehta', 'riya@gmail.com', 'India', 201, '2024-08-01');
INSERT INTO Users VALUES (2, 'Amit Verma', 'amit@gmail.com', 'India', 201, '2024-09-01');
INSERT INTO Users VALUES (3, 'Sophia Johnson', 'sophia@gmail.com', 'USA', 201, '2024-07-15');
INSERT INTO Users VALUES (4, 'Rahul Nair', 'rahul@gmail.com', 'India', 202, '2024-06-20');
INSERT INTO Users VALUES (5, 'Emma Brown', 'emma@gmail.com', 'UK', 202, '2024-05-10');
select*from users;
desc Users;

/*=======Artists=====*/
CREATE TABLE Artists(
  artist_id INT PRIMARY KEY,
  artist_name VARCHAR(100) NOT NULL,
  genre VARCHAR(50)
);
INSERT INTO Artists (artist_id, artist_name,genre)VALUES (1, 'Arijit Singh', 'Bollywood');
INSERT INTO Artists VALUES (2, 'Shreya Ghoshal', 'Bollywood');
INSERT INTO Artists VALUES (3, 'Ed Sheeran', 'Pop');
INSERT INTO Artists VALUES (4, 'Taylor Swift', 'Pop');
INSERT INTO Artists VALUES (5, 'A. R. Rahman', 'Classical');
desc Artists;
select * from artists;



/*==Albums Table*/
CREATE TABLE Albums(
  album_id INT PRIMARY KEY,
  album_name VARCHAR(100) NOT NULL,
  artist_id INT,
  release_year INT,
  FOREIGN KEY (artist_id) REFERENCES Artists(artist_id));
  INSERT INTO Albums VALUES (101, 'Soulful Hits', 1, 2022);
  INSERT INTO Albums VALUES (102, 'Melody Queen', 2, 2021);
INSERT INTO Albums VALUES (103, 'Divide', 3, 2017);
INSERT INTO Albums VALUES (104, '1989', 4, 2014);
INSERT INTO Albums VALUES (105, 'Vande Mataram', 5, 1997);
select * from albums;
desc Albums;



/* Songs Table*/
CREATE TABLE Songs(
  song_id INT PRIMARY KEY,
  song_name VARCHAR(100) NOT NULL,
  album_id INT,
  duration DECIMAL(5,2),
  FOREIGN KEY (album_id) REFERENCES Albums(album_id));
  INSERT INTO Songs VALUES (1001, 'Tum Hi Ho', 101, 4.35);
  INSERT INTO Songs VALUES (1002, 'Teri Meri', 102, 4.10);
INSERT INTO Songs VALUES (1003, 'Perfect', 103, 4.25);
INSERT INTO Songs VALUES (1004, 'Shape of You', 103, 3.55);
INSERT INTO Songs VALUES (1005, 'Blank Space', 104, 4.05);
INSERT INTO Songs VALUES (1006, 'Style', 104, 3.45);
INSERT INTO Songs VALUES (1007, 'Maa Tujhe Salaam', 105, 5.00);
select * from songs;
desc Songs;


 /*Playlists Table*/
CREATE TABLE Playlists(
  playlist_id INT PRIMARY KEY,
  playlist_name VARCHAR(100),
  user_id INT,
  FOREIGN KEY (user_id) REFERENCES Users(user_id));
  INSERT INTO Playlists VALUES (301, 'My Favorites', 1);
  INSERT INTO Playlists VALUES (302, 'Workout Mix', 2);
INSERT INTO Playlists VALUES (303, 'Romantic Hits', 3);
INSERT INTO Playlists VALUES (304, 'Pop Party', 4);
INSERT INTO Playlists VALUES (305, 'Patriotic Songs', 5);
select* from playlists;
desc Playlists;


/* Playlist_Songs (Many-to-Many)*/
CREATE TABLE Playlist_Songs(
  playlist_id INT,
  song_id INT,
  PRIMARY KEY (playlist_id, song_id),
  FOREIGN KEY (playlist_id) REFERENCES Playlists(playlist_id),
  FOREIGN KEY (song_id) REFERENCES Songs(song_id));
  INSERT INTO Playlist_Songs VALUES (301, 1001);
INSERT INTO Playlist_Songs VALUES (302, 1003);  
INSERT INTO Playlist_Songs VALUES (302, 1004);
INSERT INTO Playlist_Songs VALUES (303, 1001);
INSERT INTO Playlist_Songs VALUES (303, 1002);
INSERT INTO Playlist_Songs VALUES (304, 1005);
INSERT INTO Playlist_Songs VALUES (304, 1006);
INSERT INTO Playlist_Songs VALUES (305, 1007);
select * from playlist_songs;
desc Playlists;
/*Subscriptions Table*/
CREATE TABLE Subscriptions(
  subscription_id INT PRIMARY KEY,
  plan_name VARCHAR(50),
  price DECIMAL(10,2));
  INSERT INTO Subscriptions VALUES (201, 'Premium', 199.00);
  INSERT INTO Subscriptions VALUES (202, 'Free', 0.00);
INSERT INTO Subscriptions VALUES (203, 'Family', 499.00);
INSERT INTO Subscriptions VALUES (204, 'Student', 99.00);
select * from subscriptions;
desc Subscriptions;

/*Streams Table*/
CREATE TABLE Streams(
  stream_id INT PRIMARY KEY,
  user_id INT,
  song_id INT,
  stream_date DATE,
  FOREIGN KEY (user_id) REFERENCES Users(user_id),
  FOREIGN KEY (song_id) REFERENCES Songs(song_id));
INSERT INTO Streams VALUES (402, 1, 1002, '2024-08-16');
INSERT INTO Streams VALUES (403, 1, 1003, '2024-08-17');
INSERT INTO Streams VALUES (404, 2, 1004, '2024-08-18');
INSERT INTO Streams VALUES (405, 2, 1001, '2024-08-19');
INSERT INTO Streams VALUES (406, 3, 1005, '2024-08-20');
INSERT INTO Streams VALUES (407, 3, 1006, '2024-08-21');
INSERT INTO Streams VALUES (408, 4, 1007, '2024-08-22');
INSERT INTO Streams VALUES (409, 4, 1003, '2024-08-23');
INSERT INTO Streams VALUES (410, 5, 1004, '2024-08-24');
INSERT INTO Streams VALUES (411, 5, 1002, '2024-08-25');
select * from streams;
desc Streams;

show tables;
alter table Users add Subscription_start DATE;
Desc users;
alter table songs modify song_name varchar(200);
desc songs;
alter table songs rename column duration to song_duration;
alter table playlists drop column playlist_name;
desc playlists;
alter table streams rename to Listening_History;
desc Listening_History;
truncate  playlist_songs;
desc playlist_songs;
drop table playlist_songs;
alter table playlists add playlist_name varchar(100);
drop table playlist_songs;
drop table albums;
drop  database musicdb;

update users set subscription_id=202 where user_id=1;
select * from users;
select * from artists;


delete from playlist_songs where song_id=1001;
select * from playlist_songs;

select song_name,song_duration from songs;
select song_name AS Track,song_duration AS length from songs;


SELECT song_name, song_duration 
FROM Songs 
ORDER BY song_duration DESC LIMIT 5;

SELECT artist_name, genre
FROM Artists
ORDER BY artist_name;

SELECT album_name, release_year
FROM Albums
ORDER BY release_year;

SELECT DISTINCT genre FROM Artists;


SELECT song_name, song_duration
FROM Songs
WHERE song_duration > 4.00;


SELECT name, country
FROM Users u
JOIN Subscriptions s ON u.subscription_id = s.subscription_id
WHERE u.country = 'India' AND s.plan_name = 'Premium';


SELECT artist_name, genre
FROM Artists
WHERE genre = 'Pop' OR genre = 'Bollywood';


SELECT name, country
FROM Users
WHERE country <> 'India';

SELECT song_name
FROM Songs
WHERE album_id IS NULL;


SELECT plan_name, price
FROM Subscriptions
WHERE price BETWEEN 50 AND 500;


SELECT song_name, album_id
FROM Songs
WHERE album_id IN (101, 102, 103);

SELECT plan_name, price
FROM Subscriptions
WHERE price > ANY (SELECT price FROM Subscriptions WHERE plan_name = 'Free');

SELECT song_name, song_duration
FROM Songs
WHERE song_duration > ALL (SELECT song_duration FROM Songs WHERE song_duration < 3.00);


SELECT song_name
FROM Songs
WHERE song_name LIKE 'T%';

SELECT COUNT(*) AS total_users
FROM Users;

SELECT SUM(price) AS total_revenue
FROM Subscriptions;

SELECT ROUND(AVG(song_duration), 2) AS avg_song_duration
FROM Songs;

SELECT MAX(song_duration) AS longest_song,
       MIN(song_duration) AS shortest_song
FROM Songs;

SELECT album_id, COUNT(song_id) AS total_songs
FROM Songs
GROUP BY album_id;

SELECT plan_name, SUM(price) AS total_revenue
FROM Subscriptions
GROUP BY plan_name;

SELECT country, COUNT(user_id) AS total_users
FROM Users GROUP BY country;

SELECT a.artist_name, COUNT(al.album_id) AS total_albums
FROM Artists a
JOIN Albums al ON a.artist_id = al.artist_id
GROUP BY a.artist_name
HAVING COUNT(al.album_id) > 1;

SELECT u.name, COUNT(st.stream_id) AS total_streams
FROM Users u
JOIN Streams st ON u.user_id = st.user_id
GROUP BY u.name
HAVING COUNT(st.stream_id) > 2;

SELECT al.album_name, ROUND(AVG(s.song_duration),2) AS avg_duration
FROM Albums al
JOIN Songs s ON al.album_id = s.album_id
GROUP BY al.album_name
HAVING AVG(s.song_duration) > 4.00;

SELECT u.name, COUNT(st.stream_id) AS total_streams
FROM Users u JOIN Streams st ON u.user_id = st.user_id
GROUP BY u.name HAVING COUNT(st.stream_id) > 3;

SELECT s.song_name, COUNT(st.stream_id) AS play_count
FROM Songs s
JOIN Streams st ON s.song_id = st.song_id
GROUP BY s.song_name
HAVING COUNT(st.stream_id) > 2;


SELECT s.song_name, COUNT(st.stream_id) AS play_count
FROM Songs s
JOIN Streams st ON s.song_id = st.song_id
GROUP BY s.song_name
HAVING COUNT(st.stream_id) > 5;


SELECT name AS individual_name, 'User' AS role FROM Users
UNION SELECT artist_name AS individual_name, 'Artist' AS role FROM Artists;


SELECT a.artist_name, al.album_name, s.song_name
FROM Songs s JOIN Albums al ON s.album_id = al.album_id
JOIN Artists a ON al.artist_id = a.artist_id;


SELECT song_name, song_duration
FROM Songs WHERE song_duration > (SELECT AVG(song_duration) FROM Songs);


SELECT u.name, u.email
FROM Users u
WHERE u.user_id IN (
    SELECT st.user_id
    FROM Streams st WHERE st.song_id IN (
        SELECT song_id FROM Streams
        GROUP BY song_id ORDER BY COUNT(stream_id) DESC LIMIT 3));

SELECT name 
FROM Users 
WHERE user_id IN (
   SELECT user_id 
   FROM Streams 
   GROUP BY user_id 
   HAVING COUNT(stream_id) > 3
);


SELECT artist_name
FROM Artists
WHERE artist_id IN (
    SELECT artist_id
    FROM Albums
    GROUP BY artist_id
    HAVING COUNT(album_id) > 1
);



SELECT s.song_name, al.album_name, a.artist_name
FROM Songs s
INNER JOIN Albums al ON s.album_id = al.album_id
INNER JOIN Artists a ON al.artist_id = a.artist_id;


SELECT u.name, p.playlist_name
FROM Users u
LEFT JOIN Playlists p ON u.user_id = p.user_id;


SELECT p.playlist_name, u.name
FROM Users u
RIGHT JOIN Playlists p ON u.user_id = p.user_id;


SELECT u1.name AS user1, u2.name AS user2, u1.country
FROM Users u1
JOIN Users u2 ON u1.country = u2.country
WHERE u1.user_id < u2.user_id;



SELECT plan_name, price
FROM Subscriptions
WHERE (plan_name, price) IN (
    SELECT plan_name, MAX(price)
    FROM Subscriptions
    GROUP BY plan_name
);



SELECT artist_name
FROM Artists
WHERE artist_id IN (
    SELECT artist_id
    FROM Albums
    GROUP BY artist_id
);



SELECT u.name, u.email
FROM Users u
WHERE u.user_id IN (
    SELECT st.user_id
    FROM Streams st
    WHERE st.song_id IN (
        SELECT song_id
        FROM Streams
        GROUP BY song_id
    )
);


SELECT song_name, LENGTH(song_name) AS name_length
FROM Songs;


SELECT CONCAT(p.playlist_name, ' - created by ', u.name) AS playlist_info
FROM Playlists p
JOIN Users u ON p.user_id = u.user_id;

SELECT album_name, REPLACE(album_name, 'Hits', 'Collection') AS updated_name
FROM Albums;


SELECT song_name, REVERSE(song_name) AS reversed_name
FROM Songs;

SELECT plan_name, price, ABS(price - 200) AS price_difference
FROM Subscriptions;


SELECT ROUND(AVG(song_duration), 2) AS avg_duration
FROM Songs;


SELECT song_name, MOD(ROUND(song_duration*60), 2) AS even_or_odd
FROM Songs;


SELECT plan_name, SQRT(price) AS sqrt_price
FROM Subscriptions;

SELECT song_id, song_name, song_duration,
       ROW_NUMBER() OVER (ORDER BY song_duration DESC) AS row_num
FROM Songs;


SELECT song_id, song_name, song_duration,
       RANK() OVER (ORDER BY song_duration DESC) AS rank_num
FROM Songs;


SELECT song_id, song_name, song_duration,
       DENSE_RANK() OVER (ORDER BY song_duration DESC) AS dense_rank_num
FROM Songs;


SELECT user_id, name, subscription_start,
       LAG(subscription_start) OVER (ORDER BY subscription_start) AS prev_subscription
FROM Users;

/* Show all songs and their streams (even if a song was never streamed, or a stream exists without a matching song)*/
SELECT s.song_id, s.song_name, st.stream_id, st.stream_date
FROM Songs s
LEFT JOIN Streams st ON s.song_id = st.song_id

UNION

SELECT s.song_id, s.song_name, st.stream_id, st.stream_date
FROM Songs s
RIGHT JOIN Streams st ON s.song_id = st.song_id;


SELECT u.name, s.plan_name
FROM Users u
CROSS JOIN Subscriptions s;

