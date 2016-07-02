DROP TABLE transactions;
DROP TABLE tags;
DROP TABLE merchants;

CREATE TABLE merchants (
  id serial4 primary key, 
  name VARCHAR(255)
  );

CREATE TABLE tags (
  id serial4 primary key,
  description VARCHAR(255)
  );

CREATE TABLE transactions (
  id serial4 primary key,
  merchant_id INT8 references merchants(id),
  tag_id INT8 references tags(id),
  amount numeric(10,2),
  trans_date Date,
  description VARCHAR(255),
  type VARCHAR(255)
);


