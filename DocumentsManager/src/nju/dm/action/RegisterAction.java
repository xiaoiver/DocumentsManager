package nju.dm.action;

import java.util.Date;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import nju.dm.domain.User;
import nju.dm.domain.UserType;
import nju.dm.service.IUserService;
import nju.dm.util.MD5Helper;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class RegisterAction extends ActionSupport implements SessionAware{
	@Resource(name="userService")
	private IUserService userService;
	
	private Map<String,Object> session;
	
	public String execute() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		String username = request.getParameter("username");
		String userTypeStr = request.getParameter("userType");
		if(username!=null && !username.isEmpty()){
			if(userService.isUserExist(username)){//已经存在该用户
				request.setAttribute("registerError", "userExist");
				request.setAttribute("rightUserType", Integer.parseInt(userTypeStr));
			}else{
				String password = request.getParameter("password");
				
				String md5pwd = MD5Helper.getMD5(password.getBytes());
				UserType userType = userService.getUserTypeById(Integer.parseInt(userTypeStr));
				
				User user = new User();
				user.setUsername(username);
				user.setPassword(md5pwd);
				user.setUserType(userType);
				user.setRegDate(new Date());
				userService.addUser(user);
				
				session.put("user", user);
				return "success";
			}
		}
		return "showRegisterForm";
	}
	
	public void setSession(Map<String,Object> session){
		this.session = session;
	}
}
