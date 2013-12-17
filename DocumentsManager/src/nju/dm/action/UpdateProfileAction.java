package nju.dm.action;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import nju.dm.domain.User;
import nju.dm.service.IUserService;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class UpdateProfileAction extends ActionSupport implements SessionAware{
	@Resource(name="userService")
	private IUserService userService;
	
	private Map<String,Object> session;
	
	public String execute() throws Exception {
		User user = (User) session.get("user");
		HttpServletRequest request = ServletActionContext.getRequest();
		if(request.getMethod().equalsIgnoreCase("POST")){
			String name = request.getParameter("name");
			String phone = request.getParameter("phone");
			String email = request.getParameter("email");
			user.setName(name);
			user.setPhone(phone);
			user.setEmail(email);
			
			User updatedUser = userService.updateUser(user);
			session.put("user", updatedUser);
			return "success";
		}else{
			return "showProfile";
		}
	}
	
	public void setSession(Map<String,Object> session){
		this.session = session;
	}
}
