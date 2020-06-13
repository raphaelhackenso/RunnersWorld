    <%@ attribute name="title" required="true" %>
        <%@ attribute name="activePage" required="true" %>
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib prefix="bootstrap" tagdir="/WEB-INF/tags/bootstrap" %>
        <%@taglib prefix="layout" tagdir="/WEB-INF/tags/layout" %>
        <%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


        <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
        <html>
        <head>
        <bootstrap:bootstrap-metadata/>
        <title>${title}</title>
        <bootstrap:bootstrap-css/>
        <link rel="stylesheet" href="<c:url value="/css/custom.css"/>">

        </head>
        <body>

        <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container">
        <a class="navbar-brand" href="/aSpeedRuns">RunnersWorld</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
        </button>

        <div>
        <a href="/registerUser" class="btn btn-link" role="button">Register User</a>
        </div>

        <div>
        <a href="/listSpeedRuns" class="btn btn-link" role="button">Login</a>
        </div>

        </div>
        </nav>

        <div class="container" role="main">
        <div class="page-header">
        <h1>RunnersWorld</h1>
        </div>

        <!-- Messages ----------------------------------------------------------- -->

        <!-- Error message ----------------------------------------------------------- -->
        <c:if test="${not empty errorMessage}">
            <div class="alert alert-danger" role="alert">${errorMessage}</div>
        </c:if>
        <!-- Error message ----------------------------------------------------------- -->

        <!-- Warning message ----------------------------------------------------------- -->
        <c:if test="${not empty warningMessage}">
            <div class="alert alert-warning" role="warning">${warningMessage}</div>
        </c:if>
        <!-- Warning message ----------------------------------------------------------- -->

        <!-- successful message ----------------------------------------------------------- -->
        <c:if test="${not empty message}">
            <div class="alert alert-success" role="warning">${message}</div>
        </c:if>
        <!-- successful message ----------------------------------------------------------- -->

        <!-- Messages ----------------------------------------------------------- -->
        <jsp:doBody/>
        </div>
        <bootstrap:bootstrap-js/>
        <script type="text/javascript" src="<c:url value="/js/custom.js"/>"></script>

        </body>
        </html>
