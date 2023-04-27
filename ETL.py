import mysql.connector
import pandas as pd

# sql = """SELECT * FROM professor 
# WHERE pname LIKE 'Panus'"""

# sql = """SELECT * FROM professor"""

listOfPatient = (1, 3, 5, 10)

patientSql = """
SELECT patient_hn, t_patient_id, CONCAT(patient_firstname, ' ', patient_lastname), patient_birthday, f_sex_id, patient_patient_mobile_phone 
FROM t_patient
WHERE patient_hn IN
""" + str(listOfPatient)

patientColumns = ['uid', 'cid', 'name', 'birthDate', 'gender', 'telecom']

contactSql = """
SELECT patient_hn, CONCAT(patient_contact_firstname, patient_contact_lastname), "Emergency contact person", patient_contact_sex_id, patient_contact_phone_number
FROM t_patient
WHERE patient_hn IN
""" + str(listOfPatient)

contactColumns = ['uid', 'name', 'relationship', 'gender', 'telcom']

medicationSql = """
SELECT b_item_drug_id, item_drug_printable FROM b_item_drug
"""

medicationColumns = ['code', 'display']

isTakingSql = """
SELECT v.visit_hn, b_item_id, o.order_date_time, od.order_drug_printable, od.order_drug_special_prescription_text
FROM t_visit v, t_order o, t_order_drug od
WHERE v.t_visit_id = o.t_visit_id AND o.t_order_id = od.t_order_id AND visit_hn IN
""" + str(listOfPatient)

isTakingColumns = ['uid', 'code', 'authoredOn', 'dosageInstruction', 'note']

# AllergicIntorelanceSubstanceSql is the same as medication -> omit this part

isAllergicSql = """
SELECT t_patient_id, b_item_id, 'active', 'confirmed', 'allergy', 'medication', patient_drug_allergy_symptom, patient_drug_allergy_record_date_time
FROM t_patient_drug_allergy a, t_patient p
WHERE a.t_patient_id = p.t_patient_id AND patient_hn IN
""" + str(listOfPatient)

isAllergicColumns = ['uid', 'code', 'clinicalStatus', 'verificationStatus', 'type', 'category', 'criticality', 'recordDate']

conditionSql = """
SELECT icd10_number, icd10_description FROM b_icd10
"""

conditionColumns = ['code', 'display']

isHavingSql = """
SELECT v.visit_hn, diag_icd10_number, CASE WHEN diag_icd10_active = 1 THEN 'active' ELSE 'resolved' END as active,
'confirmed', 'problem-list-item', diag_icd10_notice, diag_icd10_record_date_time
FROM t_visit v, t_diag_icd10 d
WHERE v.t_visit_id = d.b_visit_clinic_id AND patient_hn IN
""" + str(listOfPatient)

isHaving = ['uid', 'code', 'clinicalStatus', 'verificationStatus', 'category', 'severity', 'recordDate']

def transform(sql, columns):

    mydb = mysql.connector.connect(
        host = 'localhost',
        port = 3307,
        user = 'root',
        password = 'Panus@2544',
        database = 'hosos'
    )

    mycursor = mydb.cursor()
    # mycursor.execute(sql)
    # myresult = mycursor.fetchall()
    # df1 = pd.DataFrame.from_records(myresult, columns={'id': str, 'name': str, 'salary': float})
    # df2 = pd.DataFrame.from_records(myresult, columns=['id', 'name', 'salary'])
    # df1.info()
    # df2.info()

    mycursor.execute(sql)
    result = mycursor.fetchall()
    df = pd.DataFrame.from_records(result, columns=columns)
    return df.to_json()

print(transform(patientSql, patientColumns))
print(transform(contactSql, contactColumns))