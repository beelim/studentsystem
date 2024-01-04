<template>
  <div>

    <div class="card" style="margin-bottom: 10px">
      <el-input style="width: 260px; margin-right: 10px" v-model="data.name" placeholder="请输入课程名称查询" :prefix-icon="Search"/>
      <el-input style="width: 260px; margin-right: 10px" v-model="data.no" placeholder="请输入课程编号查询" :prefix-icon="Search"/>
      <el-input style="width: 260px" v-model="data.teacher" placeholder="请输入任课老师查询" :prefix-icon="Search"/>
      <el-button type="primary" style="margin: 0 10px" @click="load">查询</el-button>
      <el-button type="info" >重置</el-button>
    </div>

    <div class="card" style="margin-bottom: 10px">
      <div style="margin-bottom: 10px">
        <el-button type="primary">新增</el-button>
      </div>
      <el-table stripe :data="data.tableData" style="width: 100%">
        <el-table-column label="序号" prop="id" width="70 "/>
        <el-table-column label="课程号" prop="no"/>
        <el-table-column label="名称" prop="name"/>
        <el-table-column label="描述" prop="descr"/>
        <el-table-column label="课时" prop="times"/>
        <el-table-column label="上课教师" prop="teacher"/>
        <el-table-column>
          <template #default="scope">
            <el-button type="primary" plain="false">编辑</el-button>
            <el-button type="danger" plain="false">删除 </el-button>
          </template>
        </el-table-column>
      </el-table>
    </div>
    <div class="card">
      <el-pagination v-model:current-page="data.pageNum"
                     v-model:page-size="data.pageSize"
                     background layout="prev, pager, next" :total="1000"/>
    </div>
    <div class="card">
      <el-pagination v-model:current-page="data.pageNum" v-model:page-size="data.pageSize"
                     @current-change="handleCurrentChange"
                     background layout="prev,pager,next":total="data.total"/>
    </div>
    <el-dialog v-model="data.formVisible" title="课程信息">
      <el-form :model="data.form">
        <el-form-item label="Promotion name" :label-width="formLabelWidth">
          <el-input v-model="data.form.name" autocomplete="off" />
        </el-form-item>
      </el-form>
    </el-dialog>
<!--    <div class="card">
      <el-pagination background layout="prev, pager, next" :page-size="8" v-model:current-page="data.pageNum" :total="1000"/>
    </div>

    <el-dialog title="信息" width="40%" v-model="data.formVisible" :close-on-click-modal="false" destroy-on-close>
      <el-form :model="data.form" label-width="100px" style="padding-right: 50px">
        <el-form-item label="名称" prop="name">
          <el-input v-model="data.form.name" autocomplete="off" />
        </el-form-item>
        <el-form-item label="描述" prop="descr">
          <el-input v-model="data.form.descr" autocomplete="off" />
        </el-form-item>
      </el-form>-->
<!--      <template #footer>
      <span class="dialog-footer">
        <el-button @click="data.formVisible = false">取 消</el-button>
        <el-button type="primary" @click="data.formVisible = false">保 存</el-button>
      </span>
      </template>
    </el-dialog>-->

  </div>
</template>

<script setup>
import { Search} from '@element-plus/icons-vue'
import {reactive} from "vue";

/*request.get('/').then(res => {
  console.log(res)
})*/

const data = reactive({
 name:'',
  tableData: [
    {id:1,name: '大学英语',no:'CS001', descr: '大学英语真有趣', times: '24课时',teacher:'张三'},
    {id:2,name: '高等数学',no:'CS002', descr: '高等数学真有趣', times: '24课时',teacher:'李四'},
    {id:3,name: '大学物理',no:'CS003', descr: '大学物理真有趣', times: '24课时',teacher:'王五'},
    {id:4,name: '数据结构',no:'CS004', descr: '数据结构真有趣', times: '24课时',teacher:'赵六'},
    {id:5,name: '操作系统',no:'CS005', descr: '操作系统真有趣', times: '24课时',teacher:'孙七'},
  ],
  total:0,
  pageNum:1,
  pageSize:5,
  formVisible:false,
})

load()

const handelCurrentChange = () =>
{
  //当翻页的时候重新加载数据即可
  load()
}
const reset = () => {
  data.name = ''
  data.no = ''
  data.teacher = ''
  load()
}


/*const handleAdd = () => {
  data.form = {}
  data.formVisible = true
}
const handleEdit = (row) => {
  let form = JSON.parse(JSON.stringify(row))
  data.formVisible = true
}
const handleDelete = (id) => {
  ElMessageBox.confirm('删除后数据无法恢复，您确定删除吗?', '删除确认', { type: 'warning' }).then(res => {
    console.log('删除')
  }).catch(err => {
    console.error(err)
  })
}*/
</script>
