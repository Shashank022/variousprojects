<template>
  <nav>
    <v-toolbar flat app class="light-green">
      <v-toolbar-side-icon class="black--text" @click="drawer = !drawer"></v-toolbar-side-icon>
      <v-toolbar-title class="text-uppercase black--text">
        <span class="font-weight-light">Serv</span>
        <span>-Manager</span>
      </v-toolbar-title>
      <!-- <v-toolbar-text><span>[A Server Config Tool]</span></v-toolbar-text> -->
      <v-spacer></v-spacer>

      <!-- Dropdown Menu -->
      <v-menu offset-y>
        <v-btn flat slot="activator">
          <v-icon>expand_more</v-icon>
          <span>Menu</span>
        </v-btn>
        <v-list>
          <v-list-tile v-for="link in links" :key="link.text" router :to="link.route">
            <v-list-tile-title>{{link.text}}</v-list-tile-title>
          </v-list-tile>
        </v-list>
      </v-menu>

      <v-btn flat color="black">
        <span>Login</span>
        <v-icon right>exit_to_app</v-icon>
      </v-btn>
      <v-btn flat color="black">
        <span>Sign out</span>
        <v-icon right>exit_to_app</v-icon>
      </v-btn>
    </v-toolbar>
    <v-navigation-drawer v-model="drawer" app class="primary">
      <v-icon></v-icon>
      <v-list>
        <v-layout column align-center>
          <v-flex class="mt-2">
            <v-avatar size="75">
              <img class="text-lg-left" src="/server.jpg">
            </v-avatar>
            <p class="black--text subheading mt-1">Server Config</p>
          </v-flex>
        </v-layout>
        <v-list-tile v-for="link in links" :key="link.text" roter :to="link.route">
          <v-list-tile-action>
            <v-icon class="black--text">{{link.icon}}</v-icon>
          </v-list-tile-action>
          <v-list-tile-title class="black--text">{{link.text}}</v-list-tile-title>
          <v-list-tile-content></v-list-tile-content>
        </v-list-tile>
      </v-list>
    </v-navigation-drawer>
  </nav>
</template>

<script>

export default {
  data() {
    return {
      drawer: false,
      links: [
        { icon: "dashboard", text: "Dashboard", route: "/" },
        { icon: "folder", text: "Servers", route: "/projects" },
        { icon: "person", text: "Team", route: "/team" },
        { icon: "local_post_office", text: "Posts", route: "/posts" },
        { icon: "settings", text: "Settings", route: "/settings" },
        { icon: "data_usage", text: "DataTable", route: "/datatable" },
        { icon: "burst_mode", text: "DashBoard DT", route: "/dashboarddt" },
        { icon: "assistant", text: "Data Post", route: "/datapost" },
        { icon: "album", text: "Auto Complete", route: "/autocomplete" },
        { icon: "fingerprint", text: "New Auto Complete", route: "/newautocomplete" },
        { icon: "restore", text: "Shipping Cart", route: "/shippingcart" },
        { icon: "update", text: "Add User", route: "/newuserform" },
        { icon: "alarm_on", text: "Expansion Panel", route: "/expansionpanel" }


      ]
    };
  }
};
</script>
