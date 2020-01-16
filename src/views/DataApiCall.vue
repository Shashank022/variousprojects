<template>
<v-container>
    <v-layout>
    <div>
        <h3>Vue.js Pagination Tutorial & Example</h3>
        <div class="card-body">
        </div>
        <div>
        </div>
    </div>
    </v-layout>
    <br>
    <v-layout>
    <div>
    <v-data-table
    v-model="selected"
    :headers="headers"
    :items="gitHubRepoList" 
    item-key="name"
    show-select
    class="elevation-1">
        <template slot="items" slot-scope="props">
      <td class="text-xs-right">{{ props.item.id }}</td>
      <td class="text-xs-right">{{ props.item.firstName }}</td>
      <td class="text-xs-right">{{ props.item.lastName }}</td>
      <td class="text-xs-right">{{props.item.gender}}</td>
      <td class="text-xs-right">{{ props.item.email }}</td>
    </template>
  </v-data-table>
    </div>
    </v-layout>
    <v-layout>
    <!-- <v-btn round small color="green" class="black--text" @click="getAllIssues()">Get Git Issues</v-btn> -->
    </v-layout>
    </v-container>
</template>

<script>
// an example array of items to be paged

import axios from 'axios';

export default {
    data() {
        return {
            gitHubRepoList:[],
             selected: [],
        headers: [
          {
            text: 'Name',
            align: 'left',
            sortable: false,
            value: 'name',
          },
          { text: 'ID', value: 'id' },
          { text: 'First Name', value: 'firstName' },
          { text: 'Last Name', value: 'lastName' },
          { text: 'Gender', value: 'gender' },
          { text: 'Email', value: 'email' },
        ],
        };
    },  
    
    created() {
     /* eslint-disable no-console */
    // const _this = this;
      // axios.get("https://api.github.com/search/repositories?q=stars:100000..300000").then(function(response) {
      //     //this.blogs = data.body.slice(0, 10);
      //    console.log(response.data)
      //    _this.gitHubRepoList = response.data.items;
      //   });

       console.log("655555555555232323232323232323232323255555555555555")

        axios.get("http://localhost:3000/api/users").then(function(response){
              const _this = this;
              console.log(response.data);
               _this.gitHubRepoList = response.data;
               console.log(this.gitHubRepoList[0]);

        });
    },
    methods: {
        getFormattedDate(date){
          console.log("&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&");
          console.log(date);
        },

        // getAllIssues(){
        //   const _this = this;
        //   axios.get("https://api.github.com/search/issues?q=author:raisedadeadrepo:freecodecamp/freecode").then(function(response) {
        //  console.log(response.data)
        //  _this.gitHubRepoList = response.data.items;
        //   });
        // }
    }
};
</script>