
-- join post & user table
-- SELECT * FROM post
--     JOIN "user" ON post.user_id = "user".id

-- join table & show post id
-- SELECT post.id FROM post
--     JOIN "user" ON post.user_id = "user".id

-- join table & aliasing
SELECT * FROM post as p
    JOIN "user" as u ON p.user_id = u.id


-- insert data set user_id null
-- INSERT INTO post (id, title, user_id) 
--     VALUES (5, 'this is a test post title', NULL)

-- left join table
SELECT * FROM post 
    LEFT JOIN "user" ON post.user_id = "user".id
  

-- right join table
SELECT * FROM post
    RIGHT JOIN "user" ON post.user_id = "user".id


-- full join table
SELECT * FROM post
    FULL JOIN "user" ON post.user_id = "user".id