<template>
  <div class="Home">
    <h1 class="subheading grey--text">Team Page</h1> 
    <v-container fluid class="my-5">
      <v-layout>
            <v-dialog
                v-model="dialog" width="500">
                <template v-slot:activator="{ on }">
                  <v-btn 
                    class="text-xs-right"
                    color="red lighten-2"
                    dark
                    v-on="on"
                  > Policy Agreement
                  </v-btn>
                </template>

                <v-card>
                  <v-card-title
                    class="headline grey lighten-2"
                    primary-title
                  >
                    Privacy Policy
                  </v-card-title>

                  <v-card-text>
                    This Privacy Policy is effective as of date and will remain in effect except with respect to any
                      changes in its provisions in the future, which will be in effect immediately after being posted on this page.
                      We reserve the right to update or change our Privacy Policy at any time and you should check this
                      Privacy Policy periodically. Your continued use of the Service after we post any modifications to the
                      
                      Privacy Policy on this page will constitute your acknowledgment of the modifications and your
                      consent to abide and be bound by the modified Privacy Policy.
                      If we make any material changes to this Privacy Policy, we will notify you either through the email
                      address you have provided us, or by placing a prominent notice on our website
                  </v-card-text>
                  <v-divider></v-divider>
                  <v-card-actions>
                    <v-spacer></v-spacer>
                    <v-btn
                      color="primary"
                      text
                      @click="dialog = false"
                    >
                      I accept
                    </v-btn>
                  </v-card-actions>
                </v-card>
              </v-dialog>
        </v-layout>
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
                    <div class="subheading">Team : {{person.team}}</div>
                </v-card-text>
                <v-btn flat color="green" @click="getallDetails(person)">Submit</v-btn>
                <v-btn flat color="grey"><v-icon small left>message</v-icon><span>Message</span></v-btn>
                <div class="text-center">
                      
                </div>
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
import axios from "axios"

export default {
  data(){
    return{
      divDisabled:false, 
      groupList:[],
      dialog: false,
    team:[
          {name:'Suresh', role:'Web Developer',avatar:'/avatar-2.png',team:'Warriors'},
          {name:'Srinivas', role:'Graphic Developer',avatar:'/avatar-1.png',team:'Targeters'},
          {name:'Kiran', role:'Client Side Developer',avatar:'/avatar-2.png',team:'Eagles'},
          {name:'Mani', role:'Server Side Developer',avatar:'/avatar-3.png',team:'Warriors'},
          {name:'Rajesh', role:'Full Stack Developer',avatar:'/avatar-4.png',team:'Hawks'},
          {name:'Rampradsad', role:'Networking Developer',avatar:'/avatar-5.png',team:'Warriors'},
          {name:'Mathuli', role:'Full Stack Developer',avatar:'/avatar-4.png',team:'Targeters'},
          {name:'Shiva Kumar', role:'Networking Developer',avatar:'/avatar-5.png',team:'Warriors'},
          {name:'Raja Kulkarni', role:'Full Stack Developer',avatar:'/avatar-3.png',team:'Hawks'},
          {name:'Rameshk', role:'Networking Developer',avatar:'/avatar-5.png',team:'Warriors'},
          {name:'Ramesh Naidu', role:'Front End & Back End Developer',avatar:'/avatar-2.png',team:'Targeters'}
        ],
    }
  },

  methods: {
    "getallDetails":function(personObj){
      const _this= this;
      /* eslint-disable no-console */
        console.log(personObj);
      // axios.post("https://teams-aa975.firebaseio.com/team.json",personObj).then(function(response){
      //       console.log(response);
      //       console.log(response.data);
      // });
    axios.get("https://teams-aa975.firebaseio.com/team.json").then(function(response){
            console.log(response.data);
            _this.groupList = response.data;
            console.log(_this.groupList);

      });
      
      JSON.stringify(this.groupList);
      this.groupList = Object.values(this.groupList);
      this.groupList = this.groupList[0];
      if(this.groupList){
        this.groupList = this.groupList.filter(obj => {
              console.log("$$$$$$$$$$$$$$$$$$$$$###########");
              console.log(obj);
              return obj;
          });
    
    }
  }
  }
  
}
</script>