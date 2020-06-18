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

<layout:page-container-anonymous title="aSpeedRuns" activePage="aSpeedRuns">

    <div class="row">
        <div class="col-md-10 col-md-offset-1">
            <form method="get" action="rankSpeedrun">

                <legend>Speedruns für</legend>

                <!-- Game select -->
                <select class="selectpicker game" data-live-search="true"
                        title="
                        <c:if test="${not empty rankSpeedRuns}">
                            ${rankSpeedRuns[0].game.name}
                        </c:if>
                        <c:if test="${empty rankSpeedRuns}">
                            Spiel
                        </c:if> ">
                    <c:forEach items="${games}" var="game" varStatus="Rank">
                        <option value="${game.id}">${game.name}</option>
                    </c:forEach>
                </select>

                <!-- TypeOfRun select -->
                <select class="selectpicker typeOfRun" data-live-search="true"
                        title="
                        <c:if test="${not empty rankSpeedRuns}">
                            ${rankSpeedRuns[0].typeOfRun.category}
                        </c:if>
                        <c:if test="${empty rankSpeedRuns}">
                            Typ
                        </c:if> ">
                    <c:forEach items="${typeOfRuns}" var="typeOfRun" varStatus="Rank">
                        <option value="${typeOfRun.id}">${typeOfRun.category}</option>
                    </c:forEach>
                </select>

                <!-- Platform select -->
                <select class="selectpicker platform" data-live-search="true"
                        title="
                        <c:if test="${not empty rankSpeedRuns}">
                            ${rankSpeedRuns[0].platform.name}
                        </c:if>
                        <c:if test="${empty rankSpeedRuns}">
                            Platform
                         </c:if> ">
                    <c:forEach items="${platforms}" var="platform" varStatus="Rank">
                        <option value="${platform.id}">${platform.name}</option>
                    </c:forEach>
                </select>


                <!-- search button for ranking the chosen Speedrun -->
                <input id="inputGameId" type="hidden" name="game" value=""/>
                <input id="inputTypeOfRunId" type="hidden" name="typeOfRun" value="">
                <input id="inputPlatformId" type="hidden" name="platform" value="">
                <button type="submit" class="btn btn-xs btn-success">suchen
                </button>
            </form>

        </div>
    </div>


    <div class="row">
        <div class="col-md-10 col-md-offset-1">
            <table data-toggle="table" class="table table-striped">
                <thead>
                <tr>

                    <th data-sortable="true">Rang</th>
                    <th data-sortable="true">Zeit</th>
                    <th data-sortable="true">Runner</th>
                    <th data-sortable="true">Datum</th>
                    <th data-sortable="true">Version</th>
                    <th data-sortable="true">Referenz</th>

                </tr>
                </thead>
                <tbody>
                <!--  rank the chosen Speedrun ----------------------------------------------------------- -->
                <c:if test="${not empty rankSpeedRuns}">
                <c:forEach items="${rankSpeedRuns}" var="rankSpeedRun" varStatus="Rank">

                    <tr>
                        <td>${Rank.count}
                            <c:if test="${Rank.count == 1}">
                                st
                                <svg class="bi bi-award" width="1em" height="1em" viewBox="0 0 16 16"
                                     fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd"
                                          d="M9.669.864L8 0 6.331.864l-1.858.282-.842 1.68-1.337 1.32L2.6 6l-.306 1.854 1.337 1.32.842 1.68 1.858.282L8 12l1.669-.864 1.858-.282.842-1.68 1.337-1.32L13.4 6l.306-1.854-1.337-1.32-.842-1.68L9.669.864zm1.196 1.193l-1.51-.229L8 1.126l-1.355.702-1.51.229-.684 1.365-1.086 1.072L3.614 6l-.25 1.506 1.087 1.072.684 1.365 1.51.229L8 10.874l1.356-.702 1.509-.229.684-1.365 1.086-1.072L12.387 6l.248-1.506-1.086-1.072-.684-1.365z"/>
                                    <path d="M4 11.794V16l4-1 4 1v-4.206l-2.018.306L8 13.126 6.018 12.1 4 11.794z"/>
                                </svg>
                            </c:if>
                            <c:if test="${Rank.count == 2}">
                                nd
                            </c:if>
                            <c:if test="${Rank.count == 3}">
                                rd
                            </c:if>


                        </td>
                        <td>${rankSpeedRun.inGameTime}</td>
                        <td>
                            <a href="adisplayUser?runner=${rankSpeedRun.runner.username}">${rankSpeedRun.runner.username}</a>
                        </td>
                        <td>
                            <fmt:parseDate value="${rankSpeedRun.date}" pattern="yyyy-MM-dd" var="parsedDate"
                                           type="date"/>
                            <fmt:formatDate value="${parsedDate}" type="date" pattern="dd.MM.yyyy"/>
                        </td>
                        <td>${rankSpeedRun.game.version}</td>
                        <td><a href=${rankSpeedRun.validationURL}>URL</a></td>

                    </tr>
                </c:forEach>
                <!--  rank the chosen Speedrun ----------------------------------------------------------- -->
                </tbody>
                </c:if>
            </table>
        </div>
    </div>


    <div class="row">
        <div class="col-md-10 col-md-offset-1">
            <legend>Neueste Speedruns</legend>
            <table data-toggle="table" class="table table-striped">
                <thead>
                <tr>

                    <th data-sortable="true">Spiel</th>
                    <th data-sortable="true">Zeit</th>
                    <th data-sortable="true">Runner</th>
                    <th data-sortable="true">Datum</th>
                    <th data-sortable="true">Typ</th>
                    <th data-sortable="true">Platform</th>
                    <th data-sortable="true">Version</th>
                    <th data-sortable="true">Referenz</th>

                </tr>
                </thead>
                <tbody>
                <!--  list all new SpeedRuns ----------------------------------------------------------- -->
                <c:forEach items="${speedRunsNew}" var="speedRunNew" varStatus="Rank">

                    <tr>
                        <td>${speedRunNew.game.name}</td>
                        <td>${speedRunNew.inGameTime}</td>
                        <td>
                            <a href="adisplayUser?runner=${speedRunNew.runner.username}">${speedRunNew.runner.username}</a>
                        </td>
                        <td>
                            <fmt:parseDate value="${speedRunNew.date}" pattern="yyyy-MM-dd" var="parsedDate"
                                           type="date"/>
                            <fmt:formatDate value="${parsedDate}" type="date" pattern="dd.MM.yyyy"/>
                        </td>
                        <td>${speedRunNew.typeOfRun.category}</td>
                        <td>${speedRunNew.platform.name}</td>
                        <td>${speedRunNew.game.version}</td>
                        <td><a href=${speedRunNew.validationURL}>URL</a></td>

                    </tr>
                </c:forEach>
                <!--  list all speedRuns ----------------------------------------------------------- -->
                </tbody>
            </table>
        </div>
    </div>


</layout:page-container-anonymous>
