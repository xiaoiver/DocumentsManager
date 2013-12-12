package nju.dm.service.impl;

import javax.annotation.Resource;

import nju.dm.dao.ILoginDAO;
import nju.dm.dao.IUserDAO;
import nju.dm.domain.User;
import nju.dm.service.ILoginService;

import org.springframework.stereotype.Service;


@Service("loginService")
public class LoginServiceImpl implements ILoginService {
	
	@Resource(name="loginDAO")
	private ILoginDAO loginDAO;
	
	@Resource(name="userDAO")
	private IUserDAO userDAO;

	public User queryUser(String username,String password){
		return loginDAO.queryUser(username,password);
	}

	@Override
	public boolean isUserExist(String username) {
		return userDAO.isUserExist(username);
	}
}
