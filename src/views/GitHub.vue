<template>
    <div>
        <h3>Vue.js Pagination Tutorial & Example</h3>
        <div class="card-body">
        </div>
        <div>
        </div>
    </div>
</template>

<script>
// an example array of items to be paged
export default {
    data() {
        return {
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
        
    }
};
</script>