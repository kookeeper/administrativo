<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="display" uri="http://displaytag.sf.net"%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title><s:text name="titulo" /></title>
	<script type="text/javascript">
		contextPath = '${pageContext.request.contextPath}';
	</script>
	<script type="text/javascript" src="<s:url value="/scripts/jquery-1.4.2.js"/>"></script>
	<script type="text/javascript" src="<s:url value="/scripts/jQueryFiles.js"/>"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			carregaImagemAtalho('acessos.acessoSq', <s:text name="acessoSq" />);
			montaCabecalho();
			$(document).data('tabela', 'Acessos');
		});
</script>
</head>
<body>

	<s:a id="submit" href="#"><img src="${pageContext.request.contextPath}/imagens/Salvar.png" title="Salvar"/></s:a>
	<s:a id="cancel" href="#"><img src="${pageContext.request.contextPath}/imagens/Cancelar.png" title="Cancelar"/></s:a>

<form action="salvarAcessos">
	<div class="corpoCadastro">
		<div class="listaRegistros">
		<display:table defaultorder="descending" defaultsort="1" requestURI="#" name="registros" class="listaRegistros" id="registro">
			<display:column property="nomePrograma" titleKey="acesso.nomePrograma" sortable="true"/>
			<display:column titleKey="acesso.visualizar">
				<input name="visualizar${registro.acessoSq}" type="checkbox" value="${visualizar}" <s:if test='%{registro.visualizar=="S"}'>checked="checked"</s:if>>
			</display:column>
			<display:column titleKey="acesso.criar">
				<input name="criar${registro.acessoSq}" type="checkbox" value="${criar}" <s:if test='%{registro.criar=="S"}'>checked="checked"</s:if>>
			</display:column>
			<display:column titleKey="acesso.editar">
				<input name="editar${registro.acessoSq}" type="checkbox" value="${editar}" <s:if test='%{registro.editar=="S"}'>checked="checked"</s:if>>
			</display:column>
			<display:column titleKey="acesso.apagar">
				<input name="apagar${registro.acessoSq}" type="checkbox" value="${apagar}" <s:if test='%{registro.apagar=="S"}'>checked="checked"</s:if>>
			</display:column>
		</display:table>
		</div>
	</div>
	<div class="atalhos">
		<s:iterator value="dependencias">
			<img src="${pageContext.request.contextPath}/imagens/documento.jpg" id="<s:property value="nomeTabela"/>" title="<s:property value="tituloTabela"/>"/>
		</s:iterator>
	</div>
</form>

</body>
</html>