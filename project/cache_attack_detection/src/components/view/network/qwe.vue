<template>
  <div class="Echarts">
      
    <div id="main2" style="width: 1800px;height:200px;"></div>
  </div>
</template>

<script>
export default {
  name: 'Echarts',
  methods:{
	  myEcharts(){
		  // 基于准备好的dom，初始化echarts实例
		  var myChart = this.$echarts.init(document.getElementById('main2'));

		  // 指定图表的配置项和数据
		  var option = {
    title: {
        text: '进出口流量统计',
        subtext: '---------------------',
        // left: 'center'
    },
    legend: {
        data: ['入口流量', '出口流量']
    },
    xAxis: {
        type: 'category',
        data: ['00:00', '01:00', '02:00', '03:00', '04:00', '05:00', '06:00','07:00','08:00','09:00','10:00','11:00','12:00','13:00','14:00','15:00','16:00','17:00','18:00','19:00','20:00','21:00','22:00','23:00']
    },
    yAxis: {
        type: 'value'
    },
    series: [{
        name: '入口流量',
        data: [0, 2, 0, 2, 0, 2, 0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2],
        type: 'line',
        smooth: true
    },
    {
        name: '出口流量',
        data: [0, 1, 0, 1, 0, 1, 0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1],
        type: 'line',
        smooth: true
    }]
};

		  // 使用刚指定的配置项和数据显示图表。
		  myChart.setOption(option);
		  }
  },
  mounted() {
  	this.myEcharts();
  }
}
</script>

<style>

</style>