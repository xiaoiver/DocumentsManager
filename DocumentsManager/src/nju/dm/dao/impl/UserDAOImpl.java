package nju.dm.dao.impl;

import java.util.List;

import nju.dm.dao.IUserDAO;
import nju.dm.domain.User;
import nju.dm.domain.UserType;

import org.springframework.stereotype.Repository;

@Repository("userDAO")
public class UserDAOImpl extends BaseDAO implements IUserDAO {

	@SuppressWarnings("unchecked")
	@Override
	public boolean isUserExist(String username) {
		List<User> users = getHibernateTemplate().find("from User u where u.username=?",new String[]{username});
		if(users!=null && users.size()>=1){
			return true;
		}
		return false;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<UserType> getAllUserTypes() {
		List<UserType> userTypes = getHibernateTemplate().find("from UserType ut");
		return userTypes;
	}

	@Override
	public void addUser(User user) {
		getHibernateTemplate().save(user);
	}

	@SuppressWarnings("unchecked")
	@Override
	public UserType getUserTypeById(Integer id) {
		List<UserType> userTypes = getHibernateTemplate().find("from UserType ut where ut.userTypeId=?",new Integer[]{id});
		return userTypes.get(0);
	}

	@Override
	public User updateUser(User user) {
		return (User)getHibernateTemplate().merge(user);	
	}
}
