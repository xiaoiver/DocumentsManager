package nju.dm.service;

import java.util.List;

import nju.dm.domain.User;
import nju.dm.domain.UserType;

public interface IUserService {

	public void addUser(User user);

	public boolean isUserExist(String username);

	public List<UserType> getAllUserTypes();

	public UserType getUserTypeById(Integer id);

	public User updateUser(User user);
	
}
