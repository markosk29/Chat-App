let api = require('./api.js').app;

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
    connection.query("SELECT account_id FROM accounts WHERE account_username = ? ", [name], (error, result) => {
        if (error) {
            console.log("get chat select acc id");
        } else {

            let accId =  result[0].account_id;

            /*
                get chat id's from the current user
            */
            connection.query("SELECT group_id FROM accountsgroupsrelation WHERE account_id = ?", [accId], (error, res) => {
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
                    connection.query("SELECT group_name FROM chatgroups WHERE group_id = ?", [id], (error, groupRes) => {

                        if (error) {
                            console.log("get chat select group name");
                        } else {
                            chatNames.push({ "chatName": groupRes[0].group_name });

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

            let groupName = request.body.params.chatName;

            /*
                relation between the user who created the chat and the chat table
            */
            connection.query("SELECT group_id FROM chatgroups WHERE group_name = ? ", groupName, (error, groupIdRes) => {

                if (error) {
                    console.log("post chat message select group id");
                } else {
                    
                    let groupId = groupIdRes[0].group_id;

                    /*
                        insert a new account-group relation
                    */
                    connection.query("INSERT INTO accountsgroupsrelation (account_id, group_id) VALUES (?, ?)", [userId, groupId], (error) => {
                        if (error) {
                            console.log(error.message);
                            console.log("inserare relatie chat-group nereusita");
                        } else {
                            console.log("inserare reusita");
                        }
                    });

                    let messageContent = request.body.params.message;
                    let messageDate = request.body.params.date;

                    /*
                        add the message to database
                    */
                    connection.query("INSERT INTO messages (message_sender_id, message_content, message_date) VALUES (?, ?, ?)", [userId, messageContent, messageDate], (error) => {
                        if (error) {
                            console.log(error.message);
                            console.log("inserare mesaj nereusit");
                        } else {
                            console.log("inserare reusita mesaj");
                        }
                    });

                    /*
                        get the inserted message id
                    */
                    connection.query("SELECT message_id FROM messages WHERE message_sender_id = ? AND message_content = ?  AND message_date = ?", [userId, messageContent, messageDate], (error, msgIdRes) => {
                        if (error) {
                            console.log("select 2 fail");
                        } else {
                            let messageIndex = msgIdRes[0].message_id;

                            /*
                                create the relation between the chat table and message table
                            */
                            connection.query("INSERT INTO groupsmessagesrelation (group_id, message_id) VALUES (?, ?)", [groupId, messageIndex], (error, insertResult) => {
                                if (error) {
                                    console.log("inserare nereusita");
                                } else {
                                    response.json("inserare reusita");
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

        let groupName = request.body.params.chatName;

        /*
            insert chat name in database
        */
        connection.query("INSERT INTO chatgroups (group_name) VALUES (?)", groupName, (error, insertResult) => {
            if (error) {
                console.log("inserare nereusita");
            } else {
                response.json("inserare reusita");
                console.log("inserare reusita");
            }
        });
        
});

/*
    get messages
*/
api.get('/message', (request, response) => {

    let chatName = request.query.chatName;

    /*
        get the id for a group name
    */
    connection.query("SELECT group_id FROM chatgroups WHERE group_name = ? ", chatName, (error, result) => {
        if (error) {
            console.log("get chat message select group id");
        } else {

            let id = result[0].group_id;

            /*
                get the message id from group-message relation
            */
            connection.query("SELECT message_id FROM groupsmessagesrelation WHERE group_id = ?", id, (error, res) => {

                if (error) {
                    console.log("get chat message select msg id");
                } else {

                    let messages = [];

                    res.forEach((msg, index) => {

                        let user = '';
                        let msgId = msg.message_id;

                        /*
                            select all fields from messages
                        */
                        connection.query("SELECT * FROM messages WHERE message_id = ? ", msgId, (error, msgRes) => {
                            if (error) {
                                console.log("get chat message select *");
                            } else {
                                
                                let userId = msgRes[0].message_sender_id;

                                /*
                                    select account username from accounts
                                */
                                connection.query("SELECT account_username FROM accounts WHERE account_id = ? ", userId, (error, accRes) => {
                                    if (error) {
                                        console.log("get chat message select acc username");
                                    } else {
                                        
                                        user = accRes[0].account_username;

                                        messages.push({
                                            user: user,
                                            date: msgRes[0].message_date,
                                            message: msgRes[0].message_content
                                        });

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
                       console.log(element.account_id);
                        connection.query("SELECT account_username FROM accounts WHERE account_id = ?", element.account_id, (error, chatRes) => {
                            if (error) {
                                console.log("get chat members select acc user");
                            } else {
                                chatUsers.push(chatRes[0].account_username);

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

    let chatName = request.body.chatName;

    let memberName = request.body.addedUser;

    /*
        get the current group id
    */
    connection.query("SELECT group_id FROM chatgroups WHERE group_name = ? ",chatName, (error, grpRes) => {
        if (error){
            console.log("post chat members select group id");
        }else {

            let chatId = grpRes[0].group_id;

            /*
                get the id from the added username
            */
            connection.query("SELECT account_id FROM accounts WHERE account_username = ?", memberName, (error, res) => {
                if (error){
                    console.log("post chat members select acc id");
                }else {
                    let memberId = res[0].account_id;

                    /*
                        insert a new account-group relation
                    */
                    connection.query("INSERT INTO accountsgroupsrelation (account_id, group_id) VALUES (?, ?)", [memberId, chatId], (error) => {
                        if (error){
                            console.log("post chat members insert acc gr rel");
                        }else{
                            response.json("Member added successfully");
                        }
                    });
                }
            });
        }
    });

});

api.get('/notifications', (request, response) => {
    let id = request.query.accountId;
    let notifications = [];

    connection.query("SELECT * FROM notifications WHERE notification_destination = ?", [id], (error, res) => {
        if(error) {
            console.log(error.message);
        }
        else {
            res.forEach((element, index) => {
                notifications.push(res[index]);
                console.log(res[index].notification_id);
            })

            response.json(notifications);
        }
    })
});

api.post('/notification', (request, response) => {
   let account_username = request.body.params.accountUsername;
   let date = request.body.params.date;
   let notification_message = request.body.params.notification;
   let read = false;

   connection.query("SELECT * FROM accounts WHERE account_username = ?", [account_username], (error, res) => {
       if(error) {
           console.log(error.message);
       } else {
           connection.query("INSERT INTO notifications(notification_date, notification_message, notification_read, notification_destination) VALUES (?, ?, ?, ?)",
               [date, notification_message, read, res[0].account_id], (error) => {
                   if(error) {
                       console.log(error.message);
                   } else {
                       response.json("notificare adaugata!");
                   }
           })
       }
   })
});

api.post('/updateNotification', (request, response) => {
    let notification_id = request.body.params.notificationId;

    connection.query("UPDATE notifications SET notification_read = true WHERE notification_id = ?",
        [notification_id], (error) => {
            if(error) {
                console.log(error.message);
            } else {
                response.json("notificare actualizata!");
            }
    })
});

api.post('/register',(request, response) =>{

    let account_username= request.body.params.username;
    let account_password= request.body.params.password;
    let account_email= request.body.params.email;
    let account_date= request.body.params.date;

    console.log("Added account to DB:")
    console.log(account_username + ", " +account_password+ ", " +account_email + ", " +account_date);

    connection.query("INSERT INTO accounts (account_username, account_password, account_email, account_date) VALUES (?,?,?,?)",
        [account_username, account_password, account_email, account_date], (error, result) => {
            if (error) {
                console.log("inserare cont nereusita");
            }
            else {
                console.log("inserare cont reusita");
            }
        });
});

api.get('/user', (request, response) => {
    let username = request.query.username;

    connection.query("SELECT * FROM accounts WHERE account_username = ?", [username], (error, res) => {
        if(error) {
            console.log(error.message);
        }
        else {
            response.json(res[0]);
        }
    })
});

api.get('/userEmail', (request, response) => {
    let email = request.query.email;

    connection.query("SELECT account_email FROM accounts WHERE account_email = ?", [email], (error, res) => {
        if(error) {
            console.log(error.message);
        }
        else {
            response.json(res[0]);
        }
    })
});

api.post('/updateUsername', (request, response) => {
    let newUsername = request.body.params.newUsername;
    let oldUsername = request.body.params.oldUsername;

    connection.query("UPDATE accounts SET account_username = ? WHERE account_username = ?", [newUsername, oldUsername], (error) => {
        if (error) {
            console.log(error.message)
        } else {
            response.json("Username updated successfully!");
            console.log("Username updated successfully!");
        }
    })
});

api.post('/updatePassword', (request, response) => {
    let newPassword = request.body.params.newPassword;
    let username = request.body.params.username;

    connection.query("UPDATE accounts SET account_password = ? WHERE account_username = ?", [newPassword, username], (error) => {
        if(error) {
            console.log(error.message)
        }
        else {
            response.json("Password updated successfully!");
        }
    })
});

//use mysql
var mysql = require("mysql");

//create connection
var connection = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "@root123",
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
