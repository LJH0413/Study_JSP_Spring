package ch18.com.model;

import javax.servlet.http.HttpServlet;

public class LoginBean {
	
	private String id;
	private String password;
	
	public LoginBean() {
		
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	public boolean validate() {
		if(password.equals("admin")) {
			return true;
		} else return false;
			
	}
	
	

}
