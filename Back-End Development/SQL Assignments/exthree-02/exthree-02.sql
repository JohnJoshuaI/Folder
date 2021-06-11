/* Here you will complete tasks against one table of the ITAM schema that 
you have created in your schema. Your deliverable is a Word document named 
exthree-02_lastname_fi.docx (where lastname_fi is your last name followed 
by the first letter of your first name). */

/* Task 1. Logged in to the class server as your username, select 
information from the system view user_tablespaces.

--John-Joshua Izuegbu
--Screenshot of command and results (possibly partial)*/
select * from user_tablespaces;

/* Task 2. Logged in to the class server as your username, select 
information from the system view user_segments. */

--John-Joshua Izuegbu
--Screenshot of command and results (possibly partial)
select * from user_segments;

/* Task 3. Logged in to the class server as your username, select 
information from the system view user_extents.*/

--John-Joshua Izuegbu
--Screenshot of command and results (possibly partial)
select * from user_extents;

/* Task 4. Answer the question: Have any of the objects owned by 
your username forced the RDBMS to add extents or segment other 
than the extents and segments created when you initially the object?
If so, name the objects. Justify your answer by citing specific data 
returned through the system views that is documented in your 
screen shots for Tasks 1 through 3.

--John-Joshua Izuegbu
--Your answer and explanation.
--An added segment caught by me that I'm not familiar with is the BIN$ segment name in 
-- the user segment section

/* Task 5. Follow the instructions given in class and in the pdf 
provided to download and install the Oracle Instant Client Basic 
package, the Oracle SQL*Plus package, and the Oracle Tools package 
that includes the SQL Loader tool. Document your success with 
installation of the tools by running SQL*Plus from the command line 
of your machine, logging in to your schema on the class server, running 
the command below, and capturing a screen shot.*/

--Command to run from SQL*Plus:
select user as "Owner",table_name,last_analyzed from user_tables;

--Your name

 

/* Task 6. Go to Mockaroo.com (or a comparable site) and generate 
1000 rows of data compatible with the employee table you created as 
one of the ITAM tables in your own schema. Note that the emp_id value 
should be added from the sequence you created for that purpose. You 
make that happen with a directive in the control file, which I have
included a sample of in the zip archive with the assignment files. 
Also not that the dept_code values will have to be added by you to 
the data file so that they match a parent table value of dept_code. 
may leave the supervisor_id field null for these added rows. 
Once you have your data file ready, open the file in Notepad or 
Excel and take a screen shot of some of the rows of the fake
data file.

--Your name



/*Task 7. Run the commands below and capture the results.*/
-- Your name
select user as "Owner", bytes, blocks, extents, initial_extent
from user_segments where segment_name like '%EMPLOYEE%';

select * from user_extents where segment_name like '%EMPLOYEE%';


/* Task 8. Prepare a control file for SQL Loader to use to
load the 1000 rows of fake data into the employee table in 
your schema. The control file should direct the RDBMS to use
the sequence to get the next value to use for the emp_id. 
Provide a screen shot of your control file open in 
Notepad.

--Your name


/*Task 9. Now use SQL Loader to load the 1000 rows of fake data 
into the employee table in your schema. Be sure to 
have SQL Loader create a log file for each run attempt. Capture 
a screen shot of your command used to invoke SQL Loader in your
command line interface and the feedback regarding the number 
of rows that were successfully loaded.

-Your name

/*Task 10. Run the commands of Task 7 again, capture the results, 
and then write a statement as to whether adding the thousand rows 
of data to the table caused the RDBMS to allocate an additional 
extent to the employee table segment.*/

--Your name



