create or replace procedure BuyTicket(In_session_id in integer, In_place_id in integer,In_total_coast in integer,In_user_id in integer)
is
cuser number;
cursor cur is select ticket.id from ticket where ticket.session_id = In_session_id and ticket.place_id=In_place_id;
begin
  open cur;
 fetch cur into cuser;
   DBMS_OUTPUT.PUT_LINE(cuser); 
if cur%FOUND THEN  -- fetch succeeded
   raise_application_error(-20010, 'Error detected - '||SQLCODE||' ERROR '||SQLERRM);
    END IF;
insert into TICKET t(t.session_id,t.place_id,t.total_coast,t.user_id) 
              values(In_session_id,In_place_id,In_total_coast,In_user_id);
  commit;
   close cur;
end;
--****************************************************************************************************
create or replace procedure DeleteSessionById (SessionId in number)
is 
begin
  delete from "SESSION" s where s.id = SessionId;
  commit;
end;
--****************************************************************************************************
create or replace procedure UpdateSession (filmId integer, cinemaHallId integer,addedCoast integer,"date" date,id integer)
is 
begin
  update "SESSION" s set s.film_id = filmId,s.cinema_hall_id=cinemaHallId,s.added_coast=addedCoast,s."date"="date"
  where s.id=id ;
  commit;
end;