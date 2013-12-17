package nju.dm.action;

import java.util.Date;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import nju.dm.domain.Document;
import nju.dm.domain.DocumentType;
import nju.dm.domain.User;
import nju.dm.service.IDocumentService;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class CreateDocumentAction extends ActionSupport implements SessionAware{
	@Resource(name="documentService")
	private IDocumentService documentService;
	
	private Map<String,Object> session;
	
	public String execute() throws Exception {
		User user = (User) session.get("user");
		HttpServletRequest request = ServletActionContext.getRequest();
		if(request.getMethod().equalsIgnoreCase("POST")){
			Integer documentTypeId = Integer.parseInt(request.getParameter("documentTypeId"));
			DocumentType documentType = documentService.getDocumentTypeById(documentTypeId);
			
			String title = request.getParameter("title");
			String author = request.getParameter("author");
			String year = request.getParameter("year");
			Integer pages = Integer.parseInt(request.getParameter("pages"));
			String abstracts = request.getParameter("abstracts");
			String keywords = request.getParameter("keywords");
			String publisher = request.getParameter("publisher");
			String url = request.getParameter("url");
			
			String publication = request.getParameter("publication");
			String city = request.getParameter("city");
			String volume = request.getParameter("volume");
			String issue = request.getParameter("issue");
			String editor = request.getParameter("editor");
			String book_name = request.getParameter("book_name");
			String school_name = request.getParameter("school_name");
			String doi = request.getParameter("doi");
			String isbn = request.getParameter("isbn");
			
			Document document = new Document();
			document.setAbstracts(abstracts);
			document.setAddTime(new Date());
			document.setAuthor(author);
			document.setBookName(book_name);
			document.setCity(city);
			document.setDocumentType(documentType);
			document.setDoi(doi);
			document.setEditor(editor);
			document.setIsbn(isbn);
			document.setIssue(issue);
			document.setKeywords(keywords);
			document.setPages(pages);
			document.setPublication(publication);
			document.setPublisher(publisher);
			document.setSchoolName(school_name);
			document.setTitle(title);
			document.setUrl(url);
			document.setUser(user);
			document.setVolume(volume);
			document.setYear(year);
			
			documentService.addDocument(document);
			return "success";
		}else{
			return "showDocumentForm";
		}
	}
	
	public void setSession(Map<String,Object> session){
		this.session = session;
	}

}
