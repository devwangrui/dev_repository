package com.example.zhengai.dao;

import com.example.zhengai.model.Person;
import org.apache.ibatis.annotations.*;

import java.util.List;


public interface PersonDao {
    @Select("select * from yz_person")
    public List<Person> selectPersons();

    @Select("select * from yz_person where id = #{id}")
    public Person selectPersonById(Integer id);

    @Update("update yz_person set #{username},#{password},#{gender},#{addr} where id =#{id}")
    public void updatePerson(Person p);

    @Options(useGeneratedKeys = true,keyProperty = "id")
    @Insert("insert into yz_person(username,password,gender,addr) values(#{username},#{password},#{gender},#{addr})")
    public void insert(Person person);

    @Delete("delete from yz_person where id=#{id}")
    public void deletePerson(Integer id);
}
