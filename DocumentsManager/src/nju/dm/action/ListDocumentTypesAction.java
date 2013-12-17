package nju.dm.action;

import java.util.List;

import javax.annotation.Resource;

import nju.dm.domain.DocumentType;
import nju.dm.domain.UserType;
import nju.dm.service.IDocumentService;
import nju.dm.service.IUserService;

import org.apache.struts2.json.annotations.JSON;

import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class ListDocumentTypesAction extends ActionSupport{
	@Resource(name="documentService")
	private IDocumentService documentService;
	
	private List<DocumentType> documentTypes;
	
	public String execute() throws Exception {
		documentTypes = documentService.getAllDocumentTypes();
		
		return "result";
	}
	
	@JSON(name="documentTypes")
	public List<DocumentType> getDocumentTypes(){
		return documentTypes;
	}
}
