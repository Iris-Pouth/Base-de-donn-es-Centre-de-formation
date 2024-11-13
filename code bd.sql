
CREATE DATABASE CentreFormation;


-- Table Étudiant
CREATE TABLE Etudiant (
    NumCINEtu INT PRIMARY KEY,
    NomEtu VARCHAR(50),
    prenomEtu VARCHAR(50),
    dateNaissance DATE,
    adresseEtu VARCHAR(100),
    villeEtu VARCHAR(50),
    niveauEtu VARCHAR(50)
);

-- Table Session
CREATE TABLE Session (
    codeSess INT PRIMARY KEY,
    nomSess VARCHAR(50),
    dateDebut DATE,
    dateFin DATE
);

-- Table TypeCours (Association entre Étudiant et Session)
CREATE TABLE Inscription (
    NumCINEtu INT,
    codeSess INT,
    typeCours VARCHAR(50) NOT NULL,
    PRIMARY KEY (NumCINEtu, codeSess),
    FOREIGN KEY (NumCINEtu) REFERENCES Etudiant(NumCINEtu),
    FOREIGN KEY (codeSess) REFERENCES Session(codeSess)
);

-- Table Spécialité
CREATE TABLE Specialite (
    codeSpec INT PRIMARY KEY,
    nomSpec VARCHAR(50),
    descSpec VARCHAR(100),
    Active BOOLEAN DEFAULT 0 -- Indicateur de l'activité de la spécialité
);

-- Table Formation
CREATE TABLE Formation (
    codeForm INT PRIMARY KEY,
    titreForm VARCHAR(50),
    dureeForm INT,
    prixForm DECIMAL(10, 2)
);

