let api = require('./api.js').app;
let notifications = require('./src/json/notifications.json');

api.get('/', function(request, response) {
    response.json("node.js backend");
});

api.get('/notifications', function(request, response) {
    response.json(notifications);
});

api.listen(3000, function() {
    console.log('CORS-enabled web server is listening on port 3000...');
});

