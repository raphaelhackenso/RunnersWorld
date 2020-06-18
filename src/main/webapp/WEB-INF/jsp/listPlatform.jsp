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

<layout:page-container title="listPlatform" activePage="listPlatform">

    <div class="row">
        <div class="col-md-4">
            <form class="form-inline" method="get" action="listPlatform">
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
            <sec:authorize access="hasAuthority('ROLE_ADMIN')">
                <p>
                    <a href="/editPlatform" class="btn btn-success">Platform hinzufügen</a>
                </p>
            </sec:authorize>
        </div>
    </div>
        <div class="row">
        <div class="col-md-6 col-md-offset-1">
                <legend>Platformen in der Datenbank</legend>

                <table data-toggle="table" class="table table-striped">
                    <thead>
                    <tr>
                        <th data-sortable="true">ID</th>
                        <th data-sortable="true">Name</th>
                        <sec:authorize access="hasAuthority('ROLE_ADMIN')">
                            <th data-sortable="true">Aktionen</th>
                        </sec:authorize>
                    </tr>
                    </thead>

                        <tbody>
                            <c:forEach items="${platform}" var="platform">
                                <tr>
                                    <td>${platform.id} </td>
                                    <td>${platform.name} </td>
                                    <td>
                                        <sec:authorize access="hasAuthority('ROLE_ADMIN')">
                                            <a href="editPlatform?id=${platform.id}" class="btn btn-xs btn-primary">Bearbeiten</a>
                                        </sec:authorize>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                </table>
        </div>
    </div>




</layout:page-container>
