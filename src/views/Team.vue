<template>
  <div class="Home">
    <h1 class="subheading grey--text">Team Page</h1> 
    <v-container fluid class="my-5">
            <v-layout row wrap>
              <v-flex xs12 sm6 md4 lg3 v-for="person in team" :key="person.name">
                <v-card flat class="text-xs-center ma-3"> 
                <v-responsive class="pt-4"> 
                  <v-avatar class="grey lighten-2">
                    <img :src="person.avatar">
                  </v-avatar>
                  </v-responsive> 
                <v-card-text>
                  <div class="subheading">{{person.name}}</div>
                    <div class="subheading">{{person.role}}</div>
                </v-card-text>
                <v-btn flat color="green" @click="getallDetails(person)">Submit</v-btn>
                    <v-card-text>
                          <v-btn flat color="grey">
                              <v-icon small left>message</v-icon>
                              <span>Message</span>
                          </v-btn>
                    </v-card-text>
                </v-card>
                <span>
                    <v-expansion-panel>
                      <v-expansion-panel-content>{{person.name}}</v-expansion-panel-content>
                      <v-expansion-panel-content>{{person.role}}</v-expansion-panel-content>
                    </v-expansion-panel>
                </span>
              </v-flex>
            </v-layout>
    </v-container>
    </div>
</template>

<script>
export default {
  data(){
    return{
       divDisabled:false, 
    team:[
          {name:'Suresh', role:'Web Developer',avatar:'/avatar-2.png'},
          {name:'Srinivas', role:'Graphic Developer',avatar:'/avatar-1.png'},
          {name:'Kiran', role:'Client Side Developer',avatar:'/avatar-2.png'},
          {name:'Mani', role:'Server Side Developer',avatar:'/avatar-3.png'},
          {name:'Rajesh', role:'Full Stack Developer',avatar:'/avatar-4.png'},
          {name:'Ramesk', role:'Networking Developer',avatar:'/avatar-5.png'},
          {name:'Mathuli', role:'Full Stack Developer',avatar:'/avatar-4.png'},
          {name:'Kulkarni', role:'Networking Developer',avatar:'/avatar-5.png'},
          {name:'Raja Kulkarna', role:'Full Stack Developer',avatar:'/avatar-3.png'},
          {name:'Rameshk', role:'Networking Developer',avatar:'/avatar-5.png'}
        ]
    }
  },

  methods: {
    "getallDetails":function(personObj){
      /* eslint-disable no-console */
        console.log("Welcome to the JS Programming...");
        console.log(personObj);
    }
  }
  
}
</script>