<template>
  <div  style="margin-top:80px;">
    <div style="background: #ececec; padding: 30px ">
    <a-row :gutter="16">
      <a-col :span="12">
        <a-card>
          <a-statistic
            title="Cache Misses Rate"
            :value="Cache_Misses_Rate"
            :precision="2"
            suffix="%"
            :value-style="{ color: '#cf1322' }"
            style="margin-right: 50px"
          >
            <template #prefix>
              <!-- <arrow-up-outlined /> -->
            </template>
          </a-statistic>
        </a-card>
      </a-col>
      <a-col :span="12">
        <a-card>
          <a-statistic
            title="L1 Data Cache Miss Rate"
            :value="L1_Data_Cache_Miss_Rate"
            :precision="2"
            suffix="%"
            class="demo-class"
            :value-style="{ color: '#cf1322' }"
          >
            <template #prefix>
              <!-- <arrow-down-outlined /> -->
            </template>
          </a-statistic>
        </a-card>
      </a-col>
    </a-row>
  </div>
    <div style="margin-left:105px; margin-top:70px;">
      <a-button type="primary" v-on:click="showModal" style="width: 400px;">检测</a-button>
      <a-modal v-model="visible" title="检测结果" @ok="handleOk">
      <p>检测到Cache侧信道攻击</p>
      <p>Cache Misses Rate异常增加</p>
      <p>L1 Data Cache Miss Rate异常增加</p>
    </a-modal>
      <a-button type="primary" style="width: 400px;margin-top:70px;">导出数据</a-button>
    </div>
  </div>
</template>

<script>
import bus from '../picture/bus'
export default {
  name: 'data3',
    components: {
    bus,
  },
  data() {
    return {
      visible: false,
      msg:[
        {arr:''},
        {time:'15ms'},
        {number:10},
        {att_times:4},
        {normal:6},
        {state:'危险'},
        {accuracy:0.98},
        {Cache_Misses_Rate1:'0.93'},
        {L1_Data_Cache_Miss_Rate1:'0.88'}
      ],
      Cache_Misses_Rate:'',
      L1_Data_Cache_Miss_Rate:''
    };
  },
  methods: {
    showModal() {
      setTimeout(() => {
      this.$message.info('检测成功');
      this.visible = true;
      this.Cache_Misses_Rate='93.73';
      this.L1_Data_Cache_Miss_Rate='88.62';
      bus.$emit('share',this.msg);
       }, 3000)
    },
    handleOk(e) {
      console.log(e);
      this.visible = false;
    },
  },
};
</script>
