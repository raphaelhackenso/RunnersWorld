<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="bootstrap" tagdir="/WEB-INF/tags/bootstrap" %>
<%@taglib prefix="layout" tagdir="/WEB-INF/tags/layout" %>

<layout:page-container-anonymous title="Error" activePage="error">

    <h1>Das war wohl zu schnell ...</h1>
    <legend>Aber der Run ist noch nicht verloren, neu sammeln und weiter gehts</legend>

    <p></p>
    <p>Etwas ist beim Besichtigen von ${url} ist schiefgelaufen.</p>

    <p>Dieses Problem ist aufgetreten: ${exception}</p>

</layout:page-container-anonymous>
