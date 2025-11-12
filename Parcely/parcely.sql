CREATE DATABASE parcely_db;
USE parcely_db;

CREATE TABLE owners(
    owner_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NULL
);
CREATE TABLE plots(
    plot_id INT AUTO_INCREMENT PRIMARY KEY,
    owner_id INT NOT NULL,
    area DECIMAL(10, 2) NOT NULL,
    kind ENUM('Stavebni', 'zpf', 'mixed') NOT NULL,
    note VARCHAR(255) NULL,
    FOREIGN KEY (owner_id) REFERENCES owners(owner_id)
);

CREATE ROLE parcela_role;
GRANT SELECT, INSERT, UPDATE, DELETE ON parcely_db. * TO parcela_role;

CREATE USER 'simonnovak'@'localhost' IDENTIFIED BY 'databaze123';
GRANT parcela_role TO 'simonnovak'@'localhost';


SELECT * FROM owners;
SELECT * FROM plots;

INSERT INTO owners (name, email)
VALUES ('David Krol', 'david.krol@gmail.com');

INSERT INTO plots(owner_id, area, kind, note)
VALUES (1, 1500.00, 'stavebni', 'Parcela u města');

SELECT * FROM owners;
SELECT * FROM plots;

UPDATE owners
SET email = 'david.krol@seznam.cz'
WHERE name = 'David Krol';
SELECT * FROM owners;

DELETE FROM plots WHERE plot_id =1;

SELECT * FROM plots;