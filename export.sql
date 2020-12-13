CREATE OR REPLACE DIRECTORY EXPORT_DIR AS 'E:\app\user1\curs_data';

grant read, write on directory EXPORT_DIR to super_admin;
-------------------------------------------------------------------------
create or replace procedure Export
is
l_file UTL_FILE.file_type;
l_file_name varchar2 (60) := 'xport.xml';
cursor c1 is select * from FILM;
cuser xmltype;
 u_string varchar2(1500);
 u Film%rowtype;

 begin
 l_file:=UTL_FIlE.fopen ('EXPORT_DIR', l_file_name, 'w', 32767 );
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
 end Export;
 -----------------------------------------------------------------
  begin
 Export ;
 end;
 
select count(*) from film

DELETE FROM film where id>0
 [WHERE conditions];

ALTER TABLE film
  MODIFY description char(1000) ;