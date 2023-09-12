DROP TABLE vet CASCADE CONSTRAINTS PURGE;
DROP TABLE clinic CASCADE CONSTRAINTS PURGE;
DROP TABLE training CASCADE CONSTRAINTS PURGE;
DROP TABLE visit CASCADE CONSTRAINTS PURGE;
DROP TABLE pet CASCADE CONSTRAINTS PURGE;
DROP TABLE owner CASCADE CONSTRAINTS PURGE;
DROP TABLE prescription CASCADE CONSTRAINTS PURGE;
DROP TABLE drug CASCADE CONSTRAINTS PURGE;

CREATE TABLE vet (
    vet_id NUMBER(8) NOT NULL,
    vet_given_name VARCHAR(50) NOT NULL,
    vet_family_name VARCHAR(50) NOT NULL,
    vet_phone NUMBER(10),
    vet_date_employed DATE NOT NULL,
    vet_specialization VARCHAR(20)
);

COMMENT ON COLUMN vet.vet_id IS
    'Vet ID';

COMMENT ON COLUMN vet.vet_given_name IS
    'Vet given name';

COMMENT ON COLUMN vet.vet_family_name IS
    'Vet family name';

COMMENT ON COLUMN vet.vet_phone IS
    'Vet phone number';

COMMENT ON COLUMN vet.vet_date_employed IS
    'Date vet was employed';

COMMENT ON COLUMN vet.vet_specialization IS
    'Vet specialization';

ALTER TABLE vet ADD CONSTRAINT vet_pk PRIMARY KEY ( vet_id );

CREATE TABLE clinic (
    clinic_id NUMBER(8) NOT NULL,
    clinic_name VARCHAR(50) NOT NULL,
    clinic_address VARCHAR(100) NOT NULL,
    clinic_phone NUMBER(10) NOT NULL
);

COMMENT ON COLUMN clinic.cinic_id IS
    'Clinic ID';

COMMENT ON COLUMN clinic.clinic_name IS
    'Clinic Name';

COMMENT ON COLUMN clinic.clinic_address IS
    'Clinic address';

COMMENT ON COLUMN clinic.clinic_phone IS
    'Clinic phone';

ALTER TABLE clinic ADD CONSTRAINT clinic_pk PRIMARY KEY ( clinic_id );

CREATE TABLE training (
    training_id NUMBER(8) NOT NULL,
    tranining_name VARCHAR(50) NOT NULL,
    // Training clinic is a foreign key -- is it right to use number(8) to referebce clinic id?
    training_clinic NUMBER(8) NOT NULL,
    // Training date is underlined in marks -- review
    training_date DATE NOT NULL,
    traning_duration NUMBER(8) NOT NULL
);

COMMENT ON COLUMN training.training_id IS
    'Training ID';

COMMENT ON COLUMN training.training_name IS
    'Training name';

COMMENT ON COLUMN traning.training_clinic IS
    'Training_clinic';

COMMENT ON COLUMN training.training_date IS
    'Training date';

COMMENT ON COLUMN training.training_duration IS
    'Training duration';
    
// NEED TO DEFINE SURROGATE KEY

CREATE TABLE visit (
    visit_time NUMBER(8) NOT NULL,
    visit_date DATE NOT NULL,
    visit_clinic NUMBER(8) NOT NULL,
    visit_vet NUMBER(8) NOT NULL,
    visit_pet_weight NUMBER(2),
    visit_duration NUMBER(4),
    visit_notes VARCHAR(100)
    // We still have to figure out what to do with follow up
);

COMMENT ON COLUMN visit.visit_time IS
    'Visit time';

COMMENT ON COLUMN visit.visit_date IS
    'Visit date';

COMMENT ON COLUMN  visit.visit_clinic IS
    'Visit clinic';
    
COMMENT ON COLUMN visit.visit_vet IS
    'Visit vet';

COMMENT ON COLUMN visit.visit_pet_weight IS
    'Pet weight at visit';

COMMENT ON COLUMN  visit.visit_duration IS
    'Visit duration';

COMMENT ON COLUMN visit.visit_notes IS
    'Visit notes';

// HAVE TO FIX KEYS FOR VISIT

CREATE TABLE pet (
    pet_id NUMBER(8) NOT NULL,
    pet_name VARCHAR(20),
    pet_birth_year NUMBER(4),
    pet_type VARCHAR(20)
);

COMMENT ON COLUMN pet.pet_id IS
    'Pet ID';

COMMENT ON COLUMN pet.pet_name IS
    'Pet name';

COMMENT ON COLUMN pet.pet_birth_year IS
    'Pet birth year';

COMMENT ON COLUMN pet.pet_type IS
    'Pet type';
    
ALTER TABLE pet ADD CONSTRAINT pet_pk PRIMARY KEY ( pet_id );

CREATE TABLE owner (
    owner_id NUMBER(8) NOT NULL,
    owner_given_name VARCHAR(20),
    owner_family_name VARCHAR(20),
    owner_phone NUMBER(10)
);    

COMMENT ON COLUMN owner.owner_id IS
    'Owner ID';

COMMENT ON COLUMN owner.owner_given_name IS
    'Owner given name';

COMMENT ON COLUMN owner.owner_family_name IS
    'Owner family name';

COMMENT ON COLUMN owner.owner_phone IS
    'Owner phone number';
    
ALTER TABLE owner ADD CONSTRAINT owner_pk PRIMARY KEY ( owner_id );

CREATE TABLE prescription (
    prescription_advised_dose VARCHAR(20)
    // MISSING ATTRIBUTES
);

COMMENT ON COLUMN prescription.prescription_advised_dose IS
    'Prescription advised dose';

// HAVE TO FIGURE OUT THE KEY FOR PRESCRIPTION

CREATE TABLE drug (
    drug_id NUMBER(8) NOT NULL,
    drug_name VARCHAR(20),
    drug_instruction VARCHAR(50)
)

COMMENT ON COLUMN drug.drug_id IS
    'Drug ID';
    
COMMENT ON COLUMN drug.drug_name IS
    'Drug name';
    
COMMENT ON COLUMN drug.drug_instructions IS
    'Drug instructions';
    
// FOREIGN KEYS
