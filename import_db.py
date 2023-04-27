import mysql.connector
import pandas as pd

mydb = mysql.connector.connect(
    host = 'localhost',
    port = 3307,
    user = 'root',
    password = 'Panus@2544',
    database = 'hosos'
)

mycursor = mydb.cursor()

sql = """
INSERT INTO t_patient (t_patient_id, patient_firstname, patient_lastname,
       patient_birthday, f_sex_id, patient_patient_mobile_phone,
       patient_contact_firstname, patient_contact_lastname,
       patient_contact_sex_id, patient_contact_phone_number) 
VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
"""
df = pd.read_excel('HosOS_mock_data.xlsx', sheet_name='t_patient', dtype=str)
df['patient_birthday'] = df['patient_birthday'].apply(lambda x: x[:10])
val = df[df.columns[df.columns != 'patient_hn']].to_records(index=False)
mycursor.executemany(sql, val.tolist())
mydb.commit()