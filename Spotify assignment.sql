CREATE TABLE artists (
  id INT PRIMARY KEY AUTO_INCREMENT,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  date_of_birth DATE NOT NULL
);

CREATE TABLE genres (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL
);

CREATE TABLE songs (
  id INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(100) NOT NULL,
  duration INT NOT NULL,
  explicit BOOLEAN NOT NULL,
  artist_id INT NOT NULL,
  cloud_link VARCHAR(255) NOT NULL,
  FOREIGN KEY (artist_id) REFERENCES artists(id)
);

CREATE TABLE song_genre (
  song_id INT NOT NULL,
  genre_id INT NOT NULL,
  PRIMARY KEY (song_id, genre_id),
  FOREIGN KEY (song_id) REFERENCES songs(id),
  FOREIGN KEY (genre_id) REFERENCES genres(id)
);

CREATE TABLE users (
  id INT PRIMARY KEY AUTO_INCREMENT,
  email VARCHAR(255) NOT NULL UNIQUE,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  password VARCHAR(255) NOT NULL
);

CREATE TABLE user_song (
  user_id INT NOT NULL,
  song_id INT NOT NULL,
  is_favorite BOOLEAN NOT NULL,
  PRIMARY KEY (user_id, song_id),
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (song_id) REFERENCES songs(id)
);

CREATE TABLE playlists (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  user_id INT NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE playlist_song (
  playlist_id INT NOT NULL,
  song_id INT NOT NULL,
  PRIMARY KEY (playlist_id, song_id),
  FOREIGN KEY (playlist_id) REFERENCES playlists(id),
  FOREIGN KEY (song_id) REFERENCES songs(id)
);