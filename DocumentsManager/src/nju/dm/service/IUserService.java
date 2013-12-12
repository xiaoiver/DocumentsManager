package nju.dm.service;

import java.io.File;
import java.util.List;

import nju.dm.domain.User;

import org.springframework.dao.DataAccessException;

public interface IUserService {

	/*//取得所有用户的记录数
	public Integer getAllUsersCount();
	//取得所有用户的记录数（模糊查询）
	public Integer getAllUsersCount(User user);

	//取得当前页用户的信息
	public List<User> getAllUsers(Integer page, Integer rows);
	//取得当前页用户的信息(模糊查询
	public List<User> getAllUsers(Integer page, Integer rows,User user);

	//更新用户基本信息(包含选择的角色信息)
	public void updateUser(User user, String selrolesid)throws DataAccessException;

	//删除用户
	public void removeUser(String userid);

	//添加用户(包含角色信息）
	public void addUser(User user);

	//处理用户上传的excel文件：批量添加用户
	public void handleUsersExcelFile(File handlingFile);
	*/
	public boolean isUserExist(String username);
	
}
