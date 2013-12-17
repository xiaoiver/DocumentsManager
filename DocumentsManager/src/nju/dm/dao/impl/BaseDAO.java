package nju.dm.dao.impl;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

/**
 * 所有DAO继承该类
 *
 */
public class BaseDAO extends HibernateDaoSupport{
	@SuppressWarnings("unused")
	@Resource(name="sessionFactory")
	/**
	 * 使用注解注入sessionFactory，HibernateDaoSupport中的sessionFactory声明为final
	 * @param sessionFactory
	 */
	private void setSuperSessionFactory(SessionFactory sessionFactory){
		super.setSessionFactory(sessionFactory);
	}
}
