<template>
  <div>
    <div class="background">
      <div class="deco1"></div>
      <div class="deco2"></div>
    </div>

    <div class="form">

      <form class="register-form">
        <input type="text" placeholder="username" v-model="username"/>
        <input type="password" placeholder="password" v-model="password"/>
        <input type="text" placeholder="email" v-model="email"/>
        <button @click="register" type="button">Create</button>
        <p class="message">Already Registered? <a href="#">Login</a>
        </p>
        <p class="message" style="color: red">{{ errorMessage }}</p>
      </form>

      <form class="login-form">
        <input type="text" placeholder="username" v-model="username"/>
        <input type="password" placeholder="password" v-model="password"/>
        <button @click="login" type="button">Login</button>
        <p class="message">Not Registered? <a href="#">Register</a>
        </p>
        <p class="message" style="color: red">{{ errorMessage }}</p>
      </form>

    </div>
  </div>
</template>

<script>
import $ from 'jquery'
import axios from 'axios'
import crypto from 'crypto'

export default {
  name: "LoginRegister",
  data: function() {
    return {
      username: '',
      password: '',
      email: '',
      date: '',
      temp: '',
      errorMessage: ''
    }
  },
  mounted() {
    $('.message a').click(function(){
      $('form').animate({height: "toggle", opacity: "toggle"}, "slow");
    });
  },
  methods: {
    /*
    * Verifies if user exists and if not it adds the account to DB
    * */
    register() {
      this.date = this.getLocalDate();

      axios
          .get("http://localhost:3000/user", {
            params: {
              username: this.username
            }
         }).then(response => (this.temp = response.data));

      setTimeout(() => {
        if($.isEmptyObject(this.temp)) {
          axios
              .get("http://localhost:3000/userEmail", {
                params: {
                  email: this.email
                }
              }).then(response => (this.temp = response.data));

         setTimeout(() => {
           if($.isEmptyObject(this.temp)) {
             if(this.email.includes("@") && this.email.endsWith(".com")) {
               let encryptedPassword;

               encryptedPassword = crypto.createHmac("sha256", this.password).digest("hex");

               axios
                   .post("http://localhost:3000/register", {
                     params: {
                       username: this.username,
                       password: encryptedPassword,
                       email: this.email.toLowerCase(),
                       date: this.date
                     }
                   });

               this.SendNotification(this.username, "Welcome to our chat app!");

               this.$emit('success', true);
               this.$emit("transferUsername", this.username);
               this.errorMessage = '';
             }
             else {
               this.errorMessage = "Invalid email format!";
             }
           }
           else {
             this.errorMessage = "Email is already in use!";
           }
         }, 50);
        }
        else {
          this.errorMessage = "Username is already in use!";
        }
      }, 50);
    },

    /*
    * Checks if entered credentials are correct and lets user through if they are
    */
    login() {
      axios
          .get("http://localhost:3000/user", {
            params: {
              username: this.username
            }
          }).then(response => (this.temp = response.data));

      setTimeout(() => {
          if(this.temp.account_username === this.username) {
            let encryptedPassword;
            encryptedPassword = crypto.createHmac("sha256", this.password).digest("hex");

            if(encryptedPassword === this.temp.account_password) {
              this.$emit('success', true);
              this.$emit("transferUsername", this.username);
            }
            else {
              this.errorMessage = "Wrong password!";
            }
          }
          else {
            this.errorMessage = "Account not found!";
          }
      }, 50);
    },

    /*
    * provides the local date (YYYY-mm-dd)
    */
    getLocalDate() {
      let date = new Date();
      let localDate;

      let month;
      let day;

      let monthTemp = date.getMonth() + 1;

      if(monthTemp < 10) {
        month = "0" + monthTemp;
      }
      else {
        month = monthTemp;
      }

      if(date.getDate() < 10) {
        day = "0" +date.getDate();
      }
      else {
        day = date.getDate();
      }

      localDate = date.getFullYear() + "-" + month + "-" + day;

      return localDate;
    },

    /*
    * adds a notification to the database
     */
    SendNotification(username, notification) {
      let today = new Date();
      let hours;
      let minutes;

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

      this.date = this.date + " | " +hours+ ":" +minutes;

      axios
          .post("http://localhost:3000/notification", {
            params: {
              accountUsername: this.username,
              date: this.date,
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

.form{
  position: absolute;
  top: 30%;
  left: 40%;
  z-index: 1;
  max-width: 360px;
  margin: 0 auto 100px;
  padding:45px;
  text-align: center;
  background-image: linear-gradient(
      to bottom,
      #8860D0, #5AB9EA
  );
}

.form:hover {
  background-image: linear-gradient(
      to bottom,
      #5AB9EA, #8860D0
  );
}

.form input{
  font-family: "Roboto",sana-serif,serif;
  outline: 1;
  background: #C1C8E4;
  width: 100%;
  border: 0;
  margin: 0 0 15px;
  padding: 15px;
  box-sizing: border-box;
  font-size: 14px;
}

.form button{
  font-family: "Roboto",sana-serif,serif;
  text-transform:  uppercase;
  outline: 0;
  background: #5680E9;
  width: 100%;
  border: 0;
  padding: 15PX;
  color: #FFFFFF;
  font-size: 15px;
  cursor: pointer;
}

.form button:hover,.gorm button:active{
  background: #5AB9EA;
}

.form .message{
  margin:15px 0 0;
  color: #C1C8E4;
  font-size: 15px;
}


.form .message a{
  color: black;
  text-decoration: none;
}

.form .register-form{
  display: none;
}

.form .login-form{
  display: inline-block;
}
</style>