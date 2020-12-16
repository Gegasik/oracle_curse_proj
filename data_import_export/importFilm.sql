CREATE OR REPLACE DIRECTORY EXPORT_DIR AS 'C:\Users\prost\Desktop\curseProjectOracle\export.xml';

grant read, write on directory EXPORT_DIR to super_admin;
--------------------------------------------
CREATE TABLE tab1 (
id NUMBER,
clob_data CLOB
);
--------------------------------------------
create or replace procedure ImportFilms(fname varchar2)
is
l_bfile BFILE;
l_clob CLOB;
l_dest_offset INTEGER := 1;
l_src_offset INTEGER := 1;
l_bfile_csid NUMBER := 0;
l_lang_context INTEGER := 0;
l_warning INTEGER := 0;
xml clob;
type curtype is ref cursor;
cur curtype;
sup_row Film%rowtype;
begin
INSERT INTO tab1 (id, clob_data)
VALUES (1, empty_clob())
RETURN clob_data INTO l_clob;
l_bfile := BFILENAME('EXPORT_DIR', fname);
DBMS_LOB.fileopen(l_bfile, DBMS_LOB.file_readonly);
DBMS_LOB.loadclobfromfile (
dest_lob => l_clob,
src_bfile => l_bfile,
amount => DBMS_LOB.lobmaxsize,
dest_offset => l_dest_offset,
src_offset => l_src_offset,
bfile_csid => l_bfile_csid ,
lang_context => l_lang_context,
warning => l_warning);
DBMS_LOB.fileclose(l_bfile);
COMMIT;
--работа с таблицей
select clob_data into xml from tab1;
open cur for select *
FROM XMLTABLE('/films/film'
PASSING
xmltype(to_char(xml))
COLUMNS
шв varchar2(255) PATH './шв',
name varchar2(255) PATH './name',
description varchar2(1000) PATH './description');
fetch cur into sup_row;
while cur%found loop
--dbms_output.put_line(sup_row.supervisor||' '||sup_row.email);
CreateFilm(sup_row.name, sup_row.description);
fetch cur into sup_row;
end loop;
close cur;
--truncate table tab1;
EXECUTE IMMEDIATE 'TRUNCATE TABLE tab1';
commit;
end ImportFilms;


-------------------------------------------------------------------------------------------





CREATE OR REPLACE DIRECTORY  IMPORT_DIR  AS 'E:\app\user1\test';
CREATE OR REPLACE PROCEDURE IMPORT_FILMS
IS
BEGIN
    INSERT INTO FILM (name, description)
    SELECT  ExtractValue(VALUE(product_order_xml), '//name')       AS name,
            ExtractValue(VALUE(product_order_xml), '//description')         AS description
    FROM TABLE(XMLSequence(EXTRACT(XMLTYPE(bfilename('IMPORT_DIR', 'movie.xml'),

        nls_charset_id('UTF-8')),'films/film'))) product_order_xml;
END IMPORT_FILMS;

begin
    IMPORT_FILMS();
end;