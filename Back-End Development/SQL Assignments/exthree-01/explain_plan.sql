/* Using Explain Plan */
/* The EXPLAIN PLAN statement displays execution plans chosen by the 
optimizer for select, UPDATE, INSERT, and DELETE statements. 
A statement execution plan is the sequence of operations that the database 
plans to perform to run the statement.*/

explain plan for 
  select invoice_number from invoices;
  
/* To see the output of the EXPLAIN PLAN statement, you
have to retrieve it from plan_table (the default repository for
the command results). The DBMS_XPLAN.DISPLAY command
retrieves from plan_table by default.*/
  
select plan_table_output from table(dbms_xplan.display());

/* Here are results that are from the class server version of the 
AP schema owned by user jdoe22.*/
/*
Plan hash value: 2547190830
 
------------------------------------------------------------------------------
| Id  | Operation         | Name     | Rows  | Bytes | Cost (%CPU)| Time     |
------------------------------------------------------------------------------
|   0 | select STATEMENT  |          |  1034 |  9306 |     5   (0)| 00:00:01 |
|   1 |  table ACCESS FULL| INVOICES |  1034 |  9306 |     5   (0)| 00:00:01 |
------------------------------------------------------------------------------
*/
/* The results show execution of a select statement by accessing the
full invoices table.*/

/* Add a where Clause to the select */
explain plan for 
  select invoice_number from invoices
  where invoice_number like '%B%';
  
/* Retrieve the Output.*/
select plan_table_output from table(dbms_xplan.display());

/* Here are results based on the AP schema tables owned by jdoe22.*/
/*
Plan hash value: 2547190830
 
------------------------------------------------------------------------------
| Id  | Operation         | Name     | Rows  | Bytes | Cost (%CPU)| Time     |
------------------------------------------------------------------------------
|   0 | select STATEMENT  |          |    52 |   468 |     5   (0)| 00:00:01 |
|*  1 |  table ACCESS FULL| INVOICES |    52 |   468 |     5   (0)| 00:00:01 |
------------------------------------------------------------------------------
 
Predicate Information (identified by operation id):
---------------------------------------------------
 
   1 - filter("INVOICE_NUMBER" LIKE '%B%')
   

/* The results show execution of a select statement but with a filter applied.
The filter is applied to each row and only the rows that pass the filter test 
are retrieved.*/


/* Try a different where clause. */
explain plan for
select invoice_date, invoice_due_date from
invoices
where invoice_date between '01-JAN-11' and '11-NOV-13';

/* Retrieve the Output.*/
select plan_table_output from table(dbms_xplan.display());
  
/* Here are results that are from the class server version of the AP
schema tables that belong to user jdoe22.*/
/*
Plan hash value: 644767052
 
-------------------------------------------------------------------------------
| Id  | Operation          | Name     | Rows  | Bytes | Cost (%CPU)| Time     |
-------------------------------------------------------------------------------
|   0 | SELECT STATEMENT   |          |     2 |    32 |     5   (0)| 00:00:01 |
|*  1 |  FILTER            |          |       |       |            |          |
|*  2 |   TABLE ACCESS FULL| INVOICES |     2 |    32 |     5   (0)| 00:00:01 |
-------------------------------------------------------------------------------
 
Predicate Information (identified by operation id):
---------------------------------------------------
 
   1 - filter(TO_DATE('11-NOV-13')>=TO_DATE('01-JAN-11'))
   2 - filter("INVOICE_DATE"<='11-NOV-13' AND 
              "INVOICE_DATE">='01-JAN-11')
*/
/* The results show execution of a select statement. The table invoices is 
accessed in full applying the filters to each row. The filter descriptions
explain how the comparisons are made to evaluate the between operator condition.
*/
/* Use to_date in the query. */
explain plan for
select invoice_date, invoice_due_date from
invoices
where invoice_date between to_date('01-JAN-11','DD-MON-YY') 
and to_date('11-NOV-13','DD-MON-YY');

/* Retrieve the Output.*/
select plan_table_output from table(dbms_xplan.display());

/* Explain the plan for an inner join. */
explain plan for
select vendor_name, invoice_number, invoice_total
from vendors v join invoices i on v.vendor_id = i.vendor_id;

/* Retrieve the Output.*/
select plan_table_output from table(dbms_xplan.display());
/* Here is sample output based on a query of the AP schema 
tables of user jdoe22.*/
/*
Plan hash value: 999999302
 
--------------------------------------------------------------------------------------------------
| Id  | Operation               | Name                   | Rows  | Bytes | Cost (%CPU)| Time     |
--------------------------------------------------------------------------------------------------
|   0 | SELECT STATEMENT        |                        |  1034 | 43428 |     7   (0)| 00:00:01 |
|*  1 |  HASH JOIN              |                        |  1034 | 43428 |     7   (0)| 00:00:01 |
|   2 |   VIEW                  | index$_join$_001       |   126 |  3024 |     2   (0)| 00:00:01 |
|*  3 |    HASH JOIN            |                        |       |       |            |          |
|   4 |     INDEX FAST FULL SCAN| VENDORS_PK             |   126 |  3024 |     1   (0)| 00:00:01 |
|   5 |     INDEX FAST FULL SCAN| VENDORS_VENDOR_NAME_UQ |   126 |  3024 |     1   (0)| 00:00:01 |
|   6 |   TABLE ACCESS FULL     | INVOICES               |  1034 | 18612 |     5   (0)| 00:00:01 |
--------------------------------------------------------------------------------------------------
 
Predicate Information (identified by operation id):
---------------------------------------------------
 
   1 - access("V"."VENDOR_ID"="I"."VENDOR_ID")
   3 - access(ROWID=ROWID)
*/
/* Here is what Oracle says about hash joins. 
The database uses a hash join to join larger data sets.
The optimizer uses the smaller of two data sets to build 
a hash table on the join key in memory, using a 
deterministic hash function to specify the location in 
the hash table in which to store each row. The database 
then scans the larger data set, probing the hash table 
to find the rows that meet the join condition.
*/

/* What if the join is accomplished using a subquery? */
explain plan for 
select (select vendor_name from vendors v where i.vendor_id = v.vendor_id),
invoice_number,invoice_total
from invoices i ;

/* Retrieve the Output.*/
select plan_table_output from table(dbms_xplan.display());

/* Here is what Oracle says about a hash join: The database uses a hash join to join larger data sets.

The optimizer uses the smaller of two data sets to build a hash table on the join key in memory, using a deterministic hash function to specify the location in the hash table in which to store each row. The database then scans the larger data set, probing the hash table to find the rows that meet the join condition.



/* explain plan for a VIEW */
/* Create a view for a simple query*/
CREATE OR REPLACE VIEW recent_invoices_vw
AS
select * from
invoices
where invoice_date between SYSDATE - 730 and SYSDATE;

/* Execute explain plan for a query on the view */
explain plan for
  select invoice_date,invoice_due_date 
  from recent_invoices_vw
  where invoice_date between '01-JAN-11' and '11-NOV-13';
  
/* Retrieve the Output.*/
  select plan_table_output from table(dbms_xplan.display());
  
/* Here are results that are not from the class server version of AP.*/
/*
Plan hash value: 3583245756
 
------------------------------------------------------------------------------------------
| Id  | Operation                   | Name       | Rows  | Bytes | Cost (%CPU)| Time     |
------------------------------------------------------------------------------------------
|   0 | SELECT STATEMENT            |            |  1034 | 18612 |    85   (0)| 00:00:01 |
|   1 |  TABLE ACCESS BY INDEX ROWID| VENDORS    |     1 |    24 |     1   (0)| 00:00:01 |
|*  2 |   INDEX UNIQUE SCAN         | VENDORS_PK |     1 |       |     0   (0)| 00:00:01 |
|   3 |  TABLE ACCESS FULL          | INVOICES   |  1034 | 18612 |     5   (0)| 00:00:01 |
------------------------------------------------------------------------------------------
 
Predicate Information (identified by operation id):
---------------------------------------------------
 
   2 - access("V"."VENDOR_ID"=:B1)
*/

/* explain plan for an outer join*/
explain plan for
select invoice_number,vendor_name,invoice_due_date,
invoice_total-payment_total-credit_total AS balance_due
from vendors v left
join  invoices i
on i.vendor_id=v.vendor_id;

/* Retrieve the Output.*/
select plan_table_output from table(dbms_xplan.display());
  
/* Here are results that are based on the class server AP schema 
tables belonging to jdoe22.*/
/*
Plan hash value: 225755086
 
--------------------------------------------------------------------------------------------------
| Id  | Operation               | Name                   | Rows  | Bytes | Cost (%CPU)| Time     |
--------------------------------------------------------------------------------------------------
|   0 | SELECT STATEMENT        |                        |  1080 | 61560 |     7   (0)| 00:00:01 |
|*  1 |  HASH JOIN OUTER        |                        |  1080 | 61560 |     7   (0)| 00:00:01 |
|   2 |   VIEW                  | index$_join$_001       |   126 |  3024 |     2   (0)| 00:00:01 |
|*  3 |    HASH JOIN            |                        |       |       |            |          |
|   4 |     INDEX FAST FULL SCAN| VENDORS_PK             |   126 |  3024 |     1   (0)| 00:00:01 |
|   5 |     INDEX FAST FULL SCAN| VENDORS_VENDOR_NAME_UQ |   126 |  3024 |     1   (0)| 00:00:01 |
|   6 |   TABLE ACCESS FULL     | INVOICES               |  1034 | 34122 |     5   (0)| 00:00:01 |
--------------------------------------------------------------------------------------------------
 
Predicate Information (identified by operation id):
---------------------------------------------------
 
   1 - access("I"."VENDOR_ID"(+)="V"."VENDOR_ID")
   3 - access(ROWID=ROWID)
*/   


/* As mentioned already, explain plan does not execute the query. The time
for the query is an estimate. How can we get actual execution time? Use 
the v$sql system view. */
/* First run a simple query and note the number or rows retrieved and the 
time for the fetch.*/
select invoice_number from invoices where invoice_number like '%B%';

/* There are system views available to an admin user that can reveal 
much information about a query that has just been executed. */
select sql_id, sql_fulltext,rows_processed,cpu_time,elapsed_time from v$sql 
where upper(sql_fulltext) 
like 'SELECT INVOICE_NUMBER FROM JDOE22.INVOICES%';


