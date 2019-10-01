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
    <div>
    <v-data-table
    v-model="selected"
    :headers="headers"
    :items="gitHubRepoList"
    :single-select="singleSelect"
    item-key="name"
    show-select
    class="elevation-1"
  >
    <template v-slot:top>
      <v-switch v-model="singleSelect" label="Single select" class="pa-3"></v-switch>
    </template>
  </v-data-table>
    </div>
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
            text: 'Dessert (100g serving)',
            align: 'left',
            sortable: false,
            value: 'name',
          },
          { text: 'Calories', value: 'calories' },
          { text: 'Fat (g)', value: 'fat' },
          { text: 'Carbs (g)', value: 'carbs' },
          { text: 'Protein (g)', value: 'protein' },
          { text: 'Iron (%)', value: 'iron' },
        ],
        };
    },  
    
    created() {
     /* eslint-disable no-console */
     const _this = this;
      axios.get("https://api.github.com/search/repositories?q=stars:>100000").then(function(response) {
          //this.blogs = data.body.slice(0, 10);
         console.log(response.data)
         _this.gitHubRepoList = response.data;
        console.log(_this.gitHubRepoList.items);
        });
    },
    methods: {


        
    }
};
</script>