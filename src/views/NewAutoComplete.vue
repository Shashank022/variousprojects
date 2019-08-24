<template>
        <v-container>
          <div v-if="this.model">
              <v-alert
                border="right"
                color="blue-grey"
                dark>
                The Name searched is not present in the DataBase
              </v-alert>
          </div>
          <div>
                <v-card>
                  <v-card-title class="headline green--text"> Auto Complete with Details Display</v-card-title>
                    <v-card-text>
                      <v-autocomplete
                        v-model="model"
                        :items="customers"
                        :loading="isLoading"
                        :search-input.sync="search"
                        color="green"
                        hide-no-data
                        hide-selected
                        item-text="Description"
                        item-value="API"
                        label="Please enter the Name"
                        placeholder="Start typing to Search"
                        return-object
                      ></v-autocomplete>
                    </v-card-text>
                </v-card>
                </div>
                <v-card>
                    <v-card-text class="text-xs-left">
                      <span>Selected  Name: {{model}}</span>
                    <span class="right">
                        <v-btn small round color="primary" class="black--text" @click="getSelectSubmitted()"> Submit</v-btn>
                        <v-btn small round color="primary" class="black--text" @click="clearSelected()"> Clear</v-btn>
                    </span>
                    </v-card-text>
                    <v-card-text>


                      <span>Student Details Name: {{model}}</span>

                    </v-card-text>
                </v-card>
                <v-card flat v-for="person in this.personList" :key="person.id" :search="search">
                    <v-layout row wrap :class="`pa-1 project ${person.status}`">

                      <v-flex xs4 md2 sm1>
                        <div class="caption grey--text">Project ID</div>
                        <div>{{person.id}}</div>
                      </v-flex>
                      <v-flex xs4 md2 sm1>
                        <div class="caption grey--text">Project Title</div>
                        <div>{{person.title}}</div>
                      </v-flex>
                      <v-flex xs4 md2 sm1>
                        <div class="caption grey--text">Person</div>
                        <div>{{person.person}}</div>
                      </v-flex>
                      <v-flex xs4 md2 sm1>
                        <div class="caption grey--text">Due Date</div>
                        <div>{{person.due}}</div>
                      </v-flex>
                      <v-flex xs4 md2 sm1>
                        <div class="caption grey--text">Status</div>
                        <div>
                          <v-chip small :class="`${person.status} white--text caption`">{{person.status}}</v-chip>
                        </div>
                      </v-flex>
                      <v-flex xs4 md2 sm1>
                        <div class="caption grey--text">Update</div>
                        <div>
                          <v-btn round outline flat small color="green" @click="update(person)">Accept</v-btn>
                        </div>
                        <v-icon dark right>check_circle</v-icon>
                      </v-flex>
                    </v-layout>
                    <v-divider></v-divider>
                  </v-card>
                  
        </v-container>
</template>

<script>
import axios from "axios";

  export default {
    name: 'newautocomplete',

    data() {
      return {
        isOpen: false,
        customers: [
        "Ramesh",
        "Suresh",
        "Maneesh",
        "Kumar",
        "Mohan",
        "Harish",
        "Kiran",
        "Lasko",
        "Orange",
        "Kites",
        "Weldone",
        "Frank",
        "Manish",
        "Umbrella",
        "Master",
        "Communicate",
        "Zaheer"],
        model:'',     
        search:'',
        isLoading: false,
        arrowCounter: 0,
        results:[],
        projectsList:[],
        groupList:[],
        personList:[]
      };
    },

    created(){
      /* eslint-disable no-console */
      const _this= this;
        axios.get("https://myvueproject-d84e4.firebaseio.com/info.json").then(function(response) {
          _this.projectsList = response.data;
          console.log(response.data); 
        }); 

        axios.get("https://vue-firebase-1103b.firebaseio.com/names.json").then(function(response) {
          _this.groupList = response.data;
          console.log(_this.projectsList); 
        }); 

        axios.get("https://myvueproject-d84e4.firebaseio.com/info.json").then(function(response) {
          console.log(response.data); 
        }); 
    },

    methods:{
      getSelectSubmitted(){
      /* eslint-disable no-console */
      console.log(this.model);
      if(this.model){
          if (typeof(this.model) != 'undefined' && this.model != null){
                    JSON.stringify(this.projectsList);
                    this.projectsList = Object.values(this.projectsList);
                    this.personList = this.projectsList.filter(obj => {
                      if (typeof(obj) != 'undefined' && obj != null){
                        if(obj.person === this.model){
                                        return obj;
                        }
                    } else {
                        // console.log("This is an alert");
                        // alert("The Name searched doesn't exsisit in the DataBase");
                    }
              });
          }
      }
       else{
          console.log("This is an alert");
          alert("Please end a valid Value to search...");
      }
      
  if (typeof(this.model) != 'undefined' && this.model != null){
      JSON.stringify(this.groupList);
      this.groupList = Object.values(this.groupList);
      this.groupList = this.groupList[0];
      if(this.groupList){
        this.groupList = this.groupList.filter(obj => {
          if(obj.name === this.model){
              return obj;
          }
          });
        }
      } else{
          console.log(this.personList);
          console.log(this.groupList);
      }
    }, 

    clearSelected(){
        this.selected="";
        this.model="";
        this.personList="";
        this.groupList="";
    }
    }
  }
  
</script>
<style>
 
</style>
