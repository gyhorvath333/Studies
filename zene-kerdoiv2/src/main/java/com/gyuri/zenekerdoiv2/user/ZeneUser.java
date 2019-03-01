package com.gyuri.zenekerdoiv2.user;

import javax.validation.constraints.NotNull;
//import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

public class ZeneUser {

	@NotNull(message="Kötelezõ kitölteni!")
	@Size(min=1, message="Kötelezõ kitölteni!")
	//@Pattern(regexp="\\[a-zA-Z]{2,}( [a-zA-Z]{2,})+\\b", message="Kérlek ne használj ékezetes betûket!")
	private String userName;
	
	@NotNull(message="Kötelezõ kitölteni!")
	@Size(min=1, message="Kötelezõ kitölteni!")
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
