import Vue from "vue";
import Router from "vue-router";
import Dashboard from "./views/Dashboard.vue";
import DataApiCall from "./views/DataApiCall.vue";
import Projects from "./views/Projects.vue";
import Team from "./views/Team.vue";
import Settings from "./views/Settings.vue";
import Posts from "./views/Posts.vue";
import DataTable from "./views/DataTable.vue";
import DashboardDT from "./views/DashboardDT.vue";
import DataPost from "./views/Datapost.vue";
import AutoComplete from "./views/AutoComplete.vue";
import NewAutoComplete from "./views/NewAutoComplete.vue";
import Shippingcart from "./views/Shippingcart.vue";
import Newform from "./views/Newform.vue";
import ExpansionPanel from "./views/ExpansionPanel.vue";
import GitHub from "./views/GitHub.vue";


Vue.use(Router);

export default new Router({
  mode: "history",
  base: process.env.BASE_URL,
  routes: [
    {
      path: "/",
      name: "dashboard",
      component: Dashboard
    },
    {
      path: "/dataapicall",
      name: "dataapicall",
      component: DataApiCall
    },
    {
      path: "/projects",
      name: "projects",
      component: Projects
    },
    {
      path: "/team",
      name: "team",
      component: Team
    },
    {
      path: "/settings",
      name: "settings",
      component: Settings
    },
    {
      path: "/posts",
      name: "posts",
      component: Posts
    },
    {
      path: "/datatable",
      name: "datatable",
      component: DataTable
    },
    {
      path: "/dashboarddt",
      name: "dashboarddt",
      component: DashboardDT
    },
    {
      path: "/datapost",
      name: "Datapost",
      component: DataPost
    },
    {
      path: "/autocomplete",
      name: "AutoComplete",
      component: AutoComplete
    },
    {
      path: "/newautocomplete",
      name: "NewAutoComplete",
      component: NewAutoComplete
    },
    {
      path: "/shippingcart",
      name: "Shippingcart",
      component: Shippingcart 
    },
    {
      path: "/newuserform",
      name: "Newform",
      component: Newform 
    },
    {
      path: "/expansionpanel",
      name: "ExpansionPanel",
      component: ExpansionPanel 
    },
    {
      path: "/github",
      name: "Git Hub",
      component: GitHub 
    },
//
  ]
});
