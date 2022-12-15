
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
Values('CAMSPACE','52','Charlie Essaga');

Insert Into centre_spacial(nom,id_pays,directeur)/*12*/
Values('BDD','5','samuel emilie');


/*Vehiculeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee*/

Insert Into vehicule(id_centre_spatial,nom,type_vehicule,habitable,type_énergie)
Values('','ORION','Capsule','TRUE','électrique');

Insert Into vehicule(id_centre_spatial,nom,type_vehicule,habitable,type_énergie)
Values('','R2D2','Rover','FALSE','nucléaire');

Insert Into vehicule(id_centre_spatial,nom,type_vehicule,habitable,type_énergie)
Values('','Ariane 6','Lanceur','FALSE','ergolds_liquides');

Insert Into vehicule(id_centre_spatial,nom,type_vehicule,habitable,type_énergie)
Values('','H3','Lanceur','FALSE','ergolds_liquides');

Insert Into vehicule(id_centre_spatial,nom,type_vehicule,habitable,type_énergie)
Values('','Angara','Lanceur','FALSE','ergolds_solides');

Insert Into vehicule(id_centre_spatial,nom,type_vehicule,habitable,type_énergie)
Values('','Nespresso','Capsule','TRUE','hydrogene');

Insert Into vehicule(id_centre_spatial,nom,type_vehicule,habitable,type_énergie)
Values('','Apollo','Rover','TRUE','électrique');

Insert Into vehicule(id_centre_spatial,nom,type_vehicule,habitable,type_énergie)
Values('','','Satellite','TRUE','');

Insert Into vehicule(id_centre_spatial,nom,type_vehicule,habitable,type_énergie)
Values('','Apollo','Rover','TRUE','électrique');
