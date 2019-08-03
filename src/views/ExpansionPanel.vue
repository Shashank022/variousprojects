<template>
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
</template>
<script>
export default {
    data() {
      return {
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
        }
        ]
            }
        }
}
</script>
