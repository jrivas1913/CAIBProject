
    alter table PLE_PROCEDIMENT 
       drop constraint PLE_PROCEDIMENT_UNITAT_FK;

    drop table if exists PLE_PROCEDIMENT cascade;

    drop table if exists PLE_UNITATORGANICA cascade;

    drop sequence if exists PLE_PROCEDIMENT_SEQ;

    drop sequence if exists PLE_UNITATORGANICA_SEQ;
