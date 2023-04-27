CREATE TABLE t_patient (
     patient_hn INT AUTO_INCREMENT,
     t_patient_id CHAR(13),
     patient_firstname VARCHAR(256),
     patient_lastname VARCHAR(256),
     patient_birthday DATE,
     f_sex_id VARCHAR(6),
     patient_patient_mobile_phone CHAR(10),
     patient_contact_firstname VARCHAR(256),
     patient_contact_lastname VARCHAR(256),
     f_sex_id VARCHAR(6),
     patient_contact_phone_number CHAR(10),
     PRIMARY KEY (patient_hn)
);