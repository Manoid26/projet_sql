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
       nom VARCHAR(255) NOT NULL,
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

SHOW WARNINGS;
