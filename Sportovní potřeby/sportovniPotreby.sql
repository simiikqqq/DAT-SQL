CREATE DATABASE IF NOT EXISTS sportovni_potreby;
USE sportovni_potreby;

CREATE TABLE Kategorie(
    id_kategorie INT AUTO_INCREMENT PRIMARY KEY,
    nazev VARCHAR(100) NOT NULL,
    popis TEXT
);

CREATE TABLE Vyrobce (
    id_vyrobce INT AUTO_INCREMENT PRIMARY KEY,
    nazev VARCHAR(100) NOT NULL,
    zeme VARCHAR(50)
);

CREATE TABLE SportovniPotreba(
    id_potreby INT AUTO_INCREMENT PRIMARY KEY,
    nazev VARCHAR(150) NOT NULL,
    cena DECIMAL(10,2),
    id_kategorie INT,
    id_vyrobce INT,
    CONSTRAINT fk_kategorie FOREIGN KEY (id_kategorie) REFERENCES Kategorie(id_kategorie),
    CONSTRAINT fk_vyrobce FOREIGN KEY (id_vyrobce) REFERENCES Vyrobce(id_vyrobce)
);

DELIMITER $$

CREATE PROCEDURE pridat_potrebu(
    IN p_nazev VARCHAR(150),
    IN p_cena DECIMAL(10,2),
    IN p_id_kategorie INT,
    IN p_id_vyrobce INT
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Chyba při vkládání sportovní potřeby.' AS zprava;
    END;

    START TRANSACTION;

    INSERT INTO SportovniPotreba (nazev, cena, id_kategorie, id_vyrobce)
    VALUES (p_nazev, p_cena, p_id_kategorie, p_id_vyrobce);

    COMMIT;

    SELECT 'Sportovní potřeba byla úspěšně přidána.' AS zprava;
END$$

DELIMITER ;


INSERT INTO Kategorie (nazev, popis)
VALUES 
    ('Oblečení', 'Sportovní trička a bundy'),
    ('Kola', 'Horská a silniční kola'),
    ('Helmy', 'Ochranné přilby');

INSERT INTO Vyrobce (nazev, zeme)
VALUES 
    ('Adidas', 'Německo'),
    ('Author', 'Česko');

CALL pridat_potrebu('Cyklistická helma', 1299.00, 3, 2);
SELECT * FROM SportovniPotreba;


CALL pridat_potrebu('Neplatná potřeba', 500, 99, 1);
CALL pridat_potrebu('Neplatná potřeba', '1000' , 1, 99);

SELECT * FROM SportovniPotreba;
