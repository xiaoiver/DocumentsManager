package nju.dm.service;

import java.util.List;

import nju.dm.domain.Document;
import nju.dm.domain.DocumentType;
import nju.dm.domain.User;

public interface IDocumentService {

	List<DocumentType> getAllDocumentTypes();

	DocumentType getDocumentTypeById(Integer documentTypeId);

	void addDocument(Document document);

	List<Document> getDocumentsByUser(int pageNum, int numPerPage, User user);

	int getDocumentsCountByUser(User user);

	Document getDocumentById(Integer documentId);

}
