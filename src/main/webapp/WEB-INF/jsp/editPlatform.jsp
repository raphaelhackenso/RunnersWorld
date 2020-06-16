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

<layout:page-container title="editPlatform" activePage="editPlatform">

    <h1>Platform Bearbeiten / Anlegen</h1>

    <div class="col-md-8 col-md-offset-2">
            <%--@elvariable id="platform" type="at.fhj.ima.runnnersworld.runnersworkd.entity.Platform"--%>
        <form:form modelAttribute="platform" class="needs-valiation form-horizontal" method="Post" action="changePlatform" novalidate="novalidate">
            <input type="hidden" name="id" value="<c:out value="${platform.id}"/>">
            <fieldset>
                <! ---------------- name ---------------- -->
                <div class="form-group">
                    <label for="inputName" class="col-md-2 control-label">Name</label>
                    <div class="col-md-10">
                        <form:input id="inputName" path="name" type="text" class="form-control" required="required"/>
                        <form:errors path="name" cssClass="invalid-feedback d-block"/>
                    </div>
                </div>

                <! ---------------- buttons ---------------- -->
                <div class="form-group">
                    <div class="col-md-10 col-md-offset-2">
                        <button type="submit" class="btn btn-primary">Speichern</button>
                        <a href="listPlatform" class="btn btn-default">Abbruch</a>
                    </div>
                </div>

            </fieldset>

        </form:form>

    </div>


</layout:page-container>
