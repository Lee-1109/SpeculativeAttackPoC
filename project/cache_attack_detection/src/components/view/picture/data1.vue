<template>
<div style="margin-left:130px; ">
  <a-row>
    <a-col :span="12">
      <a-statistic title="检测次数" :value="number" style="margin-right: 50px" />
    </a-col>
    <a-col :span="12">
      <a-statistic title="受到攻击次数" :value="att_times" style="margin-right: 50px" />
    </a-col>
  </a-row>
    <a-row>
    <a-col :span="12">
      <a-statistic title="检测正常次数" :value="normal" style="margin-right: 50px" />
    </a-col>
    <a-col :span="12">
      <a-statistic title="系统状态" :value="state" style="margin-right: 50px" />
    </a-col>
  </a-row>
      <a-row>
    <a-col :span="12">
      <a-statistic title="检测精度" :value="accuracy" style="margin-right: 50px" />
    </a-col>
    <a-col :span="12">
      <a-statistic title="检测时间" :value="time" style="margin-right: 50px" />
    </a-col>
  </a-row>
</div>

</template>

<script>
import bus from '../picture/bus'
export default {
    components: {
    bus,
  },
  data() {
    return {
      arr:'',
      time:'12ms',
      number:9,
      att_times:3,
      normal:6,
      state:'正常',
      accuracy:0.95
    };
  },
  methods: {

  },
  created(){
      bus.$on('share',(val)=>{
      console.log(val)
      this.time = val[1].time;
      this.number = val[2].number;
      this.att_times = val[3].att_times;
      this.normal = val[4].normal;
      this.state = val[5].state;
      this.accuracy = val[6].accuracy;
    })
  }
};
</script>


