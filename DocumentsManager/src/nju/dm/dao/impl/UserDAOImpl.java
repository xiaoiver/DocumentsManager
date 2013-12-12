package nju.dm.dao.impl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import javax.annotation.Resource;

import nju.dm.dao.IUserDAO;
import nju.dm.domain.User;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.dao.DataAccessException;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

@Repository("userDAO")
public class UserDAOImpl extends BaseDAO implements IUserDAO {
	
	/*public List<User> getAllUsers(final Integer page, final Integer rows) {
		return (List<User>)getHibernateTemplate().execute(new HibernateCallback() {			
			public Object doInHibernate(Session arg0) throws HibernateException,
					SQLException {
				Query query = arg0.createQuery("from User u order by u.userid desc");
				query.setFirstResult((page-1)*rows);
				query.setMaxResults(rows);
				return query.list();
			}
		});
	}
	@SuppressWarnings("unchecked")
	public List<User> getAllUsers(final Integer page, final Integer rows,final User user) {
		return (List<User>)getHibernateTemplate().execute(new HibernateCallback() {
			public Object doInHibernate(Session arg0) throws HibernateException,
					SQLException {
				Criteria c = arg0.createCriteria(User.class);
				Long userid = user.getUserid();
				String loginname = user.getLoginname();
				String loginpass = user.getLoginpass();
				String username = user.getUsername();
				if(userid!=null &&userid>0){
					c.add(Restrictions.eq("this.userid", userid));
				}
				if(loginname!=null && loginname.length()>0){
					c.add(Restrictions.like("this.loginname","%"+loginname+"%"));
				}
				if(loginpass!=null && loginpass.length()>0){
					c.add(Restrictions.like("this.loginpass","%"+ loginpass+"%"));					
				}
				if(username!=null && username.length()>0){
					c.add(Restrictions.like("this.username","%"+username+"%"));
				}
				c.addOrder(Order.desc("this.userid"));
				c.setFirstResult((page-1)*rows);
				c.setMaxResults(rows);
				return c.list();
			}
		});
	}

	public Integer getAllUsersCount() {
		Long rst = (Long)getHibernateTemplate().execute(new HibernateCallback() {			
			public Object doInHibernate(Session arg0) throws HibernateException,
					SQLException {
				return (Long)arg0.createQuery("select count(u)  from User u").uniqueResult();
			}
		});
		if(rst!=null){
			return rst.intValue();
		}
		return 0;
	}
	public Integer getAllUsersCount(final User user) {
		Long rst = (Long)getHibernateTemplate().execute(new HibernateCallback() {			
			public Object doInHibernate(Session arg0) throws HibernateException,
					SQLException {
				Criteria c = arg0.createCriteria(User.class);
				
				Long userid = user.getUserid();
				String loginname = user.getLoginname();
				String loginpass = user.getLoginpass();
				String username = user.getUsername();
				if(userid!=null &&userid>0){
					c.add(Restrictions.eq("this.userid", userid));
				}
				if(loginname!=null && loginname.length()>0){
					c.add(Restrictions.like("this.loginname","%"+loginname+"%"));
				}
				if(loginpass!=null && loginpass.length()>0){
					c.add(Restrictions.like("this.loginpass","%"+ loginpass+"%"));					
				}
				if(username!=null && username.length()>0){
					c.add(Restrictions.like("this.username","%"+username+"%"));
				}
				c.setProjection(Projections.rowCount());
				Long i =(Long) c.uniqueResult();			
				return i;
			}
		});
		if(rst!=null){
			return rst.intValue();
		}
		return 0;
	}

	public void updateUser(User user,String selrolesid) throws DataAccessException {
		System.out.println("合并用户");
		User newUser = (User)getHibernateTemplate().merge(user);
		System.out.println("删除用户对应的角色....");
		
	}

	public void removeUser(final String userid){
		try {
			getHibernateTemplate().execute(new HibernateCallback() {
				
				public Object doInHibernate(Session arg0) throws HibernateException,
						SQLException {
					Query query = arg0.createQuery("delete from UserRole ur where ur.user.userid=:userid");
					query.setLong("userid", Long.parseLong(userid));
					query.executeUpdate();
					
					query = arg0.createQuery("delete from User where userid=:userid");
					query.setLong("userid", Long.parseLong(userid));
					query.executeUpdate();
					return null;
				}
			});
		} catch (DataAccessException e) {
			throw e;
		}
		
	}
	
	public void addUser(User user) {
		getHibernateTemplate().save(user);
	}
	*/

	@Override
	public boolean isUserExist(String username) {
		List<User> users = getHibernateTemplate().find("from User u where u.username=?",new String[]{username});
		if(users!=null && users.size()>=1){
			return true;
		}
		return false;
	}
}
