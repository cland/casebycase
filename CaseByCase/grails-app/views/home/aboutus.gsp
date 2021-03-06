<%@ page import="com.cbc.SystemRoles" %>
<%@ page import="com.cbc.User" %>
<g:set var="hostOrg" value="${ com.cbc.Organisation.find{isHost==true}}"/>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>CWAO: About us</title>
		<g:set var="page_sidenav" value="${com.cbc.SideNav.MENU_STANDARD}" />
		<style type="text/css" media="screen">
			#status {
				background-color: #eee;
				border: .2em solid #fff;
				margin: 2em 2em 1em;
				padding: 1em;
				width: 12em;
				float: left;
				-moz-box-shadow: 0px 0px 1.25em #ccc;
				-webkit-box-shadow: 0px 0px 1.25em #ccc;
				box-shadow: 0px 0px 1.25em #ccc;
				-moz-border-radius: 0.6em;
				-webkit-border-radius: 0.6em;
				border-radius: 0.6em;
			}

			.ie6 #status {
				display: inline; /* float double margin fix http://www.positioniseverything.net/explorer/doubled-margin.html */
			}

			#status ul {
				font-size: 0.9em;
				list-style-type: none;
				margin-bottom: 0.6em;
				padding: 0;
			}

			#status li {
				line-height: 1.3;
			}

			#status h1 {
				text-transform: uppercase;
				font-size: 1.1em;
				margin: 0 0 0.3em;
			}

			#page-body {
				margin: 2em 1em 1.25em 18em;
			}

			h2 {
				margin-top: 1em;
				margin-bottom: 0.3em;
				font-size: 1em;
			}

			p {
				line-height: 1.5;
				margin: 0.25em 0;
			}

			#controller-list ul {
				list-style-position: inside;
			}

			#controller-list li {
				line-height: 1.3;
				list-style-position: inside;
				margin: 0.25em 0;
			}

			@media screen and (max-width: 480px) {
				#status {
					display: none;
				}

				#page-body {
					margin: 0 1em 1em;
				}

				#page-body h1 {
					margin-top: 0;
				}
			}
			@media print{
				#page-body {marging:0;}
			}
			.li-tick {padding:5px;list-style-position:inside;
			list-style-image:url('${fam.icon(name: 'accept')}');
			font-size:0.9em;
			margin-bottom:10px;
			}
			.data-table .cell {width:50%;font-size:0.9em;padding:20px;vertical-align:top;}
			.data-table .cell div.staff {border:solid 1px #EB8F2A;padding:5px;height:290px; text-align:center;}
			legend {font-weight:bold;color:#FFAE2F;font-size:1.2em;}
			h1 {font-weight:bold;font-size:1.3em;}
			.caption {padding:5px;}
		</style>
		<g:render template="head"></g:render>
	</head>
	<body>
		<a href="#page-body" class="skip"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		
		<div id="status1" class="leftbar" role="complementary">
			<g:sideMenu default="${page_sidenav}"></g:sideMenu> 
		</div>
		<div id="page-body" role="main">
			
			<div class="content">
			${com.cbc.Document.findByName('$aboutus')?.content?.decodeHTML() }
			
			<fieldset id="contactus"><legend>Contact us</legend>
			
				<div class="content float-left" style="width:100%;">
				${com.cbc.Document.findByName('$contactus')?.content?.decodeHTML() }
				
				<p>
				<g:set value="${ hostOrg?.phoneNo?.split(',')}" var="phoneList"/>
				<b>T:</b> ${ phoneList?.find{true}}<br>
				<b>F:</b><g:if test="${phoneList?.size() >= 2 }">  ${phoneList?.getAt(1)}</g:if><br>
				<b>M:</b><g:if test="${phoneList?.size() >= 3 }">  ${phoneList?.getAt(2)}</g:if><br>
				<b>E:</b> <a href="mailto:${ hostOrg?.email}">${ hostOrg?.email}</a>
				</p>
				</div>
			</fieldset>
			<fieldset id="team"><legend>Meet The Team</legend>
			<g:set var="data_table" value=""/>
			<g:set var="tmp" value=""/>
			<g:set var="staffList" value="${ hostOrg?.staff}"/>
			<g:set var="count_per_row" value="${2 }"/>
			<g:set var="total_count" value="${staffList?.size() }"/>
			<div class="data-table">
			<g:each in="${ staffList?.sort{it.id}}" var="userInstance" status="i">
				<g:set var="thisUser" value="${ User.get(userInstance.id)}"/>
				<g:set var="entry">
					<div class="cell">
						<div class="staff">			
						<g:set var="hasphoto" value="${false }"/>			
							<attachments:each bean="${thisUser}" inputName="headshot" status="k">	
							<g:set var="hasphoto" value="${true }"/>
								<div class="photo-display" style="border:none;margin-bottom:1.5em;">
									<img src="${createLink(controller:'attachmentable',action:'download', id:attachment.id)}"/>															
								</div>	
								<g:if test="${k%2==0 & k!=0 }"><br/></g:if>
							</attachments:each>	
							<g:if test="${!hasphoto }">
								<div class="photo-display" style="border:none;margin-bottom:1.5em;"><img src="../images/noimage.gif"/></div>
							</g:if>		
							<b>${userInstance}</b><br/>
							<span class="caption"> ${thisUser?.caption}</span>
							<br/>		
						</div>
					</div>
				</g:set>
				
				<g:set var="tmp" value="${tmp } ${entry }"/>

						<g:if test="${((i+1)%count_per_row) ==0 }">
							<g:set var="data_table">
								<div id="row-${i}" class="staff-row">
									${tmp }
								</div>
							</g:set>
							<g:set var="tmp" value="" />
						</g:if>
						<!-- Add the last bit -->
						<g:if test="${(total_count == (i+1)) & tmp != "" }">
							<g:set var="data_table">
								${data_table }
								<div id="row-${i}" class="staff-row">
									${tmp }
								</div>
							</g:set>
						</g:if>
				</g:each>
				${data_table }
				
			</div>
			</fieldset>
			
			<br/>
<%--	example youtube video: 		<g:video videoKey="wyUsWVMukT0"/>--%>
			<br/>
		</div>
		</div>
<script>
	$(document).ready(function() {		
		$("#accordion" ).accordion({ active: cbc_params.active_sidebar() });
	
		$("#tabs").tabs(
				{
				active:cbc_params.active_tab(),
				create: function (event,ui){	
					//executed after is created								
					$('#tabs').show()
				},
				show: function(event,ui){
					//on every tabs clicked
				},
				beforeLoad : function(event, ui) {
						ui.jqXHR.error(function() {
							ui.panel
							.html("Couldn't load this tab. We'll try to fix this as soon as possible. ");
						});
					}
		});		                
	});  
</script>		
	</body>
</html>
