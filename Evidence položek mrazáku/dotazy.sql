SELECT 
    p.id_polozky,
    p.nazev AS polozka,
    k.nazev AS kategorie,
    p.datum_expirace,
    p.pocet_kusu
FROM polozka p
JOIN kategorie k ON p.id_kategorie = k.id_kategorie;

INSERT INTO polozka (nazev, datum_expirace, pocet_kusu, id_kategorie)
VALUES ('Ledová káva', '2026-10-01', 2, 7);

-- UPDATE polozka
-- SET pocet_kusu = 5
-- WHERE id_polozky = 1;
 
-- UPDATE polozka
-- SET datum_expirace = '2026-04-01'
-- WHERE id_polozky = 3;
 
-- DELETE FROM polozka
-- WHERE id_polozky = 15;

SELECT 
    p.nazev,
    k.nazev AS kategorie,
    p.datum_expirace
FROM polozka p
JOIN kategorie k ON p.id_kategorie = k.id_kategorie
WHERE p.datum_expirace <= CURDATE() + INTERVAL 30 DAY;

SELECT 
    SUM(pocet_kusu) AS celkovy_pocet_kusu
FROM polozka;

SELECT 
    k.nazev AS kategorie,
    COUNT(p.id_polozky) AS pocet_polozek
FROM kategorie k
LEFT JOIN polozka p ON k.id_kategorie = p.id_kategorie
GROUP BY k.nazev;

SELECT 
    nazev,
    datum_expirace
FROM polozka
WHERE datum_expirace = (SELECT MIN(datum_expirace) FROM polozka)
   OR datum_expirace = (SELECT MAX(datum_expirace) FROM polozka);

SELECT 
    nazev,
    datum_expirace,
    pocet_kusu
FROM polozka
WHERE datum_expirace <= CURDATE() + INTERVAL 14 DAY

UNION

SELECT 
    nazev,
    datum_expirace,
    pocet_kusu
FROM polozka
WHERE pocet_kusu < 2;