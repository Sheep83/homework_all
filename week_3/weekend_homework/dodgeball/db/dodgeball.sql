require('pg')

DROP TABLE matches;
DROP TABLE teams;

CREATE TABLE teams (
  id serial4 primary key, 
  name VARCHAR(255)
  );

CREATE TABLE matches
  id serial4 primary key, 
  venue VARCHAR(255), 
  home_team VARCHAR(255), 
  away_team VARCHAR(255)
  );
