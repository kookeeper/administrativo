<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
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
		carregaImagemAtalho('classificacao.classificacaoSq', <s:text name="classificacaoSq" />);
		montaCabecalho();
		$(document).data('tabela', 'Classificacao');

		$('form').validate({
			rules: {
				codigoClassificacao: {
					required: true
				}
			}
		});
	});
</script>
</head>
<body>

	<s:a id="submit" href="#"><img src="${pageContext.request.contextPath}/imagens/Salvar.png" title="Salvar"/></s:a>
	<s:a id="cancel" href="#"><img src="${pageContext.request.contextPath}/imagens/Cancelar.png" title="Cancelar"/></s:a>

<form action="salvarClassificacao">
	<s:hidden name="id"/>
	<div class="corpoCadastro">
	<table class="cadastro">
	<tr>
		<td><s:text name="classificacao.codigoClassificacao" /></td>
		<td><s:textfield name="codigoClassificacao" maxlength="50" size="50" theme="simple"  /></td>
	</tr><tr>
		<td><s:text name="classificacao.limiteMinimo" /></td>
		<td><s:textfield name="limiteMinimo" maxlength="9" size="9" theme="simple" cssClass="numericField"/></td>
	</tr><tr>
		<td><s:text name="classificacao.limiteMaximo" /></td>
		<td><s:textfield name="limiteMaximo" maxlength="9" size="9" theme="simple" cssClass="numericField"/></td>
	</tr><tr>
		<td><s:text name="classificacao.mesesBonus" /></td>
		<td><s:textfield name="mesesBonus" maxlength="9" size="9" theme="simple" cssClass="numericField"/></td>
	</tr><tr>
	</tr></table>
	</div>
	<div class="atalhos">
		<s:iterator value="dependencias">
			<img src="${pageContext.request.contextPath}/imagens/documento.jpg" id="<s:property value="nomeTabela"/>" title="<s:property value="tituloTabela"/>"/>
		</s:iterator>
	</div>
</form>

</body>
</html>