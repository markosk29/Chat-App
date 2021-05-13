<template>
  <div id="sidebar" class="bar">
    <div class="gradient1"></div>
    <div class="button1" @click="show(1)">
      <img src="../assets/notification.png" class="notificationIcon">
      <div class="extendedNotification">
        <p class="notificationText">Notifications</p>
      </div>

      <p class="unreadNotifications" v-if="meetsConditions()">{{unreadNotifications}}</p>
      <p class="unreadNotifications" v-if="unreadNotifications > 100">99+</p>
    </div>
    <div class="button2" >
      <img src="../assets/user.png" class="userIcon">
      <div class="extendedUser">
        <p class="profileText">Profile</p>
      </div>
    </div>
    <div class="button3" @click='show(3)'>
      <img src="../assets/chat.png" class="chatIcon">
      <div class="extendedChat">
        <p class="chatText">Chat</p>
      </div>
    </div>
    <div class="button4" >
      <img src="../assets/settings.png" class="settingsIcon">
      <div class="extendedSettings">
        <p class="settingsText">Settings</p>
      </div>
    </div>
  </div>
</template>

<script>
import axios from 'axios'

export default {
  name: 'Sidebar',

  data: function() {
    return {
      notifications: [],
      unreadNotifications: 0,
      component: 'none'
    }
  },
  created: function(){
    axios
      .get("http://localhost:3000/notifications")
      .then(response => (this.notifications = response.data))
  },
  mounted: function() {
    this.countUnreadNotifications();
  },
  methods:{
    outputNotifications() {
      this.notifications.forEach(notification => {console.log(notification.text+ " -- " +notification.read)});
    },
    meetsConditions() {
      return (this.unreadNotifications > 0) && (this.unreadNotifications < 100);
    },
    countUnreadNotifications() {
      setTimeout(() => {
        this.notifications.forEach(
            notification => {
              if(notification.read === 'false')
              {this.unreadNotifications++}
            })

        this.$forceUpdate();
      }, 50)
    },
    show(id){
      if(id === 1) {
        this.$emit('clickedComponent', 'notificationsComponent');
      }
      if(id === 3) {
        this.$emit('clickedComponent', 'chatComponent');
      }
    }
  }
}
</script>

<style scoped>
.bar {
  position: fixed;
  left: 0;
  top: 0;
  height: 100vh;
  width: 50px;
  margin: 0 auto;
  background-color: #5680E9;
}

.gradient1 {
  position: fixed;
  bottom: 0;
  height: 60vh;
  width: 50px;
  background-color: #5680E9;
  background-image: linear-gradient(
      #5680E9, #8860D0
  );
}

.button1 {
  position: relative;
  top: 75px;
  left: 5px;
  height: 75px;
  width: 50px;
  background-color: #8860D0;
  background-image: linear-gradient(
      to right,
      #5680E9, #8860D0
  );
}

.button2 {
  position: relative;
  top: 110px;
  left: 5px;
  height: 75px;
  width: 50px;
  background-color: #8860D0;
  background-image: linear-gradient(
      to right,
      #5680E9, #8860D0
  );
}

.button3 {
  position: relative;
  top: 145px;
  height: 75px;
  left: 5px;
  width: 50px;
  background-color: #8860D0;
  background-image: linear-gradient(
      to right,
      #5680E9, #8860D0
  );
}

.button4 {
  position: relative;
  top: 180px;
  height: 75px;
  left: 5px;
  width: 50px;
  background-color: #8860D0;
  background-image: linear-gradient(
      to right,
      #5680E9, #8860D0
  );
}

.button1:hover, .button2:hover, .button3:hover, .button4:hover {
  background-image: linear-gradient(
      to right,
      #8860D0, #5680E9
  );
}

.notificationIcon, .userIcon, .settingsIcon, .chatIcon {
  position: relative;
  top: 20px;
  left: 5px;
  width: 35px;
  height: 35px;
}

.unreadNotifications {
  position: relative;
  top: -5px;
  left: 18px;
  color: #C1C8E4;
  font-weight: bold;
  font-size: 20px;
}

.extendedNotification {
  display: none;
  position: fixed;
  top: 75px;
  left: 55px;
  width: 150px;
  height: 75px;
  background-color: #5680E9;
  background-image: linear-gradient(
      to right,
      #5680E9, #8860D0
  );
}

.extendedUser {
  display: none;
  position: fixed;
  top: 185px;
  left: 55px;
  width: 150px;
  height: 75px;
  background-color: #5680E9;
  background-image: linear-gradient(
      to right,
      #5680E9, #8860D0
  );
}

.extendedChat {
  display: none;
  position: fixed;
  top: 295px;
  left: 55px;
  width: 150px;
  height: 75px;
  background-color: #5680E9;
  background-image: linear-gradient(
      to right,
      #5680E9, #8860D0
  );
}

.extendedSettings {
  display: none;
  position: fixed;
  top: 405px;
  left: 55px;
  width: 150px;
  height: 75px;
  background-color: #5680E9;
  background-image: linear-gradient(
      to right,
      #5680E9, #8860D0
  );
}

.notificationIcon:hover + .extendedNotification, .userIcon:hover + .extendedUser, .settingsIcon:hover + .extendedSettings, .chatIcon:hover + .extendedChat {
  display: block;
}

.profileText, .settingsText, .chatText{
  position: relative;
  top: 2px;
  left: 35px;
  color: #C1C8E4;
  font-weight: bold;
  font-size: 23px;
}

.notificationText{
  position: relative;
  top: 2px;
  left: 15px;
  color: #C1C8E4;
  font-weight: bold;
  font-size: 23px;
}
</style>