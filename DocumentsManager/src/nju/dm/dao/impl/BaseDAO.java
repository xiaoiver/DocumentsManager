package nju.dm.dao.impl;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

/**
 * 所有DAO的实现类均继承此类
 *
 */
public class BaseDAO extends HibernateDaoSupport{
	@SuppressWarnings("unused")
	@Resource(name="sessionFactory")
	/**
	 * 使用注解注入sessionFactory。HibernateDaoSupport中sessionFactory声明为final，无法重写。
	 * @param sessionFactory
	 */
	private void setSuperSessionFactory(SessionFactory sessionFactory){
		super.setSessionFactory(sessionFactory);
	}
}
