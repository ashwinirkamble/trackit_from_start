<%@ page language="java" %>
<%@ page import="com.premiersolutionshi.old.util.CommonMethods" %>

<%@ taglib prefix="bean"  uri="http://struts.apache.org/tags-bean" %>
<%@ taglib prefix="html"  uri="http://struts.apache.org/tags-html" %>
<%@ taglib prefix="logic" uri="http://struts.apache.org/tags-logic" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>

<bean:define id="pageTitle" value="Home"/>
<jsp:useBean id="loginBean" scope="request" class="com.premiersolutionshi.old.bean.LoginBean"/>

<%@ include file="../layout/old/layout-header.jsp" %>

<div class="card " style="margin-top:0">
  <div class="card-body">
    <div class="row">
      <div class="col">
        <h3>Projects</h3>
        <ul class="pshi-menu-list">
        <logic:iterate id="leftbar_projectBean" name="leftbar_projectList" type="com.premiersolutionshi.old.bean.ProjectBean">
          <logic:iterate id="leftbar_resultBean" name="leftbar_projectBean" property="taskList" type="com.premiersolutionshi.old.bean.ProjectBean">
            <bean:define id="projectPk" value="${leftbar_resultBean.projectPk}"/>
            <li class="pshi-menu-list-item">
              <a class="nav-link" href="page.do?projectPk=${leftbar_resultBean.projectPk}">
                <i class="material-icons">aspect_ratio</i>
                <span>${leftbar_resultBean.projectName}</span>
              </a>
            </li>
          </logic:iterate>
        </logic:iterate>
        </ul>
      </div>
      <div class="col">
        <logic:iterate id="leftbar_projectBean" name="leftbar_projectList" type="com.premiersolutionshi.old.bean.ProjectBean">
          <logic:iterate id="leftbar_resultBean" name="leftbar_projectBean" property="taskList" type="com.premiersolutionshi.old.bean.ProjectBean">
            <bean:define id="projectPk" value="${leftbar_resultBean.projectPk}"/>
            <logic:equal name="leftbar_resultBean" property="projectPk" value="1">
              <h3>${leftbar_resultBean.projectName}</h3>
              <div style="margin-bottom: 10px;">
                <%@ include file="../include/support/issue/jumpToIssuePk.jsp" %>
                <br/>
                <br/>
                <%@ include file="../include/support/task/jumpToTaskPk.jsp" %>
                <br/>
                <br/>
                <%@ include file="../include/support/poc/pocSearchBox.jsp" %>
                <br/>
                <a href="issue.do?action=add&projectPk=${leftbar_resultBean.projectPk}&pageFrom=issueList" class="btn btn-success">
                  <i class="material-icons">add</i>
                  Add Issue
                </a>
                <br/>
                <a href="project.do?action=taskAdd&projectPk=${leftbar_resultBean.projectPk}" class="btn btn-success">
                  <i class="material-icons">add</i>
                  Add Task
                </a>
              </div>
            </logic:equal>
          </logic:iterate>
        </logic:iterate>
        <h3>Other Links</h3>
        <ul class="pshi-menu-list">
          <% if (CommonMethods.isDevEnv()) { %>
            <li class="pshi-menu-list-item">
              <a class="nav-link" href="statusReport.do">
                <i class="material-icons">assignment</i>
                <span>Status Reports</span>
              </a>
            </li>
          <% } %>
          <li class="pshi-menu-list-item">
            <a class="nav-link" href="govProperty.do">
              <i class="material-icons">list</i>
              <span>Government Property</span>
            </a>
          </li>
          <li class="pshi-menu-list-item">
            <a class="nav-link" href="user.do?action=ptoTravelList">
              <i class="material-icons">calendar_today</i>
              <span>Manage PTO/Travel</span>
            </a>
          </li>
        </ul>
      </div>
    </div>
    <%--
    <div class="row" ${loginBean.username == 'lewis.nakao' ? '' : 'style="display:none;"' }>
      <div class="col">
        <table class="border-zero cellspacing-zero">
          <tbody>
            <tr align="center">
              <td>
                <img src="images/logo_tomcat.png" height="140" width="140"/><br/>
                <bean:write name="tomcatVersion"/>
              </td>
              <td>
                <img src="images/logo_java.png" height="140" width="140"/><br/>
                <bean:write name="javaVersion"/>
              </td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
     --%>
  </div>
</div>

    <!--
    pshi: <%= request.isUserInRole("pshi") %><br/>
    sysadmin: <%= request.isUserInRole("sysadmin") %><br/>
    logcop: <%= request.isUserInRole("logcop") %><br/>
    pshi-user-admin: <%= request.isUserInRole("pshi-user-admin") %>- PSHI User Administrator<br/>
    logcop-facet: <%= request.isUserInRole("logcop-facet") %> - LOGCOP-FACET Application access<br/>
    manager-gui: <%= request.isUserInRole("manager-gui") %> - Apache Tomcat Manager<br/>

    Projects: <%= CommonMethods.printArray(loginBean.getProjectPkArr()) %><br/>

    getLocalAddr: <%= request.getLocalAddr() %><br/>

    getLocalName: <%= request.getLocalName() %><br/>

    getServerName: <%= request.getServerName() %><br/>
    -->

<%@ include file="../layout/old/layout-footer.jsp" %>
</body>
</html>
