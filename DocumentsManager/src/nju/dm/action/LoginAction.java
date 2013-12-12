package nju.dm.action;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import nju.dm.domain.User;
import nju.dm.service.ILoginService;
import nju.dm.service.IUserService;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;


@SuppressWarnings("serial")
public class LoginAction extends ActionSupport implements SessionAware{

	@Resource(name="loginService")
	private ILoginService loginService;
	
	@Resource(name="userService")
	private IUserService userService;
	
	private Map<String,Object> session;
	
	public String execute() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		User user = loginService.queryUser(username, password);
		
		if(user==null){
			request.setAttribute("loginError", "error");
			return "result";
		}
		
		session.put("user", user);
		return "result";
	}
	
	public void setSession(Map<String,Object> session){
		this.session = session;
	}
}
