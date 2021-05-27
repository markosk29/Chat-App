<template>
  <div class="login-page">
    <div class="form">

      <form class="register-form">
        <input type="text" placeholder="username" v-model="username"/>
        <input type="text" placeholder="password" v-model="password"/>
        <input type="text" placeholder="email" v-model="email"/>
        <button @click="register">Create</button>
        <p class="message">Already Registered? <a href="#">Login</a>
        </p>
      </form>

      <form class="login-form">
        <input type="text" placeholder="username"/>
        <input type="password" placeholder="password"/>
        <button>Login</button>
        <p class="message">Not Registered? <a href="#">Register</a>
        </p>
      </form>

    </div>
  </div>
</template>

<script>
import $ from 'jquery'
import axios from 'axios'

export default {
  name: "LoginRegister",
  data: function() {
    return {
      username: '',
      password: '',
      email: '',
      date: ''
    }
  },
  mounted() {
    $('.message a').click(function(){
      $('form').animate({height: "toggle", opacity: "toggle"}, "slow");
    });
  },
  methods: {
    register() {
      let today = new Date();

      let month = today.getMonth() + 1;

      if(today.getMonth() + 1 < 10) {
        this.date = today.getFullYear() + "-0" + month + "-" + today.getDate();
      }
      else {
        this.date = today.getFullYear() + "-" + month + "-" + today.getDate()
      }

      console.log(this.username + ", " +this.password+ ", " +this.email + ", " +this.date);

      axios
          .post("http://localhost:3000/register", {
            params: {
              username: this.username,
              password: this.password,
              email: this.email,
              date: this.date
            }
          }).then(response => (this.test = response.data));
    }
  }
}
</script>

<style scoped>
/*
body{
  background: url(../assets/loginbg.jpg) no-repeat center center fixed;
  -webkit-background-size: cover;
  -moz-background-size: cover;
  -o-background-size: cover;
  background-size: cover;
}

cu asta trebuie avut grija, merge BG daca scoti scoped din style
dar se aplica peste tot, trebe acoperit in celalalte componente
 */

.login-page{
  width: 360px;
  padding: 20% 0 0;
  margin-left: 775px;
}

.form{
  position: relative;;
  z-index: 1;
  background: #8860D0;
  max-width: 360px;
  margin: 0 auto 100px;
  padding:45px;
  text-align: center;
}

.form input{
  font-family: "Roboto",sana-serif,serif;
  outline:1;
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
  color: #5680E9;
  text-decoration: none;
}

.form .register-form{
  display: none;
}

.form .login-form{
  display: inline-block;
}
</style>