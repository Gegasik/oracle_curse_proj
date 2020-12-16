
CREATE TABLE CINEMA_HALL(
	id INTEGER GENERATED ALWAYS as IDENTITY(START with 1 INCREMENT by 1),
	title NVARCHAR2(255) UNIQUE NOT NULL,
	capacity INT NOT NULL,
	constraint CINEMA_HALL_PK PRIMARY KEY (id));

--**************************************************************************************************
CREATE TABLE CATEGORY (
	id INTEGER GENERATED ALWAYS as IDENTITY(START with 1 INCREMENT by 1),
	title NVARCHAR2(255) UNIQUE NOT NULL,
	constraint CATEGORY_PK PRIMARY KEY (id));

--**************************************************************************************************
/
CREATE TABLE FILM (
	id INTEGER GENERATED ALWAYS as IDENTITY(START with 1 INCREMENT by 1),
	name NVARCHAR2(255) NULL,
	description NVARCHAR2(1500)  NULL,
	constraint FILM_PK PRIMARY KEY (id));

--**************************************************************************************************
/
CREATE TABLE "SESSION" (
	id INTEGER GENERATED ALWAYS as IDENTITY(START with 1 INCREMENT by 1),
	film_id INT NOT NULL,
	cinema_hall_id INT NOT NULL,
	added_coast INT DEFAULT 0 NOT NULL ,
	"date" DATE NOT NULL,
	constraint SESSION_PK PRIMARY KEY (id));

--**************************************************************************************************
/
CREATE TABLE FILMS_CATEGORIES(
	film_id INT NOT NULL,
	category_id INT NOT NULL);

--**************************************************************************************************
/
CREATE TABLE PLACE(
	id INTEGER GENERATED ALWAYS as IDENTITY(START with 1 INCREMENT by 1),
	cinema_hall_id INT NOT NULL,
	coast INT NOT NULL,
	constraint PLACE_PK PRIMARY KEY (id));
/
--**************************************************************************************************
CREATE TABLE TICKET(
	id INTEGER GENERATED ALWAYS as IDENTITY(START with 1 INCREMENT by 1),
	session_id INTEGER NOT NULL,
	place_id INTEGER NOT NULL,
	total_coast INTEGER NOT NULL,
	user_id INTEGER NOT NULL,
	constraint TICKET_PK PRIMARY KEY (id));

/
--**************************************************************************************************
    create table "USER"(
    id INTEGER GENERATED ALWAYS as IDENTITY(START with 1 INCREMENT by 1),
                   username NVARCHAR2(255) not null unique,
                   password NVARCHAR2(255) not null,
                   constraint user_pk primary key(id));
--**************************************************************************************************

ALTER TABLE "SESSION" ADD CONSTRAINT "session_fk0" FOREIGN KEY (film_id) REFERENCES FILM(id)on delete cascade;
ALTER TABLE "SESSION" ADD CONSTRAINT "session_fk1" FOREIGN KEY (cinema_hall_id) REFERENCES CINEMA_HALL(id)on delete cascade;

ALTER TABLE FILMS_CATEGORIES ADD CONSTRAINT "films_categories_fk0" FOREIGN KEY (film_id) REFERENCES FILM(id)on delete cascade;
ALTER TABLE FILMS_CATEGORIES ADD CONSTRAINT "films_categories_fk1" FOREIGN KEY (category_id) REFERENCES CATEGORY(id)on delete cascade;

ALTER TABLE PLACE ADD CONSTRAINT "place_fk0" FOREIGN KEY (cinema_hall_id) REFERENCES CINEMA_HALL(id)on delete cascade;

ALTER TABLE TICKET ADD CONSTRAINT "ticket_fk0" FOREIGN KEY (session_id) REFERENCES "SESSION"(id)on delete cascade;
ALTER TABLE TICKET ADD CONSTRAINT "ticket_fk1" FOREIGN KEY (place_id) REFERENCES PLACE(id)on delete cascade;
ALTER TABLE TICKET ADD CONSTRAINT "ticket_fk2" FOREIGN KEY (user_id) REFERENCES "USER"(id)on delete cascade;