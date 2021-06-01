<template>
  <div id="app" class="page">
    <LoginRegister @success="userJoined($event)" @transferUsername="transferUsername($event)"
                   v-if="!success || loggedout"/>
    <Sidebar @clickedComponent="getClickedComponent($event)" @logout="logout($event)"
             style="z-index: 10" v-if="success && !loggedout" :usernameProp="user" :count="count"/>
    <Notifications v-if="component === 'notificationsComponent' && success && !loggedout || firstJoin && !loggedout"
                   :usernameProp="user" @unreadNotificationsCount="getUnreadNotifications($event)" />
    <GroupChat class="temp2" v-if="component === 'chatComponent' && !loggedout"
               :usernameProp="user"/>
    <Settings v-if="component === 'settingsComponent' && !loggedout" :usernameProp="user"
              @updatedUsername="getUpdatedUsername($event)" />
  </div>
</template>

<script>
import LoginRegister from "@/components/LoginRegister"
import Sidebar from './components/Sidebar.vue'
import Notifications from './components/Notifications.vue'
import GroupChat from './components/GroupChat.vue'
import Settings from './components/Settings.vue'

export default {
  name: 'App',
  data() {
    return {
      notificationsActive: false,
      component: '',
      success: '',
      user: '',
      firstJoin: '',
      loggedout: '',
      count: 0
    }
  },
  components: {
    LoginRegister,
    Sidebar,
    Notifications,
    GroupChat,
    Settings
  },
  methods: {
    getClickedComponent(name){
      this.component = name;
      this.firstJoin = false;
    },
    userJoined(success) {
      this.success = success;
      this.firstJoin = true;
      this.loggedout = false;
    },
    transferUsername(user) {
      this.user = user;
    },
    logout(isLoggedOut) {
      this.loggedout = isLoggedOut;
      this.component = '';
    },
    getUpdatedUsername(newUsername) {
      this.user = newUsername;
    },

    getUnreadNotifications(count) {
      this.count = count;
    }
  }
}
</script>

<style scoped>
html,body {
  overflow-y: scroll;
  overflow-x: scroll;
}

.page {
  height: 800px;
  width: 1500px;
  overflow: hidden;
}
</style>
