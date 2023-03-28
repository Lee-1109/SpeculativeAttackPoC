<template>
  <div id="login">
    <div class="background">
      <img src="../login.jpg" width="100%" height="100%" alt="" />
       <!-- <img loading="lazy" src="http://static.runoob.com/images/demo/demo1.jpg"  width="100%" height="100%"> -->
    </div>
    <a-form
      id="components-form-demo-normal-login"
      :form="form"
      class="login-form"
      @submit="handleSubmit"
    >
      <a-form-item>
        <h1 class="center_text">侧信道攻击检测管理系统</h1>
      </a-form-item>
      <a-form-item>
        <a-input
          v-decorator="[
            'userName',
            {
              rules: [
                { required: true, message: 'Please input your username!' },
              ],
            },
          ]"
          placeholder="Username"
        >
          <a-icon
            slot="prefix"
            type="user"
            style="color: rgba(0, 0, 0, 0.25)"
          />
        </a-input>
      </a-form-item>
      <a-form-item>
        <a-input
          v-decorator="[
            'password',
            {
              rules: [
                { required: true, message: 'Please input your Password!' },
              ],
            },
          ]"
          type="password"
          placeholder="Password"
        >
          <a-icon
            slot="prefix"
            type="lock"
            style="color: rgba(0, 0, 0, 0.25)"
          />
        </a-input>
      </a-form-item>
      <a-form-item>
        <a-button type="primary" html-type="submit" class="login-form-button"
          >Log in</a-button
        >
      </a-form-item>
    </a-form>
  </div>
</template>

<script>
export default {
  beforeCreate() {
    this.form = this.$form.createForm(this, { name: "normal_login" });
  },
  methods: {
    handleSubmit(e) {
      e.preventDefault();
      this.form.validateFields((err, values) => {
        if (!err) {
          //   console.log("Received values of form: ", values);
          this.$router.push("/Staff");
        }
      });
    },
  },
};
</script>
<style>
/* body {
  background-image: url("https://static.runoob.com/images/mix/paper.gif");
  background-color: #cccccc;
} */
.login-form {
  background-color: hsla(240, 10%, 100%, 0.2);
  min-width: 550px;
  margin: 0 auto;
  padding-left: 80px;
  padding-right: 80px;
  padding-top: 80px;
  position: absolute;
  top: 43%;
  left: 50%;
  transform: translate(-50%, -55%);

  border-top-style: solid;
  border-right-style: solid;
  border-bottom-style: solid;
  border-left-style: solid;
  border-color: black;
}
.center_text {
  color: white;
  text-align: center;
}
/* .login-title {
  text-align: center;
  color: #6495ed;
  font-size: 32px;
  font-weight: bolder;
} */
#components-form-demo-normal-login .login-form {
  max-width: 300px;
}
/* #components-form-demo-normal-login .login-form-forgot {
  float: right;
} */
#components-form-demo-normal-login .login-form-button {
  width: 100%;
}
</style>