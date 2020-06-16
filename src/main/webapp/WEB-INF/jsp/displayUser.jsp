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

    <div class="row">
        <div class="col-md-4">
            <form class="form-inline" method="get" action="listSpeedRuns">
                <input class="form-control mr-sm-2" name="search" type="search" placeholder="Search"
                       aria-label="Search">
                <button class="btn btn-primary" type="submit">
                    <svg class="bi bi-search" width="1em" height="1em" viewBox="0 0 16 16" fill="currentColor"
                         xmlns="http://www.w3.org/2000/svg">
                        <path fill-rule="evenodd"
                              d="M10.442 10.442a1 1 0 011.415 0l3.85 3.85a1 1 0 01-1.414 1.415l-3.85-3.85a1 1 0 010-1.415z"
                              clip-rule="evenodd"/>
                        <path fill-rule="evenodd"
                              d="M6.5 12a5.5 5.5 0 100-11 5.5 5.5 0 000 11zM13 6.5a6.5 6.5 0 11-13 0 6.5 6.5 0 0113 0z"
                              clip-rule="evenodd"/>
                    </svg>
                </button>
            </form>
        </div>

    </div>

    <p></p>

    <div class="row" >
            <div class="col-md-3">
                <sec:authorize access="hasAuthority('ROLE_USER')">
                    <p>
                        <a href="/addSpeedRun" class="btn btn-success">Speedrun hinzufügen</a>
                    </p>
                </sec:authorize>
            </div>

            <div class="col-md-3">
                <sec:authorize access="hasAuthority('ROLE_ADMIN')">
                    <p>
                        <a href="/listRunValidations" class="btn btn-success">Speedruns validieren</a>
                    </p>
                </sec:authorize>
            </div>

            <div class="col-md-3">
                <sec:authorize access="hasAuthority('ROLE_ADMIN')">
                    <p>
                        <a href="/listGames" class="btn btn-success">Spiele bearbeiten</a>
                    </p>
                </sec:authorize>
            </div>

            <div class="col-md-3">
                <sec:authorize access="hasAuthority('ROLE_ADMIN')">
                    <p>
                        <a href="/listPlatform" class="btn btn-success">Plattformen bearbeiten</a>
                    </p>
                </sec:authorize>
            </div>
    </div>


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
                <tbody>
                <!--  list all speedRuns ----------------------------------------------------------- -->
                <c:forEach items="${currentUser.speedruns}" var="speedRun" varStatus="Rank">

                    <tr>
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


</layout:page-container>