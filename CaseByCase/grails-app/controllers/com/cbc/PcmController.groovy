package com.cbc



import static org.springframework.http.HttpStatus.*
import com.cbc.location.Location
import grails.transaction.Transactional
import org.joda.time.*
import org.joda.time.format.*

@Transactional(readOnly = true)
class PcmController {
	def cbcApiService
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 50, 100)
        respond Pcm.list(params), model:[pcmInstanceCount: Pcm.count()]
    }

    def show(Pcm pcmInstance) {
        respond pcmInstance
    }

    def create() {
        respond new Pcm(params)
    }

    @Transactional
    def save(Pcm pcmInstance) {
        if (pcmInstance == null) {
            notFound()
            return
        }

        if (pcmInstance.hasErrors()) {
            respond pcmInstance.errors, view:'create'
            return
        }
		try{
			if(location){
				pcmInstance.location = location
				pcmInstance = officeInstance.merge()
			}
		}catch(Exception e){
			println("Failed to save new location... "  + e)
			flash.message = "Error: Failed to save form due to an error saving location details."
			
			render(view: "create", model: [pcmInstance: pcmInstance])
			return
		}
        pcmInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'pcmInstance.label', default: 'Pcm'), pcmInstance.toString()])
                redirect pcmInstance
            }
            '*' { respond pcmInstance, [status: CREATED] }
        }
    }

    def edit(Pcm pcmInstance) {
        respond pcmInstance
    }

    @Transactional
    def update(Pcm pcmInstance) {
        if (pcmInstance == null) {
            notFound()
            return
        }

        if (pcmInstance.hasErrors()) {
            respond pcmInstance.errors, view:'edit'
            return
        }
		//Save location information
		try{
			Location location = cbcApiService.saveLocation(params)
			if(location) pcmInstance.location = location
		}catch(Exception e){
			println("Failed to save new location..."  + e)
			flash.message = "Error: Failed to update form due to an error saving location details."
			
			render(view: "create", model: [pcmInstance: pcmInstance])
			return
		}
        pcmInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Pcm.label', default: 'Pcm'), pcmInstance.toString()])
                redirect pcmInstance
            }
            '*'{ respond pcmInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Pcm pcmInstance) {

        if (pcmInstance == null) {
            notFound()
            return
        }

        pcmInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Pcm.label', default: 'Pcm'), pcmInstance.toString()])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'pcmInstance.label', default: 'Pcm'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
	
	def upload = {
		/*
		 * Date pcmDate
			String sender
			String content
			String receiver
		 */
		int existingCount = 0
		boolean hasErrors = false
		DateTimeFormatter formatter = DateTimeFormat.forPattern("dd MMM yyyy HH:mm:ss");
		DateTimeFormatter formatter1 = DateTimeFormat.forPattern("dd-MM-yyyy HH:mm");
		def f = request.getFile( 'filecsv' )
		if (f.empty) {
			flash.message = 'file cannot be empty'
			render(view: 'index')
			return
		}

		f.inputStream.splitEachLine(',') { row ->
		  
			if(existingCount < 20){
				def _date =  row[0]?.trim()?.replaceAll("\"", "")
				def _sender = row[1]?.trim()?.replaceAll("\"", "")
				def _content = row[2]?.trim()?.replaceAll("\"", "")
	
				try{			
					DateTime dt = null
					try{
						dt = formatter.parseDateTime(_date);
					}catch(Exception e){	}
					if(dt == null) dt = formatter1.parseDateTime(_date);
	
					if(dt){		
	
						def pcm = Pcm.findByPcmDateAndSender(dt.toDate(),_sender)					
						if(!pcm){
						//	println("Creating new item")
							pcm = new Pcm( pcmDate: dt.toDate(), sender: _sender,content: _content)
							pcm.save()
							if (pcm.hasErrors()) {
								println(pcm?.errors)
								log.error("Could not import domainObject  ${pcm.errors}")
							}else{
								log.debug("Importing domainObject  ${pcm.toString()}")
							}
						}else{
							//println("PCM already exists!! " + pcm)
							existingCount = existingCount + 1											
						}
					}
				}catch(Exception e){
					if(_date != "Date Received"){
						println("Error processing: '" + _date + "'")
						//e.printStackTrace()
						hasErrors = true
					}
				} //end catch
			} //end if exitingCount < 
			
		} //end spliteachline
		//response.sendError(200, 'Done')
		println("Done!!")
		flash.message = "Finished processing file! "
		if(hasErrors) flash.message += " There where errors processing the date format of some or all of the entries in the file!"
        redirect action: "index", method: "GET"
		
	} //end upload 
	

} //end class
