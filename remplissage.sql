
/* PAYSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS*/

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


/*Vehiculeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee*/

Insert Into vehicule(id_centre_spatial,nom,type_vehicule,habitable,type_énergie)/*1*/
Values('','ORION','Capsule',TRUE,'électrique');

Insert Into vehicule(id_centre_spatial,nom,type_vehicule,habitable,type_énergie)/*2*/
Values('','R2D2','Rover',FALSE,'nucléaire');

Insert Into vehicule(id_centre_spatial,nom,type_vehicule,habitable,type_énergie)/*3*/
Values('','Ariane 6','Lanceur',FALSE,'ergolds_liquides');

Insert Into vehicule(id_centre_spatial,nom,type_vehicule,habitable,type_énergie)/*4*/
Values('','H3','Lanceur',FALSE,'ergolds_liquides');

Insert Into vehicule(id_centre_spatial,nom,type_vehicule,habitable,type_énergie)/*5*/
Values('','Angara','Lanceur',FALSE,'ergolds_solides');

Insert Into vehicule(id_centre_spatial,nom,type_vehicule,habitable,type_énergie)/*6*/
Values('','Nespresso','Capsule',TRUE,'hydrogene');

Insert Into vehicule(id_centre_spatial,nom,type_vehicule,habitable,type_énergie)/*7*/
Values('','Apollo','Rover',TRUE,'électrique');

Insert Into vehicule(id_centre_spatial,nom,type_vehicule,habitable,type_énergie)/*8*/
Values('','Spoutnik-1','Satellite',TRUE,'électrique');

Insert Into vehicule(id_centre_spatial,nom,type_vehicule,habitable,type_énergie)/*9*/
Values('','Ananas','Capsule',FALSE,'ergols_solides');

Insert Into vehicule(id_centre_spatial,nom,type_vehicule,habitable,type_énergie)/*10*/
Values('','Philips','Lanceur',FALSE,'nucléaire');

Insert Into vehicule(id_centre_spatial,nom,type_vehicule,habitable,type_énergie)/*11*/
Values('','WALL-E','Rover',FALSE,'ergols_hypergolique');

Insert Into vehicule(id_centre_spatial,nom,type_vehicule,habitable,type_énergie)/*12*/
Values('','Tianzhou','Satelite',TRUE,'électrique');

Insert Into vehicule(id_centre_spatial,nom,type_vehicule,habitable,type_énergie)/*13*/
Values('','baguette','lanceur',TRUE,'hydrogene');

Insert Into vehicule(id_centre_spatial,nom,type_vehicule,habitable,type_énergie)/*14*/
Values('','Bretzel','Capsule',TRUE,'électrique');


/*Astronauteeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee*/

Insert Into astronaute(id_pays, id_centre_spatial, nom, prenom, date_naissance, date_mort, date_recrutement)/*1*/
Values('1','1','Clinton','Francklin','1969-12-01',NULL,'1999-02-12');/*1*/

Insert Into astronaute(id_pays, id_centre_spatial, nom, prenom, date_naissance, date_mort, date_recrutement)/*2*/
Values('1','1','Big','Mac','1967-07-02',NULL,'2001-12-05');/*B*/

Insert Into astronaute(id_pays, id_centre_spatial, nom, prenom, date_naissance, date_mort, date_recrutement)/*3*/
Values('4','4','Schneider','Charle','1999-11-20',NULL,'2022-11-06');/*1*/

Insert Into astronaute(id_pays, id_centre_spatial, nom, prenom, date_naissance, date_mort, date_recrutement)/*4*/
Values('3','4','Nintendo','Switch','2017-03-03',NULL,'2022-12-18');/*A*/

Insert Into astronaute(id_pays, id_centre_spatial, nom, prenom, date_naissance, date_mort, date_recrutement)/*5*/
Values('5','3','Pasquier','Thomas','1978-0227',NULL,'2012-01-12');/*A*/

Insert Into astronaute(id_pays, id_centre_spatial, nom, prenom, date_naissance, date_mort, date_recrutement)/*6*/
Values('52','11','Ernest','Simo','1956-07-21',NULL,'1985-05-16');/*1*/

Insert Into astronaute(id_pays, id_centre_spatial, nom, prenom, date_naissance, date_mort, date_recrutement)/*7*/
Values('1','1','Clooney','George','1961-05-6',NULL,'1981-04-12');/*B*/

Insert Into astronaute(id_pays, id_centre_spatial, nom, prenom, date_naissance, date_mort, date_recrutement)/*8*/
Values('19','9','Miroslaw','Hermaszewski','1941-09-15','2022-12-12','1968-12-03');

Insert Into astronaute(id_pays, id_centre_spatial, nom, prenom, date_naissance, date_mort, date_recrutement)/*9*/
Values('2','4','Boming','Liu','1998-05-20',NULL,'2018-06-25');/*1*/

Insert Into astronaute(id_pays, id_centre_spatial, nom, prenom, date_naissance, date_mort, date_recrutement)/*10*/
Values('52','5','Essaga','Charlies','2001-07-10',NULL,'2016-08-01');/*A*/

Insert Into astronaute(id_pays, id_centre_spatial, nom, prenom, date_naissance, date_mort, date_recrutement)/*11*/
Values('13','11','Colomb','Christrophe','1451-05-26',NULL,'1652-07-26');/*B*/

Insert Into astronaute(id_pays, id_centre_spatial, nom, prenom, date_naissance, date_mort, date_recrutement)/*12*/
Values('31','5','Muyard','Cyprien','1940-02-29',NULL,'1970-09-18');/*A*/

Insert Into astronaute(id_pays, id_centre_spatial, nom, prenom, date_naissance, date_mort, date_recrutement)/*13*/
Values('25','5','Smith','Quentin','1995-01-01',NULL,'2019-09-06');/*B*/

/*equipageeeeeeeeeeeeeeeeeeeeeeeeee*/

Insert Into équipage(nom)/*1*/
Values('troupes délites');

Insert Into équipage(nom)/*2*/
Values('free wifi');

Insert Into équipage(nom)/*3*/
Values('no stress déstresse');

/*lien astrooooooooooo d'eeeeeeqqqqqqqqqquiiiiiiiiiipeeeeeee*/

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



/*plaaaaaaaaaaaaaaaaaaaaneeeeeeeeeeete*/

Insert Into planetes(nom,type_planete,diamètre,satelite_naturel)/*1*/
Values ('Mercure','telluriques','4880','0');

Insert Into planetes(nom,type_planete,diamètre,satelite_naturel)/*2*/
Values ('Terre','telluriques','12742','1');

Insert Into planetes(nom,type_planete,diamètre,satelite_naturel)/*3*/
Values ('Venus','telluriques','12104','0');

Insert Into planetes(nom,type_planete,diamètre,satelite_naturel)/*4*/
Values ('Mars','telluriques','6779','2');

Insert Into planetes(nom,type_planete,diamètre,satelite_naturel)/*5*/
Values ('Jupiter','gazeuses','139820','80');

Insert Into planetes(nom,type_planete,diamètre,satelite_naturel)/*6*/
Values ('Saturne','gazeuses','116460','82');

Insert Into planetes(nom,type_planete,diamètre,satelite_naturel)/*7*/
Values ('Uranus','gazeuses','50724','27');

Insert Into planetes(nom,type_planete,diamètre,satelite_naturel)/*8*/
Values ('Neptune','gazeuses','49244','14');


/*Laaaaaaaaaaaaaaaaaaaaaaaaaaancementtttttttttttttt*/

Insert Into lancement(lieu, date_heure, id_pays, id_planete)/*1*/
Values ('Guyanes','2020-05-21T12:00:01','5','2');

Insert Into lancement(lieu, date_heure, id_pays, id_planete)/*2*/
Values ('Taiyuan','1998-07-22T16:05:09','2','2');

Insert Into lancement(lieu, date_heure, id_pays, id_planete)/*3*/
Values ('Tanegashina','2014-09-14T08:09:19','3','2');

Insert Into lancement(lieu, date_heure, id_pays, id_planete)/*4*/
Values ('Plesetsk','2015-11-28T13:25:29','10','2');

Insert Into lancement(lieu, date_heure, id_pays, id_planete)/*5*/
Values ('Taiyuan','1998-07-22T16:05:09','2','2');


/*OOOOOOOOOOOOOOOOOOOObjectiffffffffffffffffffffffff*/

Insert Into objectif(id_planetes,nom,type_objectif,objectif)/*MARSSSSS*/
values ('2', 'MARS', 'Exploration', 'OBJECTIF EXPLORATION'); /*B*/

Insert Into objectif(id_planetes,nom,type_objectif,objectif)/*A*/
values ('2', 'MARS', 'Etapes', '');

Insert Into objectif(id_planetes,nom,type_objectif,objectif)/*A*/
values ('4', 'Jupiter', 'Explorations', '');

Insert Into objectif(id_planetes,nom,type_objectif,objectif)/*C*/
values ('3', 'Venus', 'Satelites', '');

Insert Into objectif(id_planetes,nom,type_objectif,objectif)/*C*/
values ('2', 'Mercure', 'Etapes', '');

/*MMMMMMMMMMMMMMMMMMMMmiiiissssssssssiiooooooooooon*/


Insert Into mission (id_equipage, id_lancement , nom, date_debut,date_fin)/*A*/
Values ('2', '1', 'TERRE-MARS_JUPITER', '2019-08-14', '2040-07-25');

Insert Into mission (id_equipage, id_lancement , nom, date_debut,date_fin)/*B*/
Values ('3', '3', 'MARS_EXPLO', '2016-12-10', '2024-06-15');

Insert Into mission (id_equipage, id_lancement , nom, date_debut,date_fin)/*C*/
Values ('1', '2', 'TERRE-VENUS-MERCURE','2021-12-01', '2025-03-14');


/*llllllllllllllliiiiiiiieennnnnn_veeehicculeeeeeeeeeeeeeeee*/

Insert Into (id_vehicule, id_mission)
Values ('2','1');

Insert Into (id_vehicule, id_mission)
Values ('6','1');

Insert Into (id_vehicule, id_mission)
Values ('10','1');

Insert Into (id_vehicule, id_mission)
Values ('5','2');

Insert Into (id_vehicule, id_mission)
Values ('7','2');

Insert Into (id_vehicule, id_mission)
Values ('9','2');


Insert Into (id_vehicule, id_mission)
Values ('13','3');

Insert Into (id_vehicule, id_mission)
Values ('11','3');

Insert Into (id_vehicule, id_mission)
Values ('14','3');

Insert Into (id_vehicule, id_mission)
Values ('8','3');



/*llliiiiiiiiiiieeeeeeeeeeeeeennnnn vehhhhiiiiiiiiiiiiiccccccccculllllllllleeeee*/

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