DROP TABLE albums;
DROP TABLE artists;

CREATE TABLE artists (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE albums (
  id SERIAL PRIMARY KEY,
  title VARCHAR(255),
  stock INT,
  genre VARCHAR,
  artist_id INT REFERENCES artists(id)
);
