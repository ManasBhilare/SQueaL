WITH UserRatings AS (
    SELECT u.name, COUNT(mr.movie_id) AS movie_count
    FROM Users u
    JOIN MovieRating mr ON u.user_id = mr.user_id
    GROUP BY u.name
),
TopUser AS (
    SELECT name 
    FROM UserRatings
    ORDER BY movie_count DESC, name ASC
    LIMIT 1
),
MovieRatings AS (
    SELECT m.title, AVG(mr.rating) AS avg_rating
    FROM Movies m
    JOIN MovieRating mr ON m.movie_id = mr.movie_id
    WHERE mr.created_at BETWEEN '2020-02-01' AND '2020-02-29'
    GROUP BY m.title
),
TopMovie AS (
    SELECT title
    FROM MovieRatings
    ORDER BY avg_rating DESC, title ASC
    LIMIT 1
)

SELECT name AS results FROM TopUser
UNION ALL
SELECT title FROM TopMovie;


#ManasBhilare
