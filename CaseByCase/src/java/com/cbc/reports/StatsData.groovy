package com.cbc.reports;

public class StatsData {
	//** CLIENTS
	public int num_new_clients=0;
	public int num_clients = 0;
	public int num_ref_clients = 0;
	
	//** CASES
	public int num_new_cases = 0;
	public int num_cases = 0;
	public int num_cases_referred = 0;
	public int num_closed_cases = 0;
	public int ave_days_taken =  0;
	
	//** ACTIONS
	public int num_actions =0;
	
	//** EVENTS
	public int num_events = 0;

	@Override
	public String toString() {
		return "StatsData [num_new_clients=" + num_new_clients
				+ ", num_clients=" + num_clients + ", num_ref_clients="
				+ num_ref_clients + ", num_new_cases=" + num_new_cases
				+ ", num_cases=" + num_cases + ", num_cases_referred="
				+ num_cases_referred + ", num_closed_cases=" + num_closed_cases
				+ ", ave_days_taken=" + ave_days_taken + ", num_actions="
				+ num_actions + ", num_events=" + num_events + "]";
	}
	
	//** PCMs
	
}
