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

<layout:page-container title="editTypeOfRun" activePage="editTypeOfRun">

    <legend>Run Kategorie Bearbeiten / Anlegen</legend>
    <div class="row">
        <div class="col-md-8 col-md-offset-2">
                <%--@elvariable id="typeOfRun" type="at.fhj.ima.runnnersworld.runnersworkd.entity.TypeOfRun"--%>
            <form:form modelAttribute="typeOfRun" class="needs-validation form-horizontal" method="Post" action="changeTypeOfRun"
                       novalidate="novalidate">
                <input type="hidden" name="id" value="<c:out value="${typeOfRun.id}"/>">
                <fieldset>

                    <! ---------------- name ---------------- -->
                    <div class="form-group">
                        <label for="inputCategory" class="col-md-2 control-label">Category</label>
                        <div class="col-md-10">
                            <form:input id="inputCategory" path="category" type="text" class="form-control"
                                        required="required"/>
                            <form:errors path="category" cssClass="invalid-feedback d-block"/>
                        </div>
                    </div>

                    <! ---------------- buttons ---------------- -->
                    <div class="form-group">
                        <div class="col-md-10 col-md-offset-2">
                            <button type="submit" class="btn btn-primary">Speichern</button>
                            <a href="listTypeOfRuns" class="btn btn-default">Abbruch</a>
                        </div>
                    </div>

                </fieldset>

            </form:form>

        </div>
    </div>


</layout:page-container>
