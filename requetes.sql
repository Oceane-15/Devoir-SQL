use tifosi;

--1. Focaccias ordre alphabétique croissant--
--Résultat : Américaine/Emmentalaccia/Gorgonzollaccia/Hawaienne/Mozaccia/Paysanne/Raclaccia/Tradizione--

select nom from focaccia order by nom asc;

--2. Nombre total d'ingrédients--
--Résultat : 25--

select count(*) as total_ingredients from ingredient;

--3. Prix moyen focaccia--
-- Résultat : 10.375000--

select avg(prix) as prix_moyen from focaccia;

--4. Liste des boissons avec leur marque, triée par nom de boisson--
--Résultat : Capri-sun-Coca Cola/Coca-cola original-Coca Cola/Coca-cola zéro-Coca Cola/Eau de source-Cristaline/Fanta citron-Coca Cola/Fanta orange-Coca Cola/Lipton Peach-Pepsico/Lipton zéro citron-Pepsico/Monster energy ultra blue-Monster/Monster energy ultra gold-Monster/Pepsi-Pepsico/Pepsi Max Zéro-Pepsico--

select b.nom as boisson, m.nom as marque from boisson b 
join marque m on b.id_marque = m.id_marque order by b.nom asc;

--5. Afficher la liste des ingrédients pour une Raclaccia--
--Résultat : Ail/Base Tomate/Champignon/Cresson/Parmesan/Poivre/Raclette--

select i.nom from ingredient i join composition_focaccia cf on i.id_ingredient = cf.id_ingredient
join focaccia f on cf.id_focaccia = f.id_focaccia where f.nom = 'Raclaccia';

--6. Afficher le nom et le nombre d'ingrédients pour chaque foccacia--
--Résultat : Mozaccia : 10 / Gorgonzollaccia : 8 / Raclaccia : 7 / Emmentalaccia : 7 / Tradizione : 9 / Hawaienne : 9 / Américaine : 8 / Paysanne : 12--

select f.nom, count(cf.id_ingredient) as nombre_ingredients from focaccia f
join composition_focaccia cf on f.id_focaccia = cf.id_focaccia group by f.nom;

--7. Afficher le nom de la focaccia qui a le plus d'ingrédients--
-- Résultat : Paysanne--

select f.nom from focaccia f
join composition_focaccia cf on f.id_focaccia = cf.id_focaccia group by f.nom order by count(cf.id_ingredient) desc 
limit 1;

--8. Afficher la liste des focaccia qui contiennent de l'ail--
-- Résultat : Mozaccia/Gorgonzollaccia/Raclaccia/Paysanne--

select f.nom from focaccia f
join composition_focaccia cf on f.id_focaccia = cf.id_focaccia
join ingredient i on cf.id_ingredient = i.id_ingredient
where i.nom = 'Ail';

--9. Afficher la liste des ingrédients inutilisés--
-- Résultat : Salami/Tomate cerise--

select i.nom from ingredient i
left join composition_focaccia cf on i.id_ingredient = cf.id_ingredient
where cf.id_focaccia is null;

--10. Afficher la liste des focaccia qui n'ont pas de champignons--
-- Résultat : Hawaienne/Américaine--

select nom from focaccia where id_focaccia not in(
    select id_focaccia from composition_focaccia cf
    join ingredient i on cf.id_ingredient = i.id_ingredient where i.nom = 'Champignon'
);
