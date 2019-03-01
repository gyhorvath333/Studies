package com.gyuri.zenekerdoiv2.user;

import javax.validation.constraints.NotNull;
//import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

public class ZeneUser {

	@NotNull(message="K�telez� kit�lteni!")
	@Size(min=1, message="K�telez� kit�lteni!")
	//@Pattern(regexp="\\[a-zA-Z]{2,}( [a-zA-Z]{2,})+\\b", message="K�rlek ne haszn�lj �kezetes bet�ket!")
	private String userName;
	
	@NotNull(message="K�telez� kit�lteni!")
	@Size(min=1, message="K�telez� kit�lteni!")
	private String password;
	
	public ZeneUser() {
		
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
}
