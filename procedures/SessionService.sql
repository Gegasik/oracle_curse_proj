create or replace procedure CreateSession(filmId in integer, cinemaHallId integer,addedCoast integer,"date" date)
is
begin
insert into "SESSION" s(s.film_id,s.cinema_hall_id,s.added_coast,s."date") 
              values(filmId,cinemaHallId,addedCoast,"date");
  commit;
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