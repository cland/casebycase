package com.cbc

public enum SideNav {
	MENU_ADMIN("sidenav"),
	MENU_STANDARD("sidenav"),
	
	final String value;
	
	SideNav(String value) {
		this.value = value;
	}
	
	String toString(){
		this.value;
	}
	
	String getKey(){
		name()
	}

	static list() {
		[MENU_ADMIN.toString(),MENU_STANDARD.toString()]
	}
	static stringKeyValuePair(){
		MENU_ADMIN.toString() +":" + MENU_ADMIN.getKey() + ";" +
		MENU_STANDARD.toString() +":" + MENU_STANDARD.getKey() + ";"
		
	}
	static listKeys() {
		[MENU_ADMIN.getKey(),MENU_STANDARD.getKey()]
	}
}
