package com.example.service;

import com.example.entity.StudentCourse;
import com.example.exception.CustomException;
import com.example.mapper.StduentCourseMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class StudentCourseService {

    @Resource
    StduentCourseMapper stduentCourseMapper;

    public void add(StudentCourse studentCourse){
        StudentCourse course = stduentCourseMapper.selectByCondition(studentCourse);//通过学生ID和课程ID进行一次查询的筛选，看学生之前有没有选过该课程
        if (course != null){
            throw new CustomException("您已选过该门课程");
        }
        stduentCourseMapper.insert(studentCourse);
    }

    public PageInfo<StudentCourse> selectPage(Integer pageNum, Integer pageSize, StudentCourse studentCourse) {
        PageHelper.startPage(pageNum,pageSize);

        List<StudentCourse> list =stduentCourseMapper.selectAll(studentCourse);
        return PageInfo.of(list);

    }

    public void deleteById(Integer id) {
        stduentCourseMapper.deleteById(id);
    }
}