CREATE TABLE users(
user_id SERIAL PRIMARY KEY,
username CHAR(50),
password CHAR(200),
grocery_list INT NOT NULL REFERENCES grocery_lists(list_id),
recipies INT NOT NULL REFERENCES recipies(recipie_id),
occasions INT NOT NULL REFERENCES occasions(occasion_id)
);

CREATE TABLE ingredients(
ingredient_id SERIAL PRIMARY KEY,
ingredient_name varchar(50)
);

CREATE TABLE recipies(
recipie_id SERIAL PRIMARY KEY,
creator_id INT NOT NULL REFERENCES users(user_id),
is_public BOOLEAN DEFAULT FALSE,
instructions TEXT,
ingredients INT NOT NULL REFERENCES ingredients(ingredient_id)
);

CREATE TABLE grocery_lists(
list_id SERIAL PRIMARY KEY,
creator_id INT NOT NULL REFERENCES users(user_id),
ingredients INT NOT NULL REFERENCES ingredients(ingredient_id)
);

CREATE TABLE occasions(
occasion_id SERIAL PRIMARY KEY,
occasion_date TIMESTAMP,
occasion_name varchar(50),
recipie_id INT NOT NULL REFERENCES recipies(recipie_id)
);

CREATE TABLE reviews(
review_id SERIAL PRIMARY KEY,
recipe INT NOT NULL REFERENCES recipies(recipie_id),
reviewer INT NOT NULL REFERENCES users(user_id),
rating INT CONSTRAINT chk_Ratings CHECK (Ratings >= 0 AND Ratings <= 5),
comment TEXT
);