package com.cbc

import java.util.Date;
import com.cbc.reports.OfficeSummaryStats
import com.cbc.reports.StatsData;
import grails.converters.JSON


import java.text.DateFormat
import java.text.SimpleDateFormat
import org.joda.time.DateTime
import org.springframework.dao.DataIntegrityViolationException
import pl.touk.excel.export.WebXlsxExporter


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

	def export(params){
		def startdate_caseopen = params?.startDate_open
		def enddate_caseopen = params?.endDate_open
		
		if(startdate_caseopen != null & startdate_caseopen != "") startdate_caseopen = parseDate(startdate_caseopen) else startdate_caseopen = new DateTime().minusMonths(24).toDate()
		if(enddate_caseopen != null  & startdate_caseopen != "") enddate_caseopen = parseDate(enddate_caseopen) else enddate_caseopen = (new Date())
		
		def caseList = Case.createCriteria().list(params){
			if(startdate_caseopen != null & enddate_caseopen != null){
				between('dateOpen', startdate_caseopen, enddate_caseopen)
			}
		}
			
		def headers = ['Case Title',
			'Case No',
			'Date Opened',			
			'System Id']
		
		def withProperties = ['subject',
			'caseNumber',	
			'dateOpen',		
			'id'
			]
		new WebXlsxExporter().with {
			setResponseHeaders(response)
			sheet('Cases').with {
				fillHeader(headers)
				add(caseList, withProperties)
			}
			save(response.outputStream)
		}
	} //
	
	private parseDate(date) {
		SimpleDateFormat df = new SimpleDateFormat("dd-MMM-yyyy");
		return (!date) ? new Date() : df.parse(date)
   }
} //end class
