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
      <td>{{ props.item.name }}</td>
      <td class="text-xs-right">{{ props.item.id }}</td>
      <td class="text-xs-right">{{ props.item.open_issues }}</td>
      <td class="text-xs-right">{{ props.item.language }}</td>
      <td class="text-xs-right">{{ getFormattedDate(props.item.updated_at)}}</td>
      <td class="text-xs-right">{{ props.item.watchers }}</td>
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
            text: 'Name',
            align: 'left',
            sortable: false,
            value: 'name',
          },
          { text: 'ID', value: 'id' },
          { text: 'Open Issues', value: 'open_issues' },
          { text: 'Language', value: 'language' },
          { text: 'Timestamp', value: 'updated_at' },
          { text: 'Watchers', value: 'watchers' },
        ],
        };
    },  
    
    created() {
     /* eslint-disable no-console */
     const _this = this;
      axios.get("https://api.github.com/search/repositories?q=stars:>100000").then(function(response) {
          //this.blogs = data.body.slice(0, 10);
         console.log(response.data)
         _this.gitHubRepoList = response.data.items;
        });
    },
    methods: {
        getFormattedDate(date){
          // var theDate = new Date (date);
          // console.log(theDate.getMonth);
          // console.log(theDate.getTime());
          // console.log(theDate.getMonth());
          var mydate = Date.parse(date);
          var result = mydate.toString('dddd MMM yyyy h:mm:ss');
          console.log(result);

          return theDate;


          // var theDate = new Date(timeStamp_value * 1000);
          // dateString = theDate.toGMTString();
          // console.log(dateString);
          //return newdate;
        }

        
    }
};
</script>