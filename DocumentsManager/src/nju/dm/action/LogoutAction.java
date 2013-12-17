package nju.dm.action;

import java.util.Map;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class LogoutAction extends ActionSupport implements SessionAware{
	private Map<String,Object> session;
	public String execute() throws Exception {
		session.remove("user");
		return "result";
	}
	@Override
	public void setSession(Map<String,Object> session) {
		this.session = session;
	}

}
