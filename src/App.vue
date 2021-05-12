<template>
  <div id="app">
    <Sidebar @clickedComponent="getClickedComponent($event)"/>
    <Notifications class="temp1" />
    <GroupChat class="temp2" v-if="component == 'chatComponent'"/>
  </div>
</template>

<script>
import Sidebar from './components/Sidebar.vue'
import Notifications from './components/Notifications.vue'
import GroupChat from './components/GroupChat.vue'

export default {
  name: 'App',
  data() {
    return {
      notificationsActive: false,
      component: ''
    }
  },
  components: {
    Sidebar,
    Notifications,
    GroupChat
  },
  methods: {
    getClickedComponent(name){
      this.component = name;
    }
  }
}
</script>

<style scoped>
  .temp1 {
    display: block;
  }

</style>
