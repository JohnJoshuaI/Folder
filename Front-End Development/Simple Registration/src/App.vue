<template>
  <div id="app">
    <Banner/>
        <div id="nav">
          <router-link v-if="authenticated" to="/login" v-on:click.native="logout()" replace>Logout</router-link>
        </div>
        <router-view @authenticated="setAuthenticated" />
        <br><br>
      <Register/>
  </div>
</template>

<script>
import Banner from './components/Banner'
import Login from './components/Login'
import Secure from './components/Secure'
import Register from './components/Register'

export default {
  name: 'App',
  components: {
    Banner,Secure,Login,Register
  },
  data() {
    //initialize variable for authenticated login and Test Account for use through the component
    return {
      authenticated: false,
      testAccount: {
        username: "john",
        password: "password"
      }
    }
  },
  mounted() {
    //if not currently authenticated, then this helps prevent from going to protected pages
    if(!this.authenticated){
      this.$router.replace({ name: "login"});
    }
  },
  methods: {
    //methods to handle login status and logout status for use
    setAuthenticated(status){
      this.authenticated = status;
    },
    logout(){
      this.authenticated = false
    }
  },
  
}
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
