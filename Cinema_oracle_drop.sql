CREATE TABLE "cinema_hall" (
	"id" INT NOT NULL,
	"title" CHAR(255) UNIQUE NOT NULL DEFAULT "255",
	"capacity" INT NOT NULL,
	constraint CINEMA_HALL_PK PRIMARY KEY ("id"));

CREATE sequence "CINEMA_HALL_ID_SEQ";

CREATE trigger "BI_CINEMA_HALL_ID"
  before insert on "cinema_hall"
  for each row
begin
  select "CINEMA_HALL_ID_SEQ".nextval into :NEW."id" from dual;
end;

/
CREATE TABLE "category" (
	"id" INT NOT NULL,
	"title" CHAR(255) UNIQUE NOT NULL,
	constraint CATEGORY_PK PRIMARY KEY ("id"));

CREATE sequence "CATEGORY_ID_SEQ";

CREATE trigger "BI_CATEGORY_ID"
  before insert on "category"
  for each row
begin
  select "CATEGORY_ID_SEQ".nextval into :NEW."id" from dual;
end;

/
CREATE TABLE "film" (
	"id" INT NOT NULL,
	"name" CHAR(255) NOT NULL,
	"description" CHAR(255) NOT NULL,
	constraint FILM_PK PRIMARY KEY ("id"));

CREATE sequence "FILM_ID_SEQ";

CREATE trigger "BI_FILM_ID"
  before insert on "film"
  for each row
begin
  select "FILM_ID_SEQ".nextval into :NEW."id" from dual;
end;

/
CREATE TABLE "session" (
	"id" INT NOT NULL,
	"film_id" INT NOT NULL,
	"cinema_hall_id" INT NOT NULL,
	"added_coast" INT NOT NULL DEFAULT "0",
	constraint SESSION_PK PRIMARY KEY ("id"));

CREATE sequence "SESSION_ID_SEQ";

CREATE trigger "BI_SESSION_ID"
  before insert on "session"
  for each row
begin
  select "SESSION_ID_SEQ".nextval into :NEW."id" from dual;
end;

/
CREATE TABLE "films_categories" (
	"film_id" INT NOT NULL,
	"category_id" INT NOT NULL);


/
CREATE TABLE "place" (
	"id" INT NOT NULL,
	"cinema_hall_id" INT NOT NULL,
	"coast" INT NOT NULL,
	constraint PLACE_PK PRIMARY KEY ("id"));

CREATE sequence "PLACE_ID_SEQ";

CREATE trigger "BI_PLACE_ID"
  before insert on "place"
  for each row
begin
  select "PLACE_ID_SEQ".nextval into :NEW."id" from dual;
end;

/



ALTER TABLE "session" ADD CONSTRAINT "session_fk0" FOREIGN KEY ("film_id") REFERENCES "film"("id");
ALTER TABLE "session" ADD CONSTRAINT "session_fk1" FOREIGN KEY ("cinema_hall_id") REFERENCES "cinema_hall"("id");

ALTER TABLE "films_categories" ADD CONSTRAINT "films_categories_fk0" FOREIGN KEY ("film_id") REFERENCES "film"("id");
ALTER TABLE "films_categories" ADD CONSTRAINT "films_categories_fk1" FOREIGN KEY ("category_id") REFERENCES "category"("id");

ALTER TABLE "place" ADD CONSTRAINT "place_fk0" FOREIGN KEY ("cinema_hall_id") REFERENCES "cinema_hall"("id");

