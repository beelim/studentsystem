<template>
  <div>

    <div class="card" style="margin-bottom: 10px">
      <el-input style="width: 260px; margin-right: 10px" v-model="data.name" placeholder="请输入课程名称查询" :prefix-icon="Search"/>
      <el-input style="width: 260px; margin-right: 10px" v-model="data.no" placeholder="请输入课程编号查询" :prefix-icon="Search"/>
      <el-input style="width: 260px" v-model="data.teacher" placeholder="请输入任课老师查询" :prefix-icon="Search"/>
      <el-button type="primary" style="margin: 0 10px" @click="load">查询</el-button>
      <el-button type="info" @click="reset">重置</el-button>
    </div>

    <div class="card" style="margin-bottom: 10px">

      <div>
        <el-table stripe :data="data.tableData" style="width: 100%">
          <el-table-column prop="id" label="序号" width="70"/>
          <el-table-column prop="name" label="课程名称"/>
          <el-table-column prop="no" label="课程编号"/>
          <el-table-column prop="stduentName" label="学生名称"/>

          <el-table-column label="操作" width="180">
            <template #default="scope">
              <el-button type="primary" @click="del(scope.row)">删除</el-button>
            </template>
          </el-table-column>
        </el-table>
      </div>

    </div>

      <div class="card">
        <el-pagination v-model:current-page="data.pageNum" v-model:page-size="data.pageSize"
                       @current-change="handelCurrentChange"
                       background layout="prev, pager, next" :total="data.total" />
      </div>
  </div>
</template>

<script setup>
import {reactive} from "vue"
import {Search} from '@element-plus/icons-vue'
import request from "@/utils/request";
import {ElMessage} from "element-plus";

const data = reactive({
  name: '',
  no: '',
  tableData: [],
  total: 0,
  pageNum: 1 ,  //当前的页码
  pageSize: 5,   //每页的个数
  user : JSON.parse(localStorage.getItem('student-user') || '{}')
})
const load = () => {
  let params={
      pageNum: data.pageNum,
      pageSize: data.pageSize,
      name: data.name,
      no: data.no

    }
    if (data.user.role === 'STUDENT'){ //当前登录为学生，查询自己的选课记录
      params.studentId=data.user.id;
    }
  request.get('/studentCourse/selectPage', {
    params :params
  }).then(res => {
    data.tableData = res.data?.list || []
    data.total = res.data?.total || 0
  })
}
// 调用方法获取后台数据
load()

const handelCurrentChange = () => {
  // 当翻页的时候重新加载数据即可
  load()
}

const reset = () => {
  data.name = ''
  data.no = ''
  load()
}

const del =(id) => {
  request.delete();
}

</script>
