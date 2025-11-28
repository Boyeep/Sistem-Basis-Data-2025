CREATE DATABASE gamestop_db;
USE gamestop_db;

CREATE TABLE customer (
    C_id CHAR(5) PRIMARY KEY,
    C_name VARCHAR(100) NOT NULL,
    C_email VARCHAR(100),
    C_gender CHAR(1),
    C_pnumber VARCHAR(15),
    C_address VARCHAR(200)
);

CREATE TABLE staff (
    S_id CHAR(5) PRIMARY KEY,
    S_name VARCHAR(100) NOT NULL,
    S_email VARCHAR(100),
    S_gender CHAR(1),
    S_position VARCHAR(50),
    S_address VARCHAR(200)
);

CREATE TABLE game (
    G_id CHAR(5) PRIMARY KEY,
    G_title VARCHAR(100) NOT NULL,
    G_release_date DATE,
    G_rating VARCHAR(5),
    G_price INT,
    G_stock INT
);

CREATE TABLE transaction (
    T_id CHAR(5) PRIMARY KEY,
    T_date DATE,
    T_method VARCHAR(20),
    customer_id CHAR(5),
    staff_id CHAR(5),
    FOREIGN KEY (customer_id) REFERENCES customer(C_id)
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (staff_id) REFERENCES staff(S_id)
        ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE tags (
    tag_name VARCHAR(50) PRIMARY KEY,
    tag_description TEXT
);

CREATE TABLE game_tags (
    tags_name VARCHAR(50),
    game_id CHAR(5),
    PRIMARY KEY (tags_name, game_id),
    FOREIGN KEY (tags_name) REFERENCES tags(tag_name)
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (game_id) REFERENCES game(G_id)
        ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE transaction_detail (
    transaction_id CHAR(5),
    game_id CHAR(5),
    quantity INT,
    total_price INT,
    PRIMARY KEY (transaction_id, game_id),
    FOREIGN KEY (transaction_id) REFERENCES transaction(T_id)
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (game_id) REFERENCES game(G_id)
        ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE developer (
    D_id CHAR(5) PRIMARY KEY,
    D_name VARCHAR(100) NOT NULL,
    D_country VARCHAR(50) NOT NULL
);

ALTER TABLE game
ADD developer_id CHAR(5),
ADD FOREIGN KEY (developer_id) REFERENCES developer(D_id)
    ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE staff
ADD S_pnumber VARCHAR(15) NOT NULL;

ALTER TABLE customer
ADD C_joindate DATE;
