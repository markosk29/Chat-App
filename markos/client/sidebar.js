let sidebar = new Vue({
    el: '#sidebar',
    data: {
        notifications: [],
        axiosService: null
    },
    created: function(){
        this.axiosService = notifications();

        this.axiosService.get().then(response => (this.notifications = response.data));
    },
    methods:{
        outputNotifications() {
            this.notifications.forEach(notification => {console.log(notification.text+ " -- " +notification.read)});
        }
    }
})