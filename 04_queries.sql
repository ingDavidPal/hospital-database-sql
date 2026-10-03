-- Step 4: example queries.

-- Query 1: Surgery history of a patient.
-- Joins Pacient with Cirugies and returns every surgery of the given patient.
SELECT
    p.DNI,
    p.Nom AS Nom_Pacient,
    c.ID AS ID_Cirugia,
    c.Data
FROM Pacient p
JOIN Cirugies c
    ON p.DNI = c.Pacient_DNI
WHERE p.DNI = '64833081F';

-- Query 2: Medical tests of a surgery, with their type and stage (Pre / Operant).
-- Joins Proves with Tipus and Etapa; the surgery is identified by ID and date
-- because Cirugies has a composite primary key (ID, Data).
-- CORRECTION: the original had "pr.Cirugies_ID no = 1" (invalid syntax).
SELECT
    pr.ID AS ID_Prova,
    t.Tipus_prova,
    e.Etapa
FROM Proves pr
JOIN Tipus t
    ON pr.Tipus_Tipus_prova = t.Tipus_prova
JOIN Etapa e
    ON pr.ID = e.Proves_ID
WHERE pr.Cirugies_ID = 1
  AND pr.Cirugies_Data = TO_DATE('2025-03-21', 'YYYY-MM-DD');

-- Query 3: Doctors (and their departments) who took part in a surgery.
-- Goes from the surgery to its medical team, then to the team's doctors
-- and, through the associative table Funcion, to their departments.
SELECT
    m.Nom AS Nom_Medic,
    d.Nom AS Departament
FROM Cirugies c
JOIN Equip e
    ON c.Equip_ID = e.ID
JOIN Medics m
    ON m.Equip_ID = e.ID
JOIN Funcion f
    ON m.ID = f.Medics_ID
JOIN Departaments d
    ON f.Departaments_Nom = d.Nom
WHERE c.ID = 1
  AND c.Data = TO_DATE('2025-03-21', 'YYYY-MM-DD');
