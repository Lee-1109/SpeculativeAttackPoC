<template>
<div>
<div v-if="show1">
<div v-if="show">
  <a-row>
    <a-col :span="24">
  <a-descriptions title="系统状态展示页面" bordered>
        <a-descriptions-item label="检测状态" :span="3">
      <a-badge status="processing" text="运行中" />
    </a-descriptions-item>
    <a-descriptions-item label="CPU占比">
      <p >{{ counter }}</p>
    </a-descriptions-item>
    <a-descriptions-item label="缓存命中">
      <p>{{ counter1 }}</p>
      </a-descriptions-item>
    <a-descriptions-item label="缓存丢失">
      <p>{{ counter2 }}</p>
      </a-descriptions-item>
    <a-descriptions-item label="内存占比">
      <p>{{ counter3 }}</p>
      </a-descriptions-item>
    <a-descriptions-item label="L1数据缓存" >
      <p>{{ counter4 }}</p>
      </a-descriptions-item>
    <a-descriptions-item label="L1数据缓存丢失">
      <p>{{ counter5 }}</p>
      </a-descriptions-item>
        <a-descriptions-item label="数据采集">
    <a-button type="primary" @click="hand">采集</a-button>
    </a-descriptions-item>
    <a-descriptions-item label="缓存丢失率">
      <p>{{ counter6 }}</p>
      </a-descriptions-item>
    <a-descriptions-item label="L1数据缓存丢失率">
      <p>{{ counter7 }}</p>
      </a-descriptions-item>
  </a-descriptions>
    </a-col>
  </a-row>
</div>
</div>

<div v-if="show2">
<div v-if="show">
  <a-row>
    <a-col :span="24">
  <a-descriptions title="系统状态展示页面" bordered>
        <a-descriptions-item label="检测状态" :span="3">
      <a-badge status="processing" text="运行中" />
    </a-descriptions-item>
    <a-descriptions-item label="CPU占比">
      <p >{{ att_counter }}</p>
    </a-descriptions-item>
    <a-descriptions-item label="缓存命中">
      <p>{{ att_counter1 }}</p>
      </a-descriptions-item>
    <a-descriptions-item label="缓存丢失">
      <p>{{ att_counter2 }}</p>
      </a-descriptions-item>
    <a-descriptions-item label="内存占比">
      <p>{{ att_counter3}}</p>
      </a-descriptions-item>
    <a-descriptions-item label="L1数据缓存" >
      <p>{{ att_counter4}}</p>
      </a-descriptions-item>
    <a-descriptions-item label="L1数据缓存丢失">
      <p>{{ att_counter5}}</p>
      </a-descriptions-item>
        <a-descriptions-item label="数据采集">
    <a-button type="primary" @click="hand">采集</a-button>
    </a-descriptions-item>
    <a-descriptions-item label="缓存丢失率">
      <p>{{ att_counter6 }}</p>
      </a-descriptions-item>
    <a-descriptions-item label="L1数据缓存丢失率">
      <p>{{ att_counter7 }}</p>
      </a-descriptions-item>
  </a-descriptions>
    </a-col>
  </a-row>
</div>
</div>
<a-button type="primary" @click="attack">Prime+probe攻击</a-button>
</div>
</template>
<script>
// import chart1 from '@/components/view/Staff/chart1.vue'

export default {
  name: '',
  components: {
    // chart1,
  },

  mounted () {
    window.addEventListener('beforeunload', function (e) {
      localStorage.clear()
    })
    console.log(this.counter2)

   this.time=setInterval(()=>this.reload()
    //  setTimeout(this.qwe,0)
    //  location.reload()
    // console.log(111)
      ,2000)
  },
  data () {
    return {
      show:true,
      show1:true,
      show2:false,
    counter:0.997,
    counter1:2273,
    counter2:137,
    counter3:0.176,
    counter4:3936,
    counter5:243,
    counter6:0.064,
    counter7:0.038,
      // counter:"5.3%",
      // counter1:100
        //  imgSrc:require('../../assets/images/bg2.jpg')

    att_counter:0.997,
    att_counter1:2273,
    att_counter2:137,
    att_counter3:0.176,
    att_counter4:3936,
    att_counter5:243,
    att_counter6:0.064, 
    att_counter7:0.038, 
    }
  },
    methods:{
    hand(){
      setTimeout(() => {
         this.$message.info('数据采集成功');
       }, 3000)
    },
    attack(){
      var qrr=true;
       setTimeout(() => {
         this.$message.info('Prime+Probe攻击运行成功');
        if(qrr){
      this.show1=false;
      this.show2=true;
      }
       }, 3000)
      // else{
      // this.show1=true;
      // this.show2=false;
      // this.q=true;
      // }

    },
    reload(){
      this.show=false
      this.$nextTick(()=>{
        this.show=true
      })
      this.counter=(0.05+Math.random()*0.1).toFixed(3)
      this.counter1=2000+Math.floor(Math.random()*1000)
      this.counter2=100+Math.floor(Math.random()*100)
      this.counter3=(0.1+Math.random()*0.10).toFixed(3)
      this.counter4=3800+Math.floor(Math.random()*200)
      this.counter5=100+Math.floor(Math.random()*100)
      this.counter6=(this.counter2/this.counter1).toFixed(3)
      this.counter7=(this.counter5/this.counter4).toFixed(3)

      this.att_counter=(0.05+Math.random()*0.1).toFixed(3)
      this.att_counter1=1500+Math.floor(Math.random()*1000)
      this.att_counter2=1400+Math.floor(Math.random()*400)
      this.att_counter3=(0.1+Math.random()*0.10).toFixed(3)
      this.att_counter4=3800+Math.floor(Math.random()*200)
      this.att_counter5=3400+Math.floor(Math.random()*100)
      this.att_counter6=(this.att_counter2/this.att_counter1).toFixed(3)
      this.att_counter7=(this.att_counter5/this.att_counter4).toFixed(3)
    }
  },
}
</script>