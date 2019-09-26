/*=====================================================
/*=====================================================
Project :
Program : 01_data_management.sas
Version : 1
Purpose : Import original data and create permanent SAS dataset
Author : 
Date : 
Sub Macros : Names of macros if used
Notes: 
Changelog: 
======================================================
======================================================*/
* Assign directory paths;
%let path = I:\...;
%let outpath = &path.\Output;

libname sasdata "I:\..\Data\SAS";

data _null_;
today = put(date(),date9.);
call symput('dtnull',today);
run;

*Macro to delete files;
%macro deldata(list);
	proc datasets;
		delete &list ;
	quit;
%mend;

