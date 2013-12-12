package nju.dm.service;

import nju.dm.domain.User;

public interface ILoginService {

	public abstract User queryUser(String username, String password);

	public abstract boolean isUserExist(String username);

}