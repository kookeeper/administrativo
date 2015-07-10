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
			carregaImagemAtalho('agendas.agendaSq', <s:text name="agendaSq" />);
			montaCabecalho();
			$(document).data('tabela', 'Agenda');
		});
</script>
</head>
<body>

	<s:a id="submit" href="#"><img src="${pageContext.request.contextPath}/imagens/Salvar.png" title="Salvar"/></s:a>
	<s:a id="cancel" href="#"><img src="${pageContext.request.contextPath}/imagens/Cancelar.png" title="Cancelar"/></s:a>

<form action="salvarAgenda">
	<s:hidden name="id"/>
	<div class="corpoCadastro">
	<table class="cadastro">
	<tr>
		<td><s:text name="agenda.cliente" /></td>
		<td colspan="4"><s:select 	 name="clientesSq"		list="listaClientes"		listValue="nomeCliente"		listKey="clienteSq"		value="clientes.clienteSq" theme="simple" /></td>
	</tr><tr>
		<td><s:text name="agenda.vendedor" /></td>
		<td colspan="4"><s:select 	 name="vendedoresSq"		list="listaVendedores"		listValue="nomeVendedor"		listKey="vendedorSq"		value="vendedores.vendedorSq" theme="simple" /></td>
	</tr><tr>
		<td><s:text name="agenda.dataAgenda" /></td>
		<td><input class="pickerfield" name="dataAgenda" id="dataAgenda" type="text" value="<s:date name="dataAgenda" format="dd/MM/yyyy HH:mm:ss"/>"/></td>
		<td>&nbsp;</td>
		<td colspan="2"><s:checkbox  name="realizado" fieldValue="S" value="%{isRealizadoSet}" theme="simple"/>
		<s:text name="agenda.realizado" /></td>
	</tr><tr>
		<td><s:text name="agenda.observacao" /></td>
		<td colspan="4"><s:textarea name="observacao" cols="60" rows="6" theme="simple" /></td>
	</tr><tr>
		<td><s:text name="agenda.usuarioPaiSq" /></td>
		<td colspan="4"><s:textfield name="usuarioPai.nomeUsuario" maxlength="50" size="50" readonly="true" theme="simple" /></td>
		<s:hidden name="usuarioPaiSq"/>
	</tr>
	</table>
	</div>
	<div class="atalhos">
		<s:iterator value="dependencias">
			<img src="${pageContext.request.contextPath}/imagens/documento.jpg" id="<s:property value="nomeTabela"/>" title="<s:property value="tituloTabela"/>"/>
		</s:iterator>
	</div>
</form>

</body>
</html>