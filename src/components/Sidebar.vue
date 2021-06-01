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
    <div class="button2" @click='show(3)'>
      <img src="../assets/chat.png" class="chatIcon">
      <div class="extendedChat">
        <p class="chatText">Chat</p>
      </div>
    </div>
    <div class="button3" @click="show(4)">
      <img src="../assets/settings.png" class="settingsIcon">
      <div class="extendedSettings">
        <p class="profileText">Settings</p>
      </div>
    </div>
    <div class="button4" @click="logout">
      <img src="../assets/logout.png" class="logoutIcon">
      <div class="extendedLogout">
        <p class="settingsText">Logout</p>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'Sidebar',
  props: ['usernameProp', 'count'],
  data: function() {
    return {
      notifications: [],
      unreadNotifications: 0,
      component: 'none',
      user: '',
      account: ''
    }
  },
  created: function(){
    this.user = this.usernameProp;
    this.unreadNotifications = this.count;

    console.log(this.count);
  },
  watch: {
    count: function() {
      this.unreadNotifications = this.count;
    }
  },
  methods:{
    meetsConditions() {
      return (this.unreadNotifications > 0) && (this.unreadNotifications < 100);
    },
    show(id){
      if(id === 1) {
        this.$emit('clickedComponent', 'notificationsComponent');
      }
      if(id === 3) {
        this.$emit('clickedComponent', 'chatComponent');
      }
      if(id === 4) {
        this.$emit('clickedComponent', 'settingsComponent');
      }
    },
    logout() {
      this.$emit("logout", true);
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

.notificationIcon, .logoutIcon, .settingsIcon, .chatIcon {
  position: relative;
  top: 20px;
  left: 5px;
  width: 35px;
  height: 35px;
}

.unreadNotifications {
  position: relative;
  top: 13px;
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

.extendedChat {
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

.extendedSettings {
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

.extendedLogout {
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

.notificationIcon:hover + .extendedNotification, .logoutIcon:hover + .extendedLogout, .settingsIcon:hover + .extendedSettings, .chatIcon:hover + .extendedChat {
  display: block;
}

.profileText, .settingsText, .chatText{
  position: relative;
  top: 20px;
  left: 35px;
  color: #C1C8E4;
  font-weight: bold;
  font-size: 23px;
}

.notificationText{
  position: relative;
  top: 20px;
  left: 5px;
  color: #C1C8E4;
  font-weight: bold;
  font-size: 23px;
}
</style>