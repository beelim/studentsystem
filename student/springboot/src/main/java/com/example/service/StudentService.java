package com.example.service;

import cn.hutool.core.util.ObjectUtil;
import com.example.common.RoleEnum;
import com.example.entity.Account;
import com.example.entity.Student;
import com.example.exception.CustomException;
import com.example.mapper.StudentMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class StudentService {

    @Resource
    private StudentMapper studentMapper;
    /**
     * 登录
     */
    public Account login(Account account) {
        Account dbStudent = studentMapper.selectByUsername(account.getUsername());
        if (dbStudent == null) {
            // 没有用户
            throw new CustomException("账号或密码错误");
        }
        // 比较密码
        if (!account.getPassword().equals(dbStudent.getPassword())) {
            throw new CustomException("账号或密码错误");
        }
        // 登录成功
        return dbStudent;
    }

    /**
     * 学生注册
     */
    public void register(Account account){
        Student student = new Student();
        student.setUsername(account.getUsername());  //账号
        student.setPassword(account.getPassword());  //密码
        this.add(student);
    }

    /**
     *新增
     */
    public void add(Student student) {

        Student dbStudent = studentMapper.selectByUsername(student.getUsername());
        if(dbStudent != null){  //已有同名账号 不允许插入
            throw new CustomException("账号已存在");

        }
        if(ObjectUtil.isEmpty(student.getName())) {
            student.setName(student.getUsername());
        }
        student.setRole(RoleEnum.STUDENT.name());
        studentMapper.insert(student);

    }

    /**
     *删除
     */
    public void deleteById(Integer id) {
        studentMapper.deleteById(id);
    }

    /**
     *更新
     */
    public void updateById(Student student) {
        studentMapper.updateById(student);
    }
    /**
     *分页查询
     */
    public PageInfo<Student> selectPage(Integer pageNum, Integer pageSize, Student student) {
        PageHelper.startPage(pageNum,pageSize);
        List<Student> studentList = studentMapper.selectAll(student);
        return PageInfo.of(studentList);
    }
}
