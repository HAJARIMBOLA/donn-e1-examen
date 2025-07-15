CREATE TABLE CategorieProduit (
    idCategorie INT PRIMARY KEY ,
    nom VARCHAR(100) UNIQUE NOT NULL,
    description TEXT
);

CREATE TABLE Produit (
    idProduit INT PRIMARY KEY ,
    nom VARCHAR(100) NOT NULL,
    description TEXT,
    codeBarre VARCHAR(50) UNIQUE,
    prixVente DECIMAL(10,2) NOT NULL,
    seuilAlerte INT DEFAULT 0,
    dateExpiration DATE,
    uniteMesure VARCHAR(20),
    idCategorie INT,
    FOREIGN KEY (idCategorie) REFERENCES CategorieProduit(idCategorie)
);

CREATE TABLE Rayon (
    idRayon INT PRIMARY KEY ,
    nom VARCHAR(100),
    emplacement VARCHAR(100)
);

CREATE TABLE ProduitRayon (
    idProduit INT,
    idRayon INT,
    PRIMARY KEY (idProduit, idRayon),
    FOREIGN KEY (idProduit) REFERENCES Produit(idProduit),
    FOREIGN KEY (idRayon) REFERENCES Rayon(idRayon)
);

CREATE TABLE Fournisseur (
    idFournisseur INT PRIMARY KEY ,
    nom VARCHAR(100),
    telephone VARCHAR(30),
    email VARCHAR(100),
    adresse TEXT
);

CREATE TABLE Approvisionnement (
    idApprovisionnement INT PRIMARY KEY ,
    idFournisseur INT,
    date DATE,
    statut VARCHAR(50),
    FOREIGN KEY (idFournisseur) REFERENCES Fournisseur(idFournisseur)
);

CREATE TABLE ApprovisionnementProduit (
    idApprovisionnement INT,
    idProduit INT,
    quantite INT,
    prixAchat DECIMAL(10,2),
    dateExpiration DATE,
    PRIMARY KEY (idApprovisionnement, idProduit),
    FOREIGN KEY (idApprovisionnement) REFERENCES Approvisionnement(idApprovisionnement),
    FOREIGN KEY (idProduit) REFERENCES Produit(idProduit)
);

CREATE TABLE Stock (
    idStock INT PRIMARY KEY ,
    idProduit INT,
    quantiteActuelle INT,
    dateDerniereMAJ DATE,
    FOREIGN KEY (idProduit) REFERENCES Produit(idProduit)
);

CREATE TABLE Client (
    idClient INT PRIMARY KEY ,
    nom VARCHAR(100),
    prenom VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    telephone VARCHAR(20),
    carteFidelite VARCHAR(30),
    pointsFidelite INT DEFAULT 0
);

CREATE TABLE Employe (
    idEmploye INT PRIMARY KEY ,
    nom VARCHAR(100),
    prenom VARCHAR(100),
    poste VARCHAR(50),
    telephone VARCHAR(30),
    salaire DECIMAL(10,2),
    dateEmbauche DATE
);

CREATE TABLE Caisse (
    idCaisse INT PRIMARY KEY ,
    numero VARCHAR(10),
    statut VARCHAR(20),
    type VARCHAR(20)
);

CREATE TABLE Facture (
    idFacture INT PRIMARY KEY ,
    date DATE,
    idClient INT,
    idEmploye INT,
    idCaisse INT,
    total DECIMAL(10,2),
    remiseGlobale DECIMAL(10,2),
    typeVente VARCHAR(20),
    FOREIGN KEY (idClient) REFERENCES Client(idClient),
    FOREIGN KEY (idEmploye) REFERENCES Employe(idEmploye),
    FOREIGN KEY (idCaisse) REFERENCES Caisse(idCaisse)
);

CREATE TABLE VenteProduit (
    idFacture INT,
    idProduit INT,
    quantite INT,
    prixVente DECIMAL(10,2),
    remiseUnitaire DECIMAL(10,2),
    PRIMARY KEY (idFacture, idProduit),
    FOREIGN KEY (idFacture) REFERENCES Facture(idFacture),
    FOREIGN KEY (idProduit) REFERENCES Produit(idProduit)
);

CREATE TABLE Paiement (
    idPaiement INT PRIMARY KEY ,
    idFacture INT,
    typePaiement VARCHAR(50),
    montant DECIMAL(10,2),
    datePaiement DATE,
    FOREIGN KEY (idFacture) REFERENCES Facture(idFacture)
);

CREATE TABLE Promotion (
    idPromotion INT PRIMARY KEY ,
    nom VARCHAR(100),
    description TEXT,
    type VARCHAR(30),
    valeur DECIMAL(10,2),
    dateDebut DATE,
    dateFin DATE
);

CREATE TABLE ProduitPromotion (
    idProduit INT,
    idPromotion INT,
    PRIMARY KEY (idProduit, idPromotion),
    FOREIGN KEY (idProduit) REFERENCES Produit(idProduit),
    FOREIGN KEY (idPromotion) REFERENCES Promotion(idPromotion)
);

CREATE TABLE RetourClient (
    idRetour INT PRIMARY KEY ,
    idFacture INT,
    date DATE,
    motif TEXT,
    idEmploye INT,
    FOREIGN KEY (idFacture) REFERENCES Facture(idFacture),
    FOREIGN KEY (idEmploye) REFERENCES Employe(idEmploye)
);

CREATE TABLE RetourProduit (
    idRetour INT,
    idProduit INT,
    quantite INT,
    etatProduit VARCHAR(50),
    PRIMARY KEY (idRetour, idProduit),
    FOREIGN KEY (idRetour) REFERENCES RetourClient(idRetour),
    FOREIGN KEY (idProduit) REFERENCES Produit(idProduit)
);
