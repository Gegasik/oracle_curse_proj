create or replace procedure CreateCategory(title in NVARCHAR2)
is
begin
insert into CATEGORY c(c.title) 
              values(title);
  commit;
end;
--****************************************************************************************************
create or replace procedure DeleteCategoryById (CategoryId in number)
is 
begin
  delete from CATEGORY c where c.id = CategoryId;
  commit;
end;
--****************************************************************************************************

create or replace procedure DeleteCategoryByTitle (title in NVARCHAR2)
is 
begin
  delete from CATEGORY c where c.title = title;
  commit;
end;
--****************************************************************************************************
create or replace procedure UpdateCategory (title in NVARCHAR2,id number)
is 
begin
  update Category c set c.title = title where c.id=id ;
  commit;
end;
