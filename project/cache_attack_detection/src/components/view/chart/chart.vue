<template>
  <div class="Echarts">
    <div id="chart3" style="width: 1400px;height:1000px;"></div>
  </div>
</template>

<script>
export default {
  name: 'Echarts',
  methods:{
	  myEcharts(){
		  // 基于准备好的dom，初始化echarts实例
		  var myChart = this.$echarts.init(document.getElementById('chart3'));
// const dataAll = [
//   [
//     [0,1],
//     [0.68, 0.68],
//     [1, 0],
//   ]

// ];
const markLineOpt = {
  animation: false,
  label: {
    formatter: '基准线',
    align: 'right'
  },
  lineStyle: {
    type: 'solid'
  },
  tooltip: {
    formatter: '基准线'
  },
  data: [
    [
      {
        coord: [0, 0],
        symbol: 'none'
      },
      {
        coord: [1,1],
        symbol: 'none'
      }
    ]
  ]
};
		  // 指定图表的配置项和数据
		  var option = {
  title: {
    // text: "Anscombe's quartet",
    // left: 'left',
    top: 0
  },
    legend: {
    data: ['RF', 'LR', 'KNN', 'SVM', 'DT','NNs','AdaBoost'],
    left: 'left',
  },
  grid: [
    { left: '7%', top: '7%', width: '38%', height: '38%' },

  ],
  // tooltip: {
  //   formatter: 'Group {a}: ({c})'
  // },
  xAxis:
  [
    { gridIndex: 0, min: 0, max: 1 },
  ],
  yAxis: [
    { gridIndex: 0, min: 0, max: 1 },

  ],
  series: [
    {
      name:'SVM',
      type: 'line',
      smooth: true,
      data: [
            [0,1],
            [0.72, 0.72],
            [1, 0],
            ],
      markLine: markLineOpt
    },
    {
      name:'LR',
      type: 'line',
      smooth: true,
      data: [
            [0,1],
            [0.70, 0.73],
            [1, 0],
            ],
      markLine: markLineOpt
    },
        {
      name:'KNN',
      type: 'line',
      smooth: true,
      data: [
            [0,1],
            [0.76, 0.76],
            [0.88, 0.53],
            [1, 0],
            ],
      markLine: markLineOpt
    },
        {
      name:'RF',
      type: 'line',
      smooth: true,
      data: [
            [0,1],
            [0.79, 0.79],
            [1, 0],
            ],
      markLine: markLineOpt
    },
        {
      name:'DT',
      type: 'line',
      smooth: true,
      data: [
            [0,1],
            [0.78, 0.79],
            [1, 0],
            ],
      markLine: markLineOpt
    },
        {
      name:'NNs',
      type: 'line',
      smooth: true,
      data: [
            [0,1],
            [0.79, 0.79],
            [0.85, 0.73],
            [1, 0],
            ],
      markLine: markLineOpt
    },
        {
      name:'AdaBoost',
      type: 'line',
      smooth: true,
      data: [
            [0,1],
            [0.82, 0.82],
            [1, 0],
            ],
      markLine: markLineOpt
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