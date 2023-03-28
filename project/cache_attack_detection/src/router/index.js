import Vue from 'vue'
import Router from 'vue-router'
// import HelloWorld from '@/components/HelloWorld'
import login from '@/components/login'
import layout from '@/components/view/layout'
import Staff from '@/components/view/Staff/Staff.vue'
import chart from '@/components/view/chart/chart.vue'
import network from '@/components/view/network/network.vue'
import picture from '@/components/view/picture/picture.vue'
Vue.use(Router)

export default new Router({
  routes: [
    // {
    //   path: '/',
    //   name: 'HelloWorld',
    //   component: HelloWorld
    // },
    // {
    //   path: '/',
    //   name: '',
    //   redirect: '/login'
    // },
    {
      path: '/',
      name: 'login',
      component: login
    },
    {
      path: '/view',
      name: 'layout',
      component: layout
    },
    {
      path: '/Staff',
      component: layout,
      children:[
        {
          path: '',
          name: 'Staff',
          component: Staff
        }
      ]
    },
    {
      path: '/chart',
      component: layout,
      children:[
        {
          path: '',
          name: 'chart',
          component: chart
        }
      ]
    },
    {
      path: '/network',
      component: layout,
      children:[
        {
          path: '',
          name: 'network',
          component: network
        }
      ]
    },
    {
      path: '/picture',
      component: layout,
      children:[
        {
          path: '',
          name: 'picture',
          component: picture
        }
      ]
    },
  ]
})
