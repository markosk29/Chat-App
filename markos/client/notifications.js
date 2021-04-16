function notifications() {
    get = function() {
        return axios.get("http://localhost:3000/notifications");
    };

    return {
        get: get
    };
}