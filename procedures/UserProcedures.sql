--Check if user exists
create or replace procedure CheckUser (inLogin in varchar2, inPassword in varchar2)
is
 cuser number;
 cursor c1 is select u.id from Users u where u.login = inLogin and u.password = inPassword;
 begin 
 open c1;
 fetch c1 into cuser;
 
 if c1%notfound then
 raise_application_error(-20010, 'Error detected - '||SQLCODE||' ERROR '||SQLERRM);
 end if;
 close c1;
 end;
 
 --Registration
 create or replace procedure RegistrationUser (inLogin in nvarchar2, inPassword in varchar2)
 is
 cuser number;
 cursor c1 is select u.id from Users u where u.Login = inLogin and u.password = inPassword;
   newPassword varchar2(2000);
begin
  newPassword := inPassword;
  encryptPassword(newPassword);
  open c1;
  fetch c1 into cuser;
 if c1%found then
 raise_application_error(-20010, 'Error detected - '||SQLCODE||' ERROR '||SQLERRM);
 end if; 
 insert into Users (login, password) values (inLogin, newPassword);
 commit;
 
 close c1;
 end;

--Encrypt password 
create or replace procedure encryptPassword (casualPassword in out varchar2) is
  l_key varchar2(2000) := '1234567890123456';
  l_mod NUMBER  :=DBMS_CRYPTO.encrypt_aes128
                    + DBMS_CRYPTO.chain_cbc
                    + DBMS_CRYPTO.pad_pkcs5;
  newPassword RAW(2000);
begin
  newPassword:= DBMS_CRYPTO.encrypt (utl_i18n.string_to_raw (casualPassword, 'AL32UTF8'),
                                      l_mod,
                                      utl_i18n.string_to_raw (l_key, 'AL32UTF8')
  );
  casualPassword := newPassword;
end;

--Authorization 
create or replace procedure AuthorizationUser (inLogin in varchar2, inPassword in varchar2)
is
  dpassword varchar2 (2000);
begin
  dpassword := inPassword;
  encryptPassword(dpassword);
  CheckUser(inLogin, dpassword);
end;

--Delete
create or replace procedure DeleteUser (inLogin in varchar2, inPassword in varchar2)
is
 dpassword varchar2 (2000);
begin
  dpassword := inPassword;
  encryptPassword(dpassword);
  CheckUser(inLogin, dPassword);
  delete from Users u where u.login = inLogin and u.password = dpassword;
  commit;
end;

--Update login
create or replace procedure UpdateLogin(inLogin in varchar2, inPassword in varchar2)
is
 dpassword varchar2 (2000);
begin 
  dpassword := inPassword;
  encryptPassword(dpassword);
update Users u set u.login = inLogin where u.Password = dPassword;
commit;
end;




--------------------------------------------------------------------------------------
select p.id,c.title,s.date from place p
inner join cinema_hall c on p.cinema_hall_id=c.id
inner join "SESSION" s on s.cinema_hall_id=p.cinema_hall_id

select * from place p 
left join ticket t on t.place_id=p.id where p.cinema_hall_id=12 and user_id is null

select count(p.id) from  "SESSION" s
inner join place p on p.cinema_hall_id=12
left join ticket t on t.place_id=p.id
where t.id is null
 where s.id=1

CREATE VIEW sessions AS
SELECT f.name,c.title,s."date" from "SESSION" s
inner join film f on f.id=s.film_id
inner join cinema_hall c on c.id=s.cinema_hall_id;
