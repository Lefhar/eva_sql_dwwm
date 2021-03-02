--Q1. Afficher dans l'ordre alphabétique et sur une seule colonne les noms et prénoms des employés qui ont des enfants, présenter d'abord ceux qui en ont le plus.

SELECT concat(emp_lastname, ' ' , emp_firstname), emp_children from employees  order by emp_children desc, emp_lastname asc limit 4

--Q2. Y-a-t-il des clients étrangers ? Afficher leur nom, prénom et pays de résidence.
SELECT `cus_lastname`, `cus_firstname`, `cus_countries_id` FROM `customers`  where cus_countries_id !="FR"

--Q3. Afficher par ordre alphabétique les villes de résidence des clients ainsi que le code (ou le nom) du pays.

SELECT `cus_city`, `cus_countries_id`, cou_name FROM customers JOIN countries on cou_id = cus_countries_id order by cus_city asc limit 5


--Q4. Afficher le nom des clients dont les fiches ont été modifiées
SELECT `cus_lastname`, `cus_update_date` FROM `customers` WHERE `cus_update_date` IS NOT NULL


--Q5. La commerciale Coco Merce veut consulter la fiche d'un client, mais la seule chose dont elle se souvienne est qu'il habite une ville genre 'divos'. Pouvez-vous l'aider ?
SELECT `cus_id`, concat(`cus_lastname`, ' ', `cus_firstname`), `cus_city` FROM `customers` WHERE `cus_city` LIKE '%divos%'

--Q6. Quel est le produit vendu le moins cher ? Afficher le prix, l'id et le nom du produit.
SELECT `pro_id`, `pro_name`, `pro_price`  FROM `products` order by pro_price asc limit 1


--Q7. Lister les produits qui n'ont jamais été vendus
SELECT `pro_id`, `pro_ref`, `pro_name` FROM `products` WHERE NOT EXISTS (SELECT ode_pro_idFROM `orders_details`WHERE ode_pro_id = pro_id)



--Q8. Afficher les produits commandés par Madame Pikatchien.
select pro_id, pro_ref, pro_name, cus_id, ord_id, ode_id from customers JOIN orders ON ord_cus_id = cus_id JOIN orders_details on ode_ord_id = ord_id JOIN products on pro_id = ode_pro_id WHERE cus_lastname = "Pikatchien"


--Q9. Afficher le catalogue des produits par catégorie, le nom des produits et de la catégorie doivent être affichés.

SELECT cat_id, cat_name, pro_name from products JOIN categories on cat_id = pro_cat_id ORDER BY `cat_name` ASC


--Q10
SELECT CONCAT( employees.emp_lastname, ' ', employees.emp_firstname ) AS `Employé`, CONCAT( employees_responsable.emp_lastname, ' ', employees_responsable.emp_firstname ) AS `Supérieur` FROM employees LEFT JOIN employees employees_responsable ON employees_responsable.emp_id = employees.emp_superior_id where employees_responsable.`emp_sho_id` =3 group by employees.emp_lastname ORDER BY employees.emp_lastname ASC


--Q11. Quel produit a été vendu avec la remise la plus élevée ? Afficher le montant de la remise, le numéro et le nom du produit, le numéro de commande et de ligne de commande.
--Résultat : il s'agit du produit 13 (brouette Green), commande 43, ligne de commande 85.

SELECT ode_pro_id, ode_ord_id, ode_id, cat_name, pro_name  FROM orders_details  JOIN products on pro_id = ode_pro_id JOIN categories on cat_id = pro_cat_id order by ode_discount desc limit 1

--Q13. Combien y-a-t-il de clients canadiens ? Afficher dans une colonne intitulée 'Nb clients Canada'
--2 clients
SELECT COUNT(*) as `Nb clients Canada` FROM customers where `cus_countries_id` ="CA"


--Q16. Afficher le détail des commandes de 2020.
SELECT ode_id, ode_unit_price, ode_discount, ode_quantity, ode_ord_id, ode_pro_id, ord_order_date, `ord_status` FROM orders JOIN orders_details on ord_id=ode_ord_id where ord_order_date like "%2020%" and (`ord_status` NOT LIKE 'Commande annulée' or `ord_status` is null) order by `ode_ord_id` asc












--Q23. L'inflation en France en 2019 a été de 1,1%, appliquer cette augmentation à la gamme de parasols. => les produits 25 à 27 sont concernés. Prix d'origine du produit 25 : 100 €, prix après augmentation : 101,10 €.
-- 100x1.0110


