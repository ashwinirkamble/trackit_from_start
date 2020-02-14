<%@ page language="java" %>
<%@ page import="com.premiersolutionshi.old.util.CommonMethods" %>

<%@ taglib prefix="bean"  uri="http://struts.apache.org/tags-bean" %>
<%@ taglib prefix="html"  uri="http://struts.apache.org/tags-html" %>
<%@ taglib prefix="logic" uri="http://struts.apache.org/tags-logic" %>

<jsp:useBean id="resultList" scope="request" class="java.util.ArrayList"/>
<jsp:useBean id="type" scope="request" class="java.lang.String"/>
<jsp:useBean id="msoFooterData" scope="request" class="java.lang.String"/>

<bean:define id="defaultPageTitle" value="LOGCOP Transmittal Summary"/>
<jsp:useBean id="customPageTitle" scope="request" class="java.lang.String"/><bean:define id="pageTitle" name="customPageTitle"/><logic:equal name="pageTitle" value=""><bean:define id="pageTitle" name="defaultPageTitle"/></logic:equal>

<%
	response.setHeader("Pragma", "public");
	response.setHeader("Cache-Control", "max-age=0");
	response.setContentType("application/vnd.ms-excel");
 	response.setHeader("Content-Disposition", "attachment;filename=logcop_transmittal_summary.xls");

 	boolean hasNotes = false;
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
	vertical-align: top;
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

#xlsTable .noborder {
	border: none;
	}
-->
</style>
</head>

<body>
<table id="xlsTable" border="0" cellspacing="3" cellpadding="3">
	<thead>
		<tr>
			<th>Unit Name</th>
			<th>FACET Name</th>
			<th>Homeport</th>
			<th>Last Activity</th>
			<th>1348</th>
			<th>1149</th>
			<th>Food Approval</th>
			<th>Food Receipt</th>
			<th>Pcard Admin</th>
			<th>Pcard Invoice</th>
			<th>Price Change Report</th>
			<th>SFOEDL</th>
			<th>UOL</th>
			<th># of missing transmittals</th>
		</tr>
	</thead>
	<tbody>
	<logic:iterate id="resultBean" name="resultList" type="com.premiersolutionshi.old.bean.ReportBean">
		<tr>
				<td><bean:write name="resultBean" property="shipName"/></td>
				<td><bean:write name="resultBean" property="facetName"/></td>
				<td><bean:write name="resultBean" property="homeport"/></td>
				<td align="center" style="<bean:write name="resultBean" property="lastUploadDateCss"/>"><bean:write name="resultBean" property="lastUploadDate"/></td>
				<td align="center" style="<bean:write name="resultBean" property="form1348UploadDateCss"/>"><bean:write name="resultBean" property="form1348UploadDate"/></td>
				<td align="center" style="<bean:write name="resultBean" property="form1149UploadDateCss"/>" nowrap>
					<bean:write name="resultBean" property="form1149UploadDate"/>
					<logic:notEmpty name="resultBean" property="fuelClosureNotes">
						*
						<% hasNotes = true; %>
					</logic:notEmpty>
				</td>
				<td align="center" style="<bean:write name="resultBean" property="foodApprovalUploadDateCss"/>" nowrap>
					<bean:write name="resultBean" property="foodApprovalUploadDate"/>
					<logic:notEmpty name="resultBean" property="s2ClosureNotes">
						*
						<% hasNotes = true; %>
					</logic:notEmpty>
				</td>
				<td align="center" style="<bean:write name="resultBean" property="foodReceiptUploadDateCss"/>" nowrap>
					<bean:write name="resultBean" property="foodReceiptUploadDate"/>
					<logic:notEmpty name="resultBean" property="s2ClosureNotes">
						*
						<% hasNotes = true; %>
					</logic:notEmpty>
				</td>
				<td align="center" style="<bean:write name="resultBean" property="pcardAdminUploadDateCss"/>"><bean:write name="resultBean" property="pcardAdminUploadDate"/></td>
				<td align="center" style="<bean:write name="resultBean" property="pcardInvoiceUploadDateCss"/>"><bean:write name="resultBean" property="pcardInvoiceUploadDate"/></td>
				<td align="center" style="<bean:write name="resultBean" property="priceChangeUploadDateCss"/>"><bean:write name="resultBean" property="priceChangeUploadDate"/></td>
				<td align="center" style="<bean:write name="resultBean" property="sfoedlUploadDateCss"/>"><bean:write name="resultBean" property="sfoedlUploadDate"/></td>
				<td align="center" style="<bean:write name="resultBean" property="uolUploadDateCss"/>"><bean:write name="resultBean" property="uolUploadDate"/></td>
				<td align="center" style="<bean:write name="resultBean" property="missingTransmittalCss"/>"><bean:write name="resultBean" property="missingTransmittalListSize"/></td>
		</tr>
	</logic:iterate>

	<% if (hasNotes) { %>
		<tr><td class="noborder"/></tr>
		<tr><td colspan="5" class="noborder"><b>Notes:</b></td></tr>
		<logic:iterate id="resultBean" name="resultList" type="com.premiersolutionshi.old.bean.ReportBean">
			<logic:notEmpty name="resultBean" property="s2ClosureNotes">
				<tr><td colspan="5" class="noborder"><bean:write name="resultBean" property="shipName"/> <bean:write name="resultBean" property="s2ClosureNotes"/></td></tr>
			</logic:notEmpty>
			<logic:notEmpty name="resultBean" property="fuelClosureNotes">
				<tr><td colspan="5" class="noborder"><bean:write name="resultBean" property="shipName"/> <bean:write name="resultBean" property="fuelClosureNotes"/></td></tr>
			</logic:notEmpty>
		</logic:iterate>
	<% } %>
	</tbody>
</table>
</body>
</html>
