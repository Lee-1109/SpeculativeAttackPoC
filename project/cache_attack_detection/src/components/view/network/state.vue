<template>
<div>
  <h3>恶意攻击检测</h3>
  <a-table :columns="columns" :data-source="data" :pagination="false" size="small">
    <a slot="name" slot-scope="text">{{ text }}</a>
  </a-table>
  </div>
</template>
<script>
const columns = [
  {
    title: 'IP',
    dataIndex: 'name',
    key: 'name',
    scopedSlots: { customRender: 'name' },
  },
  {
    title: '目标',
    dataIndex: 'sex',
    key: 'sex',
    // width: 80,
  },
    {
    title: '类型',
    dataIndex: 'age',
    key: 'age',
    // width: 80,
  },

];

const data = [
  {
    key: '1',
    name: '192.168.1.43',
    sex:'',
    age:'SSH爆破',
  },
  {
    key: '2',
    name: '192.168.1.43',
    sex:'',
    age:'目录扫描',
  },
  {
    key: '3',
    name: '192.168.1.43',
    sex:'/back.php',
    age:'木马后门',
  },
    {
    key: '4',
    name: '192.168.1.43',
    sex:'index.php',
    age:'SQL注入',
  },
    {
    key: '5',
    name: '192.168.1.43',
    sex:'echo.php',
    age:'XSS跨站',
  },
];

export default {
  data() {
    return {
      data,
      columns,
    };
  },
};
</script>