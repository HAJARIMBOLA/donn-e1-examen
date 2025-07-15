SELECT 
    p.idProduit, p.nom AS nomProduit, c.nom AS categorie, 
    s.quantiteActuelle, p.seuilAlerte
FROM Produit p
LEFT JOIN CategorieProduit c ON p.idCategorie = c.idCategorie
LEFT JOIN Stock s ON p.idProduit = s.idProduit
ORDER BY p.nom;


SELECT 
    p.nom, s.quantiteActuelle, p.seuilAlerte
FROM Produit p
JOIN Stock s ON p.idProduit = s.idProduit
WHERE s.quantiteActuelle < p.seuilAlerte;


SELECT 
    f.idFacture, f.date, p.nom AS produit, v.quantite, 
    v.prixVente, v.remiseUnitaire, 
    (v.prixVente * v.quantite - v.remiseUnitaire * v.quantite) AS totalLigne
FROM Facture f
JOIN VenteProduit v ON f.idFacture = v.idFacture
JOIN Produit p ON v.idProduit = p.idProduit
WHERE f.idFacture = 1;


SELECT 
    p.nom, SUM(v.quantite) AS quantiteVendue
FROM VenteProduit v
JOIN Produit p ON v.idProduit = p.idProduit
GROUP BY p.nom
ORDER BY quantiteVendue DESC
LIMIT 5;


SELECT * 
FROM Promotion
WHERE CURRENT_DATE BETWEEN dateDebut AND dateFin;

SELECT 
    c.idClient, c.nom, c.prenom,
    COUNT(f.idFacture) AS nombreFactures,
    SUM(f.total - f.remiseGlobale) AS totalAchats
FROM Client c
LEFT JOIN Facture f ON c.idClient = f.idClient
GROUP BY c.idClient, c.nom, c.prenom;

SELECT 
    f.nom AS fournisseur, a.idApprovisionnement, a.date, a.statut
FROM Fournisseur f
JOIN Approvisionnement a ON f.idFournisseur = a.idFournisseur
ORDER BY a.date DESC;


SELECT 
    p.nom AS produit, pr.nom AS promotion, pr.valeur, pr.type
FROM ProduitPromotion pp
JOIN Produit p ON pp.idProduit = p.idProduit
JOIN Promotion pr ON pp.idPromotion = pr.idPromotion;

SELECT 
    rc.idRetour, rc.date, rc.motif, 
    p.nom AS produit, rp.quantite, rp.etatProduit
FROM RetourClient rc
JOIN RetourProduit rp ON rc.idRetour = rp.idRetour
JOIN Produit p ON rp.idProduit = p.idProduit;

SELECT 
    typePaiement, SUM(montant) AS totalPayé
FROM Paiement
GROUP BY typePaiement;
