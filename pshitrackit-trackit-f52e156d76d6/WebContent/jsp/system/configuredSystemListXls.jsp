<%@ page language="java" %>
<%@ page import="com.premiersolutionshi.old.util.CommonMethods" %>

<%@ taglib prefix="bean"  uri="http://struts.apache.org/tags-bean" %>
<%@ taglib prefix="html"  uri="http://struts.apache.org/tags-html" %>
<%@ taglib prefix="logic" uri="http://struts.apache.org/tags-logic" %>

<jsp:useBean id="resultList" scope="request" class="java.util.ArrayList"/>
<jsp:useBean id="msoFooterData" scope="request" class="java.lang.String"/>

<jsp:useBean id="currFacetVersion" scope="request" class="java.lang.String"/>
<jsp:useBean id="currKofaxVersion" scope="request" class="java.lang.String"/>
<jsp:useBean id="currDummyVersion" scope="request" class="java.lang.String"/>
<jsp:useBean id="currDmsVersion"	 scope="request" class="java.lang.String"/>

<bean:define id="defaultPageTitle" value="Kofax Licenses"/>
<jsp:useBean id="customPageTitle" scope="request" class="java.lang.String"/><bean:define id="pageTitle" name="customPageTitle"/><logic:equal name="pageTitle" value=""><bean:define id="pageTitle" name="defaultPageTitle"/></logic:equal>

<%
	response.setHeader("Pragma", "public");
	response.setHeader("Cache-Control", "max-age=0");
	response.setContentType("application/vnd.ms-excel");
	response.setHeader("Content-Disposition", "attachment;filename=facet_systems.xls");
%>

<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40">

<head>
<style>
<!--
table
@page {
	mso-header-data: "&C<bean:write name="pageTitle"/>";
	mso-footer-data: "&L<bean:write name="msoFooterData"/>&R&P of &N";
	margin: 1.0in .75in 1.0in .75in;
	mso-header-margin: .5in;
	mso-footer-margin: .5in;
}

BODY {
	background-color: #FFFFFF;
}

tr {
	mso-height-source: auto;
}

col {
	mso-width-source: auto;
}

br {
	mso-data-placement: same-cell;
}

.style0 {
	mso-number-format: General;
	text-align: general;
	vertical-align: middle;
	white-space: nowrap;
	mso-rotate: 0;
	mso-background-source: auto;
	mso-pattern: auto;
	color: windowtext;
	font-size: 10pt;
	font-style: normal;
	text-decoration: none;
	font-family: Calibri, Arial;
	mso-generic-font-family: auto;
	mso-font-charset: 0;
	mso-protection: locked visible;
	mso-style-name: Normal;
	mso-style-id: 0;
	padding: 3px;
	mso-ignore: padding;
}

td {
	mso-style-parent: style0;
}

#xlsTable th {
	background-color: #97cbfd;
	color: black;
	font-weight: bold;
	border: .5pt solid #000;
	}

#xlsTable th.rightBorder {
	background-color: #97cbfd;
	color: black;
	font-weight: bold;
	border: .5pt solid black;
	border-right: 1.5px solid #000;
	}

#xlsTable td {
	mso-style-parent: style0;
	border: .5pt solid #ccc;
	}

#xlsTable td.numRow {
	mso-number-format:"\#\,\#\#0";
	}

#xlsTable td.txtRow {
	mso-number-format: "\@";
	}

#xlsTable td.txtRowRight {
	mso-number-format: "\@";
	border-right: 1.5px solid #000;
	}
-->
</style>
</head>

<body>
<table id="xlsTable" border="0" cellspacing="3" cellpadding="3">
	<thead>
		<tr>
			<th colspan="4" class="rightBorder">Unit Assigned</th>
			<th colspan="4" class="rightBorder">FACET Support</th>
			<th colspan="6" class="rightBorder">PSHI-Maintained Software</th>
			<th colspan="2" class="rightBorder">POCs</th>
			<th colspan="8" class="rightBorder">Laptop</th>
			<th colspan="4" class="rightBorder">Scanner</th>
			<th colspan="3" class="rightBorder">Kofax</th>
			<th colspan="2" class="rightBorder">MS Office</th>
			<th colspan="16" class="rightBorder">Backfile Workflow</th>
			<th colspan="10" class="rightBorder">Training Workflow</th>
			<th colspan="9">Decom Workflow</th>
			<th colspan="2"></th>
			<th colspan="5">Uploaded Files</th>
		</tr>
		<tr>
			<th>Unit Name</th>
			<th>Homeport</th>
			<th>RSupply</th>
			<th class="rightBorder">DECOM Date</th>

			<th>Total # of <br/>Support Issues</th>
			<th>Total # of <br/>Open Support<br/>Issues</th>
			<th>Total # of <br/>Completed Support<br/>Visits</th>
			<th class="rightBorder">Latest Support Visit<br/>(inc. upcoming scheduled)</th>

			<th>FACET Version</th>
			<th>Kofax BC Version</th>
			<th>Dummy DB Version</th>
			<th>DMS Version</th>
			<th>ATO Installed</th>
			<th class="rightBorder">Current Location</th>

			<th>Primary POCs</th>
			<th class="rightBorder">All POCs</th>

			<th>Computer Name</th>
			<th>Multi-Ship</th>
			<th>Multi-Ship UICs</th>
			<th>Tag</th>
			<th>Product Name</th>
			<th>Serial Number</th>
			<th>Network Adapter Type</th>
			<th class="rightBorder">Status</th>

			<th>Tag</th>
			<th>Product Name</th>
			<th>Serial Number</th>
			<th class="rightBorder">Status</th>

			<th>Product Name</th>
			<th>License Key</th>
			<th class="rightBorder">Product Code</th>

			<th>Product Name</th>
			<th class="rightBorder">License Key</th>

			<!-- Backfile -->
			<th>Overall<br/>Due Date</th>
			<th>FY14/13<br/>Due Date</th>
			<th>Scheduled<br/>Training<br/>Date</th>
			<th>Completed<br/>Date</th>
			<th>Backfile<br/>Date<br/>Requested</th>
			<th>Date<br/>Received<br/>By PSHI</th>
			<th>Date<br/>Delivered<br/>to Scanning</th>
			<th>FY14/13<br/>Completed<br/>Date</th>
			<th>FY14/13<br/>CD Sent for<br/>Customer<br/>Date</th>
			<th>FY12/11<br/>Completed<br/>Date</th>
			<th>Extract File<br/>Created</th>
			<th>All backfile<br/>CD<br/>mailed to<br/>Cust/SD</th>
			<th>Verify All<br/>Backfiles<br/>Installed<br/>in FACET</th>
			<th>All Backfile<br/>CD<br/>Delivered to<br/>LogCop</th>
			<th>Verified<br/>LOGCOP<br/>Backfile<br/>Uploaded</th>
			<th class="rightBorder">Final Backfile<br/>Report<br/>Generated<br/>and Given to<br/>CompacFlt</th>
			<!--th class="rightBorder">Comments</th-->

			<!-- Training -->
			<th>Location<br/>File<br/>Received</th>
			<th>Location<br/>File<br/>Reviewed</th>
			<th>PacFlt<br/>Sent<br/>Notification<br/>to Send<br/>Food Report</th>
			<th>System<br/>Shipped</th>
			<th>Computer<br/>Name<br/>in Database</th>
			<th>Computer<br/>Name<br/>Provided to<br/>Logcop</th>
			<th>Training Kit<br/>Ready</th>
			<th>Estimated<br/>Training<br/>Month</th>
			<th>Scheduled<br/>Training<br/>Date</th>
			<th class="rightBorder">Actual<br/>Training<br/>Date</th>
			<!--th>Comments</th-->

			<!-- Decom -->
			<th>Client Contacted With Decom Instructions</th>
			<th>Hardware Received By PSHI and Inventory Lists 'Status' Updated</th>
			<th>Status of Hardware Received</th>
			<th>Status of Hardware Received Notes</th>
			<th>FIARModule Folder(s) Copied to P Drive</th>
			<th>Backup Provided to TYCOM</th>
			<th>Records Checked Against LOGCOP</th>
			<th>Transmittal Reconciled With LOGCOP</th>
			<th>Laptop Reset and All Hardware Availability Updated</th>
			<!--th>Comments</th-->

			<!-- etc. -->
			<th>NWCF</th>
			<th>Contract System Installed</th>

			<!-- Uploaded Files -->
			<th>Vessel Date Sheet</th>
			<th>Training Sign In Sheet</th>
`     <th>FACET Laptop Configuration Info</th><%-- <th>Final Laptop Prep Checklist 001</th> --%>
			<th>Trainer Laptop Checklist 002</th>
			<th>Post Install Checklist</th>
		</tr>
	</thead>
	<tbody>
	<logic:iterate id="resultBean" name="resultList" type="com.premiersolutionshi.old.bean.SystemBean">
		<tr>
			<td class="txtRow"><bean:write name="resultBean" property="shipName"/></td>
			<td class="txtRow"><bean:write name="resultBean" property="homeport"/></td>
			<td class="txtRow"><bean:write name="resultBean" property="rsupply"/></td>
			<td class="txtRowRight" style="color:red;font-weight:bold;"><bean:write name="resultBean" property="decomDate"/></td>

			<logic:present name="resultBean" property="lastVisitBean">
				<bean:define id="lastVisitBean" name="resultBean" property="lastVisitBean" type="com.premiersolutionshi.old.bean.SupportBean"/>

				<td><bean:write name="lastVisitBean" property="issueCnt"/></td>
				<td><bean:write name="lastVisitBean" property="openIssueCnt"/></td>
				<td><bean:write name="lastVisitBean" property="supportVisitCnt"/></td>
				<td class="txtRowRight">
					<logic:notEmpty name="lastVisitBean" property="supportVisitDate">
						<bean:write name="lastVisitBean" property="supportVisitDate"/>
						(<bean:write name="lastVisitBean" property="category"/>)
					</logic:notEmpty>
				</td>
			</logic:present>
			<logic:notPresent name="resultBean" property="lastVisitBean">
				<td class="txtRow"/>
				<td class="txtRow"/>
				<td class="txtRow"/>
				<td class="txtRowRight"/>
			</logic:notPresent>

			<td class="txtRow"
				 <% if (!CommonMethods.isEmpty(resultBean.getFacetVersion()) && !resultBean.getFacetVersion().equals(currFacetVersion)) { %>
				 	style="color:red;font-weight:bold;"
				 <% } %>
			>
				 <bean:write name="resultBean" property="facetVersion"/>
			</td>
			<td class="txtRow"
				<% if (!CommonMethods.isEmpty(resultBean.getKofaxVersion()) && !resultBean.getKofaxVersion().equals(currKofaxVersion)) { %>
					style='color:red;font-weight:bold;'
				<% } %>
			>
				<bean:write name="resultBean" property="kofaxVersion"/>
			</td>
			<td class="txtRow"
				<% if (!CommonMethods.isEmpty(resultBean.getDummyDatabaseVersion()) && !resultBean.getDummyDatabaseVersion().equals(currDummyVersion)) { %>
					style="color:red;font-weight:bold;"
				<% } %>
			>
				<bean:write name="resultBean" property="dummyDatabaseVersion"/>
			</td>
			<td class="txtRow"
				<% if (!CommonMethods.isEmpty(resultBean.getDmsVersion()) && !resultBean.getDmsVersion().equals(currDmsVersion)) { %>
					style="color:red;font-weight:bold;"
				<% } %>
			>
				<bean:write name="resultBean" property="dmsVersion"/>
			</td>
			<td class="txtRow">
				<logic:present name="resultBean" property="atoInstalledList"><logic:notEmpty name="resultBean" property="atoInstalledList">
				<logic:iterate id="atoFilename" name="resultBean" property="atoInstalledList" indexId="i"><% if (i > 0) { %>, <% } %><bean:write name="atoFilename"/></logic:iterate>
				</logic:notEmpty></logic:present>
			</td>
			<td class="txtRowRight">
				<bean:write name="resultBean" property="location"/>
			</td>

			<td class="txtRow"><logic:notEmpty name="resultBean" property="primaryPocEmails"><a href="mailto:<bean:write name="resultBean" property="primaryPocEmails"/>"><bean:write name="resultBean" property="primaryPocEmails"/></a></logic:notEmpty></td>
			<td class="txtRowRight"><logic:notEmpty name="resultBean" property="pocEmails"><a href="mailto:<bean:write name="resultBean" property="pocEmails"/>"><bean:write name="resultBean" property="pocEmails"/></a></logic:notEmpty></td>

			<td class="txtRow"><bean:write name="resultBean" property="computerName"/></td>
			<td class="txtRow" align="center">
				<logic:equal name="resultBean" property="multiShipInd" value="Y">Y</logic:equal>
				<logic:notEqual name="resultBean" property="multiShipInd" value="Y">N</logic:notEqual>
			</td>
			<td><bean:write name="resultBean" property="multiShipUicList"/></td>
			<td class="txtRow"><bean:write name="resultBean" property="laptopTag"/></td>
			<td class="txtRow"><bean:write name="resultBean" property="laptopProductName"/></td>
			<td class="txtRow"><bean:write name="resultBean" property="laptopSerialNumber"/></td>
			<td class="txtRow"><bean:write name="resultBean" property="networkAdapter"/></td>
			<td class="txtRowRight"><bean:write name="resultBean" property="laptopStatus"/></td>

			<td class="txtRow"><bean:write name="resultBean" property="scannerTag"/></td>
			<td class="txtRow"><bean:write name="resultBean" property="scannerProductName"/></td>
			<td class="txtRow"><bean:write name="resultBean" property="scannerSerialNumber"/></td>
			<td class="txtRowRight"><bean:write name="resultBean" property="scannerStatus"/></td>

			<td class="txtRow"><bean:write name="resultBean" property="kofaxProductName"/></td>
			<td class="txtRow"><bean:write name="resultBean" property="kofaxLicenseKey"/></td>
			<td class="txtRowRight"><bean:write name="resultBean" property="kofaxProductCode"/></td>

			<td class="txtRow"><bean:write name="resultBean" property="msOfficeProductName"/></td>
			<td class="txtRowRight"><bean:write name="resultBean" property="msOfficeLicenseKey"/></td>

			<!-- Backfile -->
			<logic:present name="resultBean" property="backfileBean">
			<bean:define id="backfileBean" name="resultBean" property="backfileBean" type="com.premiersolutionshi.old.bean.BackfileBean"/>
				<logic:equal name="backfileBean" property="isRequired" value="N">
					<td style="background:#999;">Backfile not required</td>
					<% for (int i = 0; i < 14; i++) { %>
						<td style="background:#999;"></td>
					<% } %>
					<td style="background:#999;" class="txtRowRight"></td>
				</logic:equal>
				<logic:equal name="backfileBean" property="isRequired" value="Y">
					<td align="center" class="rightBorder"><bean:write name="backfileBean" property="dueDate"/></td>
					<td align="center"><bean:write name="backfileBean" property="fy1314DueDate"/></td>
					<td align="center"><bean:write name="backfileBean" property="schedTrainingDate"/></td>
					<td align="center"><bean:write name="backfileBean" property="completedDate"/></td>
					<td align="center" style="<bean:write name="backfileBean" property="requestedDateCss"/>"><bean:write name="backfileBean" property="requestedDate"/></td>
					<td align="center" style="<bean:write name="backfileBean" property="receivedDateCss"/>"><bean:write name="backfileBean" property="receivedDate"/></td>
					<td align="center" style="<bean:write name="backfileBean" property="scanningDeliveredDateCss"/>"><bean:write name="backfileBean" property="scanningDeliveredDate"/></td>
					<td align="center" style="<bean:write name="backfileBean" property="fy1314CompletedDateCss"/>"><bean:write name="backfileBean" property="fy1314CompletedDate"/></td>
					<td align="center" style="<bean:write name="backfileBean" property="fy1314BurnedDateCss"/>"><bean:write name="backfileBean" property="fy1314BurnedDate"/></td>
					<td align="center" style="<bean:write name="backfileBean" property="fy1112CompletedDateCss"/>"><bean:write name="backfileBean" property="fy1112CompletedDate"/></td>
					<td align="center" style="<bean:write name="backfileBean" property="extractDateCss"/>"><bean:write name="backfileBean" property="extractDate"/></td>
					<td align="center" style="<bean:write name="backfileBean" property="fy1314MailedDateCss"/>"><bean:write name="backfileBean" property="fy1314MailedDate"/></td>
					<td align="center" style="<bean:write name="backfileBean" property="laptopInstalledDateCss"/>"><bean:write name="backfileBean" property="laptopInstalledDate"/></td>
					<td align="center" style="<bean:write name="backfileBean" property="logcopDeliveredDateCss"/>"><bean:write name="backfileBean" property="logcopDeliveredDate"/></td>
					<td align="center" style="<bean:write name="backfileBean" property="logcopUploadedDateCss"/>"><bean:write name="backfileBean" property="logcopUploadedDate"/></td>
					<td align="center" style="<bean:write name="backfileBean" property="finalReportDateCss"/>" class="txtRowRight"><bean:write name="backfileBean" property="finalReportDate"/></td>
					<!--td class="txtRowRight">
						<logic:iterate id="comments" name="backfileBean" property="commentsBr" indexId="i">
							<bean:write name="comments"/><% if (i+1 < backfileBean.getCommentsBr().size()) { %><br/><% } %>
						</logic:iterate>
					</td-->
				</logic:equal>
			</logic:present>
			<logic:notPresent name="resultBean" property="backfileBean">
				<td style="background:#999;">No backfile workflow found</td>
				<% for (int i = 0; i < 14; i++) { %>
					<td style="background:#999;"></td>
				<% } %>
				<td style="background:#999;" class="txtRowRight"></td>
			</logic:notPresent>

			<!-- Training -->
			<logic:present name="resultBean" property="trainingBean">
			<bean:define id="trainingBean" name="resultBean" property="trainingBean" type="com.premiersolutionshi.old.bean.TrainingBean"/>
				<td><bean:write name="trainingBean" property="locFileRecvDate"/></td>
				<td><bean:write name="trainingBean" property="locFileRevDate"/></td>
				<td><bean:write name="trainingBean" property="pacfltFoodReportDate"/></td>
				<td><bean:write name="trainingBean" property="systemReadyDate"/></td>
				<td><bean:write name="trainingBean" property="computerNameDbDate"/></td>
				<td><bean:write name="trainingBean" property="computerNameLogcopDate"/></td>
				<td><bean:write name="trainingBean" property="trainingKitReadyDate"/></td>
				<td><bean:write name="trainingBean" property="estTrainingMonth"/></td>
				<td><bean:write name="trainingBean" property="schedTrainingDate"/></td>
				<td class="txtRowRight"><bean:write name="trainingBean" property="actualTrainingDate"/></td>
				<!--td><bean:write name="trainingBean" property="comments"/></td-->
			</logic:present>
			<logic:notPresent name="resultBean" property="trainingBean">
				<td style="background:#999;">No training workflow found</td>
				<% for (int i = 0; i < 8; i++) { %>
					<td style="background:#999;"></td>
				<% } %>
				<td style="background:#999;" class="txtRowRight"></td>
			</logic:notPresent>

			<!-- Decom -->
			<logic:present name="resultBean" property="decomBean">
			<bean:define id="decomBean" name="resultBean" property="decomBean" type="com.premiersolutionshi.old.bean.DecomBean"/>
				<td><bean:write name="decomBean" property="shipContactedDate"/></td>
				<td><bean:write name="decomBean" property="systemReceivedDate"/></td>
				<td><bean:write name="decomBean" property="hardwareStatus"/></td>
				<td><bean:write name="decomBean" property="hardwareStatusNotes"/></td>
				<td><bean:write name="decomBean" property="systemReturnedDate"/></td>
				<td><bean:write name="decomBean" property="backupDate"/></td>
				<td><bean:write name="decomBean" property="transmittalCheckDate"/></td>
				<td><bean:write name="decomBean" property="transmittalReconDate"/></td>
				<td><bean:write name="decomBean" property="laptopResetDate"/></td>
				<!--td align="left" width="250"><bean:write name="decomBean" property="comments"/></td-->
			</logic:present>
			<logic:notPresent name="resultBean" property="decomBean">
				<td style="background:#999;">No decom workflow found</td>
				<% for (int i = 0; i < 7; i++) { %>
					<td style="background:#999;"></td>
				<% } %>
				<td style="background:#999;" class="txtRowRight"></td>
			</logic:notPresent>

			<!-- New fields -->
			<td class="txtRow" align="center">
				<logic:equal name="resultBean" property="nwcfInd" value="Y">Y</logic:equal>
				<logic:notEqual name="resultBean" property="nwcfInd" value="Y">N</logic:notEqual>
			</td>

			<td class="txtRow"><bean:write name="resultBean" property="contractNumber"/></td>

			<!-- Uploaded Files -->
			<td><bean:write name="resultBean" property="hardwareFileUploadedDate"/></td>
			<td><bean:write name="resultBean" property="trainingFileUploadedDate"/></td>
			<td><bean:write name="resultBean" property="laptop1FileUploadedDate"/></td>
			<td><bean:write name="resultBean" property="laptop2FileUploadedDate"/></td>
			<td><bean:write name="resultBean" property="postInstallFileUploadedDate"/></td>
		</tr>
	</logic:iterate>
	</tbody>
</table>
</body>
</html>
