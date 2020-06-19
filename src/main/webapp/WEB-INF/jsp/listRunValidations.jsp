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

<layout:page-container title="listRunValidations" activePage="listRunValidations">

    <div class="row">
        <div class="col-md-4">
            <form class="form-inline" method="get" action="listRunValidations">
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
    <div class="row">
        <div class="col-md-10 col-md-offset-1">
            <legend>Alle ausstehenden Validierungen</legend>

            <table data-toggle="table" class="table table-striped">
                <thead>
                <tr>
                    <th data-sortable="true">Speedrun-ID</th>
                    <th data-sortable="true">Spiel</th>
                    <th data-sortable="true">Zeit</th>
                    <th data-sortable="true">Datum</th>
                    <th data-sortable="true">Runner</th>
                    <th>URL</th>
                    <th>Notes</th>
                    <th>Aktionen</th>


                </tr>
                </thead>
                <tbody>
                <!--  list all speedRuns ----------------------------------------------------------- -->
                <c:forEach items="${runValidations}" var="runValidation" varStatus="Rank">

                    <tr>
                        <td>${runValidation.speedrun.id}</td>
                        <td>${runValidation.speedrun.game.name}</td>
                        <td>${runValidation.speedrun.inGameTime}</td>
                        <td>
                            <fmt:parseDate value="${runValidation.speedrun.date}" pattern="yyyy-MM-dd" var="parsedDate"
                                           type="date"/>
                            <fmt:formatDate value="${parsedDate}" type="date" pattern="dd.MM.yyyy"/>
                        </td>
                        <td><a href="adisplayUser?runner=${runValidation.speedrun.runner.username}">${runValidation.speedrun.runner.username}</a></td>

                        <td><a href=${runValidation.speedrun.validationURL}>URL</a></td>
                        <td>${runValidation.speedrun.notes}</td>

                        <td>
                            <div>
                                <button type="button" class="btn btn-success" data-toggle="modal"
                                        data-target="#validateModal${runValidation.speedrun.id}">
                                    Validieren
                                </button>

                                <button type="button" class="btn btn-danger" data-toggle="modal"
                                        data-target="#denyModal${runValidation.speedrun.id}">
                                    Anullieren
                                </button>

                                <!-- validateModal ------------>
                                <div class="modal fade" id="validateModal${runValidation.speedrun.id}" tabindex="-1"
                                     role="dialog"
                                     aria-labelledby="validateModalLabel${runValidation.speedrun.id}"
                                     aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title"
                                                    id="validateModalLabel${runValidation.speedrun.id}">Speedrun
                                                    Nr: ${runValidation.speedrun.id} validieren</h5>
                                                <button type="button" class="close" data-dismiss="modal"
                                                        aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                Sind Sie sicher, dass sie den Speedrun Nr: ${runValidation.speedrun.id}
                                                von ${runValidation.speedrun.runner.username}
                                                vom ${runValidation.speedrun.date} als korrekt validieren möchten?
                                            </div>
                                            <div class="modal-footer">
                                                <form:form method="post"
                                                           action="/validateRunValidation?id=${runValidation.id}&validatedBy=${currentUser.id}">
                                                    <button type="submit" class="btn btn-xs btn-success">Validieren
                                                    </button>
                                                </form:form>
                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">
                                                    Abbrechen
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- validateModal ------------>


                                <!-- denyModal ------------>
                                <div class="modal fade" id="denyModal${runValidation.speedrun.id}" tabindex="-1"
                                     role="dialog"
                                     aria-labelledby="denyModalLabel${runValidation.speedrun.id}"
                                     aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title"
                                                    id="denyModalLabel${runValidation.speedrun.id}">Speedrun
                                                    Nr: ${runValidation.speedrun.id} anullieren</h5>
                                                <button type="button" class="close" data-dismiss="modal"
                                                        aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                Sind Sie sicher, dass der Speedrun Nr: ${runValidation.speedrun.id}
                                                von ${runValidation.speedrun.runner.username}
                                                vom ${runValidation.speedrun.date} nicht korrekt ist und somit anulliert
                                                werden soll?
                                            </div>
                                            <div class="modal-footer">
                                                <form:form method="post"
                                                           action="/denyRunValidation?id=${runValidation.id}&validatedBy=${currentUser.id}">
                                                    <button type="submit" class="btn btn-xs btn-danger">Anullieren
                                                    </button>
                                                </form:form>
                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">
                                                    Abbrechen
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- denyModal ------------>

                            </div>


                        </td>


                    </tr>
                </c:forEach>
                <!--  list all speedRuns ----------------------------------------------------------- -->
                </tbody>
            </table>
        </div>
    </div>


</layout:page-container>
