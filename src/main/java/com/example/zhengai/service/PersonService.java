package com.example.zhengai.service;

import com.example.zhengai.model.Person;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


public interface PersonService {


    public List<Person> selectPersons();


    public Person selectPersonById(Integer id);


    public void updatePerson(Person p);


    public void insert(Person person);

    public void deletePerson(Integer id);
}
