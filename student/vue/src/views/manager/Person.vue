<template>
<div class="card">

</div>
</template>

<script setup>
import {reactive} from "vue";


const data=reactive({
  form:JSON.parse(localStorage.getItem('student-user')||"{}")
})
const handleImgUploadSuccess=(res)=>{
  data.form.avater=res.data
}
const update=()=>{
  request.put('/student/update',data.form).then(res=>{
    if (res.code === '200') {
      ElMessage.success("操作成功")
      router.push('/login')
    } else {
      ElMessage.error(res.msg)
    }
  })
}


</script>
<style>
.avatar-uploader .el-upload {
  border: 1px dashed #d9d9d9;
  border-radius: 6px;
  cursor: pointer;
  position: relative;
  overflow: hidden;
}
.avatar-uploader .el-upload:hover {
  border-color: #409EFF;
}
.avatar-uploader-icon {
  font-size: 28px;
  color: #8c939d;
  width: 100px;
  height: 100px;
  line-height: 100px;
  text-align: center;
}
.avatar {
  width: 140px;
  height: 140px;
  display: block;
}

</style>
