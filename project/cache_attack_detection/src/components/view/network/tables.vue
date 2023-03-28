<template>
<div>
  <h3 style：text-decoration:overline;>服务运行状态</h3>
  <a-table :columns="columns" :data-source="data" :pagination="false" size="small">
    <a slot="name" slot-scope="text">{{ text }}</a>
    <span slot="customTitle"></span>
    <span slot="tags" slot-scope="tags">
      <a-tag
        v-for="tag in tags"
        :key="tag"
        :color="tag === 'loser' ? 'volcano' : tag.length === 2 ? 'green' : 'red'"
      >
        {{ tag.toUpperCase() }}
      </a-tag>
    </span>
    <span slot="action" slot-scope="text, record">
      <a>Invite 一 {{ record.name }}</a>
      <a-divider type="vertical" />
      <a>Delete</a>
      <a-divider type="vertical" />
      <a class="ant-dropdown-link"> More actions <a-icon type="down" /> </a>
    </span>
  </a-table>

</div>
</template>
<script>
const columns = [
  {
    dataIndex: 'name',
    key: 'name',
    slots: { title: 'customTitle' },
    scopedSlots: { customRender: 'name' },
  },
  {
    title: '',
    key: 'tags',
    dataIndex: 'tags',
    scopedSlots: { customRender: 'tags' },
  },
];

const data = [
  {
    key: '1',
    name: 'Apache',
    tags: ['* '],
  },
  {
    key: '2',
    name: 'MySQL',
    tags: ['*'],
  },
  {
    key: '3',
    name: 'SSH',
    tags: ['*'],
  },
    {
    key: '4',
    name: 'FTP',
    tags: ['* '],
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