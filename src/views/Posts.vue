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
        <tbody>
          <tr v-for="post in posts" :key="post.title">
            <td>{{post.title.rendered}}</td>
            <td>{{post.date_gmt}}</td>
          </tr>
        </tbody>
      </table>
      <v-divider></v-divider>
      <pagination
        class="justify-around-right"
        :pagination="pagination"
        @prev="--postsData.page; getPosts();"
        @next="postsData.page++; getPosts();"
      ></pagination>
    </div>

    <div></div>
    <div>
        Post Student information for the Save the Details
    </div>
 <v-form>
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
          v-model="dueby"

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
            v-model="dueby"
          ></v-text-field>
        </v-flex>
    <v-btn round color="green" class="black--text" @click="getFormSubmitted()"> Submit</v-btn>
      </v-layout>
      </v-form>

  </v-Container>
</template>
          
<script>
import pagination from "./Pagination.vue";
import axios from "axios";
export default {
  mounted() {
    this.getPosts();
  },
  components: {
    pagination: pagination
  },
  data() {
    return {
      postsUrl: "http://demo.wp-api.org/wp-json/wp/v2/posts",
      posts: [],
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
      }
    };
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
//url: https://myvueproject-d84e4.firebaseio.com/
    },
    getFormSubmitted(){

    }
     
  }
};
</script>