-- /db/init.sql

CREATE TABLE bok (
  id SERIAL PRIMARY KEY,
  user_id INT, -- we’ll ignore auth for now, can be NULL
  title TEXT NOT NULL,
  description TEXT,
  source_url TEXT
);
