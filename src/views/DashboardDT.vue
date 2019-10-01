<template>
  <div class="dashboard">
    <v-container fluid class="my-5">
      <span></span>
      <div class="no-print">
        <h3 id="page" class="text-xs-left">DB - Data Table</h3>
      </div>
      <span class="no-print">
        <div class="text-xs-right">
          <v-layout>
            <v-dialog
                v-model="dialog" width="500">
                <template v-slot:activator="{ on }">
                  <v-btn  class="text-xs-right" color="red lighten-2" dark
                    v-on="on"
                    @click="getAllDetails()"> Genrate URL</v-btn>
                </template>

                <v-card>
                  <v-card-title
                    class="headline grey lighten-2"
                    primary-title> Copy the URL
                  </v-card-title>
                  <v-card-text>
                      {{fullUrl}}
                  </v-card-text>
                  <v-divider></v-divider>
                  <v-card-actions>
                    <v-spacer></v-spacer>
                    <v-btn
                      color="primary"
                      text
                      @click="saveApprovedApplication">
                      Approve
                    </v-btn>
                    <v-btn  color="primary"  text @click="dialog = false">
                      Close
                    </v-btn>
                  </v-card-actions>
                </v-card>
              </v-dialog>
        </v-layout>
          <v-tooltip bottom>
             <template v-slot:activator="{ on }">
                  <v-btn color="primary" dark v-on="on" @click="printMyPage()"><v-icon>print</v-icon></v-btn>
            </template>
          <span>Print</span>
          </v-tooltip>
      </div>
      </span>
      <v-card>
        <span class="no-print">
        <v-card-title id="serverpage" class="font-weight-bold">Server's Data
          <v-spacer></v-spacer>
          <v-text-field
            v-model="search"
            append-icon="search"
            label="Search"
            single-line
            hide-details
          ></v-text-field>
        </v-card-title>
        </span>
        <v-data-table  
            v-model="selected"
            :headers="headers" 
            :items="projects" 
            :search="search"
            :pagination.sync="pagination"
            select-all>
          <template v-slot:items="props">
            <td><v-checkbox
                v-model="props.selected"
                primary
                hide-details
              ></v-checkbox>
              </td>
            <td>{{ props.item.title }}</td>
            <td>{{ props.item.person }}</td>
            <td>{{ props.item.due }}</td>
            <td>{{ props.item.status }}</td>
            <td>{{ props.item.id }}</td>
            <td>{{ props.item.subjects.name }}</td>
            <td>{{ props.item.subjects.rollNo }}</td>
            <td>{{ props.item.subjects.class }}</td>
            <td>{{ props.item.subjects.school }}</td>
          </template>
          <v-alert
            v-slot:no-results
            :value="true"
            color="error"
            icon="warning"
          >Your search for "{{ search }}" found no results.</v-alert>
        </v-data-table>
        </v-card>
        <span class="no-print">
         <div class="text-xs-right">
          <v-btn round color="primary" dark @click="clearAllSelected">Clear</v-btn>
          <v-btn round color="primary" dark @click="getAllSelected">Submit</v-btn>
        </div>
        </span>
         <div v-if="selectedRowList.length > 0">
            <v-card>
              <v-card-title class="title primary--text"> Detail's Of Servers</v-card-title>
              <v-card-text>
                
                <v-layout>
                          <div v-for="selc in selectedRowList" :key="selc.id">
                            <div>
                                <v-flex xs6>
                                  <span> <strong>ID:</strong> {{selc.id}}</span>
                                </v-flex>
                            </div>
                            <div>
                              <v-flex xs6>
                                <span> <strong>Due By: </strong> {{selc.due}}</span>
                                </v-flex>
                            </div>
                            <div>
                              <v-flex xs6>
                                <span> <strong> Name: </strong> {{selc.person}}</span>
                                </v-flex>
                              </div>
                              <div>
                                <v-flex xs6>
                                  <span> <strong>Lab Server Data:</strong> {{selc.title}}</span>
                                  </v-flex>
                              </div>
                              </div>
                        </v-layout>
              </v-card-text>
            </v-card>
          </div>
    </v-container>  
  </div>
</template>

<script>
import axios from "axios";

export default {
  components: {},
  data() {
    return {
      search: "",
      dialog:"",
      selected: [],
      listofSelectedList:[],
      fullUrl:"",
      selectedRowList: [],
  headers: [
        {
          text: "Server Name",
          align: "left",
          sortable: true,
          value: "name"
        },
        { text: "Person", value: "person" },
        { text: "Due Date", value: "due" },
        { text: "Status", value: "status" },
        { text: "ID", value: "id" },
        { text: "Subject", value: "update" },
        { text: "Roll No", value: "id" },
        { text: "Class", value: "update" },
        { text: "School", value: "id" },
      ],
      pagination: {
                rowsPerPage: 5,
                page: 1
            },
      projects: [
        {
          title: "Windows Server",
          person: "Ramesh",
          due: "Dec 20, 2019",
          status: "Pending",
          id: "401",
          subjects: {
            name: "Electronics",
            rollNo: "4564654",
            class: "III year",
            school: "Vardhaman Engg College"
          }
        },
        {
          title: "Unix Server",
          person: "Suresh",
          due: "Mar 25, 2019",
          status: "Overdue",
          id: "402",
          subjects: {
            name: "Mechanical",
            rollNo: "4564654",
            class: "III year",
            school: "Vardhaman Engg College"
          }
        },
        {
          title: "Linux Server",
          person: "Kamlesh",
          due: "Jun 13, 2023",
          status: "Complete",
          id: "403",
          subjects: {
            name: "Automative",
            rollNo: "4564654",
            class: "III year",
            school: "Vardhaman Engg College"
          }
        },
        {
          title: "Linux/Unix Server",
          person: "Rakesh",
          due: "Jan 23, 2019",
          status: "Pending",
          id: "404",
          subjects: {
            name: "Mechanical",
            rollNo: "4564654",
            class: "III year",
            school: "Vardhaman Engg College"
          }
        },
        {
          title: "Windows/Linux Server",
          person: "Rajakauamr",
          due: "Dec 20, 2018",
          status: "Overdue",
          id: "405",
          subjects: {
            name: "Audio",
            rollNo: "4564654",
            class: "III year",
            school: "Vardhaman Engg College"
          }
        },
        {
          title: "Windows/Unix Server",
          person: "Kumaran",
          due: "Sep 20, 2021",
          status: "Complete",
          id: "406",
          subjects: {
            name: "Mechanical",
            rollNo: "4564654",
            class: "III year",
            school: "Vardhaman Engg College"
          }
        },
        {
          title: "Unix/Linux Server",
          person: "Mahesh",
          due: "May 12, 2023",
          status: "Overdue",
          id: "407",
          subjects: {
            name: "Neuclear",
            rollNo: "4564654",
            class: "III year",
            school: "Vardhaman Engg College"
          }
        },
        {
          title: "Linux/Linux Server",
          person: "Karthik",
          due: "Oct 12 2019",
          status: "Pending",
          id: "408",
          subjects: {
            name: "Petroleum",
            rollNo: "4564654",
            class: "III year",
            school: "Vardhaman Engg College"
          }
        },
        {
          title: "Unix/Unix Servers",
          person: "Sreenath",
          due: "Oct 12 2019",
          status: "Complete",
          id: "409",
          subjects: {
            name: "Mechanical",
            rollNo: "4564654",
            class: "III year",
            school: "Vardhaman Engg College"
          }
        },
        {
          title: "Linux/COBOL Servers",
          person: "Srikanth",
          due: "May 11 2023",
          status: "Pending",
          id: "410",
          subjects: {
            name: "Eletronic Engineering",
            rollNo: "4564654",
            class: "III year",
            school: "Vardhaman Engg College"
          }
        },
        {
          title: "Linux/Windows Servers",
          person: "Srikar",
          due: "Jul 12 2020",
          status: "Complete",
          id: "411",
          subjects: {
            name: "Materials Science Engineering",
            rollNo: "4564654",
            class: "III year",
            school: "Vardhaman Engg College"
          }
        },
        {
          title: "Linux/Windows/Unix Servers",
          person: "KamleshKumar",
          due: "Mar 12 2019",
          status: "Overdue",
          id: "434",
          subjects: {
            name: "Eletrical Engineering",
            rollNo: "4564654",
            class: "III year",
            school: "Vardhaman Engg College"
          }
        },
        {
          title: " COBOL/Unix/Windows Servers",
          person: "Kumaran",
          due: "Jul 12 2019",
          status: "Complete",
          id: "412",
          subjects: {
            name: "Mechanical",
            rollNo: "4564654",
            class: "III year",
            school: "Vardhaman Engg College"
          }
        },
        {
          title: " COBOL/Unix Servers",
          person: "Kumaran",
          due: "Jul 12 2019",
          status: "Complete",
          id: "433",
          subjects: {
            name: "Eletrical Engineering",
            rollNo: "4564654",
            class: "III year",
            school: "Vardhaman Engg College"
          }
        },
        {
          title: "Solaris/Windows/Unix Server",
          person: "Ramesh",
          due: "Dec 20, 2019",
          status: "Pending",
          id: "413",
          subjects: {
            name: "Mechanical",
            rollNo: "4564654",
            class: "III year",
            school: "Vardhaman Engg College"
          }
        },
        {
          title: "Solaris Server",
          person: "Suresh",
          due: "Mar 25, 2019",
          status: "Overdue",
          id: "414",
          subjects: {
            name: "Law",
            rollNo: "4564654",
            class: "III year",
            school: "Vardhaman Engg College"
          }
        },
        {
          title: "Solaris/Windows Server",
          person: "Kamlesh",
          due: "Jun 13, 2023",
          status: "Complete",
          id: "415",
          subjects: {
            name: "Mining and Geological Engineering",
            rollNo: "4564654",
            class: "III year",
            school: "Vardhaman Engg College"
          }
        },
        {
          title: "Solaris/Unix Server",
          person: "Rakesh",
          due: "Jan 23, 2019",
          status: "Pending",
          id: "416",
          subjects: {
            name: "Information Systems",
            rollNo: "4564654",
            class: "III year",
            school: "Vardhaman Engg College"
          }
        },
        {
          title: "Solaris/Linux Server",
          person: "Rajakauamr",
          due: "Dec 20, 2018",
          status: "Overdue",
          id: "417",
          subjects: {
            name: "Molecular Engineering",
            rollNo: "4564654",
            class: "III year",
            school: "Vardhaman Engg College"
          }
        },
        {
          title: "Windows/Solaris Server",
          person: "Kumaran",
          due: "Sep 20, 2021",
          status: "Complete",
          id: "418",
          subjects: {
            name: "Mynastics",
            rollNo: "4564654",
            class: "III year",
            school: "Vardhaman Engg College"
          }
        },
        {
          title: "Unix/Solaris Server",
          person: "Mahesh",
          due: "May 12, 2023",
          status: "Overdue",
          id: "419",
          subjects: {
            name: "mechanical",
            rollNo: "4564654",
            class: "III year",
            school: "Vardhaman Engg College"
          }
        },
        {
          title: "Linux/Solaris Server",
          person: "Karthik",
          due: "Oct 12 2019",
          status: "Pending",
          id: "420",
          subjects: {
            name: "BioMedical",
            rollNo: "4564654",
            class: "III year",
            school: "Vardhaman Engg College"
          }
        },
        {
          title: "Solaris/Solaris Servers",
          person: "Sreenath",
          due: "Oct 12 2019",
          status: "Complete",
          id: "421",
          subjects: {
            name: "Thermal Engineering",
            rollNo: "4564654",
            class: "III year",
            school: "Vardhaman Engg College"
          }
        },
        {
          title: "Solaris/COBOL Servers",
          person: "Srikanth",
          due: "May 11 2023",
          status: "Pending",
          id: "422",
          subjects: {
            name: "Physics",
            rollNo: "4564654",
            class: "III year",
            school: "Vardhaman Engg College"
          }
        },
        {
          title: "Linux/Solaris/Windows Servers",
          person: "Srikar",
          due: "Jul 12 2020",
          status: "Complete",
          id: "423",
          subjects: {
            name: "mechanical",
            rollNo: "4564654",
            class: "III year",
            school: "Vardhaman Engg College"
          }
        },
        {
          title: "Linux/Windows/Solaris Servers",
          person: "KamleshKumar",
          due: "Mar 12 2019",
          status: "Overdue",
          id: "424",
          subjects: {
            name: "Aeuronautical",
            rollNo: "4564654",
            class: "III year",
            school: "Vardhaman Engg College"
          }
        },
        {
          title: " COBOL/Unix/Windows/Host Servers",
          person: "Kumaran",
          due: "Jul 12 2019",
          status: "Complete",
          id: "425",
          subjects: {
            name: "mechanical",
            rollNo: "4564654",
            class: "III year",
            school: "Vardhaman Engg College"
          }
        },
        {
          title: " Unix/COBOL/Windows/SOLARIS/Host Servers",
          person: "Rangarajan",
          due: "Jul 16 2022",
          status: "Pending",
          id: "446",
          subjects: {
            name: "Chemical",
            rollNo: "98989898",
            class: "IV year",
            school: "Vardhman Engg College"
          }
        },
        {
          title: " Unix/COBOL/Windows/SOLARIS 4.561/Host Servers",
          person: "Abdul Kalam",
          due: "Jul 16 2029",
          status: "Complete",
          id: "447",
          subjects: {
            name: "Astro Physics",
            rollNo: "26356752",
            class: "IV year",
            school: "Vikram Sarabhai Space Centre"
          }
        }
      ],

      newEntry:[{
          title: " Host Servers",
          person: "Kumaran Rajan",
          due: "Jul 12 2020",
          status: "Complete",
          id: "525",
          subjects: {
            name: "chemical",
            rollNo: "2364654",
            class: "II year",
            school: "Engg College"
          }
        }],
      postsData: 5,
      page: 1,

      blog: {
        title: "",
        content: "",
        categories: [],
        author: ""
      }
    };
  },
  methods: {

    created() {
      axios.post("http://jsonplaceholder.typicode.com/posts")
        .then(function(data) {
          this.blogs = data.body.slice(0, 10);
          /* eslint-disable no-console */
          console.log(data);
        });
    },

    update(id) {
      /* eslint-disable no-console */
      console.log(this.projects.id);
      console.log(this.projects);
      console.log(status);
      if (this.projects.status === "Pending") {
        // status = "Complete";
        this.projects.status = "Complete";
        console.log("Changed the Status from Pending to Complete");
      } else if (this.projects.status === "Complete") {
        // status = "Overdue";
        this.projects.status = "Complete";
        console.log("Changed the Status from Complete to Overdue ");
      } else if (status === "Overdue") {
        //status = "Pending";
        this.projects.status = "Complete";

        console.log("Changed the Status from Overdue to Pending");
      }
      /* eslint-disable no-console */
      return status;
    },
    getAllSelected(){
          const selectedRow = this.selected;
          console.log(selectedRow);
          this.selectedRowList = selectedRow;
          console.log("----------------");
          console.log(this.selectedRowList);
    },

    getAllDetails(){
          console.log("Genrated URL will br on print......");
          //var path = this.$router.resolve({name: 'team', params: {id: 1}}).href
          this.fullUrl = document.URL + "?";
          const _this = this;
          console.log(_this.$route.querys);
          console.log(this.fullUrl);
          console.log(this.selected);
         // var selectedciId = obj.options[obj.selectedIndex];
        
        for(var i=0; i< this.selected.length;i++){
            console.log(this.selected[i].id);
            this.fullUrl+= "&selectedItem="+ this.selected[i].id;
          }
          console.log(this.fullUrl);
          console.log(this.selected);
    },
        clearAllSelected(){
          this.selected = [];
          this.selectedRowList=[];
    },
      printMyPage(){
      console.log(document.getElementsByClassName('header-footer'));
      document.getElementsByClassName('header-footer').checked = false;
      window.print();
    },
    generateUrl(){

    },

    saveApprovedApplication(){
      console.log("#######################");
    }
  },
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

@media print {
   .no-print {
       display: none;
    }
    .example-print {
       display: block;
    }
}

@page  
{ 
  position: relative;; 
  margin-left: 0.01%;  
  margin-right: 0.01%;  
  margin-top: 0.01%;  
  margin-bottom: 0.01%;  
  size: 0ch;

} 
</style>

