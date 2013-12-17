package nju.dm.dao;

import nju.dm.domain.User;

public interface ILoginDAO {
	/**
	 * 查找用户
	 * @param username
	 * @param password
	 * @return
	 */
	public abstract User queryUser(String username, String password);
}