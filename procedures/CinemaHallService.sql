create or replace procedure CreateCinemaHall(title in NVARCHAR2)
is
begin
insert into CINEMA_HALL ch(ch.title) 
              values(title);
  commit;
end;
--****************************************************************************************************
create or replace procedure DeleteCinemaHallById (CinemaHallId in number)
is 
begin
  delete from CINEMA_HALL ch where ch.id = CinemaHallId;
  commit;
end;
--****************************************************************************************************

create or replace procedure DeleteCinemaHallByTitle (title in NVARCHAR2)
is 
begin
  delete from CINEMA_HALL ch where ch.title = title;
  commit;
end;
--****************************************************************************************************
create or replace procedure UpdateCinemaHall (title in NVARCHAR2,capacity in integer, id number)
is 
begin
  update CINEMA_HALL ch set ch.title = title,ch.capacity=capacity where ch.id=id ;
  commit;
end;