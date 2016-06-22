
  SELECT users.name FROM shows_users
  INNER JOIN users ON users.id = shows_users.user_id
  INNER JOIN times on times.show_id = shows_users.show_id
  WHERE times.time = '17:15';









