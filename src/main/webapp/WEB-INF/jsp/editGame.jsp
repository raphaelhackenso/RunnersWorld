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

<layout:page-container title="editGames" activePage="editGames">

    <h1>Spiel Bearbeiten / Anlegen</h1>

    <div class="col-md-8 col-md-offset-2">
            <%--@elvariable id="game" type="at.fhj.ima.runnnersworld.runnersworkd.entity.Game"--%>
        <form:form modelAttribute="game" class="needs-valiation form-horizontal" method="Post" action="changeGame" novalidate="novalidate">
            <input type="hidden" name="id" value="<c:out value="${game.id}"/>">
                   <fieldset>
                       <! ---------------- language ---------------- -->
                       <div class="form-group">
                           <label for="inputLanguage" class="col-md-2 control-label">Language</label>
                           <div class="col-md-10">
                               <form:input id="inputLanguage" path="language" type="text" class="form-control" required="required"/>
                               <form:errors path="language" cssClass="invalid-feedback d-block"/>
                           </div>
                       </div>

                       <! ---------------- name ---------------- -->
                       <div class="form-group">
                           <label for="inputName" class="col-md-2 control-label">Name</label>
                           <div class="col-md-10">
                               <form:input id="inputName" path="name" type="text" class="form-control" required="required"/>
                               <form:errors path="name" cssClass="invalid-feedback d-block"/>
                           </div>
                       </div>

                       <! ---------------- releaseYear ---------------- -->
                       <div class="form-group">
                           <label for="inputRelease" class="col-md-2 control-label">Date</label>
                           <div class="col-md-10">
                               <form:input id="inputRelease" path="releaseYear" type="date" class="form-control" required="required"/>
                               <form:errors path="releaseYear" cssClass="invalid-feedback d-block"/>
                           </div>
                       </div>
                           <! ---------------- version ---------------- -->
                           <div class="form-group">
                               <label for="inputVersion" class="col-md-2 control-label">Version</label>
                               <div class="col-md-10">
                                   <form:input id="inputVersion" path="version" type="float" class="form-control" required="required"/>
                                   <form:errors path="version" cssClass="invalid-feedback d-block"/>
                               </div>
                           </div>
                       <! ---------------- buttons ---------------- -->
                       <div class="form-group">
                           <div class="col-md-10 col-md-offset-2">
                               <button type="submit" class="btn btn-primary">Speichern</button>
                               <a href="listGames" class="btn btn-default">Abbruch</a>
                           </div>
                       </div>

                   </fieldset>

        </form:form>

    </div>


</layout:page-container>
