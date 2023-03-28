<template>
  <div class="Echarts">
    <div id="chart2" style="width: 600px;height:400px;"></div>
  </div>
</template>

<script>
export default {
  name: 'Echarts',
  methods:{
	  myEcharts(){
		  // 基于准备好的dom，初始化echarts实例
		  var myChart = this.$echarts.init(document.getElementById('chart2'));

		  // 指定图表的配置项和数据
		  var option = option = {
                  title: {
        text: '乘车工具统计图',
        // subtext: '纯属虚构',
        // left: 'center'
    },
    xAxis: {
        type: 'category',
        data: ['飞机', '火车', '汽车', '公交']
    },
    yAxis: {
        type: 'value'
    },
    series: [{
        data: [120, 200, 150, 80],
        type: 'bar',
        showBackground: true,
        backgroundStyle: {
            color: 'rgba(180, 180, 180, 0.2)'
        }
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