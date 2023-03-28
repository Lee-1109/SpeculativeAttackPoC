<template>
  <div class="DataStatistics">
    <a-row type="flex"  :gutter="16">
      <a-col :span="8">
        <column/>
      </a-col>
      <a-col :span="8" push="8">
        <tables/>
      </a-col>
    </a-row>

    <a-row type="flex" justify="start" :gutter="24" :style="{marginTop: '16px'}">
      <a-col :span="8">
        <state/>
      </a-col>
      <a-col :span="8" :offset="0" push="8">
        <pie/>
      </a-col>
    </a-row>

    <a-row type="flex" justify=""> 
      <a-col :span="16" >
    <qwe/>
      </a-col>
    </a-row>
  </div>
</template>
<script>
import column from '@/components/view/network/column.vue'
import tables from '@/components/view/network/tables.vue'
import state from '@/components/view/network/state.vue'
import pie from '@/components/view/network/pie.vue'
import qwe from '@/components/view/network/qwe.vue'



export default {
  name: 'DataStatistics',
  components: {
    column,
    tables,
    state,
    pie,
    qwe
  },
  mounted () {
    window.addEventListener('beforeunload', function (e) {
      localStorage.clear()
    })
  },
  data () {
    return {
        //  imgSrc:require('../../assets/images/bg2.jpg')
    }
  }
}
</script>


<style scoped>
.DataStatistics {
     /* background: url("http://static.runoob.com/images/demo/demo1.jpg");
   background-position: center; */
  padding: 24px;
  padding-top: 0px;
  padding-left: 32px;
  min-height: 80vh;
  width: 95vw;
  
}

</style>
