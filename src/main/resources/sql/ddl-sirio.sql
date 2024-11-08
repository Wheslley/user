drop database sirio;
create database sirio;
use sirio;

create table sirio.usuario(
    id              int auto_increment primary key,
    uuid            varchar(50)           not null,
    cpf             varchar(20)           not null,
    nome            varchar(100)          not null,
    data_nascimento varchar(10)           null,
    endereco_id     int                   null,
    status          boolean default FALSE not null,
    constraint usuario_cpf_uk unique (cpf),
    constraint usuario_uuid_uk unique (uuid)
    );

insert into sirio.usuario (uuid, cpf, nome, data_nascimento, endereco_id, status)
values ('18b3d2d6-1442-4d17-9046-a133a2f75680',
        '41114890871',
        'Wheslley Nycolas da Silva',
        '30/01/1992',
        null,
        true);

alter table sirio.usuario add usuario_criacao int not null;
alter table sirio.usuario add data_criacao datetime default CURRENT_TIMESTAMP;
alter table sirio.usuario add usuario_alteracao int null;
alter table sirio.usuario add data_alteracao datetime null;
alter table sirio.usuario add usuario_remocao int null;
alter table sirio.usuario add data_remocao datetime null;
grant grant option on table sirio.usuario to dba_wheslley@localhost;
grant grant option on table sirio.usuario to 'dba-whes'@localhost;

create table sirio.endereco(
    id              int auto_increment primary key,
    uuid            varchar(50)           not null,
    rua             varchar(100)          not null,
    numero          int                   null,
    complemento     varchar(100)          null,
    bairro          varchar(30)           not null,
    cidade          varchar(50)           not null,
    estado          varchar(50)           not null,
    cep             varchar(15)           not null,
    usuario_criacao     int               not null,
    data_criacao        datetime          default CURRENT_TIMESTAMP,
    usuario_alteracao   int               null,
    data_alteracao      datetime          null,
    usuario_remocao     int               null,
    data_remocao        datetime          null,
    constraint endereco_uuid_uk unique (uuid)
    );

insert into endereco (uuid, rua, numero, complemento, bairro, cidade, estado, cep, usuario_criacao)
values ('bf5e9859-e018-4f22-99c9-7585804e33af',
        'Camilo Jose Cury',
        100,
        null,
        'Trujillo',
        'Sorocaba',
        'SP',
        '18060550',
        2);

update sirio.usuario
    set usuario_criacao = 2,
        endereco_id = 1
where id = 2;

insert into endereco (uuid, rua, numero, complemento, bairro, cidade, estado, cep, usuario_criacao)
values ('3eb39a44-a8b4-4b20-a074-55edb336b5b1',
        'Orlando Bismara',
        130,
        'bloco 3 apartamento 314',
        'Jardim Manchester',
        'Sorocaba',
        'SP',
        '18052015',
        2);

insert into sirio.usuario (uuid, cpf, nome, data_nascimento, endereco_id, status, usuario_criacao)
values ('59b14685-bb30-40a8-9377-76da77e2fa9a',
        '01991605030',
        'Gabriela Luiza Viana Scherer',
        '19/04/1997',
        3,
        true,
        2);

alter table sirio.endereco
    add constraint endereco_usuario_criacao_fk
        foreign key (usuario_criacao) references usuario (id);

alter table sirio.endereco
    add constraint endereco_usuario_alteracao_fk
        foreign key (usuario_alteracao) references usuario (id);

alter table sirio.endereco
    add constraint endereco_usuario_remocao_fk
        foreign key (usuario_remocao) references usuario (id);

alter table sirio.usuario
    add constraint usuario_usuario_criacao_fk
        foreign key (usuario_criacao) references usuario (id);

alter table sirio.usuario
    add constraint usuario_usuario_alteracao_fk
        foreign key (usuario_alteracao) references usuario (id);

alter table sirio.usuario
    add constraint usuario_usuario_remocao_fk
        foreign key (usuario_remocao) references usuario (id);

insert into sirio.usuario (uuid, cpf, nome, data_nascimento, endereco_id, status, usuario_criacao)
values ('b55096dd-b1c9-46d3-98de-f605da60ff38',
        '81658157095',
        'Luiza Gabriela Scherer',
        '07/09/1991',
        3,
        true,
        2);

insert into sirio.usuario (uuid, cpf, nome, data_nascimento, endereco_id, status, usuario_criacao)
values ('9e6c552b-3e9f-4401-8b25-1bf0a8d68b65',
        '73771982065',
        'Nycolas Moro',
        '10/10/2010',
        1,
        true,
        2);

alter table sirio.endereco
    add constraint endereco_cep_uk
        unique (cep);

commit;