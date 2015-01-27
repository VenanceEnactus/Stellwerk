<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec"     uri="http://www.springframework.org/security/tags" %>

<jsp:include page="../header.jsp"/>
<%-- Ausgabe --%>
<c:if test="${not empty Ausgabe}">
    ${Ausgabe}
</c:if>
<div id="content" class="table">
    
    <h2>Sonstiges</h2>   
    <table>
        <thead>
            <tr>
                <td class="small">ID</td>
                <td>Titel</td>
            </tr>
        </thead>
        <tbody>
            <%-- Schleife --%>
            <c:forEach items="${liste}" var="element" varStatus="line" >
                <%-- ###### Farbauswahl der einzelnen Zeile ##### --%>
                <c:choose>
                    <c:when test='${(line.index)%2 eq 0}'>
                        <c:set var="rowColor" value="even" scope="page"/>
                    </c:when>
                    <c:otherwise>
                        <c:set var="rowColor" value="odd" scope="page"/>
                    </c:otherwise>
                </c:choose>                
                <tr class="${rowColor}">
                    <td>${line.index+1}</td>
                    <td><a href="<%=request.getContextPath()%>/allgemeines-verwalten/${element.id}/details">${element.titel}</a></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>
<jsp:include page="../footer.jsp"/>