package com.example.service;

import com.example.entity.Grade;
import com.example.mapper.GradeMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class GradeService {

    @Resource
    GradeMapper gradeMapper;

    public void add(Grade grade) {
        gradeMapper.insert(grade);
    }

}
