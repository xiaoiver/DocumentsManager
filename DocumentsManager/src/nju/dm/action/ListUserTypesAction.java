package nju.dm.action;

import java.util.List;

import javax.annotation.Resource;
import org.apache.struts2.json.annotations.JSON;

import nju.dm.domain.UserType;
import nju.dm.service.IUserService;

import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class ListUserTypesAction extends ActionSupport{
	@Resource(name="userService")
	private IUserService userService;
	
	private List<UserType> userTypes;
	
	public String execute() throws Exception {
		userTypes = userService.getAllUserTypes();
		
		return "result";
	}
	
	@JSON(name="userTypes")
	public List<UserType> getUserTypes(){
		return userTypes;
	}
}
