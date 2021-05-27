<template>
  <div class="background">
    <div class="deco1"></div>
    <div class="deco2"></div>
  </div>

  <div class="table">
    <div v-for="(notification, index) in notifications" :key="notification.notification_message">
      <div class="notification" v-if="notification.notification_read === 1">
        <p class="notificationDate" style="color: gray; font-size: 20px; margin-left: 35px">{{ notification.notification_date }}</p>
        <p class="notificationMessage" style="color: gray">{{ notification.notification_message }}</p>
      </div>
      <div class="notification" v-if="notification.notification_read === 0" @click="selectNotification(index)">
        <input v-model="checkboxes[index]" type="checkbox" onclick="return false;" v-if="notification.notification_read === 0" style="margin-right: 20px"/>
        <p class="notificationDate" v-if="notification.notification_read === 0" style="color: black; font-size: 20px">{{ notification.notification_date}}</p>
        <p class="notificationMessage" v-if="notification.notification_read === 0" style="color: black">{{ notification.notification_message}}</p>
      </div>
    </div>
  </div>

  <div class="button1" @click="markAsRead">
    <p></p>
  </div>

</template>

<script>
import axios from "axios";

export default {
  name: "Notifications",

  data() {
    return {notifications: [],
    checkboxes: []}
  },
  created: function(){
    axios
        .get("http://localhost:3000/notifications", {
          params: {
            accountId: 1
          }
        })
        .then(response => (this.notifications = response.data))

    this.uncheckAllBoxes();
  },
  methods: {
    uncheckAllBoxes() {
      this.notifications.forEach(index => this.checkboxes[index] = false)
    },
    selectNotification(index) {
      this.checkboxes[index] = !this.checkboxes[index];
      console.log("test");
    },
    markAsRead() {
      this.checkboxes.forEach((element, index) => {
            if(element === true) {
                this.notifications[index].notification_read = 1;
            }
          }
      )
    }
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
.table {
  position: absolute;
  top: 250px;
  left: 250px;
  overflow-x: auto;
  overflow-y: auto;
  height: 500px;
  width: 1000px;
  display:block;
  font-size: 25px;
}

.notification:hover {
  background: #5680E9;
}

.notificationMessage, .notificationDate {
  display: inline-block;
  position: relative;
  margin-right: 100px;
}

.button1 {
  position: absolute;
  left: 1300px;
  top: 300px;
  background: #5AB9EA;
  width: 250px;
  height: 100px;
}

.button1:hover {
  background: #5680E9;
}

/* Scrollbar costum */
::-webkit-scrollbar {
  width: 5px;
}
::-webkit-scrollbar-track {
  background: #C1C8E4;
}

::-webkit-scrollbar-thumb {
  background: #5AB9EA;
}
::-webkit-scrollbar-thumb:hover {
  background: #5680E9;
}
</style>