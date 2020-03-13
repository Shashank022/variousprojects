<template>
  <div class="dashboard">
    <v-container fluid class="my-5">
      <span></span>
      <div>
        <h3 id="page" class="text-xs-left">Dashboard-Page</h3>
      </div>

      <v-card>
        
        <v-card-title id="serverpage" class="font-weight-bold">Server's Data
          <v-spacer></v-spacer>
        </v-card-title>
        <v-card flat v-for="project in this.projectsList" :key="project.id" :search="search">
          <v-layout row wrap :class="`pa-1 project ${project.status}`">

            <v-flex xs4 md2 sm1>
              <div class="caption grey--text">Project ID</div>
              <div>{{project.id}}</div>
            </v-flex>
            <v-flex xs4 md2 sm1>
              <div class="caption grey--text">Project Title</div>
              <div>{{project.title}}</div>
            </v-flex>
            <v-flex xs4 md2 sm1>
              <div class="caption grey--text">Person</div>
              <div>{{project.name}}</div>
            </v-flex>
            <v-flex xs4 md2 sm1>
              <div class="caption grey--text">Due Date</div>
              <div>{{formatDate(project.due)}}</div>
            </v-flex>
            <v-flex xs4 md2 sm1>
              <div class="caption grey--text">Status</div>
              <div>
                <v-chip small :class="`${project.status} white--text caption`">{{project.status}}</v-chip>
              </div>
            </v-flex>
            <v-flex xs4 md2 sm1>
              <div class="caption grey--text">Update</div>
              <div>
                <v-btn round outline flat small color="green" @click="update(project)">Accept</v-btn>
              </div>
              <v-icon dark right>check_circle</v-icon>
            </v-flex>
          </v-layout>
          <v-divider></v-divider>
        </v-card>
      </v-card>
      <div class="text-xs-center">
        <v-pagination v-model="page" :length="5" circle></v-pagination>
      </div>
    </v-container>
  </div>
</template>

<script>

import axios from 'axios';

export default {
  components: {},
  data() {
    return {
      search: "",
      projectsList:[],
      postsData: 5,
      page: 1,

      pagination: {     
        prevPage: "",
        nextPage: "",
        totalPages: "",
        from: "",
        to: "",
        total: ""
      },

      blog: {
        title: "",
        content: "",
        categories: [],
        author: ""
      }
    };
  },
   created() {
     //var myMap = new Map();
      /* eslint-disable no-console */
      this.$http.get("http://localhost:3000/api/persons/").then(function(response) {
          this.projectsList = response.data;
          console.log("%^%^%^%^%^%%^%^%^%^%^%^%^%^%^%^%"); 
          console.log(response.data); 
        }); 
    },
  methods: {
    /* eslint-disable */
    sortBy(prop) {
      this.projectsList.sort((a, b) => (a[prop] < b[prop] ? -1 : 1));
    },

    update(project) {
    // //   const _this = this; 
    // //   /* eslint-disable no-console */
    // //     //  let result = this.projects.map(({ id }) => id);
    // // this.$http.get("https://vue-project-8ca78.firebaseio.com/info.json")
    // //     .then(function(response) {
    // //       //this.blogs = data.body.slice(0, 10);
    // //       /* eslint-disable no-console */
    // //       this.projectsList = response.data;
    // //       console.log(response.data); 
    // //     }); 

         var id = project.id;
         console.log(project);
         console.log(project.subjects.school); 
         console.log(project.id);
         var result="";
         if(this.projects){
            result = this.projects.filter(obj => {
               return obj.id === id
           })
         console.log(result);
      
        }
        
      if (project.status === "Pending") {
          project.status = "Complete"; //Status Changes to Complete
          console.log("Changed the Status from Pending to Complete");
      } else if (project.status === "Complete") {
        project.status === "Overdue";
        console.log("Changed the Status from Complete to Overdue ");
      } else if (project.status === "Overdue") {
        project.status = "Pending";
        console.log("Changed the Status from Overdue to Pending");
      } 
      /* eslint-disable no-console */
    },

    formatDate(date){
      var date = new Date(date);
      var newdate= (date.getMonth() + 1) + '/' + date.getDate() + '/' +  date.getFullYear();
      return newdate;

    }
  }

};
</script>

<style>
#page,
#serverpage {
  color: #ef6c00;
}

.project.Complete {
  border-left: 4px solid #3cd1c2;
}
.project.Pending {
  border-left: 4px solid orange;
}
.project.Overdue {
  border-left: 4px solid tomato;
}

.v-chip.Complete {
  background: #3cd1c2;
}

.v-chip.Overdue {
  background: tomato;
}

.v-chip.Pending {
  background: orange;
}
</style>

