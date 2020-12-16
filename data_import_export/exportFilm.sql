create or replace procedure ExportFilms
is
l_file UTL_FILE.file_type;
l_file_name varchar2 (60) := 'FilmExport.xml';
cursor c1 is select * from FILM;
cuser xmltype;
 u_string varchar2(1500);
 u Film%rowtype;

 begin
 l_file:=UTL_FIlE.fopen ('IMPORT_DIR', l_file_name, 'w', 32767 );
 UTL_FILE.put_line(l_file, '<?xml version = "1.0"?>');
 UTL_FILE.put_line(l_file, '<films>');
 open c1;
 fetch c1 into u;
 while c1%found loop
 select XMLElement("film", XMLElement("name", u.name), XMLELEMENT("description", u.description)) into cuser from dual;
 u_string :=cuser.getStringVal();
 UTL_FILE.put_line(l_file, u_string);

 fetch c1 into u;
 end loop;
 close c1;
 UTL_FILE.put_line(l_file, '</films>');
 UTL_FILE.fclose(l_file);
 end ExportFilms;
 -----------------------------------------------------------------
  begin
 ExportFilms;;
 end;
