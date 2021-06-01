<template>
  <div class="background">
    <div class="deco1"></div>
    <div class="deco2"></div>
  </div>


  <div
      class="app"
      style="margin: 90px 0px 0px 150px; justify-content: center"
  >
    <div class="card h-100" style="float: left; width: 24%; background: #5AB9EA">
      <div class="card-body">
        <div class="card-title">
          <h3>Group Chats</h3>
          <hr />
        </div>

        <div
            class="chats-name"
            style="float: none; margin: 0px 0px 0px 0px"
        >
          <div class="chats" style="width: 1000%; background: #5AB9EA">
            <div class="form-inline" style="margin: 0px 0px 10px 0px;">
              <input type="text" v-model="chatName" />
              <button
                  type="submit"
                  v-on:click="addChatName()"
                  class="btn btn-primary"
              >
                Create Chat
              </button>
            </div>
          </div>
          <div class="chat t-10" style="overflow-y: scroll; width: 660%">
            <div
                class="chats"
                style="width: 660%"
                v-for="(name, index) in chatNames"
                v-bind:key="index"
                v-on:click="selectChat(name.chatName)"
            >
              <p class="chatName" STYLE="margin-left: 15px; font-weight: bolder; height: 30px">{{ name.chatName }}</p>
              <hr />
            </div>
          </div>
        </div>
      </div>
    </div>

    <div class="chat-part">
      <div class="card h-100" style="margin: 0px 15px 0px 40px; background: #5AB9EA">
        <div class="card-body h-25">
          <div class="card-title">
            <h3>{{ selectedChat }}</h3>
            <hr />
          </div>
          <div class="card-msg" style="overflow-y: scroll">
            <div
                class="messages"
                v-for="(msg, index) in messages"
                :key="index"
                v-on:click="selectChat(name)"
            >
              <p>
                {{ msg.date }}
                <span class="font-weight-bold">{{ msg.user }}: </span>
                {{ msg.message }}
              </p>
            </div>
          </div>
        </div>
        <div class="card-footer ">
          <form @submit.prevent="sendMessage">
            <div class="gorm-group">
              <label style="font-weight: bolder">User name: {{ username }}</label>
            </div>
            <div class="form-inline">
              <label style="font-weight: bolder" for="users">Chat users: </label>
              <div
                  class="form-inline"
                  style="margin: 16px 5px 0px 5px"
                  v-for="(user, index) in users"
                  v-bind:key="index"
              >
                <p></p>
                <p>{{ user }},</p>
                <p></p>
              </div>
            </div>
            <div class="gorm-group pb-3">
              <label style="font-weight: bolder" for="message">Message:</label>
              <input type="text" v-model="message" class="form-control" />
            </div>
            <button type="submit" class="btn btn-primary">Send</button>
            <div class="gorm-group pb-3">
              <label style="font-weight: bolder" for="addUser">Insert user name:</label>
              <input type="text" v-model="userName" class="form-control" />
            </div>
            <button
                type="button"
                v-on:click="addUser()"
                class="btn btn-primary"
            >
              Add user
            </button>
          </form>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import io from '../../node_modules/socket.io-client';
import axios from "axios";

export default{
    name: 'GroupChat',
    props: ['usernameProp'],
    data() {
        return {
            selectedChat: '',
            userName: '',
            chatName: '',
            chatNames: [],
            date: '',
            user: '',
            username: '',
            users: [],
            message: '',
            messages: [],
            socket : io('localhost:3000')
        }
    },
    created: function(){
      this.username = this.usernameProp;

      axios
          .get("http://localhost:3000/user", {
            params: {
              username: this.username
            }
          })
          .then(response => (this.user = response.data))

        //initialize chats
        axios
             .get("http://localhost:3000/chats", {
                 params: {
                     name: this.username
                     }
                 })
             .then(response => (this.chatNames = response.data));

        this.socket.emit('JOIN', {
            chat: this.selectedChat,
            date: this.getDate(),
            user: this.username,
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
                     userName: this.username,
                     date: this.getDate(),
                     message: "entered the chat"
                     }
                 })
             .then(response => (console.log(response.data)));

          this.chatNames.push({ chatName: this.chatName });

            this.SendNotification(this.username, "You have joined the chat ' "+ this.chatName +"'.");

            this.chatName = "";
        },

        addUser() {
          this.users.push(this.userName);

          console.log(this.selectedChat);

          axios
              .post("http://localhost:3000/chatMembers", {
                chatName: this.selectedChat,
                addedUser: this.userName,
              })
              .then((response) => console.log(response.data));

          axios
              .post("http://localhost:3000/messages", {
                params: {
                  chatName: this.selectedChat,
                  addedUser: this.userName,
                  date: this.getDate() + " ",
                  message: " entered the chat",
                },
              })
              .then((response) => console.log(response.data));
          this.SendNotification(this.userName, "You have been added to '" +this.selectedChat+ "' by '" +this.username+ "'.");

          this.userName = "";
        },

        getDate(){
          const today = new Date();
          const date =
              today.getFullYear() +
              "-" +
              (today.getMonth() + 1) +
              "-" +
              today.getDate();
          const time =
              today.getHours() + ":" + today.getMinutes() + ":" + today.getSeconds();
          const dateTime = date + " " + time;
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
                  userName: this.username,
                },
              })
              .then((response) => (this.users = response.data));

          //initialize messages
          axios
              .get("http://localhost:3000/message", {
                params: {
                  chatName: this.selectedChat,
                  userName: this.username,
                },
              })
              .then((response) => (this.messages = response.data));
        },

        sendMessage(e) {
          e.preventDefault();

          this.socket.emit("SEND_MESSAGE", {
            chat: this.selectedChat,
            date: this.getDate(),
            user: this.username,
            message: this.message,
          });

          //insert message in database
          axios
              .post("http://localhost:3000/messages", {
                params: {
                  chatName: this.selectedChat,
                  userName: this.username,
                  date: this.getDate() + " ",
                  message: this.message,
                },
              })
              .then((response) => console.log(response.data));

          this.message = "";
        },

      SendNotification(username, notification) {
        let today = new Date();
        let hours;
        let minutes;
        let month;
        let day;
        let monthTemp = today.getMonth() + 1;

        if(monthTemp < 10) {
          month = "0" + monthTemp;
        }
        else {
          month = monthTemp;
        }

        if(today.getDate() < 10) {
          day = "0" +today.getDate();
        }
        else {
          day = today.getDate();
        }

        let date = today.getFullYear() + "-" + month + "-" + day;

        if(today.getHours() < 10) {
          hours = "0" + today.getHours();
        }
        else {
          hours = today.getHours();
        }

        if(today.getMinutes() < 10) {
          minutes = "0" + today.getMinutes();
        }
        else {
          minutes = today.getMinutes();
        }

        date = date+ " | " +hours+ ":" +minutes;

        axios
            .post("http://localhost:3000/notification", {
              params: {
                accountUsername: username,
                date: date,
                notification: notification
              }
            });
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
.background {
  position: fixed;
  top: 0;
  left: 0;
  width: 100vw;
  height: 100vh;
  background: #C1C8E4;
}

.deco1 {
  position: relative;
  width: 100vw;
  height: 25vh;
  background-color: #5AB9EA;
  background-image: linear-gradient(
      #C1C8E4,  #5AB9EA
  );
  opacity: 25%;
}

.deco2 {
  position: relative;
  width: 100vw;
  height: 100vh;
  background-color: #5AB9EA;
  background-image: linear-gradient(
      to top,
      #C1C8E4,  #5AB9EA
  );
  opacity: 25%;
}

.app {
  margin: auto;
}
.chats-name {
  width: 15%;
  height: 576px;
  float: left;
}
.chats-body {
  margin-left: 15%;
  height: 500px;
}
.chat-part {
  height: 685px;
}
.card-msg {
  height: 230px;
  background: #84CEEB;
}
.chat {
  height: 520px;
  margin-top: 10px;
  background: #84CEEB;
}

.btn-primary:hover {
  background: #8860D0;
}

.chatName:hover {
  background: #8860D0;
}

/* Scrollbar costum */
::-webkit-scrollbar {
  width: 5px;
}
::-webkit-scrollbar-track {
  background: #5AB9EA;
}

::-webkit-scrollbar-thumb {
  background: #5680E9;
}
::-webkit-scrollbar-thumb:hover {
  background: #8860D0;
}
</style>