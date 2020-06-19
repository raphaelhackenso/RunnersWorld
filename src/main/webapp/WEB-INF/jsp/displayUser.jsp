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

<layout:page-container title="displayUser" activePage="displayUser">

    <div class="container">

        <div class="row">
            <div class="col-md-4">
                <input class="form-control mr-sm-2" type="search" placeholder="Suchen"
                       aria-label="Search" id="adisplayUserSearch">
            </div>

            <div class="col-md-4">
                <p>
                    <a href="/addSpeedRun" class="btn btn-primary">Speedrun hinzufügen</a>
                </p>
            </div>
        </div>

        <p></p>

        <sec:authorize access="hasAuthority('ROLE_ADMIN')">
            <div class="row border border-success">
                <legend>&nbsp; Admin Toolkit</legend>
                <div class="col-md-3">
                    <p>
                        <a href="/listRunValidations" class="btn btn-success">Speedruns validieren</a>
                    </p>
                </div>

                <div class="col-md-3">
                    <p>
                        <a href="/listGames" class="btn btn-success">Spiele bearbeiten</a>
                    </p>
                </div>

                <div class="col-md-3">
                    <p>
                        <a href="/listPlatform" class="btn btn-success">Plattformen bearbeiten</a>
                    </p>
                </div>

                <div class="col-md-3">
                    <p>
                        <a href="/listTypeOfRuns" class="btn btn-success">Typen bearbeiten</a>
                    </p>
                </div>
            </div>
        </sec:authorize>

        <div class="row">
            <div class="col-md-12 col-md-offset-1">
                <legend>Speedruns von ${currentUser.username}</legend>

                <table data-toggle="table" class="table table-striped">
                    <thead>
                    <tr>
                        <th data-sortable="true">ID</th>
                        <th data-sortable="true">Spiel</th>
                        <th data-sortable="true">Zeit</th>
                        <th data-sortable="true">Datum</th>
                        <th data-sortable="true">Typ</th>
                        <th data-sortable="true">Platform</th>
                        <th data-sortable="true">Version</th>
                        <th data-sortable="true">Referenz</th>
                        <th data-sortable="true">Status</th>
                    </tr>
                    </thead>
                    <tbody id="adisplayUserSpeedruns">
                    <!--  list all speedRuns ----------------------------------------------------------- -->
                    <c:forEach items="${currentUser.speedruns}" var="speedRun" varStatus="Rank">

                        <tr style="
                        <c:if test="${speedRun.state == 'pending'}"> background-color: #fff8c7</c:if>
                        <c:if test="${speedRun.state == 'validated'}"> background-color: #bdffbf</c:if>
                        <c:if test="${speedRun.state == 'denied'}"> background-color: #ffb2a8</c:if>
                                ">
                            <td>${speedRun.id}</td>
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
                            <td>
                                <sec:authorize access="hasAuthority('ROLE_USER')">
                                    ${speedRun.state}
                                </sec:authorize>
                            </td>
                        </tr>
                    </c:forEach>
                    <!--  list all speedRuns ----------------------------------------------------------- -->
                    </tbody>
                </table>
            </div>
        </div>
    </div>

</layout:page-container>