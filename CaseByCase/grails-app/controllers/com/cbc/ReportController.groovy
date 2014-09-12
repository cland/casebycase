package com.cbc

import java.util.Date;
import com.cbc.reports.OfficeSummaryStats
import com.cbc.reports.StatsData;
import grails.converters.JSON

class ReportController {
	def cbcApiService
    def index() { }
//	public Date startdate = null
//	public Date enddate = null
//	public String office_name=""
//	public String office_id=0
//	public Office office
//	public StatsData statsdata
	def officeSummaryStats(){
		Office o = cbcApiService.getUserPrimaryOffice()
		OfficeSummaryStats ostats = new OfficeSummaryStats()
		ostats.startdate=new Date()
		ostats.enddate = new Date()
		ostats.office_name = o?.name
		ostats.office_id = o?.id
		//ostats.office = o
//		StatsData statsdata = new StatsData()
		ostats.statsdata.ave_days_taken = 2
		ostats.statsdata.num_actions = 2
		ostats.statsdata.num_cases = 51
		ostats.statsdata.num_cases_referred = 1
		ostats.statsdata.num_clients = 3
		ostats.statsdata.num_closed_cases =15
		ostats.statsdata.num_events = 10
		ostats.statsdata.num_new_cases = 21
		ostats.statsdata.num_ref_clients = 2
		ostats.statsdata.num_new_clients = 15
		

		
		render ostats as JSON
	} //end function

} //end class
