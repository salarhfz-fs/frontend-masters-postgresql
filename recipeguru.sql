CREATE DATABASE recipeguru;

\c recipeguru

-- 1
CREATE TABLE ingredients (
	id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	title VARCHAR (255) UNIQUE NOT NULL
)

INSERT INTO ingredients (title)
VALUES ('bell pepper');


SELECT * FROM ingredients;

DROP TABLE ingredients;

ALTER TABLE ingredients
ADD COLUMN image VARCHAR (255);

ALTER TABLE ingredients
DROP COLUMN image;

-- 2
INSERT INTO ingredients (
 title, image, type
) VALUES (
  'red pepper', 'red_pepper.jpg', 'vegetable'
);

INSERT INTO ingredients (
  title, image, type
) VALUES
  ( 'avocado', 'avocado.jpg', 'fruit' ),
  ( 'banana', 'banana.jpg', 'fruit' ),
  ( 'beef', 'beef.jpg', 'meat' ),
  ( 'black_pepper', 'black_pepper.jpg', 'other' ),
  ( 'blueberry', 'blueberry.jpg', 'fruit' ),
  ( 'broccoli', 'broccoli.jpg', 'vegetable' ),
  ( 'carrot', 'carrot.jpg', 'vegetable' ),
  ( 'cauliflower', 'cauliflower.jpg', 'vegetable' ),
  ( 'cherry', 'cherry.jpg', 'fruit' ),
  ( 'chicken', 'chicken.jpg', 'meat' ),
  ( 'corn', 'corn.jpg', 'vegetable' ),
  ( 'cucumber', 'cucumber.jpg', 'vegetable' ),
  ( 'eggplant', 'eggplant.jpg', 'vegetable' ),
  ( 'fish', 'fish.jpg', 'meat' ),
  ( 'flour', 'flour.jpg', 'other' ),
  ( 'ginger', 'ginger.jpg', 'other' ),
  ( 'green_bean', 'green_bean.jpg', 'vegetable' ),
  ( 'onion', 'onion.jpg', 'vegetable' ),
  ( 'orange', 'orange.jpg', 'fruit' ),
  ( 'pineapple', 'pineapple.jpg', 'fruit' ),
  ( 'potato', 'potato.jpg', 'vegetable' ),
  ( 'pumpkin', 'pumpkin.jpg', 'vegetable' ),
  ( 'raspberry', 'raspberry.jpg', 'fruit' ),
  ( 'red_pepper', 'red_pepper.jpg', 'vegetable' ),
  ( 'salt', 'salt.jpg', 'other' ),
  ( 'spinach', 'spinach.jpg', 'vegetable' ),
  ( 'strawberry', 'strawberry.jpg', 'fruit' ),
  ( 'sugar', 'sugar.jpg', 'other' ),
  ( 'tomato', 'tomato.jpg', 'vegetable' ),
  ( 'watermelon', 'watermelon.jpg', 'fruit' )
ON CONFLICT DO NOTHING;

-- 3
UPDATE ingredients SET image = 'watermelon.jpg' WHERE title = 'watermelon';

UPDATE ingredients SET image = 'watermelon.jpg' WHERE title = 'watermelon' RETURNING id, title, image;

INSERT INTO ingredients
  (title, image)
VALUES
  ('not real 1', 'delete.jpg'),
  ('not real 2', 'delete.jpg');

UPDATE ingredients
SET image = 'different.jpg'
WHERE image='delete.jpg'
RETURNING id, title, image;

DELETE FROM ingredients
WHERE image='different.jpg'
RETURNING *;

-- 4
SELECT * FROM ingredients;

SELECT id, title, image, type FROM ingredients;

SELECT id, title, image
FROM ingredients
LIMIT 5;

SELECT id, title, image
FROM ingredients
LIMIT 5
OFFSET 5;

SELECT *
FROM ingredients
WHERE type = 'fruit';

SELECT *
FROM ingredients
WHERE type = 'vegetable'
  AND id < 20;

SELECT *
FROM ingredients
WHERE id <= 10
  OR id >= 20;

SELECT * FROM ingredients ORDER BY title;

SELECT * FROM ingredients ORDER BY id DESC;

-- 5
SELECT * FROM ingredients WHERE title LIKE '%pota%';

SELECT * FROM ingredients WHERE CONCAT(title, type) LIKE '%fruit%';

SELECT * FROM ingredients WHERE LOWER(CONCAT(title, type)) LIKE LOWER('%FrUiT%');

SELECT * FROM ingredients WHERE CONCAT(title, type) ILIKE '%FrUiT%';

SELECT * FROM ingredients WHERE title ILIKE 'c%';

-- 6
CREATE TABLE recipes (
  recipe_id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  title VARCHAR ( 255 ) UNIQUE NOT NULL,
  body TEXT
);

INSERT INTO recipes
  (title, body)
VALUES
  ('cookies', 'very yummy'),
  ('empanada','ugh so good'),
  ('jollof rice', 'spectacular'),
  ('shakshuka','absolutely wonderful'),
  ('khachapuri', 'breakfast perfection'),
  ('xiao long bao', 'god I want some dumplings right now');

CREATE TABLE recipes_photos (
  photo_id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  recipe_id INTEGER,
  url VARCHAR(255) NOT NULL
);

INSERT INTO recipes_photos
  (recipe_id, url)
VALUES
  (1, 'cookies1.jpg'),
  (1, 'cookies2.jpg'),
  (1, 'cookies3.jpg'),
  (1, 'cookies4.jpg'),
  (1, 'cookies5.jpg'),
  (2, 'empanada1.jpg'),
  (2, 'empanada2.jpg'),
  (3, 'jollof1.jpg'),
  (4, 'shakshuka1.jpg'),
  (4, 'shakshuka2.jpg'),
  (4, 'shakshuka3.jpg'),
  (5, 'khachapuri1.jpg'),
  (5, 'khachapuri2.jpg');

SELECT title, body FROM recipes WHERE recipe_id = 4;
SELECT url FROM recipes_photos WHERE recipe_id = 4;

SELECT recipes.title, recipes.body, recipes_photos.url
  FROM recipes_photos
  INNER JOIN
    recipes
  ON
    recipes_photos.recipe_id = recipes.recipe_id
  WHERE recipes_photos.recipe_id = 4;

SELECT r.title, r.body, rp.url
  FROM recipes_photos rp
  INNER JOIN
    recipes r
  ON
    rp.recipe_id = r.recipe_id
  WHERE rp.recipe_id = 4;

SELECT r.title, r.body, rp.url
  FROM recipes_photos rp
  INNER JOIN
    recipes r
  ON
    rp.recipe_id = r.recipe_id;

-- 7 

