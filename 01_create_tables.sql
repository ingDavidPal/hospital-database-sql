-- Hospital Database - Brain Surgery Management
-- Step 1: table creation (Oracle SQL). Keys are added in 02_constraints.sql.

CREATE TABLE Hospital (
    Codi    INTEGER NOT NULL,
    Nom     CHAR (50 CHAR),
    Adreça  CHAR (50 CHAR)
);

CREATE TABLE Equip (
    ID             INTEGER NOT NULL,
    Num_medics     INTEGER,
    Hospital_Codi  INTEGER NOT NULL
);

CREATE TABLE Medics (
    ID                    INTEGER NOT NULL,
    Nom                   CHAR (50 CHAR),
    Num_seguridad_social  INTEGER,
    Equip_ID              INTEGER NOT NULL
);

CREATE TABLE Departaments (
    Nom             CHAR (50 CHAR) NOT NULL,
    Num_integrants  INTEGER
);

CREATE TABLE Funcion (
    Medics_ID         INTEGER NOT NULL,
    Departaments_Nom  CHAR (50 CHAR) NOT NULL
);

CREATE TABLE Pacient (
    DNI                CHAR (50 CHAR) NOT NULL,
    Nom                CHAR (50 CHAR),
    Telefon            INTEGER,
    Targeta_sanitaria  CHAR (50 CHAR)
);

CREATE TABLE Tumors (
    ID           INTEGER NOT NULL,
    Mesura       FLOAT,
    Zona         INTEGER,
    Pacient_DNI  CHAR (50 CHAR) NOT NULL
);

CREATE TABLE Cirugies (
    ID           INTEGER NOT NULL,
    Data         DATE NOT NULL,
    Pacient_DNI  CHAR (50 CHAR) NOT NULL,
    Equip_ID     INTEGER NOT NULL
);

CREATE TABLE Tipus (
    Tipus_prova  CHAR (50 CHAR) NOT NULL
);

CREATE TABLE Proves (
    ID                 INTEGER NOT NULL,
    Num_proves         INTEGER NOT NULL,
    Tipus_Tipus_prova  CHAR (50 CHAR) NOT NULL,
    Cirugies_ID        INTEGER NOT NULL,
    Cirugies_Data      DATE NOT NULL
);

CREATE TABLE Etapa (
    Etapa      CHAR (50 CHAR) NOT NULL,
    Proves_ID  INTEGER NOT NULL
);

CREATE TABLE Zones (
    ID            INTEGER NOT NULL,
    Localitzacio  CHAR (50 CHAR)
);

CREATE TABLE Resposta (
    Proves_ID  INTEGER NOT NULL,
    Zones_ID   INTEGER NOT NULL
);
