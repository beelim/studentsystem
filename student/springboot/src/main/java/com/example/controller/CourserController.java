package com.example.controller;

import cn.hutool.poi.excel.cell.CellSetter;

import com.example.common.Result;
import com.example.entity.Course;
import com.example.service.CourseService;
import com.github.pagehelper.PageInfo;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

import static com.example.common.Result.success;

@RestController
@RequestMapping("/course")
public class CourserController
{
    @Resource
    private CourseService courseService;

    @GetMapping("/selectPage")
    public Result selectPage(@RequestParam(defaultValue = "1") Integer pageNum,
                             @RequestParam(defaultValue = "5") Integer pageSize,
                             Course course)     // ?name=xx&no=xx
    {
        PageInfo<Course> pageInfo = courseService.selectPage(pageNum, pageSize,course);
        return success(pageInfo);
    }
    @PostMapping("/add")//往数据库插入数据
    public  Result add(@RequestBody Course course)
    {
        courseService.add(course);
        return Result.success();
    }
    @PutMapping("/update")
public Result update(@RequestBody Course course) {
    courseService.updateById(course);
    return Result.success();
}



}
