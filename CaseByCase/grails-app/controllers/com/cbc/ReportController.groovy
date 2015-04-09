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
//	public Office offic
//	public StatsData statsdata
	def officeSummaryStats(){
		
		def c = Case.where{
			status.name == "Open"
		}
		def openCases = new ArrayList()
		def dt = new Date()
		Calendar cal = Calendar.getInstance()
		cal.setTime(dt)
		cal.set(Calendar.MONTH, dt.getMonth() -1)
		Date date = cal.getTime()
		def currDate1 = date.format("MM/YY")
		println currDate1 + " ====================> " + date
		c.each{
			println it.lastUpdated
			def currMonth = (it.lastUpdated).format("MM/YY")
			
			println currDate1+ " ====================> " + currMonth
			if(currDate1.equals(currMonth)){
				openCases.add(it)
			}
			
		}
		println openCases.size()
		
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
		ostats.statsdata.num_closed_cases =openCases.size()
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
		
		def actionList = []
		def clientList = []
		def orgclientList = []
		caseList?.each {thiscase ->
			def tmplist = thiscase?.actions?.collect{
				[it*.toMap([caseid:thiscase?.id])]
			}
			actionList.add(tmplist)
			
			tmplist = thiscase?.clients?.collect{
				[it*.toMap([caseid:thiscase?.id])]
			}
			clientList.add(tmplist)
			tmplist = thiscase?.orgclients?.collect{
				[it*.toMap([caseid:thiscase?.id])]
			}
			clientList.add(tmplist)
		}


		def caseHeaders = ['Case Number',
			'subject',
			'Date Opened',
			'Problem Started',
			'Description',
			'Total Male',
			'Total Female',
			'Total Unknown',
			'Case Worker',
			'Respondent',
			'Priority',
			'Status',
			'Special Case',
			'Outcome',
			'Date Closed',
			'Amt Recovered',
			'Best Practice',
			'Date Created',
			'Created By',
			'Date Last Updated',
			'Last Updated By',
			'Categories',
			'Labour: Work Hours - Overtime',
			'Labour: Work Hours - Daily',
			'Labour: Work Hours - Weekend',
			'Labour: Work Hours - Holiday',
			'Labour: Leave Days - Annual',
			'Labour: Leave Days - Sick ',
			'Labour: Leave Days - Maternity',
			'Labour: Leave Days - Family',
			'Labour: Allowance Amount',
			'Labour: Allowance Benefit',
			'Labour: Trade Union Member',
			'Labour: Trade Union Member Other',
			'Labour: Work Union',
			'Labour: Work Union Other',
			'Labour: Member of Work Union',
			'Labour: Wages',
			'Labour: Leave',
			'Labour: Allowance',
			'Labour: Benefits',
			'Labour: Health and Safety',
			'Labour: Dismisal',
			'Labour: UIF',
			'Labour: Hours Worked',
			'Labour: Earnings',
			'Event',			
			'Item Id']
		
		
		def withCaseProperties = ['casenumber',
			'subject',	
			'dateopen',
			'dateproblemstart',
			'description',
			'totalmale',
			'totalfemale',
			'totalunknown',
			'caseworker',
			'respondent',
			'priority',
			'status',
			'specialcase',
			'outcome',
			'dateclosed',
			'amountrecovered',
			'bestpractice',
			'datecreated',
			'createdby',
			'datelastupdated',
			'lastupdatedby',
			'category',
			'labour.workhours.overtime',
			'labour.workhours.daily',
			'labour.workhours.weekend',
			'labour.workhours.holiday',
			'labour.leavedays.annual',
			'labour.leavedays.sick',
			'labour.leavedays.maternity',
			'labour.leavedays.family',
			'labour.allowamount',
			'labour.allowbenefits',
			'labour.tradeunionmember',
			'labour.specifymembership',
			'labour.workunion',
			'labour.specifyworkunion',
			'labour.workunionmember',
			'labour.wages',
			'labour.leave',
			'labour.allowance',
			'labour.benefits',
			'labour.health',
			'labour.dismisal',
			'labour.uif',
			'labour.hoursworked',
			'labour.earnings',
			'event',
			'id'
			]
		def actionHeaders = ['Date Created','Item Id','Case Id']
		def withActionProperties = ['datecreated','id','params.caseid']
		def clientHeaders = ['Date Created','Item Id','Case Id']
		def withClientProperties = ['datecreated','id','params.caseid']
		def orgclientHeaders = ['Date Created','Item Id','Case Id']
		def withOrgClientProperties = ['datecreated','id','params.caseid']
		
		new WebXlsxExporter().with {
			setResponseHeaders(response)
			sheet('Cases').with {
				fillHeader(caseHeaders)
				add(caseList*.toMap(), withCaseProperties)
			}
			sheet('Actions').with{
				fillHeader(actionHeaders)
				add(actionList,withActionProperties)
			}
			sheet('People Clients').with{
				fillHeader(clientHeaders)
				add(clientList,withClientProperties)
			}
			sheet('Organisation Clients').with{
				fillHeader(orgclientHeaders)
				add(clientList,withOrgClientProperties)
			}
			save(response.outputStream)
		}
	} //
	
	private parseDate(date) {
		SimpleDateFormat df = new SimpleDateFormat("dd-MMM-yyyy");
		return (!date) ? new Date() : df.parse(date)
   }
} //end class
