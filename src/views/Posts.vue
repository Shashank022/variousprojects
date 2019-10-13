<template>
  <v-Container>
    <div>
      <h1 class="subheading grey--text">Post's page</h1>
      <v-divider></v-divider>
      <table class="table is-bordered">
        <thead>
          <tr>
            <th>Title</th>
            <th>Posted at</th>
          </tr>
        </thead>
        <!-- <tbody>
          <tr v-for="post in posts" :key=post.title>
            <td>{{post.title.rendered}}</td>
            <td>{{post.date_gmt}}</td>
          </tr>
        </tbody> -->
      </table>
      <v-divider></v-divider>
      <!-- <pagination
        class="justify-around-right"
        :pagination="pagination"
        @prev="--postsData.page; getPosts();"
        @next="postsData.page++; getPosts();"
      ></pagination> -->
    </div>

    <div></div>
    <div>
        Post Student information for the Save the Details
    </div>
 <v-layout row wrap>
        <v-flex xs12 md4 sm2 >
          <v-menu>
         <template v-slot:activator="{ on }">
          <v-text-field
            v-model="dueby"
            label="Due By"
            prepend-icon="event"
            readonly
            v-on="on"
          ></v-text-field>
        </template>
        <v-date-picker v-model="dueby" @input="menu2 = false" ></v-date-picker>
      </v-menu>
        </v-flex>

        <v-flex xs12 md4 sm2>
          <v-text-field
          label="ID"
          v-model="id"
          ></v-text-field>
        </v-flex>

      <v-flex xs12 md4 sm2>
          <v-text-field
            label="Person"
            v-model="person"
          ></v-text-field>
        </v-flex>

        <v-flex xs12 md4 sm2 >
          <v-text-field
            label="Status"
            v-model="status"
          ></v-text-field>
        </v-flex>

        <v-flex xs12 md4 sm2>
          <v-text-field
            label="Subjects"
            v-model="subjects"
          ></v-text-field>
        </v-flex>
        
      <v-flex xs12 md4 sm2>
          <v-text-field
            label="Title"
            v-model="title"
          ></v-text-field>
        </v-flex>
    <v-btn round color="green" class="black--text" @click="getFormSubmitted()">Submit</v-btn>
        <v-btn round color="green" class="black--text" @click="ClearAll()">Clear</v-btn>

      </v-layout>
      <div v-if="showDivnow">
        <v-layout>
            The Record has been sucessfully saved.......!!!
        </v-layout>
      </div>
      <!-- <div v-else>
        <v-layout>
            The Record is already exissited on the Account.......!!!
        </v-layout>
      </div> -->
      <div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
      <div>
        <v-layout>
          <v-flex xs12 md4 sm2>
                <strong>Search for the Zip Code : </strong><v-text-field label="Zip Code" v-model="startingZipCode"></v-text-field>
          </v-flex>
          <v-flex><strong> City, State, Country : </strong>{{this.startingCity}}</v-flex>
        </v-layout>
                  <v-flex><v-btn round small color="green" class="black--text" @click="clear()">Clear</v-btn></v-flex>

      </div>
  </v-Container>
</template>
          
<script>
//import pagination from "./Pagination.vue";
import axios from "axios";
import _ from 'lodash';

export default {
  mounted() {
    this.getPosts();
  },
  components: {
    //pagination: pagination
  },
  data() {
    return {
      postsUrl: "http://demo.wp-api.org/wp-json/wp/v2/posts",
      posts: [],
      customerList:[],
      showDivnow:false,
      startingZipCode:'',
      startingCity:'',
      picker: new Date().toISOString().substr(0, 10),
      landscape: false,
      reactive: false,
      postsData: {
        per_page: 10,
        page: 1
      },
      pagination: {
        prevPage: "",
        nextPage: "",
        totalPages: "",
        from: "",
        to: "",
        total: ""
      },
      id:"",
      dueby:"",
      status:"",
      person:"",
      subjects:"",
      title:"",
    };
  },
  created(){
    //this.showDivnow = true;
  },

  watch:{
      startingZipCode:function(){
      /* eslint-disable no-console */
        //this.startingZipCode = '';
        console.log(this.startingZipCode);
        if(this.startingZipCode.length === 5){
              this.lookZipCode();
        }
      }
  },  
  methods: {
    getPosts() {
      /* eslint-disable no-console */
      axios
        .get(this.postsUrl, { params: this.postsData })
        .then(response => {
          this.posts = response.data;
          console.log(this.posts);
          this.configPagination(response.headers);
        })
        .catch(error => {
          console.log(error);
        });
    },
    configPagination(headers) {
      /* eslint-disable no-console */
      console.log(headers);
      this.pagination.total = +headers["x-wp-total"];
      this.pagination.totalPages = +headers["x-wp-totalpages"];
      this.pagination.from = this.pagination.total
        ? (this.postsData.page - 1) * this.postsData.per_page + 1
        : " ";
      this.pagination.to =
        this.postsData.page * this.postsData.per_page > this.pagination.total
          ? this.pagination.total
          : this.postsData.page * this.postsData.per_page;
      this.pagination.prevPage =
        this.postsData.page > 1 ? this.postsData.page : "";
      this.pagination.nextPage =
        this.postsData.page < this.pagination.totalPages
          ? this.postsData.page + 1
          : "";
    },
    createPosts(){
            //url: https://myvueproject-d84e4.firebaseio.com  /
    },
    getFormSubmitted(){
      let _this = this;
      if(this.dueby){
      axios.get("https://teams-aa975.firebaseio.com/newformdata.json").then(function(response){
          _this.customerList = response.data;
          console.log(response.data);
        });

        for(var i=0; i< _this.customerList;i++){
          if(this.id === _this.customerList[i].id){
                this.showDivnow = true;
                console.log(this.dueby);
                console.log(this.id);
                console.log(this.person);
                console.log(this.status);
                console.log(this.subjects);
                console.log(this.title);
                const jsonSend = {};
                jsonSend.dueby = this.dueby;
                jsonSend.dueby = this.id;
                jsonSend.dueby = this.person;
                jsonSend.dueby = this.status;
                jsonSend.dueby = this.subjects;
                jsonSend.dueby = this.title;

          axios.post("https://teams-aa975.firebaseio.com/newformdata.json",jsonSend).then(function(response){
                console.log(response.data);
                });
          } else {
            this.showDivnow = false;
          }
      }
   }
},


    ClearAll(){
      this.showDivnow = false;
      this.dueby ="";
      this.id ="";
      this.person ="";
      this.status ="";
      this.subjects ="";
      this.title ="";
    },


    clear(){
      this.startingZipCode = "";
      this.startingCity = "";
    },


    "lookZipCode": _.debounce(function(){
        //this.startingZipCode = "Searching....";
        /* eslint-disable */ 
        console.log(this.startingZipCode);
        const _this = this;
        axios.get('http://ziptasticapi.com/' + this.startingZipCode).then(function(response){
              response.startingCity = response.data.city +', '+ response.data.state ;
              _this.startingCity= response.data.city +', '+ response.data.state +', '+ response.data.country; 

              console.log(response.data);
              console.log(response.startingCity);
        }).catch(function(error){
            response.startingCity = "Invalid Zip Code";
        });
    },500)
 
  }
};
</script>