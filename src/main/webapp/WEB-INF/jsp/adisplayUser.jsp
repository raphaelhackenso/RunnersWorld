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

<layout:page-container-anonymous title="adisplayUser" activePage="adisplayUser">

    <div class="container">

        <div class="row">
            <div class="col-md-4">
                <input class="form-control mr-sm-2" type="search" placeholder="Suchen"
                       aria-label="Search" id="adisplayUserSearch">
            </div>
        </div>

        <p></p>

        <c:if test="${not empty requestedRunner}">
            <div class="row">
                <div class="col-md-12 col-md-offset-1">
                    <div class="d-flex">
                        <legend id="runnerNameLegend">Speedruns von ${requestedRunner.username}</legend>
                         <button id="exportRunnerRuns" class="btn btn-link">
                            <svg class="bi bi-download" width="1em" height="1em" viewBox="0 0 16 16" fill="currentColor"
                                 xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd"
                                      d="M.5 8a.5.5 0 0 1 .5.5V12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V8.5a.5.5 0 0 1 1 0V12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V8.5A.5.5 0 0 1 .5 8z"/>
                                <path fill-rule="evenodd"
                                      d="M5 7.5a.5.5 0 0 1 .707 0L8 9.793 10.293 7.5a.5.5 0 1 1 .707.707l-2.646 2.647a.5.5 0 0 1-.708 0L5 8.207A.5.5 0 0 1 5 7.5z"/>
                                <path fill-rule="evenodd" d="M8 1a.5.5 0 0 1 .5.5v8a.5.5 0 0 1-1 0v-8A.5.5 0 0 1 8 1z"/>
                            </svg>
                        </button>
                    </div>
                    <table data-toggle="table" id="runnerRunsTable" class="table table-striped">
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