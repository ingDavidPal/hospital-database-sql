# Hospital Database – Brain Surgery Management

Relational database design and SQL implementation for managing brain surgery information in a hospital.

> **Note:** This repository is a reconstruction of an academic group project. The original `.sql` files were
> lost, so the scripts were rebuilt from the project's original technical report, fixing a few syntax and
> data errors found in the original code (marked with `CORRECTION` comments in the SQL files).

## Overview

Academic project for the *Relational Databases* course (Data Engineering degree). It covers the full database
design process: requirements analysis, conceptual E/R design, logical relational design, implementation in
SQL, sample data and queries. The database stores information about hospitals, medical teams, doctors,
departments, patients, tumors, brain surgeries and the medical tests linked to each surgery.

## Database Design

- **Conceptual E/R model:** entities, attributes and cardinalities, including weak entities (Tumors, Etapa).
- **Relational model:** 13 tables derived from the E/R model.
- **Primary keys:** simple keys (e.g. `Hospital.Codi`, `Pacient.DNI`) and composite keys (e.g. `Cirugies(ID, Data)`).
- **Foreign keys:** enforce referential integrity, including a composite foreign key from `Proves` to `Cirugies`.
- **Relationships:**
  - Hospital 1:N Equip, Equip 1:N Medics, Equip 1:N Cirugies
  - Pacient 1:N Cirugies, Pacient 1:N Tumors
  - Cirugies 1:N Proves, Tipus 1:N Proves, Proves 1:N Etapa
  - Medics N:N Departaments (through `Funcion`)
  - Proves N:N Zones (through `Resposta`)

Diagrams (in the `diagrams/` folder):

![E/R diagram](diagrams/er-diagram.png)
![Relational diagram](diagrams/relational-diagram.png)

## Database Structure

| Table | Description |
| --- | --- |
| Hospital | Hospital information |
| Equip | Medical teams, each belonging to a hospital |
| Medics | Medical staff, each assigned to a team |
| Departaments | Medical departments |
| Funcion | Associative table: doctors ↔ departments |
| Pacient | Patient information |
| Tumors | Tumors of each patient |
| Cirugies | Brain surgeries (patient, team, date) |
| Tipus | Types of medical tests |
| Proves | Medical tests linked to a surgery and a test type |
| Etapa | Stage of a test (e.g. Pre, Operant) |
| Zones | Hospital zones |
| Resposta | Associative table: tests ↔ zones |

## SQL Features

- `CREATE TABLE`, `ALTER TABLE ... ADD CONSTRAINT`
- `PRIMARY KEY` (simple and composite), `FOREIGN KEY` (simple and composite)
- `INSERT INTO`
- `JOIN`, `WHERE`
- `TO_DATE`
- Relational modeling and many-to-many relationships through associative tables

## Example Queries

Defined in `sql/04_queries.sql`:

1. **Surgery history of a patient** – joins `Pacient` and `Cirugies` to list all surgeries of a given patient.
2. **Medical tests of a surgery** – joins `Proves`, `Tipus` and `Etapa` to show each test with its type and stage.
3. **Professionals in a surgery** – joins `Cirugies`, `Equip`, `Medics`, `Funcion` and `Departaments` to list the
   doctors of the surgical team and their departments.

```sql
SELECT p.DNI, p.Nom AS Nom_Pacient, c.ID AS ID_Cirugia, c.Data
FROM Pacient p
JOIN Cirugies c ON p.DNI = c.Pacient_DNI
WHERE p.DNI = '64833081F';
```

## Project Structure

```
hospital-database-sql/
├── README.md
├── sql/
│   ├── 00_drop_tables.sql
│   ├── 01_create_tables.sql
│   ├── 02_constraints.sql
│   ├── 03_insert_data.sql
│   └── 04_queries.sql
└── diagrams/
    ├── er-diagram.png
    └── relational-diagram.png
```

## How to Run

The scripts use Oracle SQL syntax. Run them in this order (e.g. with Oracle SQL Developer or SQL*Plus):

1. `sql/00_drop_tables.sql` (optional, resets the database)
2. `sql/01_create_tables.sql`
3. `sql/02_constraints.sql`
4. `sql/03_insert_data.sql`
5. `sql/04_queries.sql`

Files must be read as UTF-8 (the `Hospital` table has a column named `Adreça`).

## Technologies

- SQL
- Oracle SQL / Oracle Database
- Git / GitHub

## Academic Context

Group academic project developed for the *Relational Databases* course of the Data Engineering degree.
The dataset is small and illustrative.

### Known limitations

- Sample data is minimal; `Num_medics` and `Num_integrants` are manually entered values.
- In `Etapa`, the primary key is only the stage name, so each stage value can appear only once.
