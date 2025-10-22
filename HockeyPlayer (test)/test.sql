CREATE TABLE hockeyPlayer(
    id INT AUTO_INCREMENT PRIMARY KEY
    fname VARCHAR(30) NOT NULL,
    lname VARCHAR(50) NOT NULL,
    team VARCHAR(50) NOT NULL
);

DELIMITER //

CREATE PROCEDURE insert_player(
    IN p_fname VARCHAR(30),
    IN p_lname VARCHAR(50),
    IN p_team VARCHAR(50)
)

BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT "Chyba při vkládání hráču" AS zprava;
    END;

    START TRANSACTION;
    INSERT INTO hockeyPlayer(fname, lname, team)
    VALUES (p_fname, p_lname, p_team);
    COMMIT;
END //

DELIMITER;
CALL insert_player("David", "Pastrnák", "Boston Bruins");
CALL insert_player ("Pavel", "Zacha", NULL)


-- Při tomto skriptu, se první hráč přidá do databáze v pořádku, jsou zadány správné udaje. Ale u druhého hráče se to nepovede, protože ve sloupci team je hodnota NULL, vyvolá to chybu a spustí se HANDLER, díky němu se provede ROLLBACK a vrátí chybu.--