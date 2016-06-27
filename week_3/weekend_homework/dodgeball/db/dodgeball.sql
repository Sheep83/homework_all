-- require( 'pg')
DROP TABLE played_matches;
DROP TABLE matches;
DROP TABLE teams;

CREATE TABLE teams (
  id serial4 primary key, 
  name VARCHAR(255)
  );

CREATE TABLE matches (
  id serial4 primary key,  
  home_team_id INT4, 
  away_team_id INT4, 
  home_team_score INT4,
  away_team_score INT4
  );

CREATE TABLE played_matches (
  id serial4 primary key,
  team_id INT4 references teams(id),
  match_id INT4 references matches(id)
  );
