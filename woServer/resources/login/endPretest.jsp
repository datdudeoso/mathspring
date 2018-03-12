<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%--
  Created by IntelliJ IDEA.
  User: david
  Date: 4/13/15
  Time: 3:42 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="edu.umass.ckc.wo.content.PrePostProblemDefn" %>
<style>
    .ui-progressbar {
        position: relative;
    }
    .progress-label {
        position: absolute;
        left: 5%;
        top: 4px;
        font-weight: bold;
        text-shadow: 1px 1px 0 #fff;
    }
</style>

<%--  JQuery is loaded by the containing page loginK12Outer.jsp--%>
<script type="text/javascript">
    var startTime;
    var elapsedTime = 0;
    var showWaitMessage = true;

    // calculate the time since this page was shown and set the hidden input to have the time.
    // If the form is valid, the elapsedTime input will be sent.
    function updateElapsedTime () {
        var d = new Date();
        now = d.getTime();
        elapsedTime = now - startTime;
        document.getElementById("elapsedTimeInput").value = elapsedTime;
    }

    // Pop up an alert after a period of time so student does not sit in the question too long
    $(document).ready(function () {
        var warnTime = ${question.waitTimeSecs};
        var interval = warnTime * 1000;  // convert to ms
        var d = new Date();
        startTime = d.getTime();
        // only set up a warning cycle if the warnTime is set.
        if ( warnTime > 0)
            setInterval(function () { alertUser(${question.isMultiChoice()})}, interval );
        // hide the controls that allow selecting 'I don't know'

    });



</script>

<%--@elvariable id="question" type="edu.umass.ckc.wo.content.PrePostProblemDefn"--%>





<form id="pretestQuestion" method="post" name="login" onsubmit="updateElapsedTime();" action="${pageContext.request.contextPath}/WoLoginServlet">
    <input type="hidden" name="action" value="LoginInterventionInput"/>
    <input type="hidden" name="sessionId" value="${sessionId}">
    <input type="hidden" name="skin" value="${skin}"/>
    <input id="varparam" type="hidden" name="var" value="a"/>
    <input type="hidden" name="interventionClass" value="${interventionClass}"/>
    <input type="hidden" name="testDone" value="true"/>
    <input id="elapsedTimeInput" type="hidden" name="elapsedTime" value="0"/>


    <p>&nbsp;</p>
    You are done with this part.  Your score is ${numProbsCorrect}/${numProbsInTest}
    <br>

    <br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <input  type="submit"  value="Continue" /> &nbsp;&nbsp;
    <br><br>
</form>
<br>





