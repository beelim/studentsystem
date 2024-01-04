package com.example.service;

import com.example.entity.Course;
import com.example.mapper.CourseMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class CourseService
{
    @Resource
    private CourseMapper courseMapper;

    //total 是查询的总数 list是数据列表
    //pageNum 当前的页码 pageSize是每页的页数
    public PageInfo<Course> selectPage(Integer pageNum,Integer pageSize,Course course){
        PageHelper.startPage(pageNum,pageSize);
        List<Course> courseList = courseMapper.selectAll(course);
        return PageInfo.of(courseList);
    }
}
