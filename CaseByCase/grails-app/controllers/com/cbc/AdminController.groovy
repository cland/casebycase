package com.cbc
import com.cbc.location.Country
import com.cbc.location.Location
import com.cbc.lookup.Keywords
import org.joda.time.*
import org.joda.time.format.*

class AdminController {

    def index() { }
	/**
	 * Upload learners and creates register -> resultsummary -> examresults
	 * The learner should already exist with a studentno
	 */
	def uploadClientData = {
		def separator = params.delimeter //";"
		if(!separator) separator = ";"
		DateTimeFormatter formatter = DateTimeFormat.forPattern("dd-MMM-yy");
		def f = request.getFile( 'clientdatacsv' )
		if (f.empty) {
			flash.message = 'file cannot be empty'
			render(view: 'index')
			return
		}
		
		// 18 columns
		int count = 0
		def failedList = []
		f.inputStream.splitEachLine(';') { row ->
			def _notesid = ""
			def _firstname = ""
			def _lastname = ""
			def _knownas = ""
			def _title = ""
			def _email = ""
			Citizenship _citizenship = null
			Date _dateofbirth = null
			def _idnumber = ""
			Keywords _maritalstatus = null
			def _gender = ""
			Race _race = null
			Country _countryOfOrigin = null
			
			List _phones = []
			Location _location = null
			
			Keywords _workStatus = null
			List <Keywords> _worksectors = null
			List <Keywords> _incomesources = null
			Keywords _education = null
			Keywords _incomePersonal  = null
			Keywords _incomeHouse = null
			def _empHowJobFound = ""
			def _empHowJobFoundDesc = ""
			def _history = ""
			if(count > 0){
				println("Row: " + count)
				row.eachWithIndex {col,index ->
					
					def value = col?.trim()?.replaceAll("\"", "")?.replaceAll("'","")
					switch(index){
						case 0:
							_notesid = value
						break;
						case 1:
							//citizenship id
						break;
						case 2:
							//RSACITIZEN
						break;
						case 3:
							//createdby
						break;
						case 4:
							//date created
						break;
						case 5:
							_email = value
						break;
						case 6:
							_empHowJobFound = value
						break;
						case 7:
							_empHowJobFoundDesc = value
						break;
						case 8:
							_firstname = value
						break;
						case 9:
							_gender = value
						break;
						case 10:
							//history column
							_history = _notesid
						break;
						case 11:
							_idnumber = value
						break;
						case 12:
							_knownas = value
						break;
						case 13:
							_lastname = value
						break;
						case 14:
							//last update date
						break;
						case 15:
							//last updated by
						break;
						case 16:
							//location_id
						break;
						case 17:
							//office_id
						break;
						case 18:
							_race = Race.findByName(value)
							
						break;
						case 19:
							//title
							_title = value
						break;
						case 20:
							_countryOfOrigin = Country.findByName(value)
						break;
						case 21:
							//Marital status
							_maritalstatus = Keywords.findByName(value)
						break;
						case 22:
							_workStatus = Keywords.findByName(value)
							
						break;
						case 23:
							//work sector
							Keywords k = Keywords.findByName(value)
							_worksectors = new ArrayList<Keywords>()
							if(k != null){
								_worksectors.add(k)
							}
							
						break;
						case 24:
							//eduction
							_education = Keywords.findByName(value)						
						break;
						case 25:
							_incomePersonal = Keywords.findByName(value)
						break;
						case 26:
							_incomeHouse = Keywords.findByName(value)
						break;
						case 27:
							Keywords k = Keywords.findByName(value)
							_incomesources = new ArrayList<Keywords>()
							if(k != null){
								_incomesources.add(k)
							}
						break;
					} //end switch
				} //end row.eachWithIndex
				
				//save the values
				Person p = new Person(lastName:_lastname)
				
			} //end if count > 0
			count++
		} //end splitEachLine
		println("Done processing!")
		def result = "<h1>Done processing!</h1><br/>"
		if(failedList.size() > 0) {
			result + "FAILED: " + failedList.size() + " <br/>"
			failedList.eachWithIndex{val,index ->
				result += (index+1) + ") " + val + "<br/>"
			}
		}
		render result
	}//end function
} //end class
