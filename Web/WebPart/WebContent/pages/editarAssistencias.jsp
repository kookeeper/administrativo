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
			carregaImagemAtalho('assistencias.assistenciaSq', <s:text name="assistenciaSq" />);
			montaCabecalho();
			$(document).data('tabela', 'Assistencias');
		});
	</script>
</head>
<body>

	<ul>
		<li><s:a id="link1" href="javascript:mostraDiv(1);">Dados cadastrais</s:a></li>
		<li><s:a id="link2" href="javascript:mostraDiv(2);">Formas de contato</s:a></li>
		<li><s:a id="link3" href="javascript:mostraDiv(3);">Outras informações</s:a></li>
	</ul>
	<s:a id="submit" href="#"><img src="${pageContext.request.contextPath}/imagens/Salvar.png" title="Salvar"/></s:a>
	<s:a id="cancel" href="#"><img src="${pageContext.request.contextPath}/imagens/Cancelar.png" title="Cancelar"/></s:a>

<form action="salvarAssistencias">
	<div>
	<s:hidden name="id"/>
	<hr>
	</div>
	<div class="corpoCadastro">
	<div class="pagina" id="aba01">
	<table class="cadastro">
	<tr>
		<td><s:text name="assistencia.numeroAssistencia" /></td>
		<td><s:textfield name="numeroAssistencia" maxlength="9" size="9" theme="simple"/></td>
		<td>&nbsp;</td>
		<td><s:text name="assistencia.dataAssistencia" /></td>
		<td><input class="pickerfield" name="dataAssistencia" id="dataAssistencia" type="text" value="<s:date name="dataAssistencia" format="dd/MM/yyyy HH:mm:ss"/>"/></td>
	</tr><tr><td colspan="5"><hr></td>
	</tr><tr>
		<td><s:text name="assistencia.condPagto" /></td>
		<td colspan="4"><s:select name="condPagtoSq"	list="listaCondPagto"	listValue="descricaoCondPagto"	listKey="condPagtoSq"	value="condPagto.condPagtoSq" theme="simple"/></td>
	</tr><tr>
		<td><s:text name="assistencia.cliente" /></td>
		<td colspan="4"><s:select name="clienteSq"	list="listaClientes"	listValue="nomeCliente"	listKey="clienteSq"	value="cliente.clienteSq" theme="simple"/></td>
	</tr><tr>
		<td><s:text name="assistencia.vendedor" /></td>
		<td colspan="4"><s:select name="vendedorSq"	list="listaVendedores"	listValue="nomeVendedor"	listKey="vendedorSq"	value="vendedor.vendedorSq" theme="simple"/></td>
	</tr><tr><td colspan="5"><hr></td>
	</tr><tr>
		<td><s:text name="assistencia.dataChamado" /></td>
		<td><input class="pickerfield" name="dataChamado" id="dataChamado" type="text" value="<s:date name="dataChamado" format="dd/MM/yyyy HH:mm:ss"/>"/></td>
	</tr><tr>
		<td><s:text name="assistencia.horaInicio" /></td>
		<td><input class="timepickerfield" name="horaInicio" id="horaInicio" type="text" value="<s:date name="horaInicio" format="HH:mm:ss"/>"/></td>
		<td>&nbsp;</td>
		<td><s:text name="assistencia.horaFim" /></td>
		<td><input class="timepickerfield" name="horaFim" id="horaFim" type="text" value="<s:date name="horaFim" format="HH:mm:ss"/>"/></td>
	</tr><tr><td colspan="5"><hr></td>
	</tr><tr>
		<td><s:text name="assistencia.despChamado" /></td>
		<td><s:textfield name="despChamado" maxlength="10" size="10" theme="simple" cssClass="numericField"/></td>
		<td>&nbsp;</td>
		<td><s:text name="assistencia.cotacaoDolar" /></td>
		<td><s:textfield name="cotacaoDolar" maxlength="10" size="10" theme="simple" cssClass="numericField"/></td>
	</tr><tr>
		<td><s:text name="assistencia.despHtecAd" /></td>
		<td><s:textfield name="despHtecAd" maxlength="10" size="10" theme="simple" cssClass="numericField"/></td>
		<td>&nbsp;</td>
		<td><s:text name="assistencia.vlrPecas" /></td>
		<td><s:textfield name="vlrPecas" maxlength="10" size="10" theme="simple" cssClass="numericField"/></td>
	</tr><tr>
		<td><s:text name="assistencia.despDesloc" /></td>
		<td><s:textfield name="despDesloc" maxlength="10" size="10" theme="simple" cssClass="numericField"/></td>
		<td>&nbsp;</td>
		<td><s:text name="assistencia.vlrTotal" /></td>
		<td><s:textfield name="vlrTotal" maxlength="10" size="10" theme="simple" cssClass="numericField"/></td>
	</tr><tr><td colspan="5"><hr></td>
	</tr><tr>
		<td><s:checkbox name="garantia" theme="simple"/><s:text name="assistencia.garantia" /></td>
		<td>&nbsp;</td>
		<td><s:checkbox name="contrato" theme="simple"/><s:text name="assistencia.contrato" /></td>
		<td>&nbsp;</td>
		<td><s:checkbox name="frete" theme="simple"/><s:text name="assistencia.frete" /></td>
	</tr><tr><td colspan="5"><hr></td>
	</tr>
	</table></div>
	</div>
	<div class="atalhos">
		<s:iterator value="dependencias">
			<img src="${pageContext.request.contextPath}/imagens/documento.jpg" id="<s:property value="nomeTabela"/>" title="<s:property value="tituloTabela"/>"/>
		</s:iterator>
	</div>
</form>
</body>
</html>