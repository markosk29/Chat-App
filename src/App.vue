<template>
  <div id="app" class="page">
    <LoginRegister />
    <Sidebar @clickedComponent="getClickedComponent($event)" style="z-index: 10" v-if="component === 'dummy'"/>
    <Notifications v-if="component === 'notificationsComponent'"/>
    <GroupChat class="temp2" v-if="component === 'chatComponent'"/>
    <Chat v-if="component === 'singleChatComponent'"/>
  </div>
</template>

<script>
import LoginRegister from "@/components/LoginRegister"
import Sidebar from './components/Sidebar.vue'
import Notifications from './components/Notifications.vue'
import GroupChat from './components/GroupChat.vue'
import Chat from './components/Chat'

export default {
  name: 'App',
  data() {
    return {
      notificationsActive: false,
      component: ''
    }
  },
  components: {
    LoginRegister,
    Sidebar,
    Notifications,
    GroupChat,
    Chat
  },
  methods: {
    getClickedComponent(name){
      this.component = name;
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
