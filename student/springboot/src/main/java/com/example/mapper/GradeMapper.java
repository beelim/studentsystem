package com.example.mapper;

import com.example.entity.Grade;
import org.apache.ibatis.annotations.Insert;

public interface GradeMapper {

    @Insert("insert into grade (course_id,student_id,score,comment,feedback)" +
            "values (#{courseId},#{studentId},#{score},#{comment},#{feedback})")
    void insert(Grade grade);

}
