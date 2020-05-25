<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="bootstrap" tagdir="/WEB-INF/tags/bootstrap" %>
<%@taglib prefix="layout" tagdir="/WEB-INF/tags/layout" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<layout:page-container title="SpeedRuns" activePage="listSpeedRuns">

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
        <div class="col-md-4">
            <p>
                    <%-- TODO change
                    <sec:authorize access="hasAuthority('ROLE_ADMIN')">
                        <a href="/editEmployee" class="btn btn-success">Add new Employee</a>
                    </sec:authorize>
                        --%>
            </p>
        </div>
    </div>


    <div class="row">
        <div class="col-md-10 col-md-offset-1">

            <table data-toggle="table" class="table table-striped">
                <thead>
                <tr>
                    <th data-sortable="true">Rank</th>
                    <th data-sortable="true">In-Game Time</th>
                    <th data-sortable="true">Runner</th>
                    <th data-sortable="true">GameVersion</th>
                    <th data-sortable="true">Date</th>
                    <th data-sortable="true">Type of Run</th>

                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                <!--  list all speedRuns ----------------------------------------------------------- -->
                <c:forEach items="${speedRuns}" var="speedRun">
                    <tr>
                        <td>TODO</td>
                        <td>${speedRun.inGameTime}</td>
                        <td>${speedRun.runner}</td>
                        <td>${speedRun.gameVersion}</td>
                        <td>
                            <fmt:parseDate value="${speedRun.date}" pattern="yyyy-MM-dd" var="parsedDate"
                                           type="date"/>
                            <fmt:formatDate value="${parsedDate}" type="date" pattern="dd.MM.yyyy"/>
                        </td>
                        <td>

                                <%-- TODO remove/edit

                                <sec:authorize access="hasAuthority('ROLE_ADMIN')">
                                    <a href="editEmployee?ssn=${employee.ssn}" class="btn btn-xs btn-success">Edit</a>

                                    <form:form method="post" action="/deleteEmployee?ssn=${employee.ssn}">
                                        <button type="submit" class="btn btn-xs btn-danger">Delete</button>
                                    </form:form>

                                </sec:authorize>

                                --%>
                        </td>
                    </tr>
                </c:forEach>
                <!--  list all speedRuns ----------------------------------------------------------- -->
                </tbody>
            </table>
        </div>
    </div>

</layout:page-container>