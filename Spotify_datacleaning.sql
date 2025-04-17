-- Dtata CLeaning --

SELECT * FROM spotify_datacleaning.spotify;

-- We need to create another table to work on rather than working on the same raw table.

CREATE TABLE spotify_dummy
LIKE spotify;

