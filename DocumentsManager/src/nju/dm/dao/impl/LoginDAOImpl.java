package nju.dm.dao.impl;

import java.util.List;
import nju.dm.dao.ILoginDAO;
import nju.dm.domain.User;
import nju.dm.util.*;
import org.springframework.stereotype.Repository;

@Repository("loginDAO")
public class LoginDAOImpl extends BaseDAO implements ILoginDAO{

	@SuppressWarnings("unchecked")
	public User queryUser(String username,String password){
		String md5pwd = MD5Helper.getMD5(password.getBytes());
		List<User> users = getHibernateTemplate().find("from User u where u.username=? and u.password=?",new String[]{username,md5pwd});
		if(users!=null && users.size()==1){
			return users.get(0);
		}
		return null;
	}
	
}
