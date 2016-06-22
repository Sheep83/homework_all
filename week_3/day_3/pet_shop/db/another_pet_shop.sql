
DROP TABLE pets;
DROP TABLE pet_shops;



CREATE TABLE pet_shops (
id SERIAL4 primary key,
name VARCHAR(255),
stock_type VARCHAR(255),
address VARCHAR(255)
);

CREATE TABLE pets (
id SERIAL4 primary key,
name VARCHAR(255),
type VARCHAR(255),
pet_shop_id INT4 REFERENCES pet_shops(id)
);

