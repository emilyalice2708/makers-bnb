ALTER TABLE spaces ADD COLUMN user_id INTEGER REFERENCES users(id);
