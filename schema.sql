CREATE TABLE IF NOT EXISTS dramas(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  country TEXT NOT NULL,           -- 'C-Drama' ou 'K-Drama'
  title TEXT NOT NULL,
  year TEXT,
  genres TEXT DEFAULT '',          -- séparés par |
  synopsis TEXT,
  seen INTEGER DEFAULT 0,
  rating INTEGER,                  -- 1 à 6
  comment TEXT,
  tmdb_id INTEGER,
  added_at TEXT DEFAULT CURRENT_TIMESTAMP
);
