package nju.dm.service.impl;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Set;

import javax.annotation.Resource;

import nju.dm.dao.IUserDAO;
import nju.dm.domain.User;
import nju.dm.domain.UserType;
import nju.dm.service.IUserService;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.DateUtil;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

@Service("userService")
public class UserServiceImpl implements IUserService {

	@Resource(name="userDAO")
	private IUserDAO userDAO;
		
	@Override
	public boolean isUserExist(String username) {
		return userDAO.isUserExist(username);
	}

	@Override
	public List<UserType> getAllUserTypes() {
		return userDAO.getAllUserTypes();
	}

	@Override
	public void addUser(User user) {
		userDAO.addUser(user);
	}

	@Override
	public UserType getUserTypeById(Integer id) {
		return userDAO.getUserTypeById(id);
	}

	@Override
	public User updateUser(User user) {
		return userDAO.updateUser(user);
	}
}
