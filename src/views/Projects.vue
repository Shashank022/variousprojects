<template>
  <div class="projects">
    <h1 class="subheading grey--text">This is Server's Info page</h1>

    <v-container fluid class="my-5 mx-4 mb-3">
      <div>
        <v-expansion-panel>
          <v-expansion-panel-content v-for="project in projects" :key="project.title">
            <div slot="header" class="crimson--text">{{project.title}}</div>
            <v-card>
              <v-card-text class="px-4 grey--text">
                <div class="font-weight-bold">Due by :{{project.due}}</div>
                <div>{{project.content}}</div>
              </v-card-text>
            </v-card>
          </v-expansion-panel-content>
        </v-expansion-panel>
      </div>
    </v-container>

    <v-container fluid class="my-5 mx-4 mb-3">
      <div>
        <v-expansion-panel>
          Extension of the Current Projects...
          <!-- <v-expansion-panel-title>Extension of the Current Projects...</v-expansion-panel-title> -->
          <v-expansion-panel-content v-for="project in myprojects" :key="project.title">
            <div slot="header">{{project.title}}</div>
            <v-card>
              <v-card-text class="px-4 grey--text">
                <!-- <div class="font-weight-bold">Due by :{{getPostRequest()}}</div> -->
              </v-card-text>
            </v-card>
            <v-card>
              <v-card-text class="px-4 grey--text">
                <!-- <div class="font-weight-bold">Due by :{{getPostRequest()}}</div> -->
              </v-card-text>
            </v-card>
          </v-expansion-panel-content>
        </v-expansion-panel>
      </div>
    </v-container>
  </div>
</template>

<script>
export default {

  data() {
    return {
  datasolutionIdList : [],
  projects: [
        {
          title: "Info on Windows/Linux Server",
          person: "Mallesk Kumar",
          due: "June 21st 1996",
          status: "Overdue",
          content:
            "The possible existence of unseen microbial life was suspected from ancient times such as in Jain scriptures from 6th century BC India and the 1st century BC book On Agriculture by Marcus Terentius Varro. Microbiology."
        },
        {
          title: "Info on Linux Server",
          person: "Kumaran Raja",
          due: "July 1st 2021",
          status: "Complete",
          content:
            "The possible existence of unseen microbial life was suspected from ancient times such as in Jain scriptures from 6th century BC India and the 1st century BC book On Agriculture by Marcus Terentius Varro. Microbiology."
        },
        {
          title: "Info on Windows Server",
          person: "Yadigiri",
          due: "Feb 13th 2009",
          status: "Overdue",
          content:
            "The possible existence of unseen microbial life was suspected from ancient times such as in Jain scriptures from 6th century BC India and the 1st century BC book On Agriculture by Marcus Terentius Varro. Microbiology."
        },
        {
          title: "Info on Windows/Linux/Unix Server",
          person: "Kulkarni",
          due: "Oct 29th 2007",
          status: "Complete",
          content:
            "The possible existence of unseen microbial life was suspected from ancient times such as in Jain scriptures from 6th century BC India and the 1st century BC book On Agriculture by Marcus Terentius Varro. Microbiology."
        }
      ]
    };
  },

  computed: {
    myprojects() {
      return this.projects.filter(project => {
        return project.status === "Complete";
      });
    }
  },

  methods: {

        // created() {
        //   this.$http
        //     .post("http://jsonplaceholder.typicode.com/posts")
        //     .then(function(response) {
        //       this.datasolutionIdList = (response.data);
        //       //this.blogs = data.body.slice(0, 10);
        //       /* eslint-disable no-console */
        //       console.log(response.data);
        //     });
        // },
        // getPostRequest(){
        //       this.$http.post("https://vue-project-8ca78.firebaseio.com/posts.json").then(function(response) {
        //       /* eslint-disable no-console */
        //       console.log(response.data);
        //       //console.log(title);
        //       this.datasolutionIdList = response.data;
        //       console.log(response.data);
        //       });
        //   },

          update(){
             /* eslint-disable no-console */
            console.log("Welcome to the Method Update.....");
             console.log("Welcome to the Method Update.....");
          }
  }
};
</script>