<template>

  <div class="background">
    <div class="deco1"></div>
    <div class="deco2"></div>
    <div class="table">
      <table>
        <tr v-for="notification in notifications" :key="notification.text">
           <th v-if="notification.read === 'true'" style="color: gray">{{ notification.text }}</th>
           <th v-if="notification.read === 'false'" style="color: black">{{ notification.text }}</th>
           <th v-if="notification.read === 'true'" style="color: gray; font-size: 20px">{{ notification.time }}</th>
           <th v-if="notification.read === 'false'" style="color: black; font-size: 20px">{{ notification.time }}</th>
        </tr>
        <tr v-for="notification in notifications" :key="notification.text">
          <th v-if="notification.read === 'true'" style="color: gray">{{ notification.text }}</th>
          <th v-if="notification.read === 'false'" style="color: black">{{ notification.text }}</th>
          <th v-if="notification.read === 'true'" style="color: gray; font-size: 20px">{{ notification.time }}</th>
          <th v-if="notification.read === 'false'" style="color: black; font-size: 20px">{{ notification.time }}</th>
        </tr>
      </table>
    </div>
  </div>

</template>

<script>
import axios from "axios";

export default {
  name: "Notifications",

  data() {
    return {notifications: []}
  },
  created: function(){
    axios
        .get("http://localhost:3000/notifications")
        .then(response => (this.notifications = response.data))
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
  position: fixed;
  top: 150px;
  left: 0;
  width: 100vw;
  height: 25vh;
  background-color: #5AB9EA;
  background-image: linear-gradient(
      #C1C8E4,  #5AB9EA
  );
  opacity: 25%;
}
.deco2 {
  position: fixed;
  top: 392px;
  left: 0;
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
  position: fixed;
  top: 250px;
  left: 250px;
  overflow-x: auto;
  overflow-y: auto;
  height: 500px;
  width: 1000px;
  display:block;
  font-size: 25px;
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