DROP TABLE IF EXISTS lien_mission_objectif
;
DROP TABLE IF EXISTS lien_vehicule_mission
;
DROP TABLE IF EXISTS mission
;
DROP TABLE IF EXISTS objectif
;
DROP TABLE IF EXISTS lancement
;
DROP TABLE IF EXISTS planetes
;
DROP TABLE IF EXISTS lien_astro_équip
;
DROP TABLE IF EXISTS équipage
;
DROP TABLE IF EXISTS astronaute
;
DROP TABLE IF EXISTS vehicule
;
DROP TABLE IF EXISTS centre_spacial
;
DROP TABLE IF EXISTS pays
;


CREATE TABLE IF NOT EXISTS pays (
       id INT UNSIGNED NOT NULL AUTO_INCREMENT,
       nom VARCHAR(255) NOT NULL,
       langue_origine VARCHAR(255) NOT NULL,
       CONSTRAINT pk_pays PRIMARY KEY (id)
);


CREATE TABLE IF NOT EXISTS centre_spacial (
       id INT UNSIGNED NOT NULL AUTO_INCREMENT,
       id_pays INT UNSIGNED NOT NULL,
       nom VARCHAR(255) NOT NULL,
       directeur VARCHAR(255) NOT NULL,
       CONSTRAINT pk_centre_spacial PRIMARY KEY (id),
       CONSTRAINT fk_centre_spacial_id_pays_pays FOREIGN KEY (id_pays) REFERENCES pays(id) ON DELETE RESTRICT ON UPDATE RESTRICT
);
       
CREATE TABLE IF NOT EXISTS vehicule (
       id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
       id_centre_spacial INT UNSIGNED NOT NULL,
       nom VARCHAR(255) NOT NULL,
       type_vehicule ENUM('Lanceur','Capsule','Satellite','Rover') NOT NULL,
       habitable BOOLEAN NOT NULL,
       type_energie ENUM('électrique','nucléaire','ergols_solides','ergols_liquides','ergols_hypergoliques','hydrogène') NOT NULL,
       CONSTRAINT pk_vehicule PRIMARY KEY (id),
       CONSTRAINT fk_vehicule_id_centre_spacial_centre_spacial FOREIGN KEY (id_centre_spacial) REFERENCES centre_spacial(id) ON DELETE RESTRICT ON UPDATE RESTRICT
);

CREATE TABLE IF NOT EXISTS astronaute (
       id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
       id_pays INT UNSIGNED NOT NULL,
       id_centre_spacial INT UNSIGNED NOT NULL,
       nom VARCHAR(255) NOT NULL,
       prenom VARCHAR(255) NOT NULL,
       date_naissance DATE NOT NULL,
       date_mort DATE,
       date_recrutement DATE NOT NULL,
       CONSTRAINT pk_astronaute PRIMARY KEY (id),
       CONSTRAINT fk_astronaute_id_pays_pays FOREIGN KEY (id_pays) REFERENCES pays(id) ON DELETE RESTRICT ON UPDATE RESTRICT,
       CONSTRAINT fk_astronaute_id_centre_spacial_centre_spacial FOREIGN KEY (id_centre_spacial) REFERENCES centre_spacial(id) ON DELETE RESTRICT ON UPDATE RESTRICT
);

CREATE TABLE IF NOT EXISTS équipage (
       id INT UNSIGNED NOT NULL AUTO_INCREMENT,
       nom VARCHAR(255),
       CONSTRAINT pk_équipage PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS lien_astro_équip (
       id_astronaute BIGINT UNSIGNED NOT NULL,
       id_équipage INT UNSIGNED NOT NULL,
       post ENUM('Medecin','Chercheur','Commandant','Copilote','Passager','Ingénieur_de_bord'),
       CONSTRAINT fk_lien_astro_équip_id_astronaute_astronaute FOREIGN KEY (id_astronaute) REFERENCES astronaute(id) ON DELETE RESTRICT ON UPDATE RESTRICT,
       CONSTRAINT fk_lien_astro_équip_id_équipage_équipage FOREIGN KEY (id_équipage) REFERENCES équipage(id) ON DELETE RESTRICT ON UPDATE RESTRICT
);

CREATE TABLE IF NOT EXISTS planetes (
       id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
       nom VARCHAR(255),
       type_planete ENUM('gazeuses','telluriques') NOT NULL,
       diamètre BIGINT NOT NULL,
       satelite_naturel BOOLEAN NOT NULL,
       galaxie VARCHAR(255) NOT NULL DEFAULT 'Voie_lactée',
       CONSTRAINT pk_planetes PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS lancement (
       id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
       lieu VARCHAR(255),
       date_heure DATETIME NOT NULL,
       id_pays INT UNSIGNED NOT NULL,
       id_planetes BIGINT UNSIGNED NOT NULL,
       CONSTRAINT pk_lancement PRIMARY KEY (id),
       CONSTRAINT fk_lancement_id_pays_pays FOREIGN KEY (id_pays) REFERENCES pays(id) ON DELETE RESTRICT ON UPDATE RESTRICT,
       CONSTRAINT fk_lancement_id_planetes_planetes FOREIGN KEY (id_planetes) REFERENCES planetes(id) ON DELETE RESTRICT ON UPDATE RESTRICT
);

CREATE TABLE IF NOT EXISTS objectif(
       id BIGINT UNSIGNED  NOT NULL AUTO_INCREMENT,
       id_planetes BIGINT UNSIGNED NOT NULL,
       type_objectif ENUM('Satelite','Exploration','Etape') NOT NULL,
       objectif TEXT(20000) NOT NULL,
       CONSTRAINT pk_objectif  PRIMARY KEY (id),
       CONSTRAINT fk_objectf_id_planetes_planetes FOREIGN KEY (id_planetes) REFERENCES planetes(id) ON DELETE RESTRICT ON UPDATE RESTRICT
);

CREATE TABLE IF NOT EXISTS mission(
       id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
       id_equipage INT UNSIGNED NOT NULL,
       id_lancement BIGINT UNSIGNED NOT NULL,
       nom VARCHAR(255),
       date_debut DATE NOT NULL,
       date_fin DATE,
       CONSTRAINT pk_mission PRIMARY KEY (id),
       CONSTRAINT fk_mission_id_equipage_équipage FOREIGN KEY (id_equipage) REFERENCES équipage(id) ON DELETE RESTRICT ON UPDATE RESTRICT,
       CONSTRAINT fk_mission_id_lancement_lancement FOREIGN KEY (id_lancement) REFERENCES lancement(id) ON DELETE RESTRICT ON UPDATE RESTRICT
);

CREATE TABLE IF NOT EXISTS lien_vehicule_mission(
       id_vehicule BIGINT UNSIGNED NOT NULL,
       id_mission BIGINT UNSIGNED NOT NULL,
       CONSTRAINT fk_lien_vehicule_mission_id_vehicule_vehicule FOREIGN KEY (id_vehicule) REFERENCES vehicule(id) ON DELETE RESTRICT ON UPDATE RESTRICT,
       CONSTRAINT fk_lien_vehicule_mission_id_mission_mission FOREIGN KEY (id_mission) REFERENCES mission(id) ON DELETE RESTRICT ON UPDATE RESTRICT
);

CREATE TABLE IF NOT EXISTS lien_mission_objectif(
       id_mission BIGINT UNSIGNED NOT NULL,
       id_objectif BIGINT UNSIGNED NOT NULL,
       CONSTRAINT fk_lien_mission_objectif_id_mission_mission FOREIGN KEY (id_mission) REFERENCES mission(id) ON DELETE RESTRICT ON UPDATE RESTRICT,
       CONSTRAINT fk_lien_mission_objectif_id_objectif_objectif FOREIGN KEY (id_objectif) REFERENCES objectif(id) ON DELETE RESTRICT ON UPDATE RESTRICT
);

source remplissage.sql

/* PROCEDURE */
DROP PROCEDURE IF EXISTS p_recherche_mission;
DROP PROCEDURE IF EXISTS p_info_équipage;
DROP PROCEDURE IF EXISTS p_info_véhicule;
DROP PROCEDURE IF EXISTS p_info_lancement;
DROP PROCEDURE IF EXISTS p_info_centre_spacial;
DROP PROCEDURE IF EXISTS p_centre_spacial_complet;

DELIMITER $

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
				
		SELECT mission.nom, date_debut, date_fin,type_objectif, objectif,planetes.nom
		FROM mission,objectif,lien_mission_objectif,planetes 
		WHERE mission.nom = in_nom
		AND mission.id = id_mission

AND objectif.id = id_objectif
		AND planetes.id = id_planetes
		;
		CALL p_info_équipage(v_id_equipage);
		CALL p_info_véhicule(v_id_mission);
		CALL p_info_lancement(v_id_lancement);
	END
$


DELIMITER ;

CALL p_recherche_mission('Apollo_11');
CALL p_centre_spacial_complet('NASA');




SHOW WARNINGS;
