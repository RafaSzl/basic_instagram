var express = require('express');
var app = express();
var mysql = require('mysql');


app.set("view engine", "ejs");


var connection = mysql.createConnection({
	host: 'localhost',
	user: 'root',
	database: 'join_us'
});


app.get("/", function(req, res) {
// 	FIND COUNT OF USERS IN DATABASE
	var q = 'SELECT COUNT(*) AS count FROM users';
	connection.query(q, function(err, results) {
		if(err) throw err;
		var count = results[0].count;
		res.render("home", {count: count});
	});
});


app.post("/register", function(req, res) {
	console.log("POST REQUEST SENT TO /REGISTER")
});



app.get("/joke", function(req, res) {
		res.send("some joke that is made");	
});

app.get("/rnumber", function(req, res) {
	var num = Math.floor(Math.random() * 10) + 1;
	res.send("Some random number is " + num);	
});


app.listen(3000, function(){
	console.log('Server running on port 3000');
});
