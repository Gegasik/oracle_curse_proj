create or replace procedure addCategoryToFilm(idFilm integer,idCategory integer)
is
begin
insert into FILMS_CATEGORIES fc(fc.film_id,fc.category_id) 
              values(idFilm,idCategory);
  commit;
end;
--****************************************************************************************************
create or replace procedure deleteCategoryFromFilm(idFilm integer,idCategory integer)
is
begin
delete from FILMS_CATEGORIES fc where fc.film_id=idfilm and fc.category_id=idcategory;
  commit;
end;