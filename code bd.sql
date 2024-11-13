Exercice 2 : « Centre de Formation »

1. Créer la base de données « Centre formation »

Vous pouvez utiliser la commande SQL suivante pour créer la base :

CREATE DATABASE CentreFormation;

2. Créer les tables depuis le MLD

Voici un exemple SQL de création des tables (clés primaires et étrangères incluses) :

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

3. Ajouter une contrainte NOT NULL sur la colonne typeCours de la table Inscription

La contrainte NOT NULL est déjà ajoutée dans la définition de Inscription :

typeCours VARCHAR(50) NOT NULL

4. Ajouter une contrainte CHECK sur dateFin dans la table Session

Cette contrainte garantit que la dateFin est postérieure à la dateDebut :

ALTER TABLE Session
ADD CONSTRAINT chk_dates CHECK (dateFin > dateDebut);

5. Ajouter une colonne Active sur la table SPECIALITE

L’ajout de la colonne est déjà inclus dans la création de la table Specialite avec la valeur par défaut 0 (inactif) :

ALTER TABLE Specialite
ADD Active BOOLEAN DEFAULT 0;


--