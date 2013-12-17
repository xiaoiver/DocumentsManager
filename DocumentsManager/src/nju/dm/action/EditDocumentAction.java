package nju.dm.action;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import nju.dm.domain.Document;
import nju.dm.domain.User;
import nju.dm.service.IDocumentService;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class EditDocumentAction extends ActionSupport implements SessionAware{
	@Resource(name="documentService")
	private IDocumentService documentService;
	
	private Map<String,Object> session;
	
	public String execute() throws Exception {
		User user = (User) session.get("user");
		HttpServletRequest request = ServletActionContext.getRequest();
		Integer documentId = Integer.parseInt(request.getParameter("documentId"));
		Document document = documentService.getDocumentById(documentId);
		
		if(request.getMethod().equalsIgnoreCase("POST")){
			return "success";
		}else{
			request.setAttribute("document", document);
			
			return "showDocumentForm";
		}
	}
	@Override
	public void setSession(Map<String,Object> session) {
		this.session = session;
	}
}
