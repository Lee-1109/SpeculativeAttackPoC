<template>
  <div>
    <a-layout class="layout">
      <a-layout-header class="header">
        <NavbarTop/>      
      </a-layout-header>
      <a-layout-content  class="content">
        <router-view></router-view>
      </a-layout-content>
    </a-layout>
  </div>
</template>
<script>
import NavbarTop from "@/components/NavbarTop.vue";

export default {
  name: "layout",
  components: {
    NavbarTop,
  },
};
</script>
<style scoped>
.header {
  background-color: #202537;
  padding: 0px;
}
.layout {
  min-height: 100vh;
  min-width: 100vw;
}
.content {
  padding: 24px;
  margin: auto;
   width:100%;
  /* margin-right: 16px; */
}
</style>
