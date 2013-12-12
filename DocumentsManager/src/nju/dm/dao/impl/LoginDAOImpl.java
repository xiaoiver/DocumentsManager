package nju.dm.dao.impl;

import java.util.List;
import nju.dm.dao.ILoginDAO;
import nju.dm.domain.User;
import org.springframework.stereotype.Repository;

@Repository("loginDAO")
public class LoginDAOImpl extends BaseDAO implements ILoginDAO{

	@SuppressWarnings("unchecked")
	public User queryUser(String username,String password){
		List<User> users = getHibernateTemplate().find("from User u where u.username=? and u.password=?",new String[]{username,password});
		if(users!=null && users.size()==1){
			return users.get(0);
		}
		return null;
	}
	
}
