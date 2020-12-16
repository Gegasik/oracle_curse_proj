CREATE OR REPLACE DIRECTORY EXPORT_DIR AS 'D:\curse project Oracle\data_import_export\data';

grant read, write on directory EXPORT_DIR to super_admin;
-------------------------------------------------------------------------
create or replace procedure ExportCinemaHall
is
l_file UTL_FILE.file_type;
l_file_name varchar2 (60) := 'CinemaHallData.xml';
cursor c1 is select * from Cinema_Hall;
cuser xmltype;
 u_string varchar2(1500);
 u Cinema_Hall%rowtype;

 begin
 l_file:=UTL_FIlE.fopen ('IMPORT_DIR', l_file_name, 'w', 32767 );
 UTL_FILE.put_line(l_file, '<?xml version = "1.0"?>');
 UTL_FILE.put_line(l_file, '<cinemaHalls>');
 open c1;
 fetch c1 into u;
 while c1%found loop
 select XMLElement("cinemaHall", XMLElement("title", u.title), XMLElement("capacity", u.capacity)) into cuser from dual;
 u_string :=cuser.getStringVal();
 UTL_FILE.put_line(l_file, u_string);

 fetch c1 into u;
 end loop;
 close c1;
 UTL_FILE.put_line(l_file, '</cinemaHalls>');
 UTL_FILE.fclose(l_file);
 end ExportCinemaHall;
 -----------------------------------------------------------------
  begin
 ExportCinemaHall ;
 end;