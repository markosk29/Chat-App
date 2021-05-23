<template>
<div class="app" style="margin:0px 15px 0px 80px;">
    
    <div class="card mt-3" style="margin:0px 15px 0px 40px;">
            <div class="card-body">
          <div class="card-title">
              <h3>{{ selectedChat }}</h3>
              <hr>
          </div>
          <div class="card-body">
              <div class="messages" v-for="(msg, index) in messages" :key="index">
                  <p>{{ msg.date }}<span class="font-weight-bold">{{ msg.user }} </span>{{ msg.message }}</p>
              </div>
          </div>
      </div>
      <div class="card-footer">
          <form @submit.prevent="sendMessage">
              <div class="gorm-group">
                  <label for="user">User: {{user}}</label>
              </div>
              <div class="gorm-group pb-3">
                  <label for="message">Message:</label>
                  <input type="text" v-model="message" class="form-control">
              </div>
              <button type="submit" class="btn btn-primary">Send</button>
          </form>
      </div>
    </div>
</div>
</template>

<script>
import io from '../../node_modules/socket.io-client'

export default{
    name: 'GroupChat',
    data() {
        return {
            selectedChat: '',
            chatName: '',
            chatNames: [],
            date: '',
            user: '',
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

        this.socket.emit('JOIN', {
            date: this.getDate() + " ",
            user: this.user,
            message: " entered the chat"
        });

        this.socket.on('JOIN_MSG', (msg) => {
            this.messages = [...this.messages, msg];
        });
    },
    methods: {
        addChatName(){
            this.chatNames.push(this.chatName);
            this.chatName = "";
        },

        getDate(){
            const today = new Date();
                const date = today.getFullYear()+'-'+(today.getMonth()+1)+'-'+today.getDate();
                const time = today.getHours() + ":" + today.getMinutes() + ":" + today.getSeconds();
                const dateTime = date +' '+ time;
                return dateTime;
        },

        sendMessage(e) {
            e.preventDefault();

            this.socket.emit('SEND_MESSAGE', {
                date: this.getDate() + " ",
                user: this.user + ":",
                message: this.message
            });
            this.message = ''
        }
    },
    mounted() {
        this.socket.on('MESSAGE', (data) => {
            this.messages = [...this.messages, data];
            // you can also do this.messages.push(data)
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