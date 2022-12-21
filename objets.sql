

/*------------------------- PROCEDURE --------------------------------*/

DELIMITER $

CREATE PROCEDURE IF NOT EXISTS p_modif_role_équipage(
/*Pour ajouter des astronaute*/    
       IN in_id_astronaute INT UNSIGNED,
       IN in_id_old_équipage INT UNSIGNED,
       IN in_id_new_équipage INT UNSIGNED,
       IN in_new_role ENUM('Medecin','Chercheur','Commandant','Copilote','Passager','Ingénieur_de_bord')
       )
       BEGIN
	IF in_id_astronaute IN (SELECT id FROM astronaute) THEN
	   IF in_id_old_équipage IN (SELECT id FROM équipage) THEN
	      IF in_id_astronaute NOT IN (SELECT id_astronaute FROM lien_astro_équip WHERE in_id_new_équipage = id_équipage) THEN
	      	 DELETE FROM lien_astro_équip WHERE id_astronaute = in_id_astronaute AND in_id_old_équipage = id_équipage;
	      	 CALL p_ajout_astronaute_dans_équipage(in_id_astronaute,in_id_new_équipage,in_new_role);
	      ELSE
	      	 DELETE FROM lien_astro_équip WHERE id_astronaute = in_id_astronaute AND in_id_new_équipage = id_équipage;	    
	      	 DELETE FROM lien_astro_équip WHERE id_astronaute = in_id_astronaute AND in_id_old_équipage = id_équipage;
	      	 CALL p_ajout_astronaute_dans_équipage(in_id_astronaute,in_id_new_équipage,in_new_role);		 
	      END IF;
	   ELSE
	      SELECT "équipage inexistant";
	   END IF;
        ELSE
	   SELECT "Astronaute inexistant";
	END IF;
   	
       END
$

CREATE PROCEDURE IF NOT EXISTS p_ajout_astronaute_dans_équipage(
/*Pour ajouter des astronaute*/    
       IN in_id_astronaute INT UNSIGNED,
       IN in_id_équipage INT UNSIGNED,
       IN in_role ENUM('Medecin','Chercheur','Commandant','Copilote','Passager','Ingénieur_de_bord')
       )
       BEGIN
	IF in_id_astronaute IN (SELECT id FROM astronaute) THEN
	   IF in_id_équipage IN (SELECT id FROM équipage) THEN
	      IF in_id_astronaute NOT IN (SELECT id_astronaute FROM lien_astro_équip WHERE in_id_équipage = id_équipage) THEN
	      	 INSERT INTO lien_astro_équip (id_astronaute,id_équipage,post)
		 VALUES(in_id_astronaute,in_id_équipage,in_role);
	      ELSE
		 SELECT "Déjà existant";
	      END IF;
	   ELSE
	      SELECT "équipage inexistant";
	   END IF;
        ELSE
	   SELECT "Astronaute inexistant";
	END IF;
   	
       END
$

CREATE PROCEDURE IF NOT EXISTS p_centre_spacial_complet(
/*info complette sur le centre spacial*/
       IN in_nom_centre VARCHAR(255)
       )
       BEGIN		
		SELECT in_nom_centre as "nom du centre", COUNT(astronaute.id) as 'nombre d''astronaute encore en vie et/ou embauché'
		FROM centre_spacial,astronaute
		WHERE centre_spacial.id = id_centre_spacial
		AND centre_spacial.nom = in_nom_centre
		AND date_mort IS NULL		
		;
		/* Info sur le nom, type et energie du véhicule */
		SELECT vehicule.nom,type_vehicule,type_energie,habitable
		FROM vehicule,centre_spacial
		WHERE centre_spacial.nom = in_nom_centre
		AND centre_spacial.id = id_centre_spacial
		;
	END
$

CREATE PROCEDURE IF NOT EXISTS p_info_lancement(
/*info sur le lieu de lancement*/
       IN in_id_lancement INT UNSIGNED
       )
       BEGIN
		SELECT lieu,date_heure,nom
		FROM lancement,pays
		WHERE lancement.id = in_id_lancement
		AND pays.id = id_pays
		;
	END
$

CREATE PROCEDURE IF NOT EXISTS p_info_centre_spacial(
/*info classique sur le centre spacial */
       IN in_id_centre_spacial INT UNSIGNED
       )
       BEGIN
		SELECT nom as 'centre spacial de la mission', directeur
		FROM centre_spacial
		WHERE id = in_id_centre_spacial
		;
	END
$

CREATE PROCEDURE IF NOT EXISTS p_info_équipage(
/*info sur l'équipage et la fonction de chacun d'eux*/
       IN in_id_equipage INT UNSIGNED
       )
       BEGIN
		DECLARE v_id_centre_spacial INT UNSIGNED;

		SET v_id_centre_spacial = (
		    SELECT id_centre_spacial
		    FROM astronaute,lien_astro_équip
		    WHERE id_équipage = in_id_equipage
		    LIMIT 1
		);

		SELECT nom as 'équipage',post as 'rôle'
		FROM lien_astro_équip,astronaute
		WHERE id_équipage = in_id_equipage
		AND id_astronaute = id
		;
		CALL p_info_centre_spacial(v_id_centre_spacial);
	END
$

CREATE PROCEDURE IF NOT EXISTS p_info_véhicule(
/*info sur le/les véhicule utiliser*/
       IN in_id_mission INT UNSIGNED
       )
       BEGIN
		SELECT nom,type_vehicule,habitable,type_energie
		FROM lien_vehicule_mission,vehicule
		WHERE id_vehicule = id
		AND id_mission  = in_id_mission
		;
	END
$

CREATE PROCEDURE IF NOT EXISTS p_recherche_mission(
       IN in_nom VARCHAR(255)
       )
       BEGIN
		DECLARE v_id_equipage INT UNSIGNED;
		DECLARE v_id_mission INT UNSIGNED;
		DECLARE v_id_lancement INT UNSIGNED;

		SET v_id_equipage = (
		    SELECT id_equipage
		    FROM mission
		    WHERE nom = in_nom	
		);

		SET v_id_mission = (
		    SELECT id
		    FROM mission
		    WHERE nom = in_nom	
		);
		
		SET v_id_lancement = (
		    SELECT id_lancement
		    FROM mission
		    WHERE nom = in_nom	
		);

		/* permet l'affichage des information sur un mission rechercher */

		SELECT mission.nom, date_debut, date_fin,type_objectif, objectif,planetes.nom
		FROM mission,objectif,lien_mission_objectif,planetes 
		WHERE mission.nom = in_nom
		AND mission.id = id_mission

AND objectif.id = id_objectif
		AND planetes.id = id_planetes
		;
		/* Sous procédure déclarer plus haut */
		CALL p_info_équipage(v_id_equipage);
		CALL p_info_véhicule(v_id_mission);
		CALL p_info_lancement(v_id_lancement);
	END
$


DELIMITER ;




/*-------------------- INSERT INTO ---------------------------*/

/* PAYS*/

Insert Into pays(nom, langue_origine) /*1*/
Values('Etas-Unis','Anglais');

Insert Into pays(nom, langue_origine)/*2*/
Values('Chine','Mandarin');

Insert Into pays(nom, langue_origine)/*3*/
Values('Japon','Japonais');

Insert Into pays(nom, langue_origine)/*4*/
Values('Allemagne','Allemand');

Insert Into pays(nom, langue_origine)/*5*/
Values('France','Francais');

Insert Into pays(nom, langue_origine)/*6*/
Values('Inde','Hindi');

Insert Into pays(nom, langue_origine)/*7*/
Values('Italie','Italien');

Insert Into pays(nom, langue_origine)/*8*/
Values('Bresil','Portugais');

Insert Into pays(nom, langue_origine)/*9*/
Values('Canada','Anglais');

Insert Into pays(nom, langue_origine)/*10*/
Values('Russie','Russe');

Insert Into pays(nom, langue_origine)/*11*/
Values('Coree','Coreen');

Insert Into pays(nom, langue_origine)/*12*/
Values('Australie','Anglais');

Insert Into pays(nom, langue_origine)/*13*/
Values('Espagne','Espagnol');

Insert Into pays(nom, langue_origine)/*14*/
Values('Mexique','Espagnol');

Insert Into pays(nom, langue_origine)/*15*/
Values('Indonesie','Indonesien');

Insert Into pays(nom, langue_origine)/*16*/
Values('Pays-bas','Neerlandaise');

Insert Into pays(nom, langue_origine)/*17*/
Values('Arabie Saoudite','Arabe');

Insert Into pays(nom, langue_origine)/*18*/
Values('Turquie','Turc');

Insert Into pays(nom, langue_origine)/*19*/
Values('Pologne','Polonais');

Insert Into pays(nom, langue_origine)/*20*/
Values('Suede','Suedois');

Insert Into pays(nom, langue_origine)/*21*/
Values('Belgique','Francais');

Insert Into pays(nom, langue_origine)/*22*/
Values('Argentine','Espagnol');

Insert Into pays(nom, langue_origine)/*23*/
Values('Thailande','Thai');

Insert Into pays(nom, langue_origine)/*24*/
Values('Venezuela','Espagnol');

Insert Into pays(nom, langue_origine)/*25*/
Values('Autriche','Allemand');

Insert Into pays(nom, langue_origine)/*26*/
Values('Iran','Iranien');

Insert Into pays(nom, langue_origine)/*27*/
Values('Norvege','Norvegien');

Insert Into pays(nom, langue_origine)/*28*/
Values('Nigeria','Anglais');

Insert Into pays(nom, langue_origine)/*29*/
Values('Irlande','Irlandais');

Insert Into pays(nom, langue_origine)/*30*/
Values('Israel','Hebreu');

Insert Into pays(nom, langue_origine)/*31*/
Values('Afrique_du_sud','Zoulou');

Insert Into pays(nom, langue_origine)/*32*/
Values('Singapour','Tamoul');

Insert Into pays(nom, langue_origine)/*33*/
Values('Danemark','Danois');

Insert Into pays(nom, langue_origine)/*34*/
Values('Philipines','Anglais');

Insert Into pays(nom, langue_origine)/*35*/
Values('Thailande','Thai');

Insert Into pays(nom, langue_origine)/*36*/
Values('Colombie','Espagnol');

Insert Into pays(nom, langue_origine)/*37*/
Values('Pakistan','Ourdou');

Insert Into pays(nom, langue_origine)/*38*/
Values('Chili','Espagnol');

Insert Into pays(nom, langue_origine)/*39*/
Values('Finlande','Finnois');

Insert Into pays(nom, langue_origine)/*40*/
Values('Bangladesh','Bengali');

Insert Into pays(nom, langue_origine)/*41*/
Values('Egypte','Arabe');

Insert Into pays(nom, langue_origine)/*42*/
Values('Vietnam','Vietnamien');

Insert Into pays(nom, langue_origine)/*43*/
Values('Roumanie','Roumain');

Insert Into pays(nom, langue_origine)/*44*/
Values('Portugal','Portugais');

Insert Into pays(nom, langue_origine)/*45*/
Values('Irak','Arabe');

Insert Into pays(nom, langue_origine)/*46*/
Values('Perou','Espagnol');

Insert Into pays(nom, langue_origine)/*47*/
Values('Grece','Grec');

Insert Into pays(nom, langue_origine)/*48*/
Values('Nouvelle-zelande','Maori');

Insert Into pays(nom, langue_origine)/*49*/
Values('Qatar','Arabe');

Insert Into pays(nom, langue_origine)/*50*/
Values('Algerie','Arabe');

Insert Into pays(nom, langue_origine)/*51*/
Values('Cuba','Espagnol');

Insert Into pays(nom, langue_origine)/*52*/
Values('Cameroun','Francais');

Insert Into pays(nom, langue_origine)/*53*/
Values('Angleterre','Anglais');

/*--------------Centre spacial-------------*/

Insert Into centre_spacial(nom,id_pays,directeur)/*1*/
Values('NASA','1','Bill Nelson');

Insert Into centre_spacial(nom,id_pays,directeur)/*2*/
Values('CNSA','2','Tang Dengjie');

Insert Into centre_spacial(nom,id_pays,directeur)/*3*/
Values('CNES','5','Philippe Baptiste');

Insert Into centre_spacial(nom,id_pays,directeur)/*4*/
Values('ROSCOSMOS','10','Iouri Borissov');

Insert Into centre_spacial(nom,id_pays,directeur)/*4*/
Values('JAXA','3','YAMAKAWA Hiroshi');

Insert Into centre_spacial(nom,id_pays,directeur)/*5*/
Values('ISRO','6','Sreedhara Panicker Somanath');

Insert Into centre_spacial(nom,id_pays,directeur)/*6*/
Values('ASI','7','Mario Mozzarella');

Insert Into centre_spacial(nom,id_pays,directeur)/*7*/
Values('ASC','9','tabarnac');

Insert Into centre_spacial(nom,id_pays,directeur)/*8*/
Values('UKSA','53','Alice Bunn');

Insert Into centre_spacial(nom,id_pays,directeur)/*9*/
Values('ASAL','50','Azzedine Oussedik');

Insert Into centre_spacial(nom,id_pays,directeur)/*10*/
Values('ISA','30','Avi Blasberger');

Insert Into centre_spacial(nom,id_pays,directeur)/*11*/
Values('CAMSPACE','52','Zak Ekoto');

Insert Into centre_spacial(nom,id_pays,directeur)/*12*/
Values('BDD','5','samuel emilie');


/*Vehicule*/

Insert Into vehicule(id_centre_spacial,nom,type_vehicule,habitable,type_energie)/*1*/
Values('1','ORION','Capsule',TRUE,'électrique');

Insert Into vehicule(id_centre_spacial,nom,type_vehicule,habitable,type_energie)/*2*/
Values('12','R2D2','Rover',FALSE,'nucléaire');

Insert Into vehicule(id_centre_spacial,nom,type_vehicule,habitable,type_energie)/*3*/
Values('3','Ariane 6','Lanceur',FALSE,'ergols_liquides');

Insert Into vehicule(id_centre_spacial,nom,type_vehicule,habitable,type_energie)/*4*/
Values('2','H3','Lanceur',FALSE,'ergols_liquides');

Insert Into vehicule(id_centre_spacial,nom,type_vehicule,habitable,type_energie)/*5*/
Values('5','Angara','Lanceur',FALSE,'ergols_solides');

Insert Into vehicule(id_centre_spacial,nom,type_vehicule,habitable,type_energie)/*6*/
Values('12','Nespresso','Capsule',TRUE,'hydrogene');

Insert Into vehicule(id_centre_spacial,nom,type_vehicule,habitable,type_energie)/*7*/
Values('1','Apollo','Rover',TRUE,'électrique');

Insert Into vehicule(id_centre_spacial,nom,type_vehicule,habitable,type_energie)/*8*/
Values('4','Spoutnik-1','Satellite',TRUE,'électrique');

Insert Into vehicule(id_centre_spacial,nom,type_vehicule,habitable,type_energie)/*9*/
Values('7','Ananas','Capsule',FALSE,'ergols_solides');

Insert Into vehicule(id_centre_spacial,nom,type_vehicule,habitable,type_energie)/*10*/
Values('12','Philips','Lanceur',FALSE,'nucléaire');

Insert Into vehicule(id_centre_spacial,nom,type_vehicule,habitable,type_energie)/*11*/
Values('12','WALL-E','Rover',FALSE,'ergols_hypergoliques');

Insert Into vehicule(id_centre_spacial,nom,type_vehicule,habitable,type_energie)/*12*/
Values('10','Tianzhou','Satellite',TRUE,'électrique');

Insert Into vehicule(id_centre_spacial,nom,type_vehicule,habitable,type_energie)/*13*/
Values('3','baguette','lanceur',TRUE,'hydrogene');

Insert Into vehicule(id_centre_spacial,nom,type_vehicule,habitable,type_energie)/*14*/
Values('4','Bretzel','Capsule',TRUE,'électrique');

Insert Into vehicule(id_centre_spacial,nom,type_vehicule,habitable,type_energie)/*15*/
Values('1','Eagle','Capsule',TRUE,'électrique');

Insert Into vehicule(id_centre_spacial,nom,type_vehicule,habitable,type_energie)/*16*/
Values('1','SaturnV','Lanceur',FALSE,'ergols_liquides');

Insert Into vehicule(id_centre_spacial,nom,type_vehicule,habitable,type_energie)/*17*/
Values('1','CSM','Capsule',TRUE,'électrique');

/*Astronaute*/

Insert Into astronaute(id_pays, id_centre_spacial, nom, prenom, date_naissance, date_mort, date_recrutement)/*1*/
Values('1','1','Clinton','Francklin','1969-12-01',NULL,'1999-02-12');/*1*/

Insert Into astronaute(id_pays, id_centre_spacial, nom, prenom, date_naissance, date_mort, date_recrutement)/*2*/
Values('1','1','Big','Mac','1967-07-02',NULL,'2001-12-05');/*B*/

Insert Into astronaute(id_pays, id_centre_spacial, nom, prenom, date_naissance, date_mort, date_recrutement)/*3*/
Values('4','4','Schneider','Charle','1999-11-20',NULL,'2022-11-06');/*1*/

Insert Into astronaute(id_pays, id_centre_spacial, nom, prenom, date_naissance, date_mort, date_recrutement)/*4*/
Values('3','4','Nintendo','Switch','2017-03-03',NULL,'2022-12-18');/*A*/

Insert Into astronaute(id_pays, id_centre_spacial, nom, prenom, date_naissance, date_mort, date_recrutement)/*5*/
Values('5','3','Pasquier','Thomas','1978-02-27',NULL,'2012-01-12');/*A*/

Insert Into astronaute(id_pays, id_centre_spacial, nom, prenom, date_naissance, date_mort, date_recrutement)/*6*/
Values('52','11','Ernest','Simo','1956-07-21',NULL,'1985-05-16');/*1*/

Insert Into astronaute(id_pays, id_centre_spacial, nom, prenom, date_naissance, date_mort, date_recrutement)/*7*/
Values('1','1','Clooney','George','1961-05-6',NULL,'1981-04-12');/*B*/

Insert Into astronaute(id_pays, id_centre_spacial, nom, prenom, date_naissance, date_mort, date_recrutement)/*8*/
Values('19','9','Miroslaw','Hermaszewski','1941-09-15','2022-12-12','1968-12-03');

Insert Into astronaute(id_pays, id_centre_spacial, nom, prenom, date_naissance, date_mort, date_recrutement)/*9*/
Values('2','4','Boming','Liu','1998-05-20',NULL,'2018-06-25');/*1*/

Insert Into astronaute(id_pays, id_centre_spacial, nom, prenom, date_naissance, date_mort, date_recrutement)/*10*/
Values('52','5','Essaga','Charlies','2001-07-10',NULL,'2016-08-01');/*A*/

Insert Into astronaute(id_pays, id_centre_spacial, nom, prenom, date_naissance, date_mort, date_recrutement)/*11*/
Values('13','11','Colomb','Christrophe','1451-05-26',NULL,'1652-07-26');/*B*/

Insert Into astronaute(id_pays, id_centre_spacial, nom, prenom, date_naissance, date_mort, date_recrutement)/*12*/
Values('31','5','Muyard','Cyprien','1940-02-29',NULL,'1970-09-18');/*A*/

Insert Into astronaute(id_pays, id_centre_spacial, nom, prenom, date_naissance, date_mort, date_recrutement)/*13*/
Values('25','5','Smith','Quentin','1995-01-01',NULL,'2019-09-06');/*B*/

Insert Into astronaute(id_pays, id_centre_spacial, nom, prenom, date_naissance, date_mort, date_recrutement)/*14*/
Values('1','1','Armstrong','Neil','1930-08-05','2012-08-25','1962-09-13');/*B*/

Insert Into astronaute(id_pays, id_centre_spacial, nom, prenom, date_naissance, date_mort, date_recrutement)/*15*/
Values('1','1','Aldrin','Edwin','1930-01-20',NULL,'1963-10-17');/*B*/

Insert Into astronaute(id_pays, id_centre_spacial, nom, prenom, date_naissance, date_mort, date_recrutement)/*16*/
Values('1','1','Collins','Micheal','1930-10-31','2021-04-28','1963-10-14');/*B*/

/*equipage*/

Insert Into équipage(nom)/*1*/
Values('troupes délites');

Insert Into équipage(nom)/*2*/
Values('free wifi');

Insert Into équipage(nom)/*3*/
Values('no stress déstresse');

Insert Into équipage(nom)/*4*/
Values('Apollo11');

/*lien astro d'equipe*/

Insert Into lien_astro_équip (id_astronaute, id_équipage, post)
Values('14','4','Commandant');

Insert Into lien_astro_équip (id_astronaute, id_équipage, post)
Values('15','4','Copilote');

Insert Into lien_astro_équip (id_astronaute, id_équipage, post)
Values('16','4','Copilote');

Insert Into lien_astro_équip (id_astronaute, id_équipage, post)
Values('10','2','Medecin');

Insert Into lien_astro_équip (id_astronaute, id_équipage, post)
Values('12','2','Copilote');

Insert Into lien_astro_équip (id_astronaute, id_équipage, post)
Values('5','2','Chercheur');

Insert Into lien_astro_équip (id_astronaute, id_équipage, post)
Values('4','2','Ingenieur_de_bord');

Insert Into lien_astro_équip (id_astronaute, id_équipage, post)
Values('10','2','Medecin');


Insert Into lien_astro_équip (id_astronaute, id_équipage, post)
Values('13','1','Ingénieur_de_bord');

Insert Into lien_astro_équip (id_astronaute, id_équipage, post)
Values('11','1','Commandant');

Insert Into lien_astro_équip (id_astronaute, id_équipage, post)
Values('7','1','Chercheur');

Insert Into lien_astro_équip (id_astronaute, id_équipage, post)
Values('2','1','Medecin');


Insert Into lien_astro_équip (id_astronaute, id_équipage, post)
Values('9','3','Medecin');

Insert Into lien_astro_équip (id_astronaute, id_équipage, post)
Values('6','3','ingenieur_de_bord');

Insert Into lien_astro_équip (id_astronaute, id_équipage, post)
Values('3','3','Chercheur');

Insert Into lien_astro_équip (id_astronaute, id_équipage, post)
Values('1','3','Commandant');



/*planetes*/

Insert Into planetes(nom,type_planete,diamètre,satelite_naturel)/*1*/
Values ('Mercure','telluriques','4880',FALSE);

Insert Into planetes(nom,type_planete,diamètre,satelite_naturel)/*2*/
Values ('Terre','telluriques','12742',TRUE);

Insert Into planetes(nom,type_planete,diamètre,satelite_naturel)/*3*/
Values ('Venus','telluriques','12104',FALSE);

Insert Into planetes(nom,type_planete,diamètre,satelite_naturel)/*4*/
Values ('Mars','telluriques','6779',TRUE);

Insert Into planetes(nom,type_planete,diamètre,satelite_naturel)/*5*/
Values ('Jupiter','gazeuses','139820',TRUE);

Insert Into planetes(nom,type_planete,diamètre,satelite_naturel)/*6*/
Values ('Saturne','gazeuses','116460',TRUE);

Insert Into planetes(nom,type_planete,diamètre,satelite_naturel)/*7*/
Values ('Uranus','gazeuses','50724',TRUE);

Insert Into planetes(nom,type_planete,diamètre,satelite_naturel)/*8*/
Values ('Neptune','gazeuses','49244',TRUE);

Insert Into planetes(nom,type_planete,diamètre,satelite_naturel)/*8*/
Values ('Lune','telluriques','3474',FALSE);

/*Lancement*/

Insert Into lancement(lieu, date_heure, id_pays, id_planetes)/*1*/
Values ('Guyanes','2020-05-21 12:00:01','5','2');

Insert Into lancement(lieu, date_heure, id_pays, id_planetes)/*2*/
Values ('Taiyuan','1998-07-22 16:05:09','2','2');

Insert Into lancement(lieu, date_heure, id_pays, id_planetes)/*3*/
Values ('Tanegashina','2014-09-14 08:09:19','3','2');

Insert Into lancement(lieu, date_heure, id_pays, id_planetes)/*4*/
Values ('Plesetsk','2015-11-28 13:25:29','10','2');

Insert Into lancement(lieu, date_heure, id_pays, id_planetes)/*5*/
Values ('Taiyuan','1998-07-22 16:05:09','2','2');

Insert Into lancement(lieu, date_heure, id_pays, id_planetes)/*6*/
Values ('Cape Canaveral','1969-07-16 14:32:09','1','2');

/*Objectif*/

Insert Into objectif(id_planetes,type_objectif,objectif)/*MARSSSSS*/
values ('2', 'Exploration', 'OBJECTIF EXPLORATION'); /*1*/

Insert Into objectif(id_planetes,type_objectif,objectif)/*2*/
values ('2', 'Etape', '');

Insert Into objectif(id_planetes,type_objectif,objectif)/*3*/
values ('4', 'Exploration', '');

Insert Into objectif(id_planetes,type_objectif,objectif)/*4*/
values ('3', 'Satelite', '');

Insert Into objectif(id_planetes,type_objectif,objectif)/*5*/
values ('2', 'Etape', '');

Insert Into objectif(id_planetes,type_objectif,objectif)/*6*/
values ('2', 'Etape', '');

Insert Into objectif(id_planetes,type_objectif,objectif)/*7*/
values ('2', 'Etape', 'Décollage');

Insert Into objectif(id_planetes,type_objectif,objectif)/*8*/
values ('9', 'Etape', 'Rester en orbite lunaire');

Insert Into objectif(id_planetes,type_objectif,objectif)/*9*/
values ('9', 'Exploration', 'Alunissage');

/*mision*/


Insert Into mission (id_equipage, id_lancement , nom, date_debut,date_fin)/*1*/
Values ('2', '1', 'TERRE-MARS_JUPITER', '2019-08-14', '2040-07-25');

Insert Into mission (id_equipage, id_lancement , nom, date_debut,date_fin)/*2*/
Values ('3', '3', 'MARS_EXPLO', '2016-12-10', '2024-06-15');

Insert Into mission (id_equipage, id_lancement , nom, date_debut,date_fin)/*3*/
Values ('1', '2', 'TERRE-VENUS-MERCURE','2021-12-01', '2025-03-14');

Insert Into mission (id_equipage, id_lancement , nom, date_debut,date_fin)/*4*/
Values ('4', '6', 'Apollo_11','1969-07-16', '1969-07-24');


/*lien_vehicule*/

Insert Into lien_vehicule_mission (id_vehicule, id_mission)
Values ('2','1');

Insert Into lien_vehicule_mission (id_vehicule, id_mission)
Values ('6','1');

Insert Into lien_vehicule_mission (id_vehicule, id_mission)
Values ('10','1');

Insert Into lien_vehicule_mission (id_vehicule, id_mission)
Values ('5','2');

Insert Into lien_vehicule_mission (id_vehicule, id_mission)
Values ('7','2');

Insert Into lien_vehicule_mission (id_vehicule, id_mission)
Values ('9','2');


Insert Into lien_vehicule_mission (id_vehicule, id_mission)
Values ('13','3');

Insert Into lien_vehicule_mission (id_vehicule, id_mission)
Values ('11','3');

Insert Into lien_vehicule_mission (id_vehicule, id_mission)
Values ('14','3');

Insert Into lien_vehicule_mission (id_vehicule, id_mission)
Values ('8','3');

Insert Into lien_vehicule_mission (id_vehicule, id_mission)
Values ('15','4');

Insert Into lien_vehicule_mission (id_vehicule, id_mission)
Values ('16','4');

Insert Into lien_vehicule_mission (id_vehicule, id_mission)
Values ('17','4');


/*lien mission objectif*/

Insert Into lien_mission_objectif(id_mission,id_objectif)
Values ('4', '7');

Insert Into lien_mission_objectif(id_mission,id_objectif)
Values ('4', '8');

Insert Into lien_mission_objectif(id_mission,id_objectif)
Values ('4', '9');

Insert Into lien_mission_objectif(id_mission,id_objectif)
Values ('1', '2');

Insert Into lien_mission_objectif(id_mission,id_objectif)
Values ('1', '3');


Insert Into lien_mission_objectif(id_mission,id_objectif)
Values ('2', '1');


Insert Into lien_mission_objectif(id_mission,id_objectif)
Values ('3', '4');

Insert Into lien_mission_objectif(id_mission,id_objectif)
Values ('3', '5');


/*****************/

CALL p_recherche_mission('Apollo_11');
CALL p_centre_spacial_complet('NASA');
