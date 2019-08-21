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
      dataList:[],
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
          { text: 'Server Title', value: 'title' },
          { text: 'Server Information ', value: 'body' },
          { text: 'Server Group ID', value: 'id' },

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
      const endpoint ="https://vue-project-8ca78.firebaseio.com/formdata.json";
      const jsonSend = {};
      jsonSend.digest = window.digest;
      jsonSend.firstname = this.firstname;
      jsonSend.lastname = this.lastname;
      jsonSend.email = this.email;

      console.log(jsonSend);
      console.log(endpoint);

      axios.post(endpoint, jsonSend).then(function(response) {
          _this.dataList = response.data;
          console.log(_this.dataList);

      });

    },

    clearFields(){
      this.firstname="";
      this.lastname="";
      this.email="";
      this.listofPosts=[];
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