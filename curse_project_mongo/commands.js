.explain("executionStats");
.sort({name: 1});

db.film.find().sort({original_title: 1}).explain("executionStats");