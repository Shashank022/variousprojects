<template>
    <div class="card text-center m-3">
        <h3 class="card-header">Vue.js Pagination Tutorial & Example</h3>
        <div class="card-body">
        </div>
        <div class="card-footer pb-0 pt-3">
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
        onChangePage(pageOfItems) {
            // update page of items
            this.pageOfItems = pageOfItems;
        }
    }
};
</script>