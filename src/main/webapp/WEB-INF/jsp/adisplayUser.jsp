<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="bootstrap" tagdir="/WEB-INF/tags/bootstrap" %>
<%@taglib prefix="layout" tagdir="/WEB-INF/tags/layout" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sprng" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- TODO if logged in show normal -->
<layout:page-container-anonymous title="adisplayUser" activePage="adisplayUser">

    <div class="container">

        <!-- TODO this search function -->
        <div class="row">
            <div class="col-md-4">
                <input class="form-control mr-sm-2" type="search" placeholder="Suchen"
                       aria-label="Search" id="adisplayUserSearch">
            </div>
        </div>

        <c:if test="${not empty requestedRunner}">
            <div class="row">
                <div class="col-md-12 col-md-offset-1">
                    <legend>Speedruns von ${requestedRunner.username}</legend>

                    <table data-toggle="table" class="table table-striped">
                        <thead>
                        <tr>
                            <th data-sortable="true">Spiel</th>
                            <th data-sortable="true">Zeit</th>
                            <th data-sortable="true">Datum</th>
                            <th data-sortable="true">Typ</th>
                            <th data-sortable="true">Platform</th>
                            <th data-sortable="true">Version</th>
                            <th data-sortable="true">Referenz</th>
                        </tr>
                        </thead>
                        <tbody id="adisplayUserSpeedruns">
                        <!--  list all speedRuns ----------------------------------------------------------- -->
                        <c:forEach items="${requestedRunnerSpeedruns}" var="speedRun" varStatus="Rank">
                            <tr>
                                <td>${speedRun.game.name}</td>
                                <td>${speedRun.inGameTime}</td>
                                <td>
                                    <fmt:parseDate value="${speedRun.date}" pattern="yyyy-MM-dd" var="parsedDate"
                                                   type="date"/>
                                    <fmt:formatDate value="${parsedDate}" type="date" pattern="dd.MM.yyyy"/>
                                </td>
                                <td>${speedRun.typeOfRun.category}</td>
                                <td>${speedRun.platform.name}</td>
                                <td>${speedRun.game.version}</td>
                                <td><a href=${speedRun.validationURL}>URL</a></td>
                            </tr>
                        </c:forEach>
                        <!--  list all speedRuns ----------------------------------------------------------- -->
                        </tbody>
                    </table>
                </div>
            </div>
        </c:if>

    </div>

</layout:page-container-anonymous>