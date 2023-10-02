-- Generado por Oracle SQL Developer Data Modeler 23.1.0.087.0806
--   en:        2023-10-01 12:27:32 CLST
--   sitio:      Oracle Database 10g
--   tipo:      Oracle Database 10g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE cliente (
    clienteid INTEGER NOT NULL,
    nombre    VARCHAR2(255) NOT NULL,
    email     VARCHAR2(255) NOT NULL
)
LOGGING;

ALTER TABLE cliente ADD CONSTRAINT cliente_pk PRIMARY KEY ( clienteid );

ALTER TABLE cliente ADD CONSTRAINT index_1 UNIQUE ( email );

CREATE TABLE empleado (
    empleadoid INTEGER NOT NULL,
    nombre     VARCHAR2(255) NOT NULL,
    tipo       VARCHAR2(50) NOT NULL
)
LOGGING;

ALTER TABLE empleado ADD CONSTRAINT empleado_pk PRIMARY KEY ( empleadoid );

CREATE TABLE habitacion (
    habitacionid    INTEGER NOT NULL,
    hotelid         INTEGER,
    numero          INTEGER NOT NULL,
    tipo            VARCHAR2(50) NOT NULL,
    caracteristicas VARCHAR2(50),
    equipamiento    VARCHAR2(255),
    preciodiario    FLOAT NOT NULL,
    estado          VARCHAR2(50) NOT NULL
)
LOGGING;

ALTER TABLE habitacion ADD CONSTRAINT habitacion_pk PRIMARY KEY ( habitacionid );

CREATE TABLE hotel (
    hotelid   INTEGER NOT NULL,
    nombre    VARCHAR2(255) NOT NULL,
    ubicacion VARCHAR2(255) NOT NULL
)
LOGGING;

ALTER TABLE hotel ADD CONSTRAINT hotel_pk PRIMARY KEY ( hotelid );

CREATE TABLE pago (
    pagoid    INTEGER NOT NULL,
    reservaid INTEGER,
    monto     FLOAT NOT NULL,
    fecha     DATE NOT NULL,
    metodo    VARCHAR2(50) NOT NULL
)
LOGGING;

ALTER TABLE pago ADD CONSTRAINT pago_pk PRIMARY KEY ( pagoid );

CREATE TABLE reserva (
    reservaid    INTEGER NOT NULL,
    clienteid    INTEGER,
    habitacionid INTEGER,
    fechainicio  DATE NOT NULL,
    fechafin     DATE NOT NULL,
    estado       VARCHAR2(50) NOT NULL
)
LOGGING;

ALTER TABLE reserva ADD CONSTRAINT reserva_pk PRIMARY KEY ( reservaid );

ALTER TABLE habitacion
    ADD CONSTRAINT habitacion_hotel_fk FOREIGN KEY ( hotelid )
        REFERENCES hotel ( hotelid )
    NOT DEFERRABLE;

ALTER TABLE pago
    ADD CONSTRAINT pago_reserva_fk FOREIGN KEY ( reservaid )
        REFERENCES reserva ( reservaid )
    NOT DEFERRABLE;

ALTER TABLE reserva
    ADD CONSTRAINT reserva_cliente_fk FOREIGN KEY ( clienteid )
        REFERENCES cliente ( clienteid )
    NOT DEFERRABLE;

ALTER TABLE reserva
    ADD CONSTRAINT reserva_habitacion_fk FOREIGN KEY ( habitacionid )
        REFERENCES habitacion ( habitacionid )
    NOT DEFERRABLE;



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                             6
-- CREATE INDEX                             0
-- ALTER TABLE                             11
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
