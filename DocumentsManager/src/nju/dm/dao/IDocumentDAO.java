package nju.dm.dao;

import java.util.List;

import nju.dm.domain.Document;
import nju.dm.domain.DocumentType;
import nju.dm.domain.User;

public interface IDocumentDAO {

	List<DocumentType> getAllDocumentTypes();

	DocumentType getDocumentTypeById(Integer documentTypeId);

	void addDocument(Document document);

	List<Document> getDocumentByUser(int pageNum, int numPerPage, User user);

	int getDocumentsCountByUser(User user);

	Document getDocumentById(Integer documentId);

}
