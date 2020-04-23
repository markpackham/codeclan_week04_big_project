DROP TABLE btable;
DROP TABLE atable;

CREATE TABLE atable (id SERIAL primary key);

CREATE TABLE btable (
  id SERIAL PRIMARY KEY,
  fk_id INT REFERENCES atable(id) ON DELETE CASCADE
);