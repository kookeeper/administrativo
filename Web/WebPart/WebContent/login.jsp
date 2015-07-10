<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<title><s:text name="titulo" /></title>
<link href="<s:url value="/css/padrao.css"/>" rel="stylesheet"
	type="text/css" />
<script type="text/javascript"
	src="<s:url value="/scripts/jquery-1.4.2.js"/>"></script>
<script type="text/javascript"
	src="<s:url value="/scripts/jQueryFiles.js"/>"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var $div = $('div.login'), $form = $('form');

		$('#Login_username').focus();
	});
</SCRIPT>
</head>

<body>
	<div class="login">

		<s:actionerror />

		<s:form action="efetuarLogin" cssClass="login">
			<s:textfield key="username" />
			<s:password key="password" />
			<s:submit key="submit" />
		</s:form>
	</div>
</body>
</html>
