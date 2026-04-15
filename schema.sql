<!-- Creation de la base de données -->
create database if not exists tifosi character set utf8mb4 collate utf8mb4_unicode_ci;
use tifosi;

create user if not exists 'tifosi'@'localhost' identified by 'Essaiencore1fois007';
grant all privileges on tifosi.* to 'tifosi'@'localhost';
flush privilegies;

<!-- Creation des tables-->
create table marque (
    id_marque int primary key auto_increment,
    nom varchar(50) not null
);

create table ingredient (
    id_ingredient int primary key auto_increment,
    nom varchar(50) not null
);

create table client (
    id_client int primary key auto_increment,
    nom varchar(50) not null,
    email varchar(255) not null unique,
    code_postal int not null
);

create table focaccia (
    id_focaccia int primary key auto_increment,
    nom varchar(50) not null,
    prix decimal(5,2) not null
);

create table boisson (
    id_boisson int primary key auto_increment,
    nom varchar(50) not null,
    id_marque int not null,
    constraint fk_boisson_marque foreign key (id_marque) references marque(id_marque)
);

create table menu (
    id_menu int primary key auto_increment,
    nom varchar(50) not null,
    prix decimal(5,2) not null,
    id_focaccia int not null,
    constraint fk_menu_focaccia foreign key (id_focaccia) references foccacia(id_focaccia)
);

<!-- Liaisons -->

create table composition_focaccia (
    id_focaccia int not null,
    id_ingredient int not null,
    primary key (id_focaccia, id_ingredient),
    constraint fk_comprend_focaccia foreign key (id_focaccia) references foccacia(id_focaccia),
    constraint fk_comprend_ingredient foreign key (id_ingredient) references ingredient(id_ingredient)
);

create table composition_menu (
    id_menu int not null,
    id_boisson int not null,
    primary key (id_menu, id_boisson),
    constraint fk_contient_menu foreign key (id_menu) references menu(id_menu),
    constraint fk_contient_boisson foreign key (id_boisson) references boisson(id_boisson)
);

create table achat (
    id_client int not null,
    id_menu int not null,
    date_achat date not null,
    primary key (id_client, id_menu, date_achat),
    constraint fk_achete_client foreign key (id_client) references client(id_client),
    constraint fk_achete_menu foreign key (id_menu) references menu(id_menu)
);