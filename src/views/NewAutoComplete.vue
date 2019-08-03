<template>
        <v-container>
                <v-card>
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
                    <v-card-text>
                        Selected  Name: {{model}}
                    </v-card-text>
                    <v-btn small round color="primary" class="black--text" @click="getFormSubmitted()"> Submit</v-btn>
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
        results:[]
      };
    },

    methods:{
      getFormSubmitted(){
      /* eslint-disable no-console */
        console.log("***********");
        console.log(this.model);
    }
    }
  }
  
</script>
<style>
 
</style>
