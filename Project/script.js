var express = require('express');
var app = express();
var bodyParser = require('body-parser');
var mysql      = require('mysql');

var connection = mysql.createConnection({
  host     : 'localhost',
  user     : 'root',
  password : 'rootpwd',
  database : 'mega_movies'
});



app.use(bodyParser.json()); // support json encoded bodies
app.use(bodyParser.urlencoded({ extended: false })); // support encoded bodies

app.use(express.static('public'));

app.get('/return_movie', function (req, res) {
   res.sendFile( __dirname + "/" + "Movie_Returns.html" );
})

app.post('/get_rental_info', function (req, res) {
   // Prepare output in JSON format

   connection.connect();

   connection.query('CALL getUserInfo(?);',req.body.nic, function(err, rows, fields) {
     if (err) throw err;

     console.log('The Data retrieved: ', rows[0]);
     response = rows[0];
     console.log(response);
     connection.end();
     res.json({User:response});
   });

})

var server = app.listen(8080, function () {

  var host = server.address().address
  var port = server.address().port

  console.log("Example app listening at http://%s:%s", host, port)

})
