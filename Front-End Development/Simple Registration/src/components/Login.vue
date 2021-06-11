<template>
    <div id="login">
        <form >
        <h1>Login</h1>
        <input type="text" name="username" v-model="input.username" placeholder="Username"/>
        <input type="text" name="password" v-model="input.password" placeholder="Password"/>
        <button type="button" v-on:click="login()">Login</button>
        </form>
    </div>
</template>


<script>
export default {
  name: 'Login',
  data() {
      return {
          input: {
              username: '',
              password: ''
          }
          
      };
  },
  methods: {
      login(){
          //takes input from input and checks it with test account in app.bue data section for account info
          if(this.input.username != "" && this.input.password != ""){
              if(this.input.username == this.$parent.testAccount.username && this.input.password == this.$parent.testAccount.password){
                  this.$emit("authenticated", true);
                  this.$router.replace({ name: "secure" });
              } else {
                  console.log("The user name and / or password is incorrect");
              }
          } else{
              console.log("A username and password must be present")
          }
      }
  },
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
h3 {
  margin: 40px 0 0;
}
ul {
  list-style-type: none;
  padding: 0;
}
li {
  display: inline-block;
  margin: 0 10px;
}
a {
  color: #42b983;
}
</style>

