<template>
  <div class="Echarts" style="margin-left:300px; margin-top:100px;">

      <div  style="margin-left:1000px;">
          <a-dropdown>
      <template #overlay>
        <a-menu @click="handleMenuClick">
          <a-menu-item key="1">
            <UserOutlined />
            Cache Miss
          </a-menu-item>
          <a-menu-item key="2">
            <UserOutlined />
            Cache References
          </a-menu-item>
          <a-menu-item key="3">
            <UserOutlined />
            LLC Load
          </a-menu-item>
        </a-menu>
      </template>
      <a-button>
        事件列表
        <DownOutlined />
      </a-button>
    </a-dropdown>
      </div>


    <div id="chart4" style="width:700px;height:400px;">
    </div>
  </div>
</template>

<script>
export default {
  name: 'Echarts',
  methods:{
	  myEcharts(){
		  // 基于准备好的dom，初始化echarts实例
		  var myChart = this.$echarts.init(document.getElementById('chart4'));

		  // 指定图表的配置项和数据
		  var option = {
  title: {
    text: 'CPU占比%'
  },
  tooltip: {
    trigger: 'axis',
    axisPointer: {
      type: 'category'
    }
  },
  legend: {},
  grid: {
    left: '3%',
    right: '4%',
    bottom: '3%',
    containLabel: true
  },
  yAxis: {
    type: 'value',
    boundaryGap: [0, 0.01]
  },
  xAxis: {
    type: 'category',
    data: ['LR', 'SVM', 'RF', 'KNN', 'DT', 'NNs','AdaBoost']
  },
  series: [
    {
      name: '无负载',
      type: 'bar',
      data: [1.4, 2.6, 3.5, 4.8, 1.4, 5.2,3.2]
    },
    {
      name: '满载',
      type: 'bar',
      data: [1.5,2.8, 3.7,5.6, 1.5, 6.2,3.3]
    }
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