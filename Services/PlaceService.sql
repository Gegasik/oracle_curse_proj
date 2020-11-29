
create or replace procedure CreatePlace(CinemaHallId in integer,coast integer)
is
begin
insert into PLACE p(p.Cinema_Hall_Id,p.coast) 
              values(CinemaHallId,coast);
  commit;
end;
--****************************************************************************************************
create or replace procedure DeletePlaceById (PlaceId in number)
is 
begin
  delete from PLACE p where p.id = PlaceId;
  commit;
end;
--****************************************************************************************************
create or replace procedure UpdatePlace (CinemaHallId in integer,coast in integer, id number)
is 
begin
  update PLACE p set p.Cinema_Hall_Id = CinemaHallId,p.coast=coast where p.id=id ;
  commit;
end;