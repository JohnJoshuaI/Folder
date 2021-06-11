/* Here you will complete tasks against the tables of jaherna42. Your 
deliverable is a Word document named exthree-01_lastname_fi.docx (where 
lastname_fi is your last name followed by the first letter of your first 
name). */

/* Task 1. In Ex One-03 you wrote a number of queries. Choose one query 
you wrote for any of the the Tasks of Ex One-03, numbered 2 though 10.
Execute the query you have chosen using Oracle SQL Developer tool. With 
comments, make it clear which Task in Ex One-03 the query was 
written for (e.g. -- Ex One-03 Task 1 Query). Capture a screen shot of 
the query and the execution results. The result set should include the 
last row retrieved (possibly a partial row in that all columns
need not be shown) with some of the rows above it. Make note of the 
retrieval time as reported by Oracle SQL Developer tool. If you did not 
write any of the queries requested in Tasks 2 through 10 of Ex One-03 then 
you will have to write one of those queries now, execute it and make note 
of the retrieval time reported by Oracle SQL Developer tool as requested. */
--John-Joshua Izuegbu
--This is the query for Ex One-03 Task 3
--John-Joshua Izuegbu
      select e.emp_id, e.first_name, e.last_name, 
ita.asset_make, ita.asset_ext, aty.asset_type_desc
from jaherna42.employee e
 join jaherna42.it_asset ita 
on ita.asset_id = e.emp_id
 full join jaherna42.asset_type aty
on ita.asset_id = aty.asset_type_id 
order by e.emp_id;


/* Task 2. Using SQL Developer tool, explain the plan for the query you 
executed for Task 1. Select the plan output and capture the complete plan 
output in one or more screenshots, one of which includes your name and the 
"explain plan for" command (with the entire query you are explaining). As 
already noted, showing the entire plan output and the entire command may 
require you to take more than one screenshot in order for me to be able 
to see all of the results. */

--John-Joshua Izuegbu
--Explain the execution plan for the query

explain plan for 
    select e.emp_id, e.first_name, e.last_name, 
ita.asset_make, ita.asset_ext, aty.asset_type_desc
from jaherna42.employee e
 join jaherna42.it_asset ita 
on ita.asset_id = e.emp_id
 full join jaherna42.asset_type aty
on ita.asset_id = aty.asset_type_id 
order by e.emp_id;

select plan_table_output from table(dbms_xplan.display());



/* Task 3. Now write a command to turn the query you executed for Task 1
into a view. Then repeat Task 1 (above) for a statement to select everything 
from the view you created. In your screenshot, it should be clear that you 
are selecting from a view. The results for the select from the view should 
include the last row retrieved and some other rows above it. */

--John_Joshua Izuegbu
--Create and retrieve from a view
create view Employee_asset as
    select e.emp_id, e.first_name, e.last_name, 
ita.asset_make, ita.asset_ext, aty.asset_type_desc
from jaherna42.employee e
 join jaherna42.it_asset ita 
on ita.asset_id = e.emp_id
 full join jaherna42.asset_type aty
on ita.asset_id = aty.asset_type_id 
order by e.emp_id;

select * from employee_asset;

/* Task 4. Compare the retrieval times for selecting identical data sets using 
a query in Task 1 and selecting from a view based on the same query in Task 3. 
Does it appear that data retrieval based on execution of a base query versus 
execution of a query from the corresponding a view is different in terms of 
speed of retrieval? Use the web to investigate retrieval performance of queries 
versus views. Summarize what you find in one or two sentences and include at 
least one url for a source you used for information. */

-- John-Joshua Izuegbu
--When using the view, it took about 0.05 seconds to retrieve the data from the database while, 
--Using the explain function, it took about 0.192 to compile and  0.067 to ouput the message for
--the base query.


/* Task 5. Now repeat Task 2 from this assignment for the query you ran for
Task 3 of this assignment. That is, explain the plan for the selection of 
data from the view you create in Task 3. document the plan generated and the
commands used to generate the plan and to retrieve the plan. */

-- John-Joshua Izuegbu
--get the execution plan for retrieval from the view
explain plan for 
select e.emp_id, e.first_name, e.last_name, 
ita.asset_make, ita.asset_ext, aty.asset_type_desc
from jaherna42.employee e
 join jaherna42.it_asset ita 
on ita.asset_id = e.emp_id
 full join jaherna42.asset_type aty
on ita.asset_id = aty.asset_type_id 
order by e.emp_id;

select plan_table_output from table(dbms_xplan.display());


/* Task 6. How do the two explain plans from Task 2 (this assignment) and 
Task 5 (this assignment) compare? Are they the same or are they different? 
If different, how so? Does it look to you as if performance in terms of 
data retrieval speed is enhanced if retrieval is done with a view as opposed
to with the base query of the view? Explain. */
--Technically to me they are the same code but have different fetch times,
--the retrieval speed was faster in task 5 then in task 2.


/* Task 7. Now retrieve the cpu execution times for the Task 1 and Task 3
statements by selecting appropriately from the v$sql system view. Be sure 
to select data that shows that you ran the query from Task 1 against the 
tables that are in the schema of jaherna42, and that you ran the query from 
Task 3 for a view you created in your own schema.*/

-- John-Joshua Izuegbu
select sql_id, sql_fulltext,rows_processed,cpu_time,elapsed_time from v$sql 
where upper(sql_fulltext) 
like 'select e.emp_id, e.first_name, e.last_name, 
ita.asset_make, ita.asset_ext, aty.asset_type_desc
from jaherna42.employee e
 join jaherna42.it_asset ita 
on ita.asset_id = e.emp_id
 full join jaherna42.asset_type aty
on ita.asset_id = aty.asset_type_id 
order by e.emp_id';






