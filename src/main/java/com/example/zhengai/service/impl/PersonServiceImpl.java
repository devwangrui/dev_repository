package com.example.zhengai.service.impl;

import com.example.zhengai.dao.PersonDao;
import com.example.zhengai.model.Person;
import com.example.zhengai.service.PersonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PersonServiceImpl implements PersonService {
    @Autowired
    private PersonDao personDao;
    @Override
    public List<Person> selectPersons() {
        return personDao.selectPersons();
    }

    @Override
    public Person selectPersonById(Integer id) {
        return personDao.selectPersonById(id);
    }

    @Override
    public void updatePerson(Person p) {
        personDao.updatePerson(p);

    }

    @Override
    public void insert(Person person) {
        personDao.insert(person);

    }

    @Override
    public void deletePerson(Integer id) {
        personDao.deletePerson(id);
    }
}
