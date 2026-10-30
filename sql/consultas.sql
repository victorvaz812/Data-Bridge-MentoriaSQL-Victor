/*
CREATE TABLE NetflixTitles_Staging(
    show_id       VARCHAR(MAX),
    [type]          VARCHAR(MAX),
    title         VARCHAR(MAX),
    director      VARCHAR(MAX),
    [cast]          VARCHAR(MAX),
    country       VARCHAR(MAX),
    date_added    VARCHAR(MAX),
    release_year  VARCHAR(MAX),
    rating        VARCHAR(MAX),
    duration      VARCHAR(MAX),
    listed_in     VARCHAR(MAX),
    [description]   VARCHAR(MAX)
);

BULK INSERT dbo.NetflixTitles_Staging
FROM 'C:\Users\User\Desktop\Desafio Netflix\netflix_titles.csv'
WITH
(
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDQUOTE = '"',
    CODEPAGE = '65001',
    ROWTERMINATOR = '0x0A',
    TABLOCK
);

*/

-- EXE06)
SELECT top 10 * from dbo.NetflixTitles_Staging;


--EXE07)
SELECT 
show_id,
title,
[type],
[description]
FROM dbo.NetflixTitles_Staging;

--EXE08)
SELECT DISTINCT
[type]
FROM dbo.NetflixTitles_Staging;

--EXE09)
SELECT TOP 10
title,
[type],
country
FROM dbo.NetflixTitles_Staging;

--EXE10)
SELECT 
show_id,
title,
country,
release_year
FROM dbo.NetflixTitles_Staging;

--EXE11)
SELECT
title,
release_year
FROM dbo.NetflixTitles_Staging
WHERE [type] = 'TV Show' and release_year = 2021; --Se for texto na coluna, colocar entre aspas

--EXE12)
SELECT
title,
country
FROM dbo.NetflixTitles_Staging
WHERE country = 'United States'

--EXE13)
SELECT
title,
release_year
FROM dbo.NetflixTitles_Staging
--WHERE release_year > 2014 AND release_year < 2021
WHERE release_year BETWEEN 2014 AND 2021
ORDER BY release_year DESC

--EXE14)
SELECT
title,
rating
FROM dbo.NetflixTitles_Staging
WHERE rating IN ('TV-MA' , 'TV-14' , 'PG-13')

--EXE15)
SELECT
title
FROM dbo.NetflixTitles_Staging
WHERE TITLE like ('The%')

--EXE16)
SELECT
title
FROM dbo.NetflixTitles_Staging
WHERE TITLE like ('%Love%')

--EXE17)
SELECT
title,
director
FROM dbo.NetflixTitles_Staging
WHERE director IS NULL

--EXE18)
SELECT release_year, COUNT(*) AS quantidade
FROM dbo.NetflixTitles_Staging
GROUP BY release_year,
HAVING COUNT(*) > 100
ORDER BY quantidade DESC;


--EXE19)

