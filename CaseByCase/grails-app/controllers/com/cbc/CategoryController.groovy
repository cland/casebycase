package com.cbc



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class CategoryController {

	static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

	def index(Integer max) {
		params.max = Math.min(max ?: 10, 100)
		respond Category.list(params), model:[categoryInstanceCount: Category.count()]
	}

	def show(Category categoryInstance) {
		respond categoryInstance
	}

	def create() {
		respond new Category(params)
	}

	@Transactional
	def save(Category categoryInstance) {
		if (categoryInstance == null) {
			notFound()
			return
		}

		if (categoryInstance.hasErrors()) {
			respond categoryInstance.errors, view:'create'
			return
		}

		categoryInstance.save flush:true

		request.withFormat {
			form {
				flash.message = message(code: 'default.created.message', args: [
					message(code: 'categoryInstance.label', default: 'Category'),
					categoryInstance.toString()
				])
				redirect categoryInstance
			}
			'*' { respond categoryInstance, [status: CREATED] }
		}
	}

	def edit(Category categoryInstance) {
		respond categoryInstance
	}

	@Transactional
	def update(Category categoryInstance) {
		if (categoryInstance == null) {
			notFound()
			return
		}

		if (categoryInstance.hasErrors()) {
			respond categoryInstance.errors, view:'edit'
			return
		}

		categoryInstance.save flush:true

		request.withFormat {
			form {
				flash.message = message(code: 'default.updated.message', args: [
					message(code: 'Category.label', default: 'Category'),
					categoryInstance.toString()
				])
				redirect categoryInstance
			}
			'*'{ respond categoryInstance, [status: OK] }
		}
	}

	@Transactional
	def delete(Category categoryInstance) {

		if (categoryInstance == null) {
			notFound()
			return
		}

		categoryInstance.delete flush:true

		request.withFormat {
			form {
				flash.message = message(code: 'default.deleted.message', args: [
					message(code: 'Category.label', default: 'Category'),
					categoryInstance.toString()
				])
				redirect action:"index", method:"GET"
			}
			'*'{ render status: NO_CONTENT }
		}
	}

	protected void notFound() {
		request.withFormat {
			form {
				flash.message = message(code: 'default.not.found.message', args: [
					message(code: 'categoryInstance.label', default: 'Category'),
					params.id
				])
				redirect action: "index", method: "GET"
			}
			'*'{ render status: NOT_FOUND }
		}
	}


	/**generates the hierarchy structure for categories **/
	def renderHierarchyStructure(){
		//println "Start"
		String treeString = "<div class='tree well'><ul><li>"
		//Category mainCategory = Category.findByName("Root")
		def rootNodesList = Category.findAllByCategory(null)

		rootNodesList.eachWithIndex{ Category rootNode, int index->
			String actions = ""
			//actions += "<a class='edit' href='edit/${rootNode.id}'>Edit</a>"
			actions+= "<a class='add' title='New Category' href='create?category=${rootNode.id}'></a>"
			//actions+=""

			treeString+= "<span><i class='icon-minus-sign'></i> ${rootNode.name}</span>${actions}"
			treeString+= getAllNodeChildren(rootNode)
			treeString+= "<br/>"
			//println treeString
		}

		//println "End"

		treeString+= "</li></ul></div>"

		render treeString
	}


	def getAllNodeChildren(Category parentNode) {
		Set<Category> nodes = new HashSet()
		String treeString = "<ul class='childrenTab'>"
		getNodeChildren(parentNode).each{def iteration->
			Category node = iteration.key
			nodes.add(node)
			treeString += "<li>"
			treeString += iteration.value
			treeString += getAllNodeChildren(node)
			treeString += "</li>"
		}

		treeString+= "</ul>"
		return treeString
	}

	def getNodeChildren(Category parentNode) {
		Map<Category, String> nodeMapping = new HashMap<Category, String>()
		def nodeCriteria = Category.createCriteria()
		def nodeChildren = nodeCriteria.list {
			eq('category', parentNode)
			order("name", "asc")
		}
		nodeChildren.each {Category currentNode ->
			String actions = ""
			actions += "<a class='edit' title='Edit' href='edit/${currentNode.id}'></a>"
			actions+= "<a class='add' title='Add Subcategory' href='create?category=${currentNode.id}'></a>"
			actions+=""

			if(!currentNode.categories){
				nodeMapping.put(currentNode, "<span><i class='icon-leaf'></i> ${currentNode.name}</span> ${actions}")
			}else{
				nodeMapping.put(currentNode, "<span><i class='icon-minus-sign'></i> ${currentNode.name}</span> ${actions}")
			}
		}
		return nodeMapping
	}
}
