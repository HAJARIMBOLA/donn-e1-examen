INSERT INTO CategorieProduit VALUES
(1, 'Fruits & Légumes', 'Produits frais de saison'),
(2, 'Boissons', 'Boissons gazeuses et non gazeuses'),
(3, 'Produits Laitiers', 'Lait, yaourt, fromages');

INSERT INTO Produit VALUES
(1, 'Pomme', 'Pomme rouge bio', '1234567890123', 2.50, 10, '2025-12-01', 'kg', 1),
(2, 'Coca-Cola 1L', 'Boisson gazeuse', '2345678901234', 1.20, 20, '2026-01-15', 'L', 2),
(3, 'Yaourt Nature', 'Yaourt lait entier', '3456789012345', 0.60, 5, '2025-08-01', 'unité', 3);

INSERT INTO Rayon VALUES
(1, 'Rayon Fruits', 'Zone A'),
(2, 'Rayon Boissons', 'Zone B'),
(3, 'Rayon Frais', 'Zone C');

INSERT INTO ProduitRayon VALUES
(1, 1),
(2, 2),
(3, 3);

INSERT INTO Fournisseur VALUES
(1, 'AgriFrais', '0321122334', 'contact@agrifrais.mg', 'Antsirabe'),
(2, 'BoissonsMada', '0332233445', 'ventes@boissonsmada.mg', 'Antananarivo');

INSERT INTO Approvisionnement VALUES
(1, 1, '2025-07-10', 'Reçu'),
(2, 2, '2025-07-12', 'En attente');

INSERT INTO ApprovisionnementProduit VALUES
(1, 1, 100, 1.50, '2025-12-01'),
(2, 2, 200, 0.90, '2026-01-15');

INSERT INTO Stock VALUES
(1, 1, 80, '2025-07-15'),
(2, 2, 180, '2025-07-15'),
(3, 3, 50, '2025-07-15');

INSERT INTO Client VALUES
(1, 'Rakoto', 'Jean', 'jean.rakoto@gmail.com', '0341122334', 'F1234', 120),
(2, 'Rasoa', 'Marie', 'marie.rasoa@gmail.com', '0345566778', 'F5678', 85);

INSERT INTO Employe VALUES
(1, 'Randria', 'Mamy', 'Caissier', '0324455667', 350.00, '2023-01-10'),
(2, 'Ando', 'Lala', 'Responsable stock', '0339988776', 500.00, '2022-06-01');

INSERT INTO Caisse VALUES
(1, 'C01', 'active', 'physique'),
(2, 'C02', 'inactive', 'mobile');

INSERT INTO Facture VALUES
(1, '2025-07-15', 1, 1, 1, 10.00, 0.50, 'détaillée');

INSERT INTO VenteProduit VALUES
(1, 1, 2, 2.50, 0.10),
(1, 3, 3, 0.60, 0.00);

INSERT INTO Paiement VALUES
(1, 1, 'Espèce', 9.50, '2025-07-15');

INSERT INTO Promotion VALUES
(1, 'Promo ete', 'Réduction sur boissons', 'Pourcentage', 10.00, '2025-07-01', '2025-08-01');

INSERT INTO ProduitPromotion VALUES
(2, 1);

INSERT INTO RetourClient VALUES
(1, 1, '2025-07-16', 'Produit abime', 1);

INSERT INTO RetourProduit VALUES
(1, 2, 1, 'Abime');
