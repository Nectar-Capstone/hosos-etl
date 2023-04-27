-- Patient & canContact tables 
CREATE TABLE t_patient (
    t_patient_id character varying(255) NOT NULL,
    patient_hn character varying(255),
    f_patient_prefix_id character varying(255),
    patient_firstname character varying(255),
    patient_lastname character varying(255),
    patient_xn character varying(255),
    f_sex_id character varying(255),
    patient_birthday character varying(255),
    patient_house character varying(255),
    patient_road character varying(255),
    patient_moo character varying(255),
    patient_tambon character varying(255),
    patient_amphur character varying(255),
    patient_changwat character varying(255),
    f_patient_marriage_status_id character varying(255),
    f_patient_occupation_id character varying(255),
    f_patient_race_id character varying(255),
    f_patient_nation_id character varying(255),
    f_patient_religion_id character varying(255),
    f_patient_education_type_id character varying(255),
    f_patient_family_status_id character varying(255),
    patient_father_firstname character varying(255),
    patient_mother_firstname character varying(255),
    patient_couple_firstname character varying(255),
    patient_move_in_date_time character varying(255),
    f_patient_discharge_status_id character varying(255),
    patient_discharge_date_time character varying(255),
    f_patient_blood_group_id character varying(255),
    f_patient_foreigner_id character varying(255),
    f_patient_area_status_id character varying(255),
    patient_father_pid character varying(255),
    patient_mather_pid character varying(255),
    patient_couple_pid character varying(255),
    patient_community_status character varying(255),
    patient_private_doctor character varying(255),
    patient_pid character varying(255),
    patient_mother_lastname character varying(255),
    patient_father_lastname character varying(255),
    patient_couple_lastname character varying(255),
    patient_phone_number character varying(255),
    f_patient_relation_id character varying(255),
    patient_contact_phone_number character varying(255),
    patient_contact_sex_id character varying(255),
    patient_contact_house character varying(255),
    patient_contact_moo character varying(255),
    patient_contact_changwat character varying(255),
    patient_contact_amphur character varying(255),
    patient_contact_tambon character varying(255),
    patient_contact_road character varying(255),
    patient_contact_firstname character varying(255),
    patient_contact_lastname character varying(255),
    patient_birthday_true character varying(255),
    patient_merged character varying(255),
    patient_record_date_time character varying(255),
    patient_update_date_time character varying(255),
    patient_staff_record character varying(255),
    patient_staff_modify character varying(255),
    patient_staff_cancel character varying(255),
    patient_active character varying(255),
    patient_drugallergy character varying(255),
    patient_language_for_print character varying(255) DEFAULT '',
    patient_patient_mobile_phone character varying(255) DEFAULT '',
    patient_contact_mobile_phone character varying(255) DEFAULT '',
    patient_has_home_in_pcu character varying(255) DEFAULT '0',
    t_health_family_id character varying(255) DEFAULT '',
    patient_other_country_address character varying(255) DEFAULT '0',
    patient_is_other_country character varying(255) DEFAULT ''
);

-- isHaving
CREATE TABLE t_diag_icd10 (
    t_diag_icd10_id character varying(255) NOT NULL,
    diag_icd10_vn character varying(255),
    diag_icd10_number character varying(255),
    f_diag_icd10_type_id character varying(255),
    diag_icd10_notice character varying(255),
    diag_icd10_staff_doctor character varying(255),
    b_visit_clinic_id character varying(255),
    diag_icd10_diagnosis_date character varying(255),
    diag_icd10_staff_record character varying(255) DEFAULT ''::character varying,
    diag_icd10_record_date_time character varying(255) DEFAULT ''::character varying,
    diag_icd10_staff_update character varying(255) DEFAULT ''::character varying,
    diag_icd10_update_date_time character varying(255) DEFAULT ''::character varying,
    diag_icd10_staff_cancel character varying(255) DEFAULT ''::character varying,
    diag_icd10_cancel_date_time character varying(255) DEFAULT ''::character varying,
    diag_icd10_active character varying(255) DEFAULT '1'::character varying
);

-- ConditionProblemDiagnosis
CREATE TABLE b_icd10 (
    b_icd10_id character varying(255) NOT NULL,
    icd10_number character varying(255),
    icd10_description character varying(255),
    icd10_other_description character varying(255),
    icd10_generate_code character varying(255)
);

-- isTaking
CREATE TABLE t_visit (
    t_visit_id character varying(255) NOT NULL,
    visit_hn character varying(255),
    visit_vn character varying(255),
    f_visit_type_id character varying(255),
    visit_begin_visit_time character varying(255),
    visit_financial_discharge_time character varying(255),
    visit_notice character varying(255),
    b_visit_office_id_refer_in character varying(255),
    b_visit_office_id_refer_out character varying(255),
    visit_diagnosis_notice character varying(5000),
    f_visit_opd_discharge_status_id character varying(255),
    f_visit_ipd_discharge_type_id character varying(255),
    f_visit_ipd_discharge_status_id character varying(255),
    visit_locking character varying(255),
    visit_staff_lock character varying(255),
    visit_lock_date_time character varying(255),
    f_visit_status_id character varying(255),
    visit_pregnant character varying(255),
    b_visit_clinic_id character varying(255),
    b_visit_ward_id character varying(255),
    visit_bed character varying(255),
    visit_observe character varying(255),
    visit_patient_type character varying(255),
    visit_queue character varying(255),
    b_service_point_id character varying(255),
    visit_staff_observe character varying(255),
    visit_dx character varying(255),
    visit_ipd_discharge_status character varying(255),
    visit_money_discharge_status character varying(255),
    visit_doctor_discharge_status character varying(255),
    t_patient_id character varying(255),
    visit_staff_financial_discharge character varying(255),
    visit_staff_doctor_discharge character varying(255),
    visit_staff_doctor_discharge_date_time character varying(255),
    visit_an character varying(255),
    visit_dx_stat character varying(255),
    visit_begin_admit_date_time character varying(255),
    visit_deny_allergy character varying(255),
    visit_first_visit character varying(255) DEFAULT '0'::character varying,
    visit_patient_self_doctor character varying(255) DEFAULT ''::character varying,
    visit_patient_age character varying(255) DEFAULT ''::character varying,
    visit_pcu_service character varying(255) DEFAULT '0'::character varying,
    visit_hospital_service character varying(255) DEFAULT '0'::character varying,
    visit_lab_status_id character varying(255) DEFAULT '0'::character varying,
    visit_ncd character varying(255) DEFAULT '0'::character varying,
    b_ncd_group_id character varying(255) DEFAULT ''::character varying,
    f_refer_cause_id character varying(255) DEFAULT '0'::character varying,
    f_emergency_status_id character varying(255) DEFAULT '0'::character varying,
    visit_emergency_staff character varying(255) DEFAULT ''::character varying,
    visit_have_appointment character varying(255) DEFAULT '0'::character varying,
    visit_have_admit character varying(255) DEFAULT '0'::character varying,
    visit_have_refer character varying(255) DEFAULT '0'::character varying,
    t_patient_appointment_id character varying(255) DEFAULT ''::character varying,
    visit_cal_date_appointment character varying(255) DEFAULT ''::character varying,
    visit_cause_appointment character varying(255) DEFAULT ''::character varying
);

CREATE TABLE t_order (
    t_order_id character varying(255) NOT NULL,
    t_visit_id character varying(255),
    b_item_id character varying(255),
    order_staff_verify character varying(255),
    order_verify_date_time character varying(255),
    order_staff_execute character varying(255),
    order_executed_date_time character varying(255),
    order_staff_discontinue character varying(255),
    order_discontinue_date_time character varying(255),
    order_staff_dispense character varying(255),
    order_dispense_date_time character varying(255),
    order_service_point character varying(255),
    b_item_subgroup_id character varying(255),
    order_charge_complete character varying(255),
    f_order_status_id character varying(255),
    order_secret character varying(255),
    order_continue character varying(255),
    b_item_billing_subgroup_id character varying(255),
    t_patient_id character varying(255),
    f_item_group_id character varying(255),
    order_common_name character varying(255),
    order_refer_out character varying(255),
    order_request character varying(255),
    order_staff_order character varying(255),
    order_date_time character varying(255),
    order_complete character varying(255),
    order_price double precision,
    order_qty double precision,
    order_cost character varying(255),
    order_notice character varying(255),
    order_drug_allergy character varying(255) DEFAULT '0'::character varying,
    order_cause_cancel_resultlab character varying(255),
    order_staff_report character varying(255) DEFAULT ''::character varying,
    order_report_date_time character varying(255) DEFAULT ''::character varying,
    order_home character varying(255) DEFAULT '0'::character varying,
    b_item_16_group_id character varying(255) DEFAULT ''::character varying
);

CREATE TABLE t_order_drug (
    t_order_drug_id character varying(255) NOT NULL,
    t_order_id character varying(255),
    b_item_drug_instruction_id character varying(255),
    b_item_drug_frequency_id character varying(255),
    b_item_drug_uom_id_use character varying(255),
    order_drug_caution character varying(255),
    order_drug_description character varying(255),
    f_item_day_time_id character varying(255),
    order_drug_printable character varying(255),
    b_item_drug_uom_id_purch character varying(255),
    order_drug_special_prescription character varying(255),
    order_drug_special_prescription_text character varying(255),
    b_item_id character varying(255),
    order_drug_dose double precision,
    order_drug_active character varying(255) DEFAULT '1'::character varying,
    order_drug_modifier character varying(255) DEFAULT ''::character varying,
    order_drug_modify_datetime character varying(255) DEFAULT ''::character varying,
    order_drug_order_status character varying(255) DEFAULT ''::character varying
);

-- isAllergic
CREATE TABLE t_patient_drug_allergy (
    t_patient_drug_allergy_id character varying(255) NOT NULL,
    t_patient_id character varying(255),
    b_item_id character varying(255),
    patient_drug_allergy_common_name character varying(255),
    patient_drug_allergy_symptom character varying(255),
    b_item_drug_standard_id character varying(255) DEFAULT ''::character varying,
    patient_drug_allergy_drug_standard_description character varying(255) DEFAULT ''::character varying,
    patient_drug_allergy_record_date_time character varying(255) DEFAULT ''::character varying
);

-- AllergyIntoleranceSubstance & Medication
CREATE TABLE b_item (
    b_item_id character varying(255) NOT NULL,
    item_number character varying(255),
    item_common_name character varying(255),
    item_trade_name character varying(255),
    item_nick_name character varying(255),
    item_active character varying(255),
    b_item_subgroup_id character varying(255),
    b_item_billing_subgroup_id character varying(255),
    item_printable character varying(255),
    item_secret character varying(255) DEFAULT '0'::character varying,
    b_item_16_group_id character varying(255) DEFAULT ''::character varying
);

-- Practitioner
CREATE TABLE b_employee (
    b_employee_id character varying(255) NOT NULL,
    employee_login character varying(255),
    employee_password character varying(255),
    employee_firstname character varying(255),
    employee_lastname character varying(255),
    employee_number character varying(255),
    employee_last_login character varying(255),
    employee_last_logout character varying(255),
    employee_active character varying(255),
    b_service_point_id character varying(255),
    f_employee_level_id character varying(255),
    f_employee_rule_id character varying(255),
    f_employee_authentication_id character varying(255),
    b_employee_default_tab character varying(255) DEFAULT ''::character varying,
    employee_warning_dx character varying(255) DEFAULT '0'::character varying
);