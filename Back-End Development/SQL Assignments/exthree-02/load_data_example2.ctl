load data
 infile 'C:\Users\johni\Desktop\CIS4338\exthree-02\MOCK_DATA (1).txt'
 append into table employee
 fields terminated by ","
 optionally enclosed by '"'
 trailing nullcols
 ( emp_id, first_name, last_name, lastfour_ssn, co_mobile, co_email, dept_code, job_title,
supervisor_id)