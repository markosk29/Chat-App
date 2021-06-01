<template>
  <div class="background">
    <div class="deco1"></div>
    <div class="deco2"></div>
  </div>

  <p class="errorMessage"> {{ errorMessage }}</p>

  <p class="usernameText"> Change username: </p>
  <input type="text" class="usernameBox" v-model="newUsername"/>
  <button type="button" class="usernameButton" @click="changeUsername"> CONFIRM </button>

  <p class="passwordText"> Change password: </p>
  <input type="password" class="passwordBox" v-model="newPassword"/>
  <button type="button" class="passwordButton" @click="changePassword"> CONFIRM </button>
</template>

<script>
import axios from "axios";
import $ from 'jquery'
import crypto from "crypto";

export default {
  name: "Settings",
  props: ['usernameProp'],
  data() {
    return {
      username: '',
      errorMessage: '',
      newUsername: '',
      newPassword: '',
      temp: ''
    }
  },

  mounted() {
    this.username = this.usernameProp;
  },

  methods: {
    changeUsername() {
      if(/\S/.test(this.newUsername)) {
        axios
            .get("http://localhost:3000/user", {
              params: {
                username: this.newUsername
              }
            }).then(response => (this.temp = response.data));

        setTimeout(() => {
          if($.isEmptyObject(this.temp)) {
            axios
                .post("http://localhost:3000/updateUsername", {
                  params: {
                    newUsername: this.newUsername,
                    oldUsername: this.username
                  }
                })


            this.SendNotification(this.newUsername, "Username updated!");

            this.$emit("updatedUsername", this.newUsername);

            this.username = this.newUsername;
            this.newUsername = '';
            this.errorMessage = '';
          }
          else {
            this.errorMessage = "Username is taken, please choose another one!";
          }
        }, 50);
      }
      else {
        this.errorMessage = "Username input field cannot be empty!";
      }
    },

    changePassword() {
      if(/\S/.test(this.newPassword)) {
        let encryptedPassword;
        encryptedPassword = crypto.createHmac("sha256", this.newPassword).digest("hex");

        axios
            .post("http://localhost:3000/updatePassword", {
              params: {
                newPassword: encryptedPassword,
                username: this.username
              }
            });

        this.SendNotification(this.username, "Password updated!");
        this.newPassword = '';
        this.errorMessage = '';
      }
      else {
        this.errorMessage = "Password input field cannot be empty!";
      }
    },

    SendNotification(username, notification) {
      let today = new Date();
      let hours;
      let minutes;
      let month;
      let day;
      let monthTemp = today.getMonth() + 1;

      if(monthTemp < 10) {
        month = "0" + monthTemp;
      }
      else {
        month = monthTemp;
      }

      if(today.getDate() < 10) {
        day = "0" +today.getDate();
      }
      else {
        day = today.getDate();
      }

      let date = today.getFullYear() + "-" + month + "-" + day;

      if(today.getHours() < 10) {
        hours = "0" + today.getHours();
      }
      else {
        hours = today.getHours();
      }

      if(today.getMinutes() < 10) {
        minutes = "0" + today.getMinutes();
      }
      else {
        minutes = today.getMinutes();
      }

      date = date+ " | " +hours+ ":" +minutes;

      axios
          .post("http://localhost:3000/notification", {
            params: {
              accountUsername: username,
              date: date,
              notification: notification
            }
          });
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

.errorMessage {
  position: absolute;
  top: 15vh;
  left: 10vw;
  color: red;
  font-size: 30px;
  font-weight: bolder;
}

.usernameText {
  position: absolute;
  top: 30vh;
  left: 10vw;
  font-size: 30px;
  font-weight: bolder;
}

.usernameBox {
  position: absolute;
  top: 36vh;
  left: 10vw;
  font-size: 25px;
  background: transparent;
  outline-color: #8860D0;
  border-color: #5680E9;
  border-width: 5px;
}

.usernameButton {
  position: absolute;
  top: 36vh;
  left: 26vw;
  width: 200px;
  height: 50px;
  background: #5680E9;
  font-weight: bolder;
}

.passwordText {
  position: absolute;
  top: 45vh;
  left: 10vw;
  font-size: 30px;
  font-weight: bolder;
}

.passwordBox {
  position: absolute;
  top: 51vh;
  left: 10vw;
  font-size: 25px;
  background: transparent;
  outline-color: #8860D0;
  border-color: #5680E9;
  border-width: 5px;
}

.passwordButton {
  position: absolute;
  top: 51vh;
  left: 26vw;
  width: 200px;
  height: 50px;
  background: #5680E9;
  font-weight: bolder;
}

.usernameButton:hover, .passwordButton:hover {
  background: #8860D0;
}


</style>