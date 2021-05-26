<template>
<div class="app" style="margin:0px 15px 0px 80px;">
    <div class="card" style="float: left; width: 24%; height: 500px">
        <div class="card-body" >
        <div class="card-title" >
            <h3>Group Chats</h3>
            <hr>
        </div>

        <div class="chats-name" style="float: none; margin:0px 0px 0px 0px;">
            <form class="chats " style="width:1000%; " @submit.prevent="addChatName">
                <div class="form-inline" style="margin:0px 0px 10px 0px;">
                <input type="text" v-model="chatName">
                <button type="submit" class="btn btn-primary">Create Chat</button>
                
                </div>
            </form>
            <div class="chats" style="width:660%;" v-for="(name, index) in chatNames" :key="index" v-on:click="selectChat(name.chatName)">
                <p>{{ name.chatName }}</p>
                <hr>
            </div>
        </div>
        </div>
    </div>
    
    <div class="card mt-3" style="margin:0px 15px 0px 40px;">
            <div class="card-body">
          <div class="card-title">
              <h3>{{ selectedChat }}</h3>
              <hr>
          </div>
          <div class="card-body">
              <div class="messages" v-for="(msg, index) in messages" :key="index" v-on:click="selectChat(name)">
                  <p>{{ msg.date }} <span class="font-weight-bold">{{ msg.user }}: </span> {{ msg.message }}</p>
              </div>
          </div>
      </div>
      <div class="card-footer">
          <form @submit.prevent="sendMessage">
              <div class="gorm-group">
                  <label for="user">User name: {{user}}</label>
              </div>
              <div class="form-inline">
                  <label for="users">Chat users: </label>
                  <div class="form-inline" style="margin:16px 5px 0px 5px;" v-for="(user, index) in users" :key="index">
                      <p>  </p>
                      <p> {{ user }}, </p>
                      <p>  </p>
                  </div>
              </div>
              <div class="gorm-group pb-3">
                  <label for="message">Message:</label>
                  <input type="text" v-model="message" class="form-control">
              </div>
              <button type="submit" class="btn btn-primary">Send</button>
               <div class="gorm-group pb-3">
                  <label for="addUser">Insert user name:</label>
                  <input type="text" v-model="userName" class="form-control">
              </div>
              <button type="button" v-on:click="addUser()" class="btn btn-primary">Add user</button>
          </form>
      </div>
    </div>
</div>
</template>

<script>
import io from '../../node_modules/socket.io-client';
import axios from "axios";

export default{
    name: 'GroupChat',
    data() {
        return {
            selectedChat: '',
            userName: '',
            chatName: '',
            chatNames: [],
            date: '',
            user: '',
            users: [],
            message: '',
            messages: [],
            socket : io('localhost:3000')
        }
    },
    created: function(){
        this.user = prompt("Please enter a name");

        if (!this.user){
            this.user = "Anonymous";
        }

        console.log(this.user);

        //initialize chats
        axios
             .get("http://localhost:3000/chats", {
                 params: {
                     name: this.user
                     }
                 })
             .then(response => (this.chatNames = response.data));

        this.socket.emit('JOIN', {
            chat: this.selectedChat,
            date: this.getDate(),
            user: this.user,
            message: " is online"
        });

        this.socket.on('JOIN_MSG', (msg) => {
            if (msg.chat == this.selectedChat){
                this.messages = [...this.messages, msg];
            }
        });

    },
    methods: {
        //Add a new chat
        addChatName(){

            axios
             .post("http://localhost:3000/chats", {
                 params: {
                     chatName: this.chatName
                     }
                 })
             .then(response => (console.log(response.data)));

            axios
             .post("http://localhost:3000/messages", {
                 params: {
                     chatName: this.chatName,
                     userName: this.user,
                     date: this.getDate(),
                     message: "entered the chat"
                     }
                 })
             .then(response => (console.log(response.data)));

            this.chatNames.push(this.chatName);

            this.chatName = "";
        },

        addUser() {
            this.users.push(this.userName);

            console.log(this.selectedChat);

             axios
             .post("http://localhost:3000/chatMembers",{
                     chatName: this.selectedChat,
                     addedUser: this.userName,
                     })
             .then(response => (console.log(response.data)))

             axios
             .post("http://localhost:3000/messages", {
                 params: {
                     chatName: this.selectedChat,
                     addedUser: this.userName,
                     date: this.getDate() + " ",
                     message: " entered the chat"
                     }
                 })
             .then(response => (console.log(response.data)));
            this.userName = '';
        },

        getDate(){
            const today = new Date();
                const date = today.getFullYear()+'-'+(today.getMonth()+1)+'-'+today.getDate();
                const time = today.getHours() + ":" + today.getMinutes() + ":" + today.getSeconds();
                const dateTime = date +' '+ time;
                return dateTime;
        },
        selectChat(name) {
            this.selectedChat = name;

            console.log(this.selectedChat);

        //initialize chat members
        axios
             .get("http://localhost:3000/chatMembers", {
                 params: {
                     chatName: this.selectedChat,
                     userName: this.user
                     }
                 })
             .then(response => (this.users = response.data));

        //initialize messages
        axios
             .get("http://localhost:3000/message", {
                 params: {
                     chatName: this.selectedChat,
                     userName: this.user
                     }
                 })
             .then(response => (this.messages = response.data));
        },

        sendMessage(e) {
            e.preventDefault();

            this.socket.emit('SEND_MESSAGE', {
                chat: this.selectedChat,
                date: this.getDate(),
                user: this.user,
                message: this.message
            });

            //insert message in database
            axios
                .post("http://localhost:3000/messages", {
                 params: {
                     chatName: this.selectedChat,
                     userName: this.user,
                     date: this.getDate() + " ",
                     message: this.message
                     }
                 })
             .then(response => (console.log(response.data)));

            this.message = ''
        }
    },
    mounted() {
        this.socket.on('MESSAGE', (data) => {
            if (data.chat == this.selectedChat){
                this.messages = [...this.messages, data];
            }
        });
        
    }
}
</script>

<style scoped>
.chats-name {
  width: 15%;
  height: 200px;
  float: left;
}
.chats-body {
  margin-left: 15%;
  height: 200px;
}
</style>