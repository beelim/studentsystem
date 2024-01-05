<template>
  <div>

    <div class="card" style="margin-bottom: 10px">
      <el-input style="width: 260px; margin-right: 10px" v-model="data.courseName" placeholder="请输入课程名称查询"
                :prefix-icon="Search"/>
      <el-input style="width: 260px; margin-right: 10px" v-model="data.studentName" placeholder="请输入学生名称查询"
                :prefix-icon="Search"/>
      <el-button type="primary" style="margin: 0 10px" @click="load">查询</el-button>
      <el-button type="info" @click="reset">重置</el-button>
    </div>

    <div class="card" style="margin-bottom: 10px">


      <div>
        <el-table stripe :data="data.tableData" style="width: 100%">
          <el-table-column prop="id" label="序号" width="70"/>
          <el-table-column prop="courseName" label="课程名称"/>
          <el-table-column prop="studentName" label="学生名称"/>
          <el-table-column prop="score" label="分数"/>
          <el-table-column prop="comment" label="评语"/>
          <el-table-column prop="feedback" label="反馈"/>
          <el-table-column label="操作" width="180">
            <template #default="scope">
              <el-button type="primary" @click="handleEdit(scope.row)" v-if="data.user.role ==='ADMIN'">编辑</el-button>
              <el-button type="danger" @click="del(scope.row.id)" v-if="data.user.role ==='ADMIN'">删除</el-button>
              <el-button type="primary" @click="handleEdit(scope.row)" v-if="data.user.role ==='STUDENT'">反馈</el-button>
            </template>
          </el-table-column>
        </el-table>
      </div>

    </div>

    <div class="card">
      <el-pagination v-model:current-page="data.pageNum" v-model:page-size="data.pageSize"
                     @current-change="handelCurrentChange"
                     background layout="prev, pager, next" :total="data.total"/>
    </div>

    <el-dialog width="35%" v-model="data.formVisible" title="成绩信息">
      <el-form :model="data.form" label-width="100px" label-position="right" style="padding-right: 40px">
        <el-form-item label="评分" v-if="data.user.role ==='ADMIN'">
          <el-input v-model="data.form.score" autocomplete="off" />
        </el-form-item>
        <el-form-item label="评语" v-if="data.user.role ==='ADMIN'">
          <el-input type="textarea" v-model="data.form.comment" autocomplete="off" />
        </el-form-item>
        <el-form-item label="反馈" v-if="data.user.role ==='STUDENT'">
          <el-input type="textarea" v-model="data.form.feedback" autocomplete="off" />
        </el-form-item>
      </el-form>
      <template #footer>
        <span class="dialog-footer">
          <el-button @click="data.formVisible = false">取 消</el-button>
          <el-button type="primary" @click="save">保 存</el-button>
          <!--           @click事件处理及可传参的函数-->
        </span>
      </template>
    </el-dialog>
  </div>
</template>

<script setup>
import {reactive} from "vue"
import {Search} from '@element-plus/icons-vue'
import request from "@/utils/request";
import {ElMessage, ElMessageBox} from "element-plus";

const data = reactive({
  form: {},
  courseName: '',
  studentName: '',
  tableData: [],
  total: 0,
  pageNum: 1,  //当前的页码
  pageSize: 5,   //每页的个数
  user: JSON.parse(localStorage.getItem('student-user') || '{}'),
  formVisible: false
})
const load = () => {
  let params = {
    pageNum: data.pageNum,
    pageSize: data.pageSize,
    courseName: data.courseName,
    studentName: data.studentName

  }
  if (data.user.role === 'STUDENT') { //当前登录为学生，查询自己的选课记录
    params.studentId = data.user.id;
  }
  request.get('/grade/selectPage', {
    params: params
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
  data.courseName = ''
  data.studentName = ''
  load()
}

const del = (id) => {
  ElMessageBox.confirm('删除数据后无法恢复，您确认删除吗？', '删除确认', {type: 'warning'}).then(res => {
    request.delete('/grade/delete/' + id).then(res => {
      if (res.code === '200') {
        load()    // 重新获取数据
        ElMessage.success("操作成功")
      } else {
        ElMessage.error(res.msg)
      }
    })
  }).catch(res => {
  })
}

//打分
const handleEdit = (row) => {
  //弹窗
  data.form = JSON.parse(JSON.stringify(row)) //拷贝行数据到表单对象
  data.formVisible = true

}

const save = () => {
  request.put('/grade/update', data.form).then(res => {
    if (res.code === '200') {
      load()    // 重新获取数据
      data.formVisible = false  // 关闭弹窗
      ElMessage.success("操作成功")
    } else {
      ElMessage.error(res.msg)
    }
  })
}

</script>
