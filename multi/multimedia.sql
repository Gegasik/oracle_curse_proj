create or replace procedure Export
is
l_file UTL_FILE.file_type;
l_file_name varchar2 (60) := 'export.xml';
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
 
select count(*) from film,place;

ALTER TABLE "USER"
  ADD image BFILE;
  
  
  CREATE OR REPLACE DIRECTORY IMAGE_DIR AS 'D:\curse project Oracle\multi\data';
-- go to SQL Plus, 
-- connect /as sysdba 
-- connect system/Qwertyu2000@//localhost:1521/cinema_pdb as sysdba;
grant read, write on directory IMAGE_DIR to super_admin;

INSERT INTO "USER" (username,password,image) VALUES ('user','password',BFILENAME('IMAGE_DIR', '13.png'))
select * from "USER" u where u.username='qwert';

CREATE OR REPLACE PROCEDURE readBFILE_proc(ident integer,filename varchar2) IS
   File_loc       BFILE := BFILENAME('ADPHOTO_DIR', 
       filename);
   Amount        INTEGER := 32767;
   Position      INTEGER := 1;
   Buffer        RAW(32767);
BEGIN
   /* Select the LOB: */  
    SELECT u.image INTO File_loc FROM "USER" u
      WHERE u.id=ident;
   /* Open the BFILE: */  
   DBMS_LOB.OPEN(File_loc, DBMS_LOB.LOB_READONLY);
   /* Read data: */  
   DBMS_LOB.READ(File_loc, Amount, Position, Buffer);
   /* Close the BFILE: */  
   DBMS_LOB.CLOSE(File_loc);
END;

CREATE OR REPLACE PROCEDURE displayBFILE_proc(ident integer) IS 
   File_loc  BFILE; 
   Buffer   RAW(1024); 
   Amount   BINARY_INTEGER := 1024; 
   Position INTEGER        := 1; 
BEGIN 
   /* Select the LOB: */ 
     SELECT u.image INTO File_loc FROM "USER" u
      WHERE u.id=ident;
   /* Opening the BFILE: */ 
   DBMS_LOB.OPEN (File_loc, DBMS_LOB.LOB_READONLY); 
   LOOP 
      DBMS_LOB.READ (File_loc, Amount, Position, Buffer); 
      /* Display the buffer contents: */ 
      DBMS_OUTPUT.PUT_LINE(utl_raw.cast_to_varchar2(Buffer)); 
      Position := Position + Amount; 
   END LOOP; 
   /* Closing the BFILE: */ 
   DBMS_LOB.CLOSE (File_loc); 
   EXCEPTION 
   WHEN NO_DATA_FOUND THEN 
      DBMS_OUTPUT.PUT_LINE('End of data'); 
END;

begin 
displayBFILE_proc(21);
end;