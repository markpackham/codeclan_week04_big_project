DROP TABLE customers_lessons;

DROP TABLE customers;

DROP TABLE lessons;

CREATE TABLE customers (
  id SERIAL primary key,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  phone VARCHAR(255),
  funds FLOAT
);

CREATE TABLE lessons (
  id SERIAL primary key,
  name VARCHAR(255),
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  phone VARCHAR(255),
  week_day VARCHAR(255),
  price FLOAT,
  max_capacity INT,
  active BOOLEAN DEFAULT true
);

CREATE TABLE customers_lessons (
  id SERIAL PRIMARY KEY,
  customer_id INT REFERENCES customers(id) ON DELETE CASCADE,
  lesson_id INT REFERENCES lessons(id) ON DELETE CASCADE
);