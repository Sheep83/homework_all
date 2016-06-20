
SELECT users.id, COUNT(times.time = '17.15') WHERE
SELECT times.show_id, 
INNER JOIN shows_users ON shows_users.show_id = users.id
INNER JOIN times ON times.time = '17.15';








