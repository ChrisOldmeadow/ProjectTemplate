/*
*	File:	init.sas
*	Date:   
*	Author: 
*	Purpose:To setup program, output and data paths, compile macros, etc.
*/

*To create the necessary paths;
%let path =  \\researchers\rsch_centres\CReDITSS\Funder name-Researcher name(name of researcher);
%let outpath  = &path.\Output;
%let datapath = &path.\Data\SAS;
%let pgmpath = &path.\Programs\SAS;


*To create the permanent data directory;
libname sasdata "&path.\Data\SAS";

*To compile formats;
%include "&path.\Programs\SAS\formats.sas";

*To compile the macros;
%inc "&path.\Programs\SAS\Macros\abc.sas";
%inc "&path.\Programs\SAS\Macros\xyz.sas";

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

*Code for footnotes for reports;
%macro footnote (pgmname, rtfname);
	compute after/style=[just=l];
			line ' ';
			line "Program: &pgmpath.\&pgmname..sas";
			line "Output: &outpath.\&rtfname..rtf";
	endcomp;
%mend;
*%footnote(SensSpes, %str(Sensitivity and Specificity)); 




