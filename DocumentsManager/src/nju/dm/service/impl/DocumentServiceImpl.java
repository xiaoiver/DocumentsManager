package nju.dm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import nju.dm.dao.IDocumentDAO;
import nju.dm.domain.Document;
import nju.dm.domain.DocumentType;
import nju.dm.domain.User;
import nju.dm.service.IDocumentService;

import org.springframework.stereotype.Service;

@Service("documentService")
public class DocumentServiceImpl implements IDocumentService{
	@Resource(name="documentDAO")
	private IDocumentDAO documentDAO;

	@Override
	public List<DocumentType> getAllDocumentTypes() {
		return documentDAO.getAllDocumentTypes();
	}

	@Override
	public DocumentType getDocumentTypeById(Integer documentTypeId) {
		return documentDAO.getDocumentTypeById(documentTypeId);
	}

	@Override
	public void addDocument(Document document) {
		documentDAO.addDocument(document);
	}

	@Override
	public List<Document> getDocumentsByUser(int pageNum, int numPerPage,
			User user) {
		return documentDAO.getDocumentByUser(pageNum, numPerPage, user);
	}

	@Override
	public int getDocumentsCountByUser(User user) {
		return documentDAO.getDocumentsCountByUser(user);
	}

	@Override
	public Document getDocumentById(Integer documentId) {
		return documentDAO.getDocumentById(documentId);
	}
}
