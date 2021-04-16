let sidebar = new Vue({
    el: '#sidebar',
    data: {
        notifications: [],
        unreadNotifications: 0,
        axiosService: null
    },
    created: function(){
        this.axiosService = notifications();
        this.axiosService.get().then(response => (this.notifications = response.data));
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
        }
    }
})