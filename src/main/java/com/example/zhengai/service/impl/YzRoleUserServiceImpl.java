package com.example.zhengai.service.impl;

import com.example.zhengai.dao.YzRoleUserDao;
import com.example.zhengai.model.YzRoleUser;
import com.example.zhengai.service.YzRoleUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



@Service
public class YzRoleUserServiceImpl implements YzRoleUserService {
	
	@Autowired
	private YzRoleUserDao yzRoleUserDao;

	@Override
	public void deleteUId(Integer uId) {

		yzRoleUserDao.deleteUId(uId);
	}

	@Override
	public void savaRoleUser(YzRoleUser yzRoleUser) {
		yzRoleUserDao.savaRoleUser(yzRoleUser);

	}

}
