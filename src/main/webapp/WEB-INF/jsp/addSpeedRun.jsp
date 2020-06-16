<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="bootstrap" tagdir="/WEB-INF/tags/bootstrap" %>
<%@taglib prefix="layout" tagdir="/WEB-INF/tags/layout" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<layout:page-container title="addSpeedRun" activePage="addSpeedRun">
    <legend>Add SpeedRun</legend>
    <div class="row">
        <div class="col-md-8 col-md-offset-2">


                <%--@elvariable id="speedrun" type="at.fhj.ima.runnersworld.runnersworld.dto.SpeedRunDto"--%>
            <form:form modelAttribute="speedrun" class="needs-validation form-horizontal" method="post"
                       action="saveNewSpeedRun" novalidate="novalidate">
                <input type="hidden" name="id" value="<c:out value="${speedrun.id}"/>">
                <fieldset>

                    <! ---------------- Runner ---------------- -->
                    <div>
                        <form:input id="inputRunner" path="runner" type="hidden" readonly="${not empty currentUser.id}"
                                    required="required" value="${currentUser.id}" cssClass="form-control"/>
                    </div>


                    <! ---------------- Game ---------------- -->
                    <div class="form-group">
                        <label class="col-md-2 control-label">Game*</label>
                        <div class="col-md-10">
                            <form:select path="game" cssClass="form-control">
                                <form:option value="">&nbsp;</form:option>
                                <form:options items="${games}" itemValue="id" itemLabel="name"/>
                            </form:select>
                            <form:errors path="game" cssClass="invalid-feedback d-block"/>
                        </div>
                    </div>

                    <! ---------------- Platform ---------------- -->
                    <div class="form-group">
                        <label class="col-md-2 control-label">Platform*</label>
                        <div class="col-md-10">
                            <form:select path="platform" cssClass="form-control">
                                <form:option value="">&nbsp;</form:option>
                                <form:options items="${platforms}" itemValue="id" itemLabel="name"/>
                            </form:select>
                            <form:errors path="platform" cssClass="invalid-feedback d-block"/>
                        </div>
                    </div>


                    <! ---------------- TypeOfRun ---------------- -->
                    <div class="form-group">
                        <label class="col-md-2 control-label">Type of Run*</label>
                        <div class="col-md-10">
                            <form:select path="typeOfRun" cssClass="form-control">
                                <form:option value="">&nbsp;</form:option>
                                <form:options items="${typeOfRuns}" itemValue="id" itemLabel="category"/>
                            </form:select>
                            <form:errors path="typeOfRun" cssClass="invalid-feedback d-block"/>
                        </div>
                    </div>


                    <! ---------------- In Game Time ---------------- -->
                    <div class="form-group">
                        <label for="inputTime" class="col-md-4 control-label">In Game Time*</label>
                        <div class="col-md-10">
                            <form:input id="inputTime" path="inGameTime" type="time" step="1" class="form-control"
                                        required="required" value="${speedrun.inGameTime}"/>
                            <form:errors path="inGameTime" cssClass="invalid-feedback d-block"/>
                        </div>
                    </div>


                    <! ---------------- Date ---------------- -->
                    <div class="form-group">
                        <label for="inputDate" class="col-md-2 control-label">Date*</label>
                        <div class="col-md-10">
                            <form:input id="inputDate" path="date" type="date" class="form-control" required="required"
                                        value="${speedrun.date}"/>
                            <form:errors path="date" cssClass="invalid-feedback d-block"/>
                        </div>
                    </div>


                    <! ---------------- ValidationURL ---------------- -->
                    <div class="form-group">
                        <label for="inputURL" class="col-md-4 control-label">Validation URL*</label>
                        <div class="col-md-10">
                            <form:input id="inputURL" path="validationURL" type="text" class="form-control"
                                        required="required" value="${speedrun.validationURL}"/>
                            <form:errors path="validationURL" cssClass="invalid-feedback d-block"/>
                        </div>
                    </div>


                    <! ---------------- Notes ---------------- -->
                    <div class="form-group">
                        <label for="inputNotes" class="col-md-2 control-label">Notes</label>
                        <div class="col-md-10">

                            <form:textarea path="notes" id="inputNotes" rows="5" />

                        </div>
                    </div>

                    <! ---------------- buttons ---------------- -->
                    <div class="form-group">
                        <div class="col-md-10 col-md-offset-2">
                            <button type="submit" class="btn btn-primary">Submit</button>
                            <a href="/displayUser" class="btn btn-default">Cancel</a>
                        </div>
                    </div>

                </fieldset>
            </form:form>
        </div>
    </div>

</layout:page-container>