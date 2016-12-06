Set up database


CREATE DATABASE to_do_josh

CREATE TABLE tasks (id serial PRIMARY KEY, description varchar, due_date date, list_id int)

CREATE DATABASE to_do_josh_test WITH TEMPLATE to_do_josh
