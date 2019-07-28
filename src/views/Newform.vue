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
        <v-data-table
            :headers="headers"
            :items="listofPosts"
            :items-per-page="5"
            class="elevation-1">
              <template v-slot:items="props">
                  <td>{{props.item.id}}</td>
                  <td>{{props.item.title}}</td>
                  <td>{{props.item.body}}</td>
                  <td>{{props.item.userId}}</td>
              </template>
          </v-data-table>

    </v-container>
</template>

<script>
/* eslint-disable */
import axios from 'axios';
export default {
  name: 'hello',
  data() {
    return {
      listofPosts:[],
      firstname:"",
      lastname:"",
      email:"",
      msg: 'Welcome to Your Vue.js App',
      User: { first_name: '', last_name: '', email: '' },
       headers: [
          {
            text: 'ID',
            align: 'left',
            sortable: true,
            value: 'name',
          },
          { text: 'Title', value: 'title' },
          { text: 'Body', value: 'body' },
          { text: 'UserID', value: 'id' },

        ],
    }
  }, 

  created(){
     let _this = this;
     const endpoint ="https://jsonplaceholder.typicode.com/posts";
      const jsonToSend = {};
      console.log(jsonToSend);
      console.log(endpoint);

      axios.get(endpoint).then(function(response) {
          _this.listofPosts = response.data;
      });
    
  },
  
  methods: {
    addToAPI() {
      let _this = this;

      const endpoint ="https://jsonplaceholder.typicode.com/comments";
      //const jsonToSend = {};
      // jsonToSend.digest = window.sessionInformation.digest;
      // jsonToSend.firstName = this.firstname;
      // jsonToSend.lastName = this.lastname;
      // jsonToSend.email = this.email;

      //console.log(jsonToSend);
      //console.log(endpoint);

      axios.get(endpoint).then(function(response) {
          console.log(response.data);
          //_this.listofPosts = response.data;
          //console.log(_this.listofPosts);
      });
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