/*------------ DROP DES TABLE -----------*/
DROP TABLE IF EXISTS lien_mission_objectif;
DROP TABLE IF EXISTS lien_vehicule_mission;
DROP TABLE IF EXISTS mission;
DROP TABLE IF EXISTS objectif;
DROP TABLE IF EXISTS lancement;
DROP TABLE IF EXISTS planetes;
DROP TABLE IF EXISTS lien_astro_équip;
DROP TABLE IF EXISTS équipage;
DROP TABLE IF EXISTS astronaute;
DROP TABLE IF EXISTS vehicule;
DROP TABLE IF EXISTS centre_spacial;
DROP TABLE IF EXISTS pays;

/*-------- DROP DES PROCEDURE --------*/

DROP PROCEDURE IF EXISTS p_recherche_mission;
DROP PROCEDURE IF EXISTS p_info_équipage;
DROP PROCEDURE IF EXISTS p_info_véhicule;
DROP PROCEDURE IF EXISTS p_info_lancement;
DROP PROCEDURE IF EXISTS p_info_centre_spacial;
DROP PROCEDURE IF EXISTS p_centre_spacial_complet;
DROP PROCEDURE IF EXISTS p_ajout_astronaute_dans_équipage;
DROP PROCEDURE IF EXISTS p_modif_role_équipage;
