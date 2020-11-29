create or replace procedure CreateFilm(name in CHAR,description in CHAR)
is
begin
insert into FILM f(f.name,f.description) 
              values(name,description);
  commit;
end;
--****************************************************************************************************
create or replace procedure DeleteFilmById (FilmId in number)
is 
begin
  delete from FILM f where f.id = FilmId;
  commit;
end;
--****************************************************************************************************

create or replace procedure DeleteFilmByName (name in char)
is 
begin
  delete from FILM f where f.name = name;
  commit;
end;
--****************************************************************************************************
create or replace procedure UpdateFilm (name in char,description in CHAR, id number)
is 
begin
  update FILM f set f.name = name,f.description=description where f.id=id ;
  commit;
end;
