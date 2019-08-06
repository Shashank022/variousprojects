<template>
        <v-container>
                <v-card>
                  <v-card-title class="headline align-center green--text"> Auto Complete with Details Display</v-card-title>
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
        personList:[]
      };
    },

    created(){
      /* eslint-disable no-console */
       this.$http.get("https://myvueproject-d84e4.firebaseio.com/info.json").then(function(response) {
          this.projectsList = response.data;
          console.log("%^%^%^%^%^%%^%^%^%^%^%^%^%^%^%^%"); 
          console.log(response.data); 
        }); 

    },

    methods:{
      getSelectSubmitted(){
      /* eslint-disable no-console */
      console.log(this.model);
      JSON.stringify(this.projectsList);
      this.projectsList = Object.values(this.projectsList);
       this.personList = this.projectsList.filter(obj => {
          if(obj.person === this.model){
              return obj;
          }
          });
          console.log(this.personList);
          // this.personList.push(result);
          // console.log(this.personList);
    }, 

    clearSelected(){
        console.log(this.model);
        this.selected="";
        this.model="";
        this.personList="";
    }
    }
  }
  
</script>
<style>
 
</style>
