let api = require('./api.js').app;
let notifications = require('./src/json/notifications.json');

api.get('/', function(request, response) {
    response.json("node.js backend");
});

api.get('/notifications', function(request, response) {
    response.json(notifications);
});

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
        io.emit('MESSAGE', data)
    });

    socket.on('JOIN', function(data) {
        io.emit('JOIN_MSG', data)
    });
});

