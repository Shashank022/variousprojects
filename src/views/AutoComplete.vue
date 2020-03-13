<template>
 <v-container fluid class="my-5">
      <span></span>
            <h3 style="align">Auto Complete Functionality:</h3>
              <span>&nbsp;</span>
                <!-- <div>
                  <v-layout>
                    <v-card>
                      <v-text-field append-icon="mic" class="xs-12 sm-6" flat label="Search" prepend-inner-icon="search"></v-text-field>
                    </v-card>
                </v-layout>
              </div> -->
               
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <div>
              <v-layout>
                    <v-card>
                        <v-flex>
                              <div class="autocomplete">
                                <input type="text" @input="onChange" v-model="search" @keydown.down="onArrowDown" 
                                @keydown.up="onArrowUp" @keydown.enter="onEnter"/>
                                <ul id="autocomplete-results" v-show="isOpen"   class="autocomplete-results"> 
                                  <li class="loading" v-if="isLoading">Loading results...</li>
                                  <li v-else v-for="(result, i) in results" :key="i"  @click="setResult(result)" class="autocomplete-result"
                                    :class="{ 'is-active': i === arrowCounter }">{{ result }} </li>
                                </ul>
                            </div>
                      </v-flex>
                  </v-card>
          </v-layout>
        </div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <div>
                    <v-expansion-panel class="">
                      <v-expansion-panel-content>
                        <template v-slot:header>
                          <div>Item :search</div>
                        </template>
                        <v-card>
                          <v-card-text>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut 
                            labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris
                             nisi ut aliquip ex ea commodo consequat.
                          </v-card-text>
                        </v-card>
                      </v-expansion-panel-content>
                    </v-expansion-panel>
        </div>
        &nbsp;&nbsp;
        <!-- <v-layout>
                    <v-flex>
                            <div class="autocomplete">
                              <input type="text" @input="onChange" v-model="search" @keydown.down="onArrowDown" 
                              @keydown.up="onArrowUp" @keydown.enter="onEnter"/>
                              <ul id="autocomplete-results" v-show="isOpen"   class="autocomplete-results"> 
                                <li class="loading" v-if="isLoading">Loading results...</li>
                                <li v-else v-for="(result, i) in results" :key="i"  @click="setResult(result)" class="autocomplete-result"
                                  :class="{ 'is-active': i === arrowCounter }">{{ result }} </li>
                              </ul>
                          </div>
                    </v-flex>
        </v-layout> -->
 </v-container>
</template>

<script>
  export default {
    name: 'autocomplete',

    props: {
      items: {
        type: Array,
        required: false,
        default: () => [],
      },
      isAsync: {
        type: Boolean,
        required: false,
        default: false,
      },
    },

    data() {
      return {
        isOpen: false,
        customers: ["Ramesh",
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
        "Communicate"],
        search: '',
        isLoading: false,
        arrowCounter: 0,
        results:[]
      };
    },

    created() {
     //var myMap = new Map();
      /* eslint-disable no-console */
      this.$http.get("https://myvueproject-d84e4.firebaseio.com/info.json").then(function(response) {
          this.projectsList = response.data;
          //var listProjects=[];
          //listProjects = this.projectsList;
          //console.log(this.projectsList);
          //console.log(listProjects);
            //const unique = listProjects.filter(function(elem, index, self) {
                  //   console.log("**************************************************************");
                  // console.log(elem);
                  //   console.log(index);
                  //   console.log(self);
                  //   return index === self.indexOf(elem);
               // });
                   //console.log(unique);
      });
    },

    methods: {

      onChange() {
       /* eslint-disable no-console */
       this.isOpen=true;
        this.$emit('input', this.search);
        this.results = this.customers.filter(item => item.toLowerCase().indexOf(this.search.toLowerCase()) > -1);
        console.log(this.results);
        return this.results;
      },

      setResult(result) {
        this.search = result;
        this.isOpen = false;
      },
      onArrowDown() {
              /* eslint-disable no-console */
        if (this.arrowCounter < this.results.length) {
          this.arrowCounter = this.arrowCounter + 1;
          console.log("+++++++++++++++++@@@@@@@@@@@@@@@@@@@@@@@- Stage Arrow Down");
          console.log(this.arrowCounter);
        }
      },
      onArrowUp() {
                      /* eslint-disable no-console */
        if (this.arrowCounter > 0) {
          this.arrowCounter = this.arrowCounter -1;
          console.log("+++++++++++++++++@@@@@@@@@@@@@@@@@@@@@@@- Stage Arrow Up");
          console.log(this.arrowCounter);
        }
        
      },
      onEnter() {

        /* eslint-disable no-console */
        this.search = this.results[this.arrowCounter];
        this.isOpen = false;
        this.arrowCounter = -1;
        console.log("+++++++++++++++++@@@@@@@@@@@@@@@@@@@@@@@- Stage Enter");
        console.log(this.search);
      },
      handleClickOutside(evt) {
        if (!this.$el.contains(evt.target)) {
          this.isOpen = false;
          this.arrowCounter = -1;
        }
      },
      addProjectNameList(){
        console.log(this.projectsList);
        // for(project in this.projectsList){
        //     //console.log(project);
        // }
      },
      reset(){
        this.results="";
      }
    },
    watch: {
      items: function (val, oldValue) {
        // actually compare them
        if (val.length !== oldValue.length) {
          this.results = val;
          this.isLoading = false;
        }
      },
    },
    mounted() {
      document.addEventListener('click', this.handleClickOutside)
    },
    destroyed() {
      document.removeEventListener('click', this.handleClickOutside)
    }
  };
</script>
<style>
  .autocomplete {
    position: relative;
  }

  .autocomplete-results {
    padding: 0;
    margin: 1;
    border: 1px solid #a19696;
    height: 100px;
    overflow: auto;
    width: 100%;
  }

  .autocomplete-result {
    list-style: none;
    text-align: left;
    padding: 4px 2px;
    cursor: pointer;
  }

  .autocomplete-result.is-active,
  .autocomplete-result:hover {
    background-color: #a19696;
    color: white;
  }

  .autocomplete{
    border: 0.5px solid black;
    width:500px;
    /* align-content: space-around; */
  }

</style>
