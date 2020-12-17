CREATE or replace VIEW sessions AS
SELECT s.id, f.name,c.title,s."date" from "SESSION" s
inner join film f on f.id=s.film_id
inner join cinema_hall c on c.id=s.cinema_hall_id;


CREATE or replace VIEW tickets AS select t.id,u.username from ticket t 
inner join "USER" u on u.id=t.user_id


