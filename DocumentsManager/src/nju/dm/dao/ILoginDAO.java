package nju.dm.dao;

import nju.dm.domain.User;

public interface ILoginDAO {
	/**
	 * 验证用户名和密码
	 * @param username
	 * @param password
	 * @return
	 */
	public abstract User queryUser(String username, String password);
}