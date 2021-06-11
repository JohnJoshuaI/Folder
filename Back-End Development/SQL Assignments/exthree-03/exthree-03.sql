/*Ex Three-03 */
/* Here you will complete tasks against your schema and against the 
schema of jaherna42. Your deliverable is a Word document named 
exthree-03_lastname_fi.docx (where lastname_fi is your last name 
followed by the first letter of your first name). */

/*Connect to your schema to create a table based on principles of 
denormalization applied to tables of ITAM that you have created in 
your own schema. You may have already created this table while 
following along in class.*/

/* This is SQl to create a denormalized table that combines 
the columns from IT_Asset with the columns from CI_Inventory. Your 
denormalized table needs to be based on the tables in your schema. You 
may have already create this table in class.*/
drop table it_asset_and_inventory;
create table it_asset_and_inventory (
it_asset_inv_id number(10),
--asset_id number(10) not null,
asset_type_id number(10) not null,
asset_make varchar2(50) not null,
asset_model varchar2(100) not null,
asset_ext varchar2(50),
purchase_or_rental char(8),
unique_id varchar2(50),
ci_acquired_date date not null,
ci_status_code char(8) not null,
ci_status_date date not null,
changed_by_user varchar2(20),
date_updated date,
constraint it_asset_and_inv_pk PRIMARY KEY(it_asset_inv_id),
constraint asset_n_inv_asset_status_code foreign key (ci_status_code)
references ci_status(ci_status_code)
);


/* Task 1. Verify the creation of the denormalized table in your schema 
by running the following query modified so that it retrieves your table 
information. Capture a screenshot of the query and the result set.*/
--John-Joshua Izuegbu
select owner, table_name,tablespace_name from all_tables 
where owner = 'JOIZUEGB';

/* For Task 2. Here is a sample query that retrieves from the tables 
in the normalized version of the schema, the data that matches the 
denormalizaed version of the tables. */
select ci_inv_id,asset_type_id,asset_make,asset_model,ia.asset_ext,
purchase_or_rental,unique_id,ci_acquired_date,ci_status_code,
ci_status_date,
ia.changed_by_user,ia.date_updated 
from ci_inventory cii
join it_asset ia
on ia.asset_id=cii.asset_id;


/* Task 2. Run the sample query to verify that it works against the 
tables of your schema. Once you have the query working, turn it into 
a view. */
  --John-Joshua Izuegbu
 create or replace view joizuegb_combine_tables as
select ci_inv_id,asset_type_id,asset_make,asset_model,ia.asset_ext,
purchase_or_rental,unique_id,ci_acquired_date,ci_status_code,
ci_status_date,
ia.changed_by_user,ia.date_updated 
from ci_inventory cii
join it_asset ia
on ia.asset_id=cii.asset_id;

/* Verify you completion of Task 2 by running the following query 
modified so that it retrieves your view information. Capture a 
screenshot of the query below and the result set.*/

select owner,view_name,text_length from all_views 
where view_name like 'JOIZUEGB_COMBINE_TABLES';



/*Task 3. Now use the view in an insert into statement to populate 
the it_asset_and_inventory table (the new one) in your schema with 
all the data you have in the two separate tables it_asset and 
ci_inventory. */

/* Here is the sample insert into statement that selects all the data
to be inserted into your new table from the view and then inserts that 
data into your table.*/
insert into joizuegb_it_asset_and_inventory 
select * from JOIZUEGB_COMBINE_TABLES;

/* Verify Task 3 completion by  running the the command below - modified to 
retrieve your information. Capture the command and the results in a screenshot.*/

select owner,table_name, num_rows from all_tables
where table_name = 'JOIZUEGB_COMBINE_TABLES';


/* Task 4. Before running queries to capture execution times and compare
the normalized version of the table to the denormalized version, you 
want the comparison to be valid in terms of indexes (if the before table 
is indexed you want the denormalized table to be indexed, too). Thus, 
you should create indexes on your denormalized table to match any indexes 
that exist on either the it_asset or ci_inventory tables, or you may remove 
indexes except for those created when the PKs were created. To verify this 
step, modify the command below for your username and capture a screenshot 
of the command and result. */
select table_owner,index_name,table_name from user_indexes
where table_name = 'IT_ASSET' OR table_name = 'CI_INVENTORY'
OR table_name = 'IT_ASSET_AND_INVENTORY';


/* Task 5. In Ex One-03 you wrote a number of queries. Choose one query 
you wrote for any of the the Tasks of Ex One-03, numbered 2 though 10.
the query you choose must involve a join of the it_asset table to the 
ci_inventory table. To the beginning of the select list of the query 
you have chosen, add the selection: user as YOURUSERNAMENORMALIZED. 
Use a comment to make it clear which Task in Ex One-03 the query was 
originally written for (e.g. -- Ex One-03 Task 1 Query). Execute the 
query you have chosen using Oracle SQL Developer tool, but execute it 
now against the tables of JAHERNA42's schema. Capture a screen shot 
of the query and the execution results. The result set should include 
the last row retrieved (possibly a partial row in that all columns 
need not be shown) with some of the rows above it. Make note of the 
retrieval time as reported by Oracle SQL Developer tool. 
If you did not write any of the queries requested in Tasks 2 through 
10 of Ex One-03 then you will have to write one of those queries now, 
execute it and make note of the retrieval time reported by Oracle SQL 
Developer tool as requested.*/


/*Task 6. Modify the query from Task 5 to retrieve the identical 
information except the first item in the select list should now be:
user as YOURUSERNAMEDENORMALIZED. Also, use JAHERNA42's 
it_asset_and_inventory table in place of the join of it_asset to 
ci_inventory in the original query. Verify Task 5 completion by 
capturing a screenshot of the modified query and the last ten 
rows of the result set it returns.*/
 



/* For Task 7 you will explain and retrieve the execution plans for 
the Task 5 query in the normalized environment and for the Task 6 query 
in the modified denormalized environment. */

/* Task 7. Use the following template of commands, recording with a screen shot 
each command and its result after execution. */
--explain plan for 
--the query from task 5 that is run again JAHERNA42's tables
explain plan for
select user as PROFMNORMAL,e.last_name,e.first_name, ia.asset_make,ia.asset_model,
ia.asset_ext,eci.user_or_support,eci.date_assigned, eci.condition_out
from jaherna42.employee e full join jaherna42.employee_ci eci on eci.emp_id = e.emp_id
full join ci_inventory cii on eci.ci_inv_id = cii.ci_inv_id
full join it_asset ia on ia.asset_id = cii.asset_id
where condition_out = 'NEW' and user_or_support = 'USER'
and eci.date_assigned between sysdate - 3*365 and sysdate;

select plan_table_output from table(dbms_xplan.display());

/* Once the plan has been explained, retrieve the plan data from the buffer
where it is saved (temporarily). */
select plan_table_output from table(dbms_xplan.display());

--explain plan for
--the query from Task 5 that uses the denormalized tables of JAHERNA42.


/* Once the plan has been explained, retrieve the plan data from the buffer
where it is saved (temporarily). */
select plan_table_output from table(dbms_xplan.display());



/* For Task 8. Run the Task 5 and Task 6 queries if you have not done so 
in the current session.*/




/* For Task 8. Retrieve the cpu execution time and the elapsed time in 
microseconds for the Task 5 and Task 6 queries. Modify the following 
command and run it. Verify Task 8 completion by capturing a screen shot 
of the command and its result set.*/
select sql_id, parsing_schema_name,sql_text,sql_fulltext,
rows_processed,cpu_time,elapsed_time from v$sql where
upper(sql_text) like 'SELECT USER AS JOIZUEGB%';

/* Task 9. Discuss your results from Task 8. Does it appear that 
denormalization improved the performance of the query? Explain.*/



