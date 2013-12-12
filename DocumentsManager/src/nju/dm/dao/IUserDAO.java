package nju.dm.dao;

import java.util.List;

import nju.dm.domain.User;

import org.springframework.dao.DataAccessException;

public interface IUserDAO {

	/*public List<User> getAllUsers(Integer page, Integer rows);
	public List<User> getAllUsers(Integer page, Integer rows, User user);

	public Integer getAllUsersCount();
	public Integer getAllUsersCount(User user);

	public void updateUser(User user, String selrolesid)throws DataAccessException;

	public void removeUser(String userid);

	public void addUser(User user);

	public Object[] getUserSelrolesAndUnselroles(Long userid2);

	public List getRoleSelmenusAndUnselmenus(String roleid);*/
	public boolean isUserExist(String username);

}
