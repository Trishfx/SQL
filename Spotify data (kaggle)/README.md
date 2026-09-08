# Spotify Data Analysis (Kaggle)

## Business Question
Exploring a Spotify tracks dataset to understand artist popularity, track 
characteristics (danceability, energy), and to identify and rank 
top-performing artists and tracks.

## Dataset
- Source: Spotify dataset from Kaggle
- Loaded into a custom SQL table (`Spotifydata`) with a defined schema
- Fields include: artist name, track name, popularity, danceability, energy, 
  key, loudness, tempo, duration, and other audio features

## SQL Techniques Used
- Subqueries (finding the artist with maximum popularity)
- Common Table Expressions (CTEs) for labeling artists and ranking tracks
- **Window functions** (`RANK() OVER (PARTITION BY ...)`) to rank each 
  artist's tracks by popularity
- Aggregate functions (`AVG`, `MAX`, `COUNT`)
- Multi-column `GROUP BY`
- Multi-condition filtering (`WHERE ... AND ...`)
- Multi-column `ORDER BY` with `LIMIT`

## Key Questions Answered
- Which artist has the single highest popularity score across their tracks
- Average danceability, popularity, and energy by artist and track
- Top 10 artists by popularity
- Which artist released the longest song
- Which artist has the most tracks in the dataset
- Tracks rated highly danceable and energetic (both above 0.8)
- Artists with an average popularity of 90+, labeled "Top Star"
- Each artist's top 3 tracks by popularity, using a window function

## Notes
This project was extended beyond the original analysis to include a window 
function (`RANK() OVER (PARTITION BY ...)`), ranking each artist's tracks by 
popularity and surfacing their top 3. Window functions are a core skill for 
analytics engineering roles, so this addition was made deliberately to 
demonstrate that technique on real data rather than just aggregate queries.
