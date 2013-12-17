package nju.dm.dao;

import java.util.List;

import nju.dm.domain.User;
import nju.dm.domain.UserType;

public interface IUserDAO {

	public boolean isUserExist(String username);

	public List<UserType> getAllUserTypes();

	public void addUser(User user);

	public UserType getUserTypeById(Integer id);

	public User updateUser(User user);

}
