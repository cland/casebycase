package com.cbc

public enum SystemRoles {
	ROLE_ADMIN("ROLE_ADMIN"),
	ROLE_DEVELOPER("ROLE_DEVELOPER"),
	ROLE_REVIEWER("ROLE_REVIEWER")
	final String value;
	
	SystemRoles(String value) {
		this.value = value;
	}
	
	String toString(){
		value;
	}
	
	String getKey(){
		name()
	}

	static list() {
		[ROLE_REVIEWER,ROLE_ADMIN,ROLE_DEVELOPER]
	}
}
