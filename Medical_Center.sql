-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

CREATE TABLE "Doctors" (
    "doctor_id" SERIAL   NOT NULL,
    "first_name" VARCHAR(100)   NOT NULL,
    "last_name" VARCHAR(100)   NOT NULL,
    "specialty" VARCHAR(150)   NOT NULL,
    CONSTRAINT "pk_Doctors" PRIMARY KEY (
        "doctor_id"
     )
);

CREATE TABLE "Patients" (
    "patient_id" SERIAL   NOT NULL,
    "first_name" VARCHAR(100)   NOT NULL,
    "last_name" VARCHAR(100)   NOT NULL,
    "date_of_birth" DATE   NOT NULL,
    CONSTRAINT "pk_Patients" PRIMARY KEY (
        "patient_id"
     )
);

CREATE TABLE "Diseases" (
    "disease_id" SERIAL   NOT NULL,
    "disease_name" VARCHAR(255)   NOT NULL,
    "description" TEXT   NOT NULL,
    CONSTRAINT "pk_Diseases" PRIMARY KEY (
        "disease_id"
     )
);

CREATE TABLE "Visits" (
    "visit_id" SERIAL   NOT NULL,
    "patient_id" INT   NOT NULL,
    "doctor_id" INT   NOT NULL,
    "date_of_visit" DATE   NOT NULL,
    CONSTRAINT "pk_Visits" PRIMARY KEY (
        "visit_id"
     )
);

CREATE TABLE "Diagnoses" (
    "diagnosis_id" SERIAL   NOT NULL,
    "visit_id" INT   NOT NULL,
    "disease_id" INT   NOT NULL,
    CONSTRAINT "pk_Diagnoses" PRIMARY KEY (
        "diagnosis_id"
     )
);

ALTER TABLE "Visits" ADD CONSTRAINT "fk_Visits_patient_id" FOREIGN KEY("patient_id")
REFERENCES "Patients" ("patient_id");

ALTER TABLE "Visits" ADD CONSTRAINT "fk_Visits_doctor_id" FOREIGN KEY("doctor_id")
REFERENCES "Doctors" ("doctor_id");

ALTER TABLE "Diagnoses" ADD CONSTRAINT "fk_Diagnoses_visit_id" FOREIGN KEY("visit_id")
REFERENCES "Visits" ("visit_id");

ALTER TABLE "Diagnoses" ADD CONSTRAINT "fk_Diagnoses_disease_id" FOREIGN KEY("disease_id")
REFERENCES "Diseases" ("disease_id");

