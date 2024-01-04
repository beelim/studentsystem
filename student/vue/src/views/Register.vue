<template>
  <div>
    <div class="login-container">
      <div style="width: 350px" class="login-box">
        <div style="font-weight: bold; font-size: 24px; text-align: center; margin-bottom: 30px">注册</div>
        <el-form :model="data.form" ref="formRef" :rules="rules">
          <el-form-item prop="username">
            <el-input prefix-icon="User" v-model="data.form.username" placeholder="请输入账号"/>
          </el-form-item>
          <el-form-item prop="password">
            <el-input show-password prefix-icon="Lock" v-model="data.form.password" placeholder="请输入密码"/>
          </el-form-item>

          <el-form-item>
            <el-button type="primary" style="width: 100%" @click="register">注 册</el-button>
          </el-form-item>
        </el-form>
        <div style="margin-top: 30px; text-align: right">
          已有账号？请<a href="/login">登录</a>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import {reactive, ref} from "vue"
import request from "@/utils/request";
import {ElMessage} from "element-plus";
import router from "@/router";

const data = reactive({
  form: {  }
})

const rules = reactive({
  username: [
    { required: true, message: '请输入账号', trigger: 'blur' },
  ],
  password: [
    { required: true, message: '请输入密码', trigger: 'blur' },
  ],
})

const formRef = ref()

const register = () => {
  formRef.value.validate((valid) => {
    if (valid) {
      request.post('/register',data.form).then(res => {
        if (res.code === '200') {
          ElMessage.success('注册成功')
          console.log(res.data)
          router.push('/login')  // 通过路由跳转到主页
        } else {
          ElMessage.error(res.msg)
        }
      })
    }
  })
}
</script>
//scoped当前页面生效
<style scoped>
.login-container {
  min-height: 100vh;
  overflow: hidden;
  display: flex;
  align-items: center;
  justify-content: center;
  background-image: url("@/assets/imgs/1.png");
  background-size: cover;
}


.login-box {
  background-color: #fff;
  background-color: #fff;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
  padding: 30px;
  border-radius: 5px;
}
</style>