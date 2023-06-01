--
-- File generated with SQLiteStudio v3.4.4 on Thu Jun 1 14:13:41 2023
--
-- Text encoding used: UTF-8
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: association
DROP TABLE IF EXISTS association;

CREATE TABLE IF NOT EXISTS association (
    association_id INTEGER PRIMARY KEY AUTOINCREMENT,
    type           TEXT
);


-- Table: category
DROP TABLE IF EXISTS category;

CREATE TABLE IF NOT EXISTS category (
    category_id INTEGER PRIMARY KEY AUTOINCREMENT
                        UNIQUE
                        NOT NULL,
    category    TEXT
);

INSERT INTO category (
                         category_id,
                         category
                     )
                     VALUES (
                         1,
                         'computing'
                     );

INSERT INTO category (
                         category_id,
                         category
                     )
                     VALUES (
                         2,
                         'perimeter'
                     );

INSERT INTO category (
                         category_id,
                         category
                     )
                     VALUES (
                         3,
                         'printer'
                     );

INSERT INTO category (
                         category_id,
                         category
                     )
                     VALUES (
                         4,
                         'physical'
                     );

INSERT INTO category (
                         category_id,
                         category
                     )
                     VALUES (
                         5,
                         'security'
                     );

INSERT INTO category (
                         category_id,
                         category
                     )
                     VALUES (
                         6,
                         'networking'
                     );


-- Table: category_list
DROP TABLE IF EXISTS category_list;

CREATE TABLE IF NOT EXISTS category_list (
    category_list_id INTEGER PRIMARY KEY AUTOINCREMENT,
    main                     REFERENCES category (category_id),
    second                   REFERENCES category (category_id),
    third                    REFERENCES category (category_id) 
);


-- Table: company
DROP TABLE IF EXISTS company;

CREATE TABLE IF NOT EXISTS company (
    name           TEXT,
    email          TEXT,
    phone,
    company_id     INTEGER PRIMARY KEY AUTOINCREMENT,
    business_start NUMERIC,
    business_end   NUMERIC,
    co_owned               REFERENCES company (company_id),
    co_owned_two   NUMERIC
);


-- Table: device
DROP TABLE IF EXISTS device;

CREATE TABLE IF NOT EXISTS device (
    device_id        INTEGER PRIMARY KEY AUTOINCREMENT,
    model_id                 REFERENCES model (model_id),
    manufacturer_id          REFERENCES manufacturer (manufacturer),
    category_list_id         REFERENCES category_list (category_list_id),
    serial_id                REFERENCES serial (serial_id),
    name             TEXT,
    warranty_id              REFERENCES warranty (warranty_id),
    location_id              REFERENCES location (location_id) 
);


-- Table: device_type
DROP TABLE IF EXISTS device_type;

CREATE TABLE IF NOT EXISTS device_type (
    device_type_id INTEGER PRIMARY KEY AUTOINCREMENT,
    category_id,
    device_type
);

INSERT INTO device_type (
                            device_type_id,
                            category_id,
                            device_type
                        )
                        VALUES (
                            1,
                            NULL,
                            NULL
                        );

INSERT INTO device_type (
                            device_type_id,
                            category_id,
                            device_type
                        )
                        VALUES (
                            2,
                            NULL,
                            'alarm_panel'
                        );

INSERT INTO device_type (
                            device_type_id,
                            category_id,
                            device_type
                        )
                        VALUES (
                            3,
                            NULL,
                            'access_control'
                        );


-- Table: did
DROP TABLE IF EXISTS did;

CREATE TABLE IF NOT EXISTS did (
    did_id INTEGER PRIMARY KEY AUTOINCREMENT,
    did_no NUMERIC,
    sip_id         REFERENCES sip (sip_id) 
);


-- Table: location
DROP TABLE IF EXISTS location;

CREATE TABLE IF NOT EXISTS location (
    address,
    address_two,
    city,
    state,
    latitude,
    longitude,
    location_id INTEGER PRIMARY KEY AUTOINCREMENT,
    company_id          REFERENCES company (company_id) 
);


-- Table: manufacturer
DROP TABLE IF EXISTS manufacturer;

CREATE TABLE IF NOT EXISTS manufacturer (
    manufacturer_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name            TEXT
);


-- Table: model
DROP TABLE IF EXISTS model;

CREATE TABLE IF NOT EXISTS model (
    model_id INTEGER PRIMARY KEY AUTOINCREMENT
);


-- Table: person
DROP TABLE IF EXISTS person;

CREATE TABLE IF NOT EXISTS person (
    person_id   INTEGER PRIMARY KEY AUTOINCREMENT,
    company_id          REFERENCES company (company_id),
    location_id         REFERENCES location (location_id) 
);


-- Table: phone
DROP TABLE IF EXISTS phone;

CREATE TABLE IF NOT EXISTS phone (
    phone_id        INTEGER PRIMARY KEY AUTOINCREMENT,
    number          NUMERIC,
    sim             TEXT,
    model_id                REFERENCES model (model_id),
    manufacturer_id         REFERENCES manufacturer (manufacturer_id),
    sip_id                  REFERENCES sip (sip_id) 
);


-- Table: serial
DROP TABLE IF EXISTS serial;

CREATE TABLE IF NOT EXISTS serial (
    serial_id INTEGER PRIMARY KEY AUTOINCREMENT,
    serial_no TEXT
);


-- Table: sip
DROP TABLE IF EXISTS sip;

CREATE TABLE IF NOT EXISTS sip (
    sip_id INTEGER PRIMARY KEY AUTOINCREMENT,
    sip_no NUMERIC,
    ""             REFERENCES company (company_id) 
);


-- Table: warranty
DROP TABLE IF EXISTS warranty;

CREATE TABLE IF NOT EXISTS warranty (
    warranty_id INTEGER PRIMARY KEY AUTOINCREMENT,
    start_date  NUMERIC,
    end_date    NUMERIC
);


COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
