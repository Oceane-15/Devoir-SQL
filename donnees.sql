use tifosi;

--Marques--
insert into marque (id_marque, nom) values
(1, 'Coca Cola'),
(2, 'Cristaline'),
(3, 'Monster'),
(4, 'Pepsico');

--Ingrédients--
insert into ingredient (id_ingredient, nom) values
(1, 'Ail'),
(2, 'Ananas'),
(3, 'Artichaut'),
(4, 'Bacon'),
(5, 'Base Tomate'),
(6, 'Base crème'),
(7, 'Champignon'),
(8, 'Chevre'),
(9, 'Cresson'),
(10, 'Emmental'),
(11, 'Gorgonzola'),
(12, 'Jambon cuit'),
(13, 'Jambon fumé'),
(14, 'Oeuf'),
(15, 'Oignon'),
(16, 'Olive noire'),
(17, 'Olive verte'),
(18, 'Parmesan'),
(19, 'Piment'),
(20, 'Poivre'),
(21, 'Pomme de terre'),
(22, 'Raclette'),
(23, 'Salami'),
(24, 'Tomate cerise'),
(25, 'Mozarella');

--Focaccia--
insert into focaccia (id_focaccia, nom, prix) values
(1, 'Mozaccia' 9.80),
(2, 'Gorgonzollaccia' 10.80),
(3, 'Raclaccia' 8.90),
(4, 'Emmentalaccia' 9.80),
(5, 'Tradizione' 8.90),
(6, 'Hawaienne' 11.20),
(7, 'Américaine' 10.80),
(8, 'Paysanne' 12.80);

--Boissons--
insert into boisson (id_boisson, nom, id_marque) values
(1, 'Coca-cola zéro', 1),
(2, 'Coca-cola original', 1),
(3, 'Fanta citron', 1),
(4, 'Fanta orange', 1),
(5, 'Capri-sun', 1),
(6, 'Pepsi', 4),
(7, 'Pepsi Max Zéro', 4),
(8, 'Lipton zéro citron', 4),
(9, 'Lipton Peach', 4),
(10, 'Monster energy ultra gold', 3),
(11, 'Monster energy ultra blue', 3),
(12, 'Eau de source', 2);

--Liaisons des ingrédients pour les focaccias--
insert into composition_focaccia (id_focaccia, id_ingredient) values

--Mozaccia--
(1, 5), (1, 25), (1, 9), (1, 13), (1, 1), (1, 3), (1, 7), (1, 18), (1, 20), (1, 16),

--Gorgonzollaccia--
(2, 5),(2, 11),(2, 9),(2, 1),(2, 7),(2, 18),(2, 20),(2, 16),

--Raclaccia--
(3, 5),(3, 22),(3, 9),(3, 1),(3, 7),(3, 18),(3, 20),

--Emmentalaccia--
(4, 6),(4, 10),(4, 9),(4, 7),(4, 18),(4, 20),(4, 15),

--Tradizione--

Base tomate, Mozarella, cresson, jambon cuit, champignon(80), parmesan, poivre, olive noire(10), olive verte(10)







