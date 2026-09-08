# Spotify Data Analysis (Kaggle)

## Business Question
Exploring a Spotify tracks dataset to understand artist popularity, track 
characteristics (danceability, energy), and to identify top-performing 
artists based on defined popularity thresholds.

## Dataset
- Source: Spotify dataset from Kaggle
- Loaded into a custom SQL table (`Spotifydata`) with a defined schema
- Fields include: artist name, track name, popularity, danceability, energy, 
  key, loudness, tempo, duration, and other audio features

## SQL Techniques Used
- Subqueries (finding the artist with maximum popularity)
- Common Table Expressions (CTE) for calculating and labeling "Top Star" artists
- Aggregate functions (`AVG`, `MAX`, `COUNT`)
- Multi-column `GROUP BY`
- Multi-condition filtering (`WHERE ... AND ...`)
- Multi-column `ORDER BY` with `LIMIT`

## Key Questions Answered
- Which artist has the single highest popularity score across their tracks
- Average danceability, popularity, and energy by artist and track
- Top 10 artists by popularity
- Which artist released the longest song
- Which artists have the most tracks in the dataset
- Tracks rated highly danceable and energetic (both above 0.8)
- Artists with an average popularity of 90+, labeled as "Top Star"

## Notes
Table schema was designed to match the structure of the Kaggle CSV before 
import, including precise decimal typing for audio feature columns 
(danceability, energy, valence, etc.).
