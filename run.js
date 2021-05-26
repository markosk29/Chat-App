let api = require('./api.js').app;
let notifications = require('./src/json/notifications.json');

api.get('/', function (request, response) {
    response.json("node.js backend");
    connection.query("SELECT * FROM accounts", function (error, rows, fields) {

    });
});

/*
    get the existent chats for a user
*/
api.get('/chats', (request, response) => {
    let name = request.query.name;

    /*
        get the current user id
    */
    connection.query("SELECT account_id FROM accounts WHERE account_username = ? ", name, (error, result) => {
        if (error) {
            console.log("get chat select acc id");
        } else {

            let accId =  result[0].account_id;

            /*
                get chat id's from the current user
            */
            connection.query("SELECT group_id FROM accountsgroupsrelation WHERE account_id = ?", accId, (error, res) => {
                let chatIds = [];
                if (error) {
                    console.log("get chat select group id");
                } else {
                    res.forEach(element => {
                        chatIds.push(element.group_id);
                    });
                }

                let chatNames = [];

                /*
                    get the groups from the current username id
                */
                chatIds.forEach((id, index) => {
                    connection.query("SELECT group_name FROM chatgroups WHERE group_id = ?", id, (error, res) => {

                        if (error) {
                            console.log("get chat select group name");
                        } else {
                            chatNames.push({ "chatName": res[0].group_name });

                            console.log("index + chat id");
                            console.log(index);
                            console.log(chatIds.length);
                            console.log(index == chatIds.length);

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

/*
    insert new messages
*/
api.post('/messages', (request, response) => {
    
    /*
        get the current user id
    */
    connection.query("SELECT account_id FROM accounts WHERE account_username = ? ", request.body.params.userName, (error, result) => {
        if (error) {
            console.log("post chat message select acc id");
        } else {
            let userId = result[0].account_id;

            console.log(request.body.params.chatName);

            let groupName = request.body.params.chatName;

            /*
                relation between the user who created the chat and the chat table
            */
            connection.query("SELECT group_id FROM chatgroups WHERE group_name = ? ", groupName, (error, groupIdRes) => {

                if (error) {
                    console.log("post chat message select group id");
                } else {
                    
                    console.log("post message");
                    console.log(groupIdRes);
    
                    console.log(groupIdRes[0].group_id);
                    let groupId = groupIdRes[0].group_id;
                    console.log("User id");
                    console.log(userId);

                    /*
                        insert a new account-group relation
                    */
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

                    /*
                        add the message to database
                    */
                    connection.query("INSERT INTO messages (message_time, message_sender_id, message_content, message_datime) VALUES (?, ?, ?, ?)", [messageDate, userId, messageContent, messageDate], (error, insertResult) => {
                        if (error) {
                            console.log("inserare mesaj nereusit");
                        } else {
                            console.log("inserare reusita mesaj");
                        }
                    });

                    /*
                        get the inserted message id
                    */
                    connection.query("SELECT message_id FROM messages WHERE message_sender_id = ? AND message_content = ?  AND message_datime = ?", [userId, messageContent, messageDate], (error, msgIdRes) => {
                        if (error) {
                            console.log("select 2 fail");
                        } else {
                            console.log(msgIdRes[0].message_id);
                            let messageIndex = msgIdRes[0].message_id;

                            /*
                                create the relation between the chat table and message table
                            */
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

/*
    insert new chats
*/
api.post('/chats', (request, response) => {
    console.log("chat name");
    console.log(request.body);
    console.log(request.body.params.chatName);

        let groupName = request.body.params.chatName;

        /*
            insert chat name in database
        */
        connection.query("INSERT INTO chatgroups (group_name) VALUES (?)", groupName, (error, insertResult) => {
            if (error) {
                console.log("inserare nereusita");
            } else {
                console.log("inserare reusita");
            }
        });
        
});

/*
    get messages
*/
api.get('/message', (request, response) => {
    console.log(request.query);

    let chatName = request.query.chatName;

    /*
        get the id for a group name
    */
    connection.query("SELECT group_id FROM chatgroups WHERE group_name = ? ", chatName, (error, result) => {
        if (error) {
            console.log("get chat message select group id");
        } else {
            console.log(result);
            let id = result[0].group_id;

            /*
                get the message id from group-message relation
            */
            connection.query("SELECT message_id FROM groupsmessagesrelation WHERE group_id = ?", id, (error, res) => {

                if (error) {
                    console.log("get chat message select msg id");
                } else {
                    console.log(res);
                    let messages = [];

                    res.forEach((msg, index) => {
                        console.log(msg.message_id);
                        let user = '';
                        let msgId = msg.message_id;

                        /*
                            select all fields from messages
                        */
                        connection.query("SELECT * FROM messages WHERE message_id = ? ", msgId, (error, msgRes) => {
                            if (error) {
                                console.log("get chat message select *");
                            } else {
                                console.log(msgRes);
                                
                                let userId = msgRes[0].message_sender_id;

                                /*
                                    select account username from accounts
                                */
                                connection.query("SELECT account_username FROM accounts WHERE account_id = ? ", userId, (error, accRes) => {
                                    if (error) {
                                        console.log("get chat message select acc username");
                                    } else {
                                        console.log(accRes);
                                        
                                        user = accRes[0].account_username;

                                        messages.push({
                                            user: user,
                                            date: msgRes[0].message_datime,
                                            message: msgRes[0].message_content
                                        });

                                        console.log(messages);

                                        console.log(index == res.length);

                                        if (index == res.length - 1){
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

/*
    get chat members for a chat
*/
api.get('/chatMembers', (request, response) => {
    let chatName = request.query.chatName;

    /*
        get the current user id
    */
    connection.query("SELECT group_id FROM chatgroups WHERE group_name = ? ", chatName, (error, result) => {
        if (error) {
            console.log("get chat members select group id");
        } else {
            /*
                get chat users id's from the current user
            */
            connection.query("SELECT account_id FROM accountsgroupsrelation WHERE group_id = ? ", result[0].group_id, (error, res) => {
                let chatUsers = [];
                if (error) {

                    console.log("get chat members select acc id");
                } else {
                    /*
                        browse through all members
                    */
                    res.forEach((element, index) => {
                        /*
                            select usernames for all members
                        */
                        connection.query("SELECT account_username FROM accounts WHERE account_id = ?", element.account_id, (error, res) => {
                            if (error) {
                                console.log("get chat members select acc user");
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

/*
    add chat members
*/
api.post('/chatMembers', (request, response) =>{
    console.log(request.body);
    console.log(request.body.chatName);

    let chatName = request.body.chatName;
    console.log(chatName);

    let memberName = request.body.addedUser;
    console.log(memberName);
    /*
        get the current group id
    */
    connection.query("SELECT group_id FROM chatgroups WHERE group_name = ? ",chatName, (error, response) => {
        if (error){
            console.log("post chat members select group id");
        }else {
            console.log(response);

            let chatId = response[0].group_id;

            /*
                get the id from the added username
            */
            connection.query("SELECT account_id FROM accounts WHERE account_username = ?", memberName, (error, res) => {
                if (error){
                    console.log("post chat members select acc id");
                }else {
                    let memberId = res[0].account_id;
                    console.log(res);

                    /*
                        insert a new account-group relation
                    */
                    connection.query("INSERT INTO accountsgroupsrelation (account_id, group_id) VALUES (?, ?)", [memberId, chatId], (error, insertResult) => {
                        if (error){
                            console.log("post chat members insert acc gr rel");
                        }else{
                            console.log("Member added successfully");
                        }
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

    });
});
