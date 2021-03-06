<%@ tag body-content="empty" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ attribute name="value" required="true" type="java.time.LocalDateTime" %>
<%@ attribute name="pattern" required="false" type="java.lang.String" %>

<c:if test="${empty pattern}">
  <c:set var="pattern" value="M/d/yyyy"/>
</c:if>

<fmt:parseDate value="${value}" pattern="yyyy-MM-dd'T'HH:mm" var="parsedDate" />
<c:if test="${not empty parsedDate}">
  <fmt:formatDate value="${parsedDate}" pattern="${pattern}"/>
</c:if>
