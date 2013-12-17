package nju.dm.action;

import java.util.List;
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
public class PersonalHomepageAction extends ActionSupport implements SessionAware{
	
	@Resource(name="documentService")
	private IDocumentService documentService;
	
	private Map<String,Object> session;
	
	/**
	 * 每页显示多少文献
	 */
	public static int ITEM_PER_PAGE = 10;
	
	public String execute() throws Exception {
		User user = (User) session.get("user");
		HttpServletRequest request = ServletActionContext.getRequest();
		String pageNumString = request.getParameter("pageNum");
		int pageNum = 1;//第几页
		int totalPageNum;//总页数
		if(pageNumString!=null){
			pageNum=Integer.parseInt(pageNumString);
			request.setAttribute("activePanel", "document");
		}
		
		List<Document> documents = documentService.getDocumentsByUser(pageNum, ITEM_PER_PAGE, user);
		
		int totalDocumentCount = documentService.getDocumentsCountByUser(user);
		
		totalPageNum = (int) Math.ceil(totalDocumentCount/(double)ITEM_PER_PAGE);
		
		request.setAttribute("documents", documents);
		request.setAttribute("totalPageNum", totalPageNum);
		request.setAttribute("currentPage", pageNum);
		return "result";
	}
	
	public void setSession(Map<String,Object> session){
		this.session = session;
	}
}
