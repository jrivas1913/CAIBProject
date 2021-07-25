
    create sequence PLE_PROCEDIMENT_SEQ start 1 increment 1;
    create sequence PLE_UNITATORGANICA_SEQ start 1 increment 1;

    create table PLE_PROCEDIMENT (
       ID int8 not null,
        CODISIA varchar(8) not null,
        NOM varchar(50) not null,
        UNITATORGANICAID int8 not null,
        constraint PLE_PROCEDIMENT_PK primary key (ID)
    );

    create table PLE_UNITATORGANICA (
       ID int8 not null,
        CODIDIR3 varchar(9) not null,
        DATACREACIO date not null,
        ESTAT int4 not null,
        NOM varchar(50) not null,
        constraint PLE_UNITAT_PK primary key (ID)
    );

    create index PLE_PROCEDIMENT_PK_I on PLE_PROCEDIMENT (ID);
    create index PLE_PROCEDIMENT_CODISIA_UK_I on PLE_PROCEDIMENT (CODISIA);
    create index PLE_PROCEDIMENT_UNITAT_FK_I on PLE_PROCEDIMENT (UNITATORGANICAID);

    alter table PLE_PROCEDIMENT 
       add constraint PLE_PROCEDIMENT_CODISIA_UK unique (CODISIA);

    create index PLE_UNITAT_PK_I on PLE_UNITATORGANICA (ID);
    create index PLE_UNITAT_CODIDIR3_UK_I on PLE_UNITATORGANICA (CODIDIR3);

    alter table PLE_UNITATORGANICA 
       add constraint PLE_UNITAT_CODIDIR3_UK unique (CODIDIR3);

    alter table PLE_PROCEDIMENT 
       add constraint PLE_PROCEDIMENT_UNITAT_FK 
       foreign key (UNITATORGANICAID) 
       references PLE_UNITATORGANICA;
