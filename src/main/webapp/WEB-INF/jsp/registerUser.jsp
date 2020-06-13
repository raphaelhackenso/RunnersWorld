<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="bootstrap" tagdir="/WEB-INF/tags/bootstrap" %>
<%@taglib prefix="layout" tagdir="/WEB-INF/tags/layout" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<layout:page-container-anonymous title="RegisterUser" activePage="registerUser">


    <legend>Register User</legend>
    <div class="row">
        <div class="col-md-8 col-md-offset-2">

            <%--@elvariable id="user" type="at.fhj.ima.runnersworld.runnersworld.dto.UserDto"--%>
            <form:form modelAttribute="user" class="needs-validation form-horizontal" method="post"
                       action="registerUserAccount" novalidate="novalidate">
                <input type="hidden" name="id" value="<c:out value="${user.id}"/>">
                <fieldset>


                    <! ---------------- Username ---------------- -->
                    <div class="form-group">
                        <label for="inputUsername" class="col-md-2 control-label">Username*</label>
                        <div class="col-md-10">
                            <form:input id="inputUsername" path="username" type="text" class="form-control"
                                        required="required"/>
                            <form:errors path="username" cssClass="invalid-feedback d-block"/>
                        </div>
                    </div>

                    <! ---------------- Password ---------------- -->
                    <div class="form-group">
                        <label for="inputPassword" class="col-md-2 control-label">Password*</label>
                        <div class="col-md-10">
                            <form:input id="inputPassword" path="password" type="password" class="form-control"
                                        required="required"/>
                            <form:errors path="password" cssClass="invalid-feedback d-block"/>

                        </div>
                    </div>


                    <! ---------------- Password Repeat ---------------- -->
                    <div class="form-group">
                        <label for="inputPasswordRepeat" class="col-md-2 control-label">Repeat Password*</label>
                        <div class="col-md-10">
                            <form:input id="inputPasswordRepeat" path="passwordRepeat" type="password" class="form-control"
                                        required="required"/>
                            <form:errors path="passwordRepeat" cssClass="invalid-feedback d-block"/>

                        </div>
                    </div>


                    <! ---------------- buttons ---------------- -->
                    <div class="form-group">
                        <div class="col-md-10 col-md-offset-2">
                            <button type="submit" class="btn btn-primary">Submit</button>
                            <a href="listSpeedRuns" class="btn btn-default">Cancel</a>
                        </div>
                    </div>

                </fieldset>
            </form:form>
        </div>
    </div>

</layout:page-container-anonymous>