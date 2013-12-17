package nju.dm.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import nju.dm.dao.IDocumentDAO;
import nju.dm.domain.Document;
import nju.dm.domain.DocumentType;
import nju.dm.domain.User;

@Repository("documentDAO")
public class DocumentDAOImpl extends BaseDAO implements IDocumentDAO {

	@SuppressWarnings("unchecked")
	@Override
	public List<DocumentType> getAllDocumentTypes() {
		List<DocumentType> documentTypes = getHibernateTemplate().find("from DocumentType dt");
		return documentTypes;
	}

	@SuppressWarnings("unchecked")
	@Override
	public DocumentType getDocumentTypeById(Integer documentTypeId) {
		List<DocumentType> documentTypes = getHibernateTemplate().find("from DocumentType dt where dt.documentTypeId=?",new Integer[]{documentTypeId});
		return documentTypes.get(0);
	}

	@Override
	public void addDocument(Document document) {
		getHibernateTemplate().save(document);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Document> getDocumentByUser(int pageNum, int numPerPage,
			User user) {
		Criteria criteria = this.getSession().createCriteria(Document.class);
		criteria.add(Restrictions.eq("user", user));
		criteria.addOrder(Order.desc("addTime"));
		criteria.setFirstResult((pageNum-1)*numPerPage);
		criteria.setMaxResults(numPerPage);
		return criteria.list();
	}

	@Override
	public int getDocumentsCountByUser(User user) {
		Criteria criteria = this.getSession().createCriteria(Document.class);
		criteria.setProjection(Projections.rowCount());
		criteria.add(Restrictions.eq("user", user));
		return Integer.parseInt(criteria.uniqueResult().toString());
	}

	@Override
	public Document getDocumentById(Integer documentId) {
		Criteria criteria = this.getSession().createCriteria(Document.class);
		criteria.add(Restrictions.eq("documentId", documentId));
		return (Document)criteria.uniqueResult();
	}

}
