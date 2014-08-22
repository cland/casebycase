package com.cbc

public enum SystemRoles {
	ROLE_ADMIN("ROLE_ADMIN"),
	ROLE_DEVELOPER("ROLE_DEVELOPER"),
	ROLE_REVIEWER("ROLE_REVIEWER","Can view only without editing abilities"),
	ROLE_NCO("ROLE_NCO","National Co-Ordinator"),
	ROLE_PCO("ROLE_OCO","Office Co-Ordinator"),
	ROLE_OCO("ROLE_PCO","Provincial Co-Ordinator"),
	ROLE_CWO("ROLE_CWO","Case Worker Officer"),
	ROLE_SPO("ROLE_SPO","Special Case Worker"),
	ROLE_MEO("ROLE_MEO","Monitoring and Evaluation role - readonly")
	final String value;
	final String description;
	SystemRoles(String value) {
		this.value = value;
		this.description = "";
	}
	SystemRoles(String value,String desc) {
		this.value = value;
		this.description = desc;
	}
	String toString(){
		value;
	}
	String getDescription(){
		return description
	}
	String getKey(){
		name()
	}

	static list() {
		[ROLE_REVIEWER,ROLE_ADMIN,ROLE_DEVELOPER,
			ROLE_NCO,
			ROLE_PCO,
			ROLE_OCO,
			ROLE_CWO,
			ROLE_SPO,
			ROLE_MEO
			]
	}
}
