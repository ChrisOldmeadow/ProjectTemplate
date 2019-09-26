*Macro to delete files;
%macro ddata(list);
	proc datasets;
		delete &list ;
	quit;
%mend;
