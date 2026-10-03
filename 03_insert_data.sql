-- Step 3: sample data. Parent tables are loaded before child tables.

INSERT INTO Hospital VALUES (1, 'Hospital Central', 'Av. Hospital 76');

INSERT INTO Departaments VALUES ('Cirugia', 10);
INSERT INTO Departaments VALUES ('Oncologia', 19);
INSERT INTO Departaments VALUES ('Radiologia', 28);

INSERT INTO Equip VALUES (1, 5, 1);
INSERT INTO Equip VALUES (2, 6, 1);

INSERT INTO Medics VALUES (1, 'Dr. Herrero', 111111, 1);
INSERT INTO Medics VALUES (2, 'Dra. Torres', 222222, 1);
INSERT INTO Medics VALUES (3, 'Dr. Garcia', 333333, 2);

INSERT INTO Funcion VALUES (1, 'Cirugia');
INSERT INTO Funcion VALUES (2, 'Oncologia');
INSERT INTO Funcion VALUES (3, 'Radiologia');

INSERT INTO Pacient VALUES ('64833081F', 'Laura Martinez', 616444678, 'TS1');
INSERT INTO Pacient VALUES ('47131832P', 'Carlos Perez', 616283741, 'TS2');

INSERT INTO Cirugies VALUES (1, TO_DATE('2025-03-21', 'YYYY-MM-DD'), '64833081F', 1);
INSERT INTO Cirugies VALUES (2, TO_DATE('2024-11-10', 'YYYY-MM-DD'), '64833081F', 2);

INSERT INTO Tipus VALUES ('Motriu');
INSERT INTO Tipus VALUES ('Paraules');

-- CORRECTION: the original script used 'Analitica' and 'Biopsia', which do not
-- exist in Tipus (foreign key violation). Replaced by the types actually
-- inserted above, as shown in the report's result tables.
INSERT INTO Proves VALUES (10, 1, 'Motriu',   1, TO_DATE('2025-03-21', 'YYYY-MM-DD'));
INSERT INTO Proves VALUES (11, 1, 'Paraules', 1, TO_DATE('2025-03-21', 'YYYY-MM-DD'));

INSERT INTO Etapa VALUES ('Pre', 10);
INSERT INTO Etapa VALUES ('Operant', 11);

INSERT INTO Zones VALUES (1, 'Zona 1');
INSERT INTO Zones VALUES (2, 'Zona 2');

INSERT INTO Resposta VALUES (10, 1);
INSERT INTO Resposta VALUES (11, 2);

INSERT INTO Tumors VALUES (1, 3.4, 1, '64833081F');
INSERT INTO Tumors VALUES (2, 1.8, 2, '64833081F');

COMMIT;
