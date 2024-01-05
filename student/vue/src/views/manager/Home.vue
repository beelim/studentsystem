<template>
  <div>

    <div class="card" style="line-height: 100%">
      <div style="font-size: 24px; text-align: center">欢迎<span style="color:dodgerblue">{{ user.name }}</span>登录使用学生成绩管理系统</div>
    </div>
    <div>
      <div style="display: flex; align-items: center">
        <img src="@/assets/imgs/home1.png" style="width: 40%; border-radius: 50%"> <img src="@/assets/imgs/home2.png" style="width: 40%; border-radius: 50%">
      </div>
      <div style="display: flex; align-items: center">
        <img src="@/assets/imgs/home2.png" style="width: 40%; border-radius: 50%"> <img src="@/assets/imgs/home4.png" style="width: 40%; border-radius: 50%">
      </div>
    </div>


  </div>
</template>

<script setup>
import request from "@/utils/request";

const user = JSON.parse(localStorage.getItem('student-user') || '{}')

</script>