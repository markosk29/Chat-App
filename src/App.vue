<template>
  <div id="app">
    <Sidebar />
    <Notifications class="temp1" />
  </div>
</template>

<script>
import Sidebar from './components/Sidebar.vue'
import Notifications from './components/Notifications.vue'

export default {
  name: 'App',
  data() {
    return {
      notificationsActive: false
    }
  },
  components: {
    Sidebar,
    Notifications
  }
}
</script>

<style scoped>
  .temp1 {
    display: block;
  }
</style>
