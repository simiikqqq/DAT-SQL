SET FOREIGN_KEY_CHECKS = 0;

INSERT INTO kategorie (
    id_kategorie, nazev,
    polozka_id_polozky,
    polozka_id_plozky,
    polozka_pocet_kusu,
    polozka_id_kategorie
) VALUES
    (1, 'Maso', 0, 0, 0, 0),
    (2, 'Hotová jídla', 0, 0, 0, 0),
    (3, 'Ryby', 0, 0, 0, 0),
    (4, 'Zelenina', 0, 0, 0, 0),
    (5, 'Přílohy', 0, 0, 0, 0),
    (6, 'Ovoce', 0, 0, 0, 0),
    (7, 'Dezerty', 0, 0, 0, 0),
    (8, 'Polotovary', 0, 0, 0, 0);

INSERT INTO polozka (
    id_plozky, nazev, date_expirace, pocet_kusu, id_kategorie
) VALUES
    (1, 'Kuřecí prsa', '2026-03-15', 4, 1),
    (2, 'Hovězí guláš', '2026-01-20', 2, 2),
    (3, 'Losos filet', '2026-02-10', 3, 3),
    (4, 'Mražený špenát', '2026-06-01', 5, 4),
    (5, 'Hranolky', '2026-05-12', 2, 5),
    (6, 'Jahody', '2026-04-30', 3, 6),
    (7, 'Borůvky', '2026-04-18', 2, 6),
    (8, 'Pizza Margherita', '2026-02-28', 1, 2),
    (9, 'Vepřová panenka', '2026-03-05', 2, 1),
    (10, 'Zeleninová směs', '2026-07-10', 4, 4),
    (11, 'Knedlíky', '2026-08-01', 2, 5),
    (12, 'Vanilková zmrzlina', '2026-09-15', 1, 7),
    (13, 'Rybí prsty', '2026-01-30', 3, 3),
    (14, 'Maliny', '2026-04-25', 2, 6),
    (15, 'Kuřecí vývar', '2026-02-05', 4, 8);
