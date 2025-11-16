CREATE TABLE recipes (
                         id SERIAL PRIMARY KEY,
                         title VARCHAR(200) NOT NULL,
                         description TEXT
);

CREATE TABLE categories (
                            id SERIAL PRIMARY KEY,
                            label VARCHAR(80) NOT NULL UNIQUE
);

CREATE TABLE recipe_category (
                                 recipe_id INT NOT NULL REFERENCES recipes(id) ON DELETE CASCADE,
                                 category_id INT NOT NULL REFERENCES categories(id) ON DELETE CASCADE,
                                 PRIMARY KEY (recipe_id, category_id)
);

CREATE TABLE ingredients (
                             id SERIAL PRIMARY KEY,
                             ingredient_name VARCHAR(150) NOT NULL UNIQUE
);


CREATE TABLE recipe_ingredient (
                                   recipe_id INT NOT NULL REFERENCES recipes(id) ON DELETE CASCADE,
                                   ingredient_id INT NOT NULL REFERENCES ingredients(id) ON DELETE CASCADE,
                                   amount NUMERIC(6,2) CHECK (amount > 0),
                                   unit VARCHAR(30),
                                   PRIMARY KEY (recipe_id, ingredient_id)
);


CREATE TABLE steps (
                       id SERIAL PRIMARY KEY,
                       instruction TEXT NOT NULL
);

CREATE TABLE recipe_step (
                             recipe_id INT NOT NULL REFERENCES recipes(id) ON DELETE CASCADE,
                             step_id INT NOT NULL REFERENCES steps(id) ON DELETE CASCADE,
                             position INT NOT NULL CHECK (position > 0),
                             PRIMARY KEY (recipe_id, step_id)
);
