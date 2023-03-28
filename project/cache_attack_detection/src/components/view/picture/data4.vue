<template>
  <div class="Echarts" >
    <div id="chart1" style="width: 650px;height:400px; margin-top:100px;"></div>
  </div>
</template>

<script>
import bus from '../picture/bus'
export default {
  name: 'Echarts',
  components: {
    bus,
  },
  data() {
    return {
      data: [
        {
          value: [0.88,0.91],
          itemStyle: {
            color: 'red'
          }
        },
                {
          value: [0.83,0.71],
          itemStyle: {
            color: 'red'
          }
        },
                {
          value: [0.78,0.68],
          itemStyle: {
            color: 'red'
          }
        },
                {
          value: [0.21,0.31],
          itemStyle: {
            color: 'blue'
          }
        },
                {
          value: [0.24,0.19],
          itemStyle: {
            color: 'blue'
          }
        },
                {
          value: [0.31,0.43],
          itemStyle: {
            color: 'blue'
          }
        },
                {
          value: [0.18,0.19],
          itemStyle: {
            color: 'blue'
          }
        },
                {
          value: [0.26,0.3],
          itemStyle: {
            color: 'blue'
          }
        },
                {
          value: [0.27,0.22],
          itemStyle: {
            color: 'blue'
          }
        },
          {
          value: [],
          itemStyle: {
            color: 'red'
          }
        },
      ],
    };
  },
  methods:{
	  myEcharts(){
		  // 基于准备好的dom，初始化echarts实例
		  var myChart = this.$echarts.init(document.getElementById('chart1'));

		  // 指定图表的配置项和数据
		  var option = {
                  title: {
        text: '记录检测点',
        // subtext: '纯属虚构'
    },
  xAxis: {},
  yAxis: {},
  series: [
    {
      symbolSize: 20,
      data:this.data,
      type: 'scatter'
    }
  ]
};

		  // 使用刚指定的配置项和数据显示图表。
		  myChart.setOption(option);
	},
  },
  mounted() {
  	this.myEcharts();
  },
  created(){
    //  console.log(this.data)
      // this.data[9].value[0] = 0.93;
      // this.data[9].value[1] =0.88;
      bus.$on('share',(val)=>{
      this.data[9].value[0] = val[7].Cache_Misses_Rate1;
      this.data[9].value[1] = val[8].L1_Data_Cache_Miss_Rate1;
      console.log(this.data[9])
      this.myEcharts();
    })
  }
}
</script>

<style>

</style>