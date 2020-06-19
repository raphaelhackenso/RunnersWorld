<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="bootstrap" tagdir="/WEB-INF/tags/bootstrap" %>
<%@taglib prefix="layout" tagdir="/WEB-INF/tags/layout" %>

<layout:page-container-anonymous title="Error" activePage="error">

    <h1>Error</h1>

    <p>Etwas ist beim Besichtigen von ${url} schiefgelaufen.</p>

    <p>Dieses Problem ist aufgetreten: ${exception}</p>

</layout:page-container-anonymous>
