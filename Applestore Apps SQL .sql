
--- 07-01-2024 21:34:37
--- SQLite
create TABLE applestore_description_combined AS

SELECT * FROM appleStore_description1

UNION ALL

SELECT * FROM appleStore_description2

union ALL

SELECT * FROM appleStore_description3

UNION ALL

SELECT * FROM appleStore_description4;

--- 07-01-2024 21:34:43
--- SQLite
SELECT COUNT(DISTINCT id) AS UniqueAppID

FROM AppleStore;

--- 07-01-2024 21:34:47
--- SQLite
SELECT COUNT(DISTINCT id) AS UniqueAppID

FROM applestore_description_combined;

--- 07-01-2024 21:35:30
--- SQLite
SELECT count(*) AS MissingValue 
FROM AppleStore
WHERE track_name is NULL OR user_rating is null or prime_genre is NULL;

--- 07-01-2024 21:35:38
--- SQLite
SELECT count(*) AS MissingValue 
FROM applestore_description_combined
WHERE app_desc is NULL;

--- 07-01-2024 21:36:34
--- SQLite
SELECT prime_genre, count(*) as NumOfApps
FROM AppleStore
GROUP BY prime_genre
order by NumOfApps DESC;

--- 07-01-2024 21:36:41
--- SQLite
SELECT min(user_rating) as MinRating,
       max(user_rating) AS MaxRating,
       avg(user_rating) AS AvgRating
FROM AppleStore;

--- 07-01-2024 21:36:48
--- SQLite
select case 
when price > 0 then "Paid"
else "Free"
end as App_Type,
avg(user_rating) as Avg_Rating
FROM AppleStore
group by App_Type;

--- 07-01-2024 21:37:04
--- SQLite
select case 
when price > 0.01 <= 5 then "Under5"
end as App_Type,
avg(user_rating) as Avg_Rating
FROM AppleStore
group by App_Type;

--- 07-01-2024 21:37:10
--- SQLite
select case 
when price > 5 then "Over5"
end as App_Type,
avg(user_rating) as Avg_Rating
FROM AppleStore
group by App_Type;

--- 07-01-2024 21:37:41
--- SQLite
SELECT prime_genre,
avg(user_rating) AS Avg_Rating
FROM AppleStore
GROUP by prime_genre
ORDER by Avg_Rating;

--- 07-01-2024 21:37:49
--- SQLite
SELECT CASE
WHEN lang_num < 10 THEN "LangUnder10"
WHEN lang_num BETWEEN 10 and 30 then "Lang10to30"
end AS language_count,
avg(user_rating) as Avg_Rating
FROM AppleStore
group by language_count
ORDER by Avg_Rating DESC;

--- 07-01-2024 21:39:45
--- SQLite
SELECT CASE 
when length(b.app_desc) < 750 THEN "ShortDescription"
else "LongDescription"
END as DescriptionLengthCount,
avg(a.user_rating) as Avg_Rating 

FROM 
AppleStore as a 
JOIN
applestore_description_combined as b
ON
a.id = b.id

GROUP BY DescriptionLengthCount
order by Avg_Rating DESC;

