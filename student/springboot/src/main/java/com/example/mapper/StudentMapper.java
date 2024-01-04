package com.example.mapper;

import com.example.entity.Student;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

public interface StudentMapper {

    @Select("select * from student where username = #{username}")
    Student selectByUsername(String username);

    @Insert("insert into student(username,password,name,phone,email,sex,birth,avatar,role) values(#{username},#{password},#{name},#{phone},#{email},#{sex},#{birth},#{avatar},#{role})")
    void insert(Student student);
}

