<template>
  <div>
    <a-row type="flex" justify="center" align="top">
      <a-col :span="4" class="col">
        <a-icon type="bars" class="title" />
        <span class="title">侧信道攻击检测系统</span>
      </a-col>
      <a-col :span="16">
        <a-menu
          theme="dark"
          mode="horizontal"
          class="menu"
          v-model="menuSelect"
        >
          <a-menu-item key="Staff">
            数据采集
            <router-link to="/Staff"></router-link>
          </a-menu-item>
          <!-- <a-menu-item key="chart">
            攻击检测
            <router-link to="/chart"></router-link>
          </a-menu-item> -->
           <!-- <a-menu-item key="network">
            流量分析
            <router-link to="/network"></router-link>
          </a-menu-item> -->
          <a-menu-item key="picture">
            攻击检测
            <router-link to="/picture"></router-link>
          </a-menu-item>
        </a-menu>
      </a-col>
      <!-- <a-col :span="5" class="col">
        <a-menu
          theme="light"
          mode="horizontal"
          class="menu"
          style="height: 65px"
          v-model="subMenu"
        >
          <a-sub-menu>
            <span slot="title" class="user">
              <a-icon type="user" />
              {{ userName }}
            </span>
            <a-menu-item key="setting">
              <a-icon type="setting" />个人设置
            </a-menu-item>
            <a-divider style="margin: 0px" />
            <a-menu-item
              key="logout"
              @click="
                () => {
                  this.showModal = true;
                }
              "
            >
              <a-icon type="logout" />退出登录
            </a-menu-item>
          </a-sub-menu>
        </a-menu>
      </a-col> -->
    </a-row>

    <!-- <a-modal
      :title="null"
      :visible="showModal"
      @cancel="
        () => {
          this.showModal = false;
        }
      "
      :footer="null"
    >
      <a-icon type="question-circle" class="modal" style="color: red" />
      <span class="modal">确认要退出登陆吗？</span>
      <a-row type="flex" justify="end" style="margin-top: 32px">
        <a-col span="4">
          <a-button
            @click="
              () => {
                this.showModal = false;
              }
            "
            >取消</a-button
          >
        </a-col>
        <a-col span="4">
          <a-button type="primary" @click="backToLogin">确认</a-button>
        </a-col>
      </a-row>
    </a-modal> -->
    
  </div>
</template>

<script>
export default {
  name: "NavbarTop",
  mounted() {
    this.menuSelect = [this.$route.name];
    this.userName = JSON.parse(localStorage.getItem("loggedUsername"));
  },
  watch: {
    $route() {
      this.menuSelect = [this.$route.name];
    },
    subMenu() {
      this.subMenu = null;
    },
  },
  data() {
    return {
      menuSelect: [],
      subMenu: [],
      userName: "",
      showModal: false,
    };
  },
  methods: {
    backToLogin() {
      localStorage.clear();
      this.$router.push("/login");
    },
  },
};
</script>

<style scoped>
.title {
  font-size: 24px;
  padding-right: 8px;
  color: #fff;
  font-weight: bolder;
}
.menu {
  text-align: center;
  line-height: 64px;
  background-color: #202537;
}
.col {
  text-align: center;
}
.user {
  font-size: 16px;
  color: #fff;
}
.modal {
  font-size: 18px;
  padding-right: 4px;
}
</style>