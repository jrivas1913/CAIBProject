
    create sequence PLE_PROCEDIMENT_SEQ start with 1 increment by  1;
    create sequence PLE_UNITATORGANICA_SEQ start with 1 increment by  1;

    create table PLE_PROCEDIMENT (
        ID number(19,0) not null,
        CODISIA varchar2(8 char) not null,
        NOM varchar2(50 char) not null,
        UNITATORGANICAID number(19,0) not null
    );

    create table PLE_UNITATORGANICA (
        ID number(19,0) not null,
        CODIDIR3 varchar2(9 char) not null,
        DATACREACIO date not null,
        ESTAT number(10,0) not null,
        NOM varchar2(50 char) not null
    );

    create index PLE_PROCEDIMENT_PK_I on PLE_PROCEDIMENT (ID);
    create index PLE_PROCEDIMENT_CODISIA_UK_I on PLE_PROCEDIMENT (CODISIA);
    create index PLE_PROCEDIMENT_UNITAT_FK_I on PLE_PROCEDIMENT (UNITATORGANICAID);

    alter table PLE_PROCEDIMENT
        add constraint PLE_PROCEDIMENT_PK primary key (ID);

    alter table PLE_PROCEDIMENT
        add constraint PLE_PROCEDIMENT_CODISIA_UK unique (CODISIA);

    create index PLE_UNITAT_PK_I on PLE_UNITATORGANICA (ID);
    create index PLE_UNITAT_CODIDIR3_UK_I on PLE_UNITATORGANICA (CODIDIR3);

    alter table PLE_UNITATORGANICA
        add constraint PLE_UNITAT_PK primary key (ID);

    alter table PLE_UNITATORGANICA
        add constraint PLE_UNITAT_CODIDIR3_UK unique (CODIDIR3);

    alter table PLE_PROCEDIMENT
        add constraint PLE_PROCEDIMENT_UNITAT_FK
        foreign key (UNITATORGANICAID)
        references PLE_UNITATORGANICA;

    -- Grants per l'usuari www_plabedu
    -- seqüències
    GRANT SELECT, ALTER ON PLE_PROCEDIMENT_SEQ TO WWW_PLABEDU;
    GRANT SELECT, ALTER ON PLE_UNITATORGANICA_SEQ TO WWW_PLABEDU;
    -- taules
    GRANT SELECT, INSERT, UPDATE, DELETE ON PLE_PROCEDIMENT TO WWW_PLABEDU;
    GRANT SELECT, INSERT, UPDATE, DELETE ON PLE_UNITATORGANICA TO WWW_PLABEDU;


