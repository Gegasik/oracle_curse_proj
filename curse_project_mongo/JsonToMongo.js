const MongoClient = require("mongodb").MongoClient;
const fs = require("fs");
const url = "mongodb://localhost:27017/";
const mongoClient = new MongoClient(url, {useNewUrlParser: true});
var fi = fs.readFileSync("D:\\curse_project_mongo\\movie.json");
var js = JSON.parse(fi);


    mongoClient.connect(function (err, client) {
for (let i = 1; i < 45550; i++) {
        let db = client.db("cinema");
        let collection = db.collection("films");
    let A=js[i];
    delete A.Id;
    collection.insertOne(A, function (err, results) {
    });
        client.close();
}
    });

