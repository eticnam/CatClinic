create database if not exists catclinic default character set utf8 collate utf8_general_ci;

use catclinic;

create table if not exists chat(
    id smallint unsigned not null auto_increment,
    nom varchar(30) not null,
    age tinyint unsigned not null,
    tatouage varchar(10) not null,
    primary key(id)
) Engine= InnoDB;

create table if not exists praticien(
    id smallint unsigned not null auto_increment,
    nom varchar(30) not null,
    prenom varchar(30) not null,
    primary key(id)
) Engine= InnoDB;

create table if not exists utilisateur(
    id smallint unsigned not null auto_increment,
    login varchar(10) not null,
    motdepasse char(40) not null,
    admin tinyint unsigned not null default 0,
    primary key(id)
) Engine= InnoDB;

alter table utilisateur add unique (login);

create table if not exists proprietaire(
    id smallint unsigned not null auto_increment,
    nom varchar(30) not null,
    prenom varchar(30) not null,
    id_utilisateur smallint unsigned,
    id_chat smallint unsigned, 
    primary key(id)
) Engine= InnoDB;

alter table proprietaire add constraint FK_propr_chat foreign key (id_chat) references chat(id);
alter table proprietaire add constraint FK_propr_user foreign key (id_utilisateur) references utilisateur(id) ON DELETE CASCADE;
-- ON DELETE CASCADE dans proprietaire sur id_utilisateur signifie que dès qu'on supprime un utilisateur du site, on supprime le proprietaire associé

create table if not exists visite(
    id smallint unsigned not null auto_increment,
    id_praticien smallint unsigned,
    id_chat smallint unsigned,
    date timestamp,
    prix float(6,2) unsigned not null,
    observations tinytext,
    primary key(id)
) Engine= InnoDB;

alter table visite add constraint FK_visite_chat foreign key (id_chat) references chat(id);
alter table visite add constraint FK_visite_prat foreign key (id_praticien) references praticien(id);