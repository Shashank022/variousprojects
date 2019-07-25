<template>
  <v-container>
      <v-layout>
        <h4>Details of the System</h4>
      </v-layout>
        <v-divider></v-divider>
          <v-spacer></v-spacer>
                <v-layout>
                      <div>
                      </div>
                            <div>
                                <v-flex>
                                  <v-text-field label="First Name" v-model="firstname"></v-text-field>
                                </v-flex>
                                <v-flex>
                                  <v-text-field label="Last Name" v-model="lastname"></v-text-field>
                                </v-flex>
                                <v-flex>
                                  <v-text-field label="Email" v-model="email"></v-text-field>
                                </v-flex>
                            </div>
                </v-layout>
          <v-layout>
              <div>
                <v-btn round small color="primary" dark class="centered" @click="addToAPI()">Submit</v-btn>
                  <v-btn round small color="primary" dark class="centered" @click="clearFields()">Clear</v-btn>
              </div>
          </v-layout>
    </v-container>
</template>

<script>
/* eslint-disable */
import axios from 'axios';
export default {
  name: 'hello',
  data() {
    return {
      firstname:"",
      lastname:"",
      email:"",
      msg: 'Welcome to Your Vue.js App',
      User: { first_name: '', last_name: '', email: '' },
    }
  }, methods: {
    addToAPI() {
      console.log(this.firstname);
      console.log(this.lastname);
      console.log(this.email);
      // let newUser = {
      //   first_name: this.User.first_name,
      //   last_name: this.User.last_name,
      //   email: this.User.email
      // }
      // console.log(newUser);
      // axios.post('http://localhost:3000/users', newUser)
      //   .then((response) => {
      //     console.log(response);
      //   })
      //   .catch((error) => {
      //     console.log(error);
      //   });
    },

    clearFields(){
      this.firstname="";
      this.lastname="";
      this.email="";

    }
  },
  

}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
h1,h2 {
  font-weight: normal;
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