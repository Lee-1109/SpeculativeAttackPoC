<template>
  <div class="Echarts">
    <div id="network1" style="width: 580px;height:400px;"></div>
  </div>
</template>

<script>
export default {
  name: 'Echarts',
  methods:{
	  myEcharts(){
		  // 基于准备好的dom，初始化echarts实例
		  var myChart = this.$echarts.init(document.getElementById('network1'));

		  // 指定图表的配置项和数据
		  var option = {
    title: {
        text: '请求IP来源',
        subtext: '------------------'
    },
    tooltip: {
        trigger: 'axis',
        axisPointer: {
            type: 'shadow'
        }
    },
    legend: {
        data: ['']
    },
    grid: {
        left: '3%',
        right: '4%',
        bottom: '3%',
        containLabel: true
    },
    xAxis: {
        type: 'value',
        boundaryGap: [0, 0.01]
    },
    yAxis: {
        type: 'category',
        data: ['', '', '', '', '', '','','','','']
    },
    series: [
        {
            // name: '2011年',
            type: 'bar',
            data: [15,5,4,3,2,2,2,1,1,1]
        },
    ]
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