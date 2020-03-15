<template>
  <div class="datapost">
    <v-container fluid class="my-5">
      <span></span>
      <div>
        <h3 id="page" class="text-xs-left">Data Post-Page</h3>
      </div>
      <v-card>
        
        <v-card-title id="serverpage" class="font-weight-bold">Server's Data
          <v-spacer></v-spacer>
        </v-card-title>
        <v-card flat v-for="project in projects" :key="project.id" :search="search">
          <v-layout row wrap :class="`pa-1 project ${project.status}`">

            <v-flex xs4 md2 sm1>
              <div class="caption grey--text">Project ID</div>
              <div>{{project.id}}</div>
            </v-flex>
            <v-flex xs4 md2 sm1>
              <div class="caption grey--text">Project Title</div>
              <div>{{project.title}}</div>
            </v-flex>
            <!-- <v-flex xs4 md2 sm1>
              <div class="caption grey--text">Person</div>
              <div>{{project.person}}</div>
            </v-flex> -->
            <v-flex xs4 md2 sm1>
              <div class="caption grey--text">Due Date</div>
              <div>{{project.due}}</div>
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
                <v-btn round outline flat small color="green" @click="removeProduct(project.id)">Delete</v-btn>
              </div>
              <v-icon dark right>check_circle</v-icon>
              <Popup/>
            </v-flex>
                        <v-flex xs4 md2 sm1>
              <div class="caption grey--text">Post Data to Server</div>
              <div>
                <v-btn round outline flat small color="green" @click="postDatatoProject(project)">Post Data</v-btn>
              </div>
              <v-icon dark right>check_circle</v-icon>
              <Popup/>
            </v-flex>
          </v-layout>
          <v-divider></v-divider>
        </v-card>
      </v-card>
    </v-container>
  </div>
</template>

<script>
import Popup from "./Popup";

export default {
  components: { Popup },
  data() {
    return {
      search: "",
      projectsList:[],
      projects: [
        {
          title: "Windows Server",
          person: "Ramesh",
          due: "Dec 20, 2019",
          status: "Overdue",
          id: "401",
          subjects: {
            name: "mechanical",
            rollNo: "4564654",
            class: "III year",
            school: "Vardhaman Engg College"
          }
        },
        {
          title: "Windows 10 Server",
          person: "Kumar",
          due: "Dec 20, 2019",
          status: "Pending",
          id: "403",
          subjects: {
            name: "mechanical",
            rollNo: "4564654",
            class: "III year",
            school: "Vardhaman Engg College"
          }
        },
        {
          title: "Linux Server",
          person: "Mathesh",
          due: "Dec 29, 2019",
          status: "Complete",
          id: "402",
          subjects: {
            name: "mechanical",
            rollNo: "4564654",
            class: "III year",
            school: "Vardhaman Engg College"
          }
        },
      ],
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
      /* eslint-disable no-console */
      this.$http.get("https://data-project-3c4fe.firebaseio.com/datainfo.json").then(function(response) {
          //this.blogs = data.body.slice(0, 10);
          /* eslint-disable no-console */
          this.projectsList = response.data;
          console.log(response.data); 
           console.log(this.projectsList); 
        }); 
     console.log(this.projectsList);
    },

  methods: {
    /* eslint-disable */
    sortBy(prop) {
      this.projects.sort((a, b) => (a[prop] < b[prop] ? -1 : 1));
    },

    update(project) {
      /* eslint-disable no-console */
        //  let result = this.projects.map(({ id }) => id);
        var id = project.id;
        console.log(project);
        console.log(project.subjects.school);
        console.log(project.id);
        var result = this.projects.filter(obj => {
          return obj.id === id
          })
        console.log(result);
      
      if (result[0].status === "Pending") {
          result[0].status = "Complete"; //Status Changes to Complete
          console.log("Changed the Status from Pending to Complete");
      } else if (result[0].status === "Complete") {
        result[0].status === "Overdue";
        console.log("Changed the Status from Complete to Overdue ");
      } else if (result[0].status === "Overdue") {
        result[0].status = "Pending";
        console.log("Changed the Status from Overdue to Pending");
      }
      /* eslint-disable no-console */
    },
    postDatatoProject(project){
      /* eslint-disable no-console */
          this.$http.post("https://data-project-3c4fe.firebaseio.com/datainfo.json",project).then(function(data) {
          // JSON responses are automatically parsed.
            console.log(data);
            this.projectsList = response.data;
          })
              .catch(e => {
                //this.errors.push(e) 
          });    
      console.log(this.projectsList); 
    },
  
  deleteDatainProject(project){
      /* eslint-disable no-console */

      console.log(this.projectsList)

        var result = this.projects.filter(obj => {
          console.log(obj);
          this.$http.patch("https://data-project-3c4fe.firebaseio.com/datainfo.json",obj)
          .then(function(data) {
          // JSON responses are automatically parsed.
            console.log(data);
            this.projectsList = response.data;
          })
              .catch(e => {
                //this.errors.push(e) 
          }) 
          }); 
    },
    removeProduct: function (project) {

      console.log(project);
      console.log(this.projectsList);

      var result = this.projectsList.filter(obj => {
          if(obj.id === id){
            console.log(obj.id+ "@@@@@@@@@@@@@@@@");
               var rowId = $row.data('id');
              rootRef.child(rowId).remove();
          }
          });
      console.log(result); 

     
        JSON.stringify(this.projectsList);
              this.projectsList = Object.values(this.projectsList);
              this.personList = this.projectsList.filter(obj => {
                  if(obj.person === this.model){
                    console.log(obj);
                      return obj;
                  }
                  });



  // removeProduct: function (project) {
  //   var currentRef = database.ref('id/' + project.id);
  //   currentRef.remove();
  //   console.log("Product deleted successfully");
  // }
      //console.log(this.projectsList); 
  },
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

