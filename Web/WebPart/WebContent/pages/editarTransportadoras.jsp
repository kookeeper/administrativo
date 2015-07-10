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
		carregaImagemAtalho('transportadoras.transportadoraSq', <s:text name="transportadoraSq" />);
		montaCabecalho();
		$(document).data('tabela', 'Transportadoras');

		$('form').validate({
			rules: {
				codigoTransportadora: {
					required: true
				},
				nomeTransportadora: {
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

<form action="salvarTransportadora">
	<s:hidden name="id"/>
	<div class="corpoCadastro">
	<table class="cadastro">
	<tr>
		<td><s:text name="transportadora.codigoTransportadora" /></td>
		<td colspan="3"><s:textfield name="codigoTransportadora" maxlength="15" size="15" theme="simple"  /></td>
	</tr><tr>
		<td><s:text name="transportadora.nomeTransportadora" /></td>
		<td colspan="3"><s:textfield name="nomeTransportadora" maxlength="50" size="50" theme="simple"/></td>
	</tr><tr>
		<td><s:text name="transportadora.enderecoTransportadora" /></td>
		<td colspan="3"><s:textfield name="enderecoTransportadora" maxlength="50" size="50" theme="simple"  /></td>
	</tr><tr>
		<td><s:text name="transportadora.municipioTransportadora" /></td>
		<td colspan="3"><s:textfield name="municipioTransportadora" maxlength="30" size="30" theme="simple"/></td>
	</tr><tr>
		<td><s:text name="transportadora.estadoTransportadora" /></td>
		<td colspan="3"><s:textfield name="estadoTransportadora" maxlength="2" size="2" theme="simple"  /></td>
	</tr><tr>
		<td><s:text name="transportadora.inscrEstadual" /></td>
		<td colspan="3"><s:textfield name="inscrEstadual" maxlength="20" size="20" theme="simple"/></td>
	</tr><tr>
		<td><s:text name="transportadora.telefone" /></td>
		<td><s:textfield name="dddFone" maxlength="4" size="4" theme="simple"  /></td>
		<td><s:textfield name="numeroFone" maxlength="15" size="15" theme="simple"  /></td>
		<td><s:textfield name="complFone" maxlength="10" size="10" theme="simple"  /></td>
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