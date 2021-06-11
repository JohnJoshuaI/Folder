<template>
    <div id="register">
        <form @submit.prevent="submit">
            <label for="firstName">First Name</label>
            <input type="text" id="firstName" v-model="form.firstName"/>

            <label for="lastName">Last Name</label>
            <input type="text" id="lastName" v-model="form.lastName"/>

            <label for="email">Email</label>
            <input type="text" id="email" v-model="form.email"/>

            <label for="username">Username</label>
            <input type="text" id="username" v-model="form.username"/>

            <label for="password">Password</label>
            <input type="text" id="password" v-model="form.password"/>

            <button type="submit">Register!</button>
        </form>
    </div>
</template>

<script>
export default {
    data(){
        return {
            form: {
                firstName: '',
                lastName: '',
                email: '',
                username: '',
                password: ''
            }
        }
    },
    methods: {
        submit(){
            localStorage.setItem('form', JSON.stringify(this.form))
        }
        },
        mounted() {
            if (localStorage.getItem('form')) this.form = JSON.parse(localStorage.getItem('form'))
        }
        
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
