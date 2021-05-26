let api = require('./api.js').app;
let notifications = require('./src/json/notifications.json');

api.get('/', function (request, response) {
    response.json("node.js backend");
    connection.query("SELECT * FROM accounts", function (error, rows, fields) {

    });
});

/*api.get('/chats', (request, response) => {
    const name = request.name;
    connection.query("SELECT account_id FROM accounts WHERE account_username = name", (error, result) => {
        if (error){
            console.log("select fail");
        }else{
            console.log("select reusit");
            console.log(result);
        }
    });

    //get the id from the current username
    connection.query("SELECT * FROM accounts", (error, result, fields) => {
        if (error){
            console.log("select fail");
        }else{
            console.log("select reusit");
            console.log(result);
            console.log(result[0].account_username);
        }
    });
    response.json("get");

});
*/
api.get('/chats', (request, response) => {
    let name = request.query.name;

    //get the current user id
    connection.query("SELECT account_id FROM accounts WHERE account_username = ? ", name, (error, result) => {
        if (error) {
            console.log("1 select name fail");
        } else {

            let accId =  result[0].account_id;

            //get chat id's from the current user
            connection.query("SELECT group_id FROM accountsgroupsrelation WHERE account_id = ?", accId, (error, res) => {
                let chatIds = [];
                if (error) {
                    console.log("select 2 fail");
                } else {
                    res.forEach(element => {
                        chatIds.push(element.group_id);
                    });
                }

                let chatNames = [];

                //get the groups from the current username id
                chatIds.forEach((id, index) => {
                    connection.query("SELECT group_name FROM chatgroups WHERE group_id = " + id, (error, res) => {

                        if (error) {
                            console.log("select 2 fail");
                        } else {
                            chatNames.push({ "chatName": res[0].group_name });

                            if (index == chatIds.length - 1) {
                                response.json(chatNames);
                            }
                        }

                    });

                });

            });
        }
    });

});

//insert new messages
api.post('/messages', (request, response) => {
    //get the current user id
    connection.query("SELECT account_id FROM accounts WHERE account_username = ? ", request.body.params.userName, (error, result) => {
        if (error) {
            console.log("1 select name fail");
        } else {
            let userId = result[0].account_id;

            console.log(request.body.params.chatName);

            let groupName = request.body.params.chatName;

            //relation between the user who created the chat and the chat table
            connection.query("SELECT group_id FROM chatgroups WHERE group_name = ? ", groupName, (error, groupIdRes) => {

                if (error) {
                    console.log("select 2 fail");
                } else {
                    console.log(groupIdRes[0].group_id);
                    let groupId = groupIdRes[0].group_id;
                    console.log("User id");
                    console.log(userId);

                    connection.query("INSERT INTO accountsgroupsrelation (account_id, group_id) VALUES (?, ?)", [userId, groupId], (error, insertResult) => {
                        if (error) {
                            console.log("inserare relatie chat-group nereusita");
                        } else {
                            console.log("inserare reusita");
                        }
                    });

                    let messageContent = request.body.params.message;
                    let messageDate = request.body.params.date;
                    console.log(messageDate);
                    console.log(messageContent);
                    //add the message to database
                    connection.query("INSERT INTO messages (message_time, message_sender_id, message_content, message_datime) VALUES (?, ?, ?, ?)", [messageDate, userId, messageContent, messageDate], (error, insertResult) => {
                        if (error) {
                            console.log("inserare mesaj nereusit");
                        } else {
                            console.log("inserare reusita mesaj");
                        }
                    });

                    //get the inserted message id
                    connection.query("SELECT message_id FROM messages WHERE message_sender_id = ? AND message_content = ?  AND message_datime = ?", [userId, messageContent, messageDate], (error, msgIdRes) => {
                        if (error) {
                            console.log("select 2 fail");
                        } else {
                            console.log(msgIdRes[0].message_id);
                            let messageIndex = msgIdRes[0].message_id;

                            //create the relation between the chat table and message table
                            connection.query("INSERT INTO groupsmessagesrelation (group_id, message_id) VALUES (?, ?)", [groupId, messageIndex], (error, insertResult) => {
                                if (error) {
                                    console.log("inserare nereusita");
                                } else {
                                    console.log("inserare reusita");
                                }
                            });
                        }
                    });

                }
            });
        }
    });
});

//insert new chats
api.post('/chats', (request, response) => {
    console.log(request.body.params.userName);

    //get the current user id
    connection.query("SELECT account_id FROM accounts WHERE account_username = ? ", request.body.params.userName, (error, result) => {
        if (error) {
            console.log("1 select name fail");
        } else {
            let userId = result[0].account_id;

            let groupName = request.body.params.chatName;
            //insert chat name in database
            connection.query("INSERT INTO chatgroups (group_name) VALUES (?)", groupName, (error, insertResult) => {
                if (error) {
                    console.log("inserare nereusita");
                } else {
                    console.log("inserare reusita");
                }
            });
        }
    });
});

//get messages
api.get('/message', (request, response) => {
    console.log(request.query);

    let chatName = request.query.chatName;
    connection.query("SELECT group_id FROM chatgroups WHERE group_name = ? ", chatName, (error, result) => {
        if (error) {
            console.log("1 select chat name fail");
        } else {
            console.log(result);
            let id = result[0].group_id;
            connection.query("SELECT message_id FROM groupsmessagesrelation WHERE group_id = " + id, (error, res) => {

                if (error) {
                    console.log("select 2 fail");
                } else {
                    console.log(res);
                    let messages = [];

                    res.forEach((msg, index) => {
                        console.log(msg.message_id);
                        let user = '';
                        let msgId = msg.message_id;
                        connection.query("SELECT * FROM messages WHERE message_id = ? ", msgId, (error, msgRes) => {
                            if (error) {
                                console.log("select message fail");
                            } else {
                                console.log(msgRes);
                                
                                let userId = msgRes[0].message_sender_id;
                                connection.query("SELECT account_username FROM accounts WHERE account_id = ? ", userId, (error, accRes) => {
                                    if (error) {
                                        console.log("select message fail");
                                    } else {
                                        console.log(accRes);
                                        
                                        user = accRes[0].account_username;

                                        messages.push({
                                            user: user,
                                            date: msgRes[0].message_datime,
                                            message: msgRes[0].message_content
                                        });

                                        console.log(messages);

                                        console.log(index == (res.length - 1));

                                        if (index == (res.length - 1)){
                                            response.json(messages);
                                        }
                                        
                                    }
                                });
                            }
                        });
                    });
                }

            });
        }
    });

});

api.get('/chatMembers', (request, response) => {
    let chatName = request.query.chatName;

    //get the current user id
    connection.query("SELECT group_id FROM chatgroups WHERE group_name = ? ", chatName, (error, result) => {
        if (error) {
            console.log("1 select name fail");
        } else {
            //get chat users id's from the current user
            connection.query("SELECT account_id FROM accountsgroupsrelation WHERE group_id = ? ", result[0].group_id, (error, res) => {
                let chatUsers = [];
                if (error) {

                    console.log("select 2 fail");
                } else {

                    res.forEach((element, index) => {
                        connection.query("SELECT account_username FROM accounts WHERE account_id = " + element.account_id, (error, res) => {
                            if (error) {
                                console.log("select 3 fail");
                            } else {
                                chatUsers.push(res[0].account_username);

                                if (index == res.length - 1) {
                                    response.json(chatUsers);
                                }
                            }

                        });
                    });
                }

            });
        }
    });

});

api.get('/notifications', function (request, response) {
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

/*connection.query("INSERT INTO chatgroups(group_id, group_name) VALUES (5, 'Chat5')", (error, rows) => {
    if (error){
        console.log("inserare nereusita");
    }else{
        console.log("inserare reusita");
        console.log(rows);
    }
})*/

connection.connect((error) => {
    if (error) {
        console.log("nu merge mysql");
    } else {
        console.log("connected");
    }

});

//se porneste si server-ul si sockets
const server = api.listen(3000, function () {
    console.log('CORS-enabled web server is listening on port 3000...');
});

const io = require('socket.io')(server, {
    cors: {
        origin: '*',
    }
});

io.on('connection', function (socket) {
    console.log(socket.id);

    socket.on('SEND_MESSAGE', function (data) {
        console.log(data);
        io.emit('MESSAGE', data)
    });

    socket.on('JOIN', function (data) {
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

/*connection.query("SELECT * FROM accounts", (error, result, fields) => {
    if (error){
        console.log("select fail");
    }else{
        console.log("select reusit");
        console.log(result);
        console.log(result[0].account_username);
    }
});*/

