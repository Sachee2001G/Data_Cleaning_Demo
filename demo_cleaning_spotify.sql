SELECT * FROM spotify_datacleaning.spotify_dummy;

-- To insert datas from main table [ spotify ]

INSERT spotify_dummy
SELECT *
FROM spotify;

SELECT *
FROM spotify_dummy;

-- To find duplicate values using CTE

WITH duplicate_cte AS
(
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY MyUnknownColumn,
 Age, Gender, 
 spotify_usage_period, 
 spotify_listening_device, 
 spotify_subscription_plan, 
 premium_sub_willingness, 
 preffered_premium_plan, 
 preferred_listening_content, 
 fav_music_genre, 
 music_time_slot, 
 music_Influencial_mood, 
 music_lis_frequency, 
 music_expl_method, 
 music_recc_rating, 
 pod_lis_frequency, 
 fav_pod_genre, 
 preffered_pod_format, 
 pod_host_preference, 
 preffered_pod_duration, 
 pod_variety_satisfaction
) 
AS row_num FROM spotify_dummy
)
SELECT *
FROM duplicate_cte;

-- the value of row_num is 1 so there is no duplicate values.

-- Standarizing Data

SELECT DISTINCT (TRIM(spotify_listening_device))
FROM spotify_dummy;

SELECT DISTINCT (TRIM(preffered_premium_plan))
FROM spotify_dummy;

SELECT DISTINCT (TRIM(preffered_pod_format))
FROM spotify_dummy;


-- To check for more

SELECT spotify_listening_device
FROM spotify_dummy
WHERE spotify_listening_device LIKE '%voice%';


SELECT DISTINCT (MyUnknownColumn)
FROM spotify_dummy;

SELECT *
FROM spotify_dummy;

ALTER TABLE spotify_dummy
RENAME COLUMN MyUnknownColumn TO Serial_Number;

-- To check if any vales are null.

SELECT *
FROM spotify_dummy
WHERE Serial_Number IS NULL;


SELECT *
FROM spotify_dummy
WHERE spotify_listening_device IS NULL;

-- To check Null or Blank values

SELECT *
FROM spotify_dummy
WHERE spotify_subscription_plan IS NULL
OR spotify_subscription_plan = ' ';


-- Exploratory Data Analysis [EDA]

SELECT * 
FROM spotify_dummy
WHERE spotify_listening_device = 'Smartphone'
ORDER BY AGE DESC;

SELECT Age, fav_music_genre, MAX(music_recc_rating) AS max_rating
FROM spotify_dummy
GROUP BY Age, fav_music_genre
ORDER BY 2 DESC;

-- Drop the Unnecesarry column.

-- let's initially add a column

ALTER TABLE spotify_dummy
ADD email text;


ALTER TABLE spotify_dummy
DROP COLUMN email;

SELECT *
FROM spotify_dummy;















