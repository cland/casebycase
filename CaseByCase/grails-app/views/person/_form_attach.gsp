<%--SUPPORTING DOCUMENTS SECTION--%>
<g:set var="thisInstance" value="${thisInstance }"/>
<fieldset><legend>SUPPORTING DOCUMENTS</legend>

<h1>Documents</h1>

<input type="file" name="documents"/>
<input type="file" name="documents"/>
<g:if test="${params?.action == false }">
<br/>
	<div id="attachments" class="attachments">
			<attachments:each bean="${thisInstance}" inputName="documents" status="i">	
			<div class="photo-display float-left">
			<img src="${createLink(controller:'attachmentable',action:'download', id:attachment.id)}"/><br/>
				<img src="${resource(dir:'images/icons',file:'attach.png',plugin:'famfamfam')}" />			
				<attachments:downloadLink attachment="${attachment}" inline="true" withContentType="true" />
				${attachment.niceLength}
				<attachments:deleteLink attachment="${attachment}" label="${'[ delete ]'}"
					returnPageURI="${createLink(action:'show', id:thisInstance.id,absolute:true)}" />
			</div>	
				<g:if test="${i%2==0 & i!=0 }"><br/></g:if>
			
			</attachments:each>
			<div style="clear:both"></div>
	</div>
</g:if>	


<h1>PICTURES</h1>
<input type="file" name="pictures"/>
<input type="file" name="pictures"/>
<g:if test="${params?.action == false }">
<br/>
	<div id="attachments" class="attachments">
			<attachments:each bean="${thisInstance}" inputName="documents" status="i">	
			<div class="photo-display float-left">
			<img src="${createLink(controller:'attachmentable',action:'download', id:attachment.id)}"/><br/>
				<img src="${resource(dir:'images/icons',file:'picture.png',plugin:'famfamfam')}" />			
				<attachments:downloadLink attachment="${attachment}" inline="true" withContentType="true" />
				${attachment.niceLength}
				<attachments:deleteLink attachment="${attachment}" label="${'[ delete ]'}"
					returnPageURI="${createLink(action:'show', id:thisInstance.id,absolute:true)}" />
			</div>	
				<g:if test="${i%2==0 & i!=0 }"><br/></g:if>
			
			</attachments:each>
			<div style="clear:both"></div>
	</div>
</g:if>	
</fieldset>