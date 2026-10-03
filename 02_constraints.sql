-- Step 2: primary keys and foreign keys.
-- All primary keys go first, because Proves references the composite key of Cirugies.

-- PRIMARY KEYS
ALTER TABLE Hospital     ADD CONSTRAINT Hospital_PK     PRIMARY KEY (Codi);
ALTER TABLE Equip        ADD CONSTRAINT Equip_PK        PRIMARY KEY (ID);
ALTER TABLE Medics       ADD CONSTRAINT Medics_PK       PRIMARY KEY (ID);
ALTER TABLE Departaments ADD CONSTRAINT Departaments_PK PRIMARY KEY (Nom);
ALTER TABLE Funcion      ADD CONSTRAINT Funcion_PK      PRIMARY KEY (Medics_ID, Departaments_Nom);
ALTER TABLE Pacient      ADD CONSTRAINT Pacient_PK      PRIMARY KEY (DNI);
ALTER TABLE Tumors       ADD CONSTRAINT Tumors_PK       PRIMARY KEY (ID);
ALTER TABLE Cirugies     ADD CONSTRAINT Cirugies_PK     PRIMARY KEY (ID, Data);
ALTER TABLE Tipus        ADD CONSTRAINT Tipus_PK        PRIMARY KEY (Tipus_prova);
ALTER TABLE Proves       ADD CONSTRAINT Proves_PK       PRIMARY KEY (ID);
ALTER TABLE Etapa        ADD CONSTRAINT Etapa_PK        PRIMARY KEY (Etapa);
ALTER TABLE Zones        ADD CONSTRAINT Zones_PK        PRIMARY KEY (ID);
ALTER TABLE Resposta     ADD CONSTRAINT Resposta_PK     PRIMARY KEY (Proves_ID, Zones_ID);

-- FOREIGN KEYS
ALTER TABLE Equip ADD CONSTRAINT Equip_Hospital_FK
    FOREIGN KEY (Hospital_Codi) REFERENCES Hospital (Codi);

ALTER TABLE Medics ADD CONSTRAINT Medics_Equip_FK
    FOREIGN KEY (Equip_ID) REFERENCES Equip (ID);

ALTER TABLE Funcion ADD CONSTRAINT Funcion_Medics_FK
    FOREIGN KEY (Medics_ID) REFERENCES Medics (ID);

ALTER TABLE Funcion ADD CONSTRAINT Funcion_Departaments_FK
    FOREIGN KEY (Departaments_Nom) REFERENCES Departaments (Nom);

ALTER TABLE Tumors ADD CONSTRAINT Tumors_Pacient_FK
    FOREIGN KEY (Pacient_DNI) REFERENCES Pacient (DNI);

ALTER TABLE Cirugies ADD CONSTRAINT Cirugies_Pacient_FK
    FOREIGN KEY (Pacient_DNI) REFERENCES Pacient (DNI);

ALTER TABLE Cirugies ADD CONSTRAINT Cirugies_Equip_FK
    FOREIGN KEY (Equip_ID) REFERENCES Equip (ID);

ALTER TABLE Proves ADD CONSTRAINT Proves_Cirugies_FK
    FOREIGN KEY (Cirugies_ID, Cirugies_Data) REFERENCES Cirugies (ID, Data);

ALTER TABLE Proves ADD CONSTRAINT Proves_Tipus_FK
    FOREIGN KEY (Tipus_Tipus_prova) REFERENCES Tipus (Tipus_prova);

ALTER TABLE Etapa ADD CONSTRAINT Etapa_Proves_FK
    FOREIGN KEY (Proves_ID) REFERENCES Proves (ID);

ALTER TABLE Resposta ADD CONSTRAINT Resposta_Proves_FK
    FOREIGN KEY (Proves_ID) REFERENCES Proves (ID);

ALTER TABLE Resposta ADD CONSTRAINT Resposta_Zones_FK
    FOREIGN KEY (Zones_ID) REFERENCES Zones (ID);
