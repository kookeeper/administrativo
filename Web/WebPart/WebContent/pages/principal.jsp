<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="menu" uri="http://struts-menu.sf.net/tag"%>
<%@ taglib uri="http://struts-menu.sf.net/tag-el" prefix="menu-el" %> 
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title><s:text name="titulo" /></title>
	<script type="text/javascript" src="<s:url value="/scripts/jquery-1.4.2.js"/>"></script>
	<script type="text/javascript" src="<s:url value="/scripts/jQueryFiles.js"/>"></script>
		
</head>
<body>
<div class="cabecalho">
	<menu:useMenuDisplayer name="CoolMenu">
		<menu:displayMenu name="arquivo"/>
		<menu:displayMenu name="cadastro"/>
	</menu:useMenuDisplayer>
</div>

<div class="conteudo">
	<iframe name="conteudo" id="conteudo" src="pages/conteudo.jsp"></iframe>
</div>
<div class="rodape">
	Usuário: <b><s:property value="session.getAttribute('usuario').nomeUsuario" /></b>
</div>
</body>
</html>