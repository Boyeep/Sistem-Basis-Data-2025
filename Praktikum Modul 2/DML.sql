INSERT INTO customer (C_id, C_name, C_email, C_gender, C_pnumber, C_address, C_joindate) VALUES
('C0001', 'Alice', 'alice@example.com', 'F', '(555) 010-1234', '123 Maple St, IL', '2023-12-01'),
('C0002', 'Ben', 'ben@example.com', 'M', '(555) 011-6789', '321 Birch Blvd, WI', '2023-12-02'),
('C0003', 'Chloe', 'chloe@example.com', 'F', '(555) 012-3456', '654 Cedar Ct, TX', '2023-12-03'),
('C0004', 'Daniel', 'daniel@example.com', 'M', '(555) 013-8901', '246 Willow Way, OR', '2023-12-04'),
('C0005', 'Ethan', 'ethan@example.com', 'M', '(555) 014-9012', '147 Maplewood Ln, GA', '2023-12-05');

INSERT INTO staff (S_id, S_name, S_email, S_gender, S_position, S_pnumber, S_address) VALUES
('S0001', 'Adam', 'adam@example.com', 'M', 'Cashier', '(555) 010-5678', '456 Oak Ave, NE'),
('S0002', 'Bella', 'bella@example.com', 'F', 'Cashier', '(555) 011-2345', '789 Pine Rd, OH'),
('S0003', 'Charlie', 'charlie@example.com', 'M', 'Database Engineer', '(555) 012-7890', '987 Elm St, CO'),
('S0004', 'Daisy', 'daisy@example.com', 'F', 'Customer Service Rep', '(555) 013-4567', '135 Spruce Pl, WA'),
('S0005', 'Emma', 'emma@example.com', 'F', 'Content Writer', '(555) 014-5678', '369 Ash Dr, TN');

INSERT INTO transaction (T_id, T_date, T_method, customer_id, staff_id) VALUES
('T0001', '2024-01-01', 'Cash', 'C0001', 'S0001'),
('T0002', '2024-01-02', 'Cash', 'C0002', 'S0001'),
('T0003', '2024-01-02', 'QRIS', 'C0003', 'S0001'),
('T0004', '2024-01-09', 'Debit', 'C0004', 'S0002'),
('T0005', '2024-01-13', 'Credit', 'C0005', 'S0002');

INSERT INTO tags (tag_name, tag_description) VALUES
('Action', 'Fast-paced gameplay requiring quick reflexes and combat skills.'),
('Horror', 'Focuses on creating fear and tension through unsettling atmospheres and scares.'),
('Puzzle', 'Challenges players to solve problems and riddles using logic and critical thinking.'),
('RPG', 'Players assume character roles, developing skills and engaging in storytelling.'),
('Sports', 'Involves competitive gameplay based on real or fictional sports, emphasizing skill, strategy, and teamwork.');

INSERT INTO game (G_id, G_title, G_release_date, G_rating, G_price, G_stock) VALUES
('G0001', 'Call of Duty: Black Ops 6', '2024-10-25', '18+', 1040000, 2),
('G0002', 'F1 24', '2024-05-31', '3+', 759000, 11),
('G0003', 'Hogwarts Legacy', '2023-02-11', '13+', 799000, 9),
('G0004', 'FC 25', '2024-09-27', '3+', 799000, 32),
('G0005', 'HELLDIVERS II', '2024-02-08', '18+', 579000, 20),
('G0006', 'Concord', '2024-08-23', '13+', 579000, 10);

INSERT INTO game_tags (tags_name, game_id) VALUES
('Action', 'G0001'),
('Action', 'G0005'),
('Action', 'G0006'),
('Action', 'G0003'),
('RPG', 'G0003'),
('Sports', 'G0002'),
('Sports', 'G0004');

INSERT INTO transaction_detail (transaction_id, game_id, quantity, total_price) VALUES
('T0001', 'G0001', 1, 1040000),
('T0002', 'G0002', 1, 759000),
('T0003', 'G0003', 1, 799000),
('T0004', 'G0004', 2, 1598000),
('T0005', 'G0005', 2, 1158000);

INSERT INTO developer (D_id, D_name, D_country) VALUES
('D0001', 'Activision', 'USA'),
('D0002', 'EA Sports', 'Canada'),
('D0003', 'Avalanche', 'UK'),
('D0004', 'Arrowhead', 'Sweden'),
('D0005', 'Firewalk Studio', 'USA');

ALTER TABLE game
ADD CONSTRAINT fk_game_developer FOREIGN KEY (developer_id)
REFERENCES developer(D_id)
ON UPDATE CASCADE
ON DELETE CASCADE;

INSERT INTO staff (S_id, S_name, S_email, S_gender, S_position, S_pnumber, S_address)
VALUES ('S0006', 'Fiona', 'fiona@example.com', 'F', 'Cashier', '(555) 016-3456', '420 Thick Fein, LS');

UPDATE game
SET G_price = G_price * 0.7
WHERE G_rating = '3+';

INSERT INTO transaction (T_id, T_date, T_method, customer_id, staff_id)
VALUES ('T0006', '2024-11-01', 'Cash', 'C0005', 'S0001');

INSERT INTO transaction_detail (transaction_id, game_id, quantity, total_price)
SELECT 'T0006', 'G0003', G_stock, G_price * G_stock FROM game WHERE G_id = 'G0003';

UPDATE game SET G_stock = 0 WHERE G_id = 'G0003';

UPDATE staff
SET S_position = 'Database Engineer'
WHERE S_id = 'S0006';

DELETE FROM game WHERE G_title = 'Concord';

DROP DATABASE GameStop;
