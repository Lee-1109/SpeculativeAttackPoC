<template>
  <div>
    <a-row type="flex"   >
      <a-col :span="8">
        <data1/>
      </a-col>
      <a-col :span="8" push="8">
        <data2/>
      </a-col>
    </a-row>
    <a-row type="flex" justify="start">
      <a-col :span="8">
        <data3/>
      </a-col>
      <a-col :span="8" :offset="0" push="8">
        <data4/>
      </a-col>
    </a-row>
    </div>
</template>

<script>
import data1 from '@/components/view/picture/data1.vue'
import data2 from '@/components/view/picture/data2.vue'
import data3 from '@/components/view/picture/data3.vue'
import data4 from '@/components/view/picture/data4.vue'

export default {
  name: '',
  components: {
    data1,
    data2,
    data3,
    data4
  },
  data () {
    return {
    }
  },

  mounted () {

    // window.console.log(this.isLogged)
  },
  props: {},
  methods: {

  }
}
</script>


