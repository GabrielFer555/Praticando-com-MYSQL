--@block
CREATE TABLE Users(
    id INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(255) NOT NULL UNIQUE,
    bio TEXT,
    country VARCHAR(2)
);
--@block
INSERT INTO users (email, bio, country)
VALUES
    ('kaiberimanos3@gmail.com', 'Hi i´m Gabriel', 'BR'),
    ('vladmir@hotmail.com', 'Vodka vladimir!', 'RU'),
    ('Luigicad@bol.com', 'Cheese is nice!', 'IT');
--@block 
SELECT * FROM users
WHERE email LIKE 'k%'
ORDER BY id ASC
LIMIT 2;
--@block
CREATE TABLE rooms(
    id INT AUTO_INCREMENT,
    street VARCHAR(255) NOT NULL,
    owner_id INT NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(owner_id) REFERENCES users(id)
)
--@block
INSERT INTO rooms(owner_id,street)
VALUES
(1, 'Rua Buenos Aires, 200'),
(1, 'Rua Cristal, 309'),
(1, 'Rua Canadá, 501');
--@block
SELECT 
    Users.id AS users_id,
    Rooms.id AS rooms_id,
    email,
    street
FROM users
INNER JOIN Rooms ON Rooms.owner_id = Users.id;
--@block
CREATE TABLE bookings(
    id INT AUTO_INCREMENT,
    guest_id INT NOT NULL,
    owner_id INT NOT NULL,
    checkin DATETIME,
    PRIMARY KEY  (id)
    FOREIGN KEY(guest_id) REFERENCES Users.id
    FOREIGN KEY (owner_id) REFERENCES rooms_id
);
--@block




