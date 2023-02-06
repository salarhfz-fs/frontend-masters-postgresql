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

