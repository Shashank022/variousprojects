<template>
  <div class="Home">
    <h1 class="subheading grey--text">Setting's Page</h1> 
    <v-container fluid class="my-5">
        <h2 class="orange--text">The Server Config's:</h2>
        <table>
            <tr>
                <td>The Windows Server:</td>
                <td>  <v-switch v-model="windowsSwitch">
                        <template v-slot:label>
                            ON/OFF: 
                            <v-progress-circular :indeterminate="windowsSwitch" :value="1" size="18" class="ml-2"></v-progress-circular>
                        </template>
                      </v-switch></td>
            </tr>
            <tr>
                <td>The Windows/Linux Server:</td>
                 <td>  <v-switch v-model="unixSwitch">
                        <template v-slot:label>
                            ON/OFF: 
                            <v-progress-circular :indeterminate="unixSwitch" :value="0" size="18" class="ml-2"></v-progress-circular>
                        </template>
                      </v-switch></td>
            </tr>

            <tr>
                <td>The Windows/UNIX Server:</td>
                 <td>  <v-switch v-model="unixWinSwitch">
                        <template v-slot:label>
                            ON/OFF: 
                            <v-progress-circular :indeterminate="unixWinSwitch" :value="0" size="18" class="ml-2"></v-progress-circular>
                        </template>
                      </v-switch></td>
            </tr>

            <tr>
                <td>The COBAL/Windows Server:</td>
                 <td>  <v-switch v-model="unixCobSwitch">
                        <template v-slot:label>
                            ON/OFF: 
                            <v-progress-circular :indeterminate="unixCobSwitch" :value="0" size="18" class="ml-2"></v-progress-circular>
                        </template>
                      </v-switch></td>
            </tr>

            <tr>
                <td>The Linux/Windows Server:</td>
                 <td>  <v-switch v-model="unixLinSwitch">
                        <template v-slot:label>
                            ON/OFF: 
                            <v-progress-circular :indeterminate="unixLinSwitch" :value="0" size="18" class="ml-2"></v-progress-circular>
                        </template>
                      </v-switch></td>
            </tr>

            <tr>
                <td>The Solaris/Windows Server:</td>
                 <td>  <v-switch v-model="unixLinSwitch">
                        <template v-slot:label>
                            ON/OFF: 
                            <v-progress-circular :indeterminate="unixLinSwitch" :value="0" size="18" class="ml-2"></v-progress-circular>
                        </template>
                      </v-switch></td>
            </tr>

            
        </table>
        
      
    </v-container>
  </div>
</template>

<script>
export default {
  data(){
      return{
          windowsSwitch: false,
          unixSwitch:false,
          unixWinSwitch:false,
          unixLinSwitch:false,
          unixCobSwitch:false,
      }
  }
}
</script>