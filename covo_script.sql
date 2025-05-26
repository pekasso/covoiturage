--
-- base de données: 'covo'
--
create database if not exists covo default character set utf8 collate utf8_general_ci;
use covo;
-- --------------------------------------------------------
-- creation des tables

set foreign_key_checks =0;

-- table utilisateur
drop table if exists utilisateur;
create table utilisateur(
	uti_id int not null auto_increment primary key,
    uti_nom varchar(100) not null,
    uti_prenom varchar(100) not null,
    uti_telephone varchar(50) not null,
    uti_login varchar(100) unique not null,
    uti_mdp varchar(500) not null,
    uti_profil int not null
)engine=innodb;

-- table trajet
drop table if exists trajet;
create table trajet (
	tra_id int not null auto_increment primary key,
    tra_utilisateur int not null,
    tra_escale varchar(100) not null,
    tra_date_creation date not null,
    tra_date_heure_debut date not null,
        tra_date_heure_fin date not null
)engine=innodb;

-- table profil
drop table if exists profil;
create table profil (
	pro_id int not null auto_increment primary key,
    pro_type varchar(100) not null
)engine=innodb;

-- table inscrire
drop table if exists inscrire;
create table inscrire (
	ins_id int not null auto_increment primary key,
    ins_date date not null,
    ins_utilisateur int not null,
    ins_trajet int not null
)engine=innodb;



set foreign_key_checks =1;

-- contraintes
alter table utilisateur add constraint cs1 foreign key (uti_profil) references profil(pro_id);
alter table trajet add constraint cs2 foreign key (tra_utilisateur) references utilisateur(uti_id);
alter table inscrire add constraint cs3 foreign key (ins_utilisateur) references utilisateur(uti_id);
alter table inscrire add constraint cs4 foreign key (ins_trajet) references trajet(tra_id);
