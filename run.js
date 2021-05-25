let api = require('./api.js').app;
let notifications = require('./src/json/notifications.json');

api.get('/', function(request, response) {
    response.json("node.js backend");
    connection.query("SELECT * FROM accounts",function(error,rows,fields){

    });
});

api.get('/notifications', function(request, response) {
    response.json(notifications);
});

//use mysql
var mysql = require("mysql");

//create connection
var connection = mysql.createConnection({
    host: "localhost",
    user: "root",
    //sa modific inainte sa dau push
    password: "password",
    database: "test",
    port: "3306"
});

connection.query("INSERT INTO chatgroups(group_id, group_name) VALUES (5, 'Chat5')", (error, rows) => {
    if (error){
        console.log("inserare nereusita");
    }else{
        console.log("inserare reusita");
        console.log(rows);
    }
})

connection.connect((error) => {
    if (error){
        console.log("nu merge mysql");
    }else{
        console.log("connected");
    }
    
});

//se porneste si server-ul si sockets
const server = api.listen(3000, function() {
    console.log('CORS-enabled web server is listening on port 3000...');
});

const io = require('socket.io')(server, {
    cors: {
      origin: '*',
    }
  });

io.on('connection', function(socket) {
    console.log(socket.id);

    socket.on('SEND_MESSAGE', function(data) {
        console.log(data);
        io.emit('MESSAGE', data)
    });

    socket.on('JOIN', function(data) {
        console.log(data);
        io.emit('JOIN_MSG', data);

        //save message in database
        /*connection.query("INSERT INTO messages (message_content) VALUES (''' + data +  ''')", (error, result) => {
            if (error){
                console.log("inserare nereusita");
            }else{
                console.log("inserare reusita");
            }
        });*/
    });
});

connection.query("SELECT * FROM accounts", (error, result, fields) => {
    if (error){
        console.log("select fail");
    }else{
        console.log("select reusit");
        console.log(result);
    }
});

