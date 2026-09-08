-- Process undertaken 
-- Spotify Data Analysis
-- Dataset: Spotify tracks dataset (Kaggle)
-- Process: Created a table matching the CSV schema, imported
-- the data, then explored it with the queries below.

-- Table creation
CREATE TABLE BIT_DB.Spotifydata (
    id integer PRIMARY KEY,
    artist_name varchar NOT NULL,
    track_name varchar NOT NULL,
    track_id varchar NOT NULL,
    popularity integer NOT NULL,
    danceability decimal(4,3) NOT NULL,
    energy decimal(4,3) NOT NULL,
    key integer NOT NULL,
    loudness decimal(5,3) NOT NULL,
    mode integer NOT NULL,
    speechiness decimal(5,4) NOT NULL,
    acousticness decimal(6,5) NOT NULL,
    instrumentalness text NOT NULL,
    liveness decimal(5,4) NOT NULL,
    valence decimal(4,3) NOT NULL,
    tempo decimal(6,3) NOT NULL,
    duration_ms integer NOT NULL,
    time_signature integer NOT NULL
);

-- Spotify Data.csv was then imported into the table above.

-- Find the artist with the maximum popularity score among all their tracks
SELECT artist_name, max_pop
FROM (
    SELECT artist_name, MAX(popularity) AS max_pop
    FROM spotifydata
    GROUP BY artist_name
) AS artist_max_pop
ORDER BY max_pop DESC
LIMIT 1;

-- What is the average danceability, popularity, and energy by artist and track?
SELECT artist_name, track_name,
    AVG(popularity) AS avg_popularity,
    AVG(danceability) AS avg_dance,
    AVG(energy) AS avg_energy
FROM spotifydata
GROUP BY artist_name, track_name;

-- Who are the top 10 artists based on popularity?
SELECT artist_name, popularity
FROM spotifydata
ORDER BY popularity DESC
LIMIT 10;

-- What artist released the longest song?
SELECT MAX(duration_ms), artist_name
FROM spotifydata
GROUP BY artist_name
LIMIT 1;

-- Which artist has the most tracks in the dataset?
SELECT artist_name, COUNT(track_id) AS track_count
FROM spotifydata
GROUP BY artist_name
ORDER BY track_count DESC
LIMIT 1;

-- Which tracks have a rating greater than 0.8 for both danceability and energy?
SELECT artist_name, track_name, danceability, energy
FROM spotifydata
WHERE danceability > 0.8 AND energy > 0.8
ORDER BY danceability DESC, energy DESC
LIMIT 10;

-- Calculate the average popularity per artist.
-- Artists with an average popularity of 90 or above are labeled "Top Star".
WITH popularity_average_CTE AS (
    SELECT artist_name, AVG(popularity) AS avg_pop
    FROM spotifydata
    GROUP BY artist_name
)
SELECT artist_name, avg_pop, 'Top Star' AS tag
FROM popularity_average_CTE
WHERE avg_pop >= 90;

-- Rank each artist's own tracks by popularity, and return their top 3 tracks.
-- Demonstrates a window function (RANK) partitioned per artist.
WITH ranked_tracks AS (
    SELECT artist_name, track_name, popularity,
        RANK() OVER (PARTITION BY artist_name ORDER BY popularity DESC) AS popularity_rank
    FROM spotifydata
)
SELECT artist_name, track_name, popularity, popularity_rank
FROM ranked_tracks
WHERE popularity_rank <= 3
ORDER BY artist_name, popularity_rank;
