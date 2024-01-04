package com.example.controller;

import com.example.common.Result;
import com.example.entity.Grade;
import com.example.service.GradeService;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

/**
 * 成绩接口
 */
@RestController
@RequestMapping("/grade")
public class GradeController {

    @Resource
    GradeService gradeService;


    @PostMapping("/add")
    public Result add(@RequestBody Grade grade) {
        gradeService.add(grade);
        return Result.success();
    }

}
