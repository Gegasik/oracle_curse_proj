CREATE OR REPLACE DIRECTORY IMAGE_DIR AS 'D:\curse project Oracle\multi\data';
-- go to SQL Plus, 
-- connect /as sysdba 
-- connect system/Qwertyu2000@//localhost:1521/cinema_pdb as sysdba;
grant read, write on directory IMAGE_DIR to super_admin;

INSERT INTO "USER" (username,password,image) VALUES ('qwert','ewqe',BFILENAME('IMAGE_DIR', '3106_keyboard'))