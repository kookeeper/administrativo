<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<%@ taglib prefix="display" uri="http://displaytag.sf.net"%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title><s:text name="titulo" /></title>
	<script type="text/javascript">
		contextPath = '${pageContext.request.contextPath}';
	</script>
	<script type="text/javascript" src="<s:url value="/combogrid-1.6.2/resources/jquery/jquery-1.6.2.min.js"/>"></script>
	<script>jq162 = jQuery.noConflict();</script>
	<script type="text/javascript" src="<s:url value="/combogrid-1.6.2/resources/jquery/jquery-ui-1.8.9.custom.min.js"/>"></script>
	<script type="text/javascript" src="<s:url value="/combogrid-1.6.2/resources/plugin/jquery.ui.combogrid-1.6.2.js"/>"></script>
	<script type="text/javascript" src="<s:url value="/combogrid-1.6.2/resources/plugin/jquery.i18n.properties-1.0.9.js"/>"></script>

    <link rel="stylesheet" type="text/css" href="<s:url value="/combogrid-1.6.2/resources/css/smoothness/jquery.ui.combogrid.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<s:url value="/combogrid-1.6.2/resources/css/smoothness/jquery-ui-1.8.9.custom.css"/>"/>
  
	<script type="text/javascript" src="<s:url value="/scripts/jquery-1.9.1.js"/>"></script>
	<script type="text/javascript" src="<s:url value="/scripts/jQueryFiles.js"/>"></script>
	<script type="text/javascript" src="<s:url value="/scripts/editarPedidos.js"/>"></script>

    <link rel="stylesheet" type="text/css" href="<s:url value="/datatables-1.9.4/css/demo_page.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<s:url value="/datatables-1.9.4/css/demo_table.css"/>"/>

	<script type="text/javascript" src="<s:url value="/datatables-1.9.4/js/jquery.dataTables.js"/>"></script>

	<sx:head/>
	<s:set name="registro" value="registro" scope="page"/>
</head>
<body>

	<ul>
		<li><s:a id="link1" href="javascript:mostraDiv(1);"><s:text name="pedido.aba1"/></s:a></li>
		<li><s:a id="link2" href="javascript:mostraDiv(2);"><s:text name="pedido.aba2"/></s:a></li>
		<li><s:a id="link3" href="javascript:mostraDiv(3);"><s:text name="pedido.aba3"/></s:a></li>
	</ul>
	<s:a id="submit" href="#"><img src="${pageContext.request.contextPath}/imagens/Salvar.png" title="<s:text name="botao.salvar"/>"/></s:a>
	<s:a id="cancel" href="#"><img src="${pageContext.request.contextPath}/imagens/Cancelar.png" title="<s:text name="botao.cancelar"/>"/></s:a>

<s:actionerror/>
<s:actionmessage/>

<form action="salvarPedidos">
	<div>
	<s:hidden name="id"/>
	<hr>
	</div>
	<div class="corpoCadastro">
	<div id="errors"></div>
	<div class="pagina" id="aba01">
	<table class="cadastro">
	<tr>
		<td><s:text name="pedido.numeroPedido" /></td>
		<td><s:textfield name="numeroPedido" maxlength="15" size="15" theme="simple"/></td>
		<td>&nbsp;</td>
		<td><s:text name="pedido.dataPedido" /></td>
		<td><input class="pickerfield" name="dataPedido" id="dataPedido" type="text" value="<s:date name="dataPedido" format="dd/MM/yyyy HH:mm:ss"/>"/></td>
	</tr><tr>
		<td><s:text name="pedido.cotacaoDolar" /></td>
		<td><s:textfield name="cotacaoDolar" maxlength="20" size="20" theme="simple" /></td>
		<td>&nbsp;</td>
	</tr><tr>
		<td><s:text name="pedido.clientes" /></td>
		<td colspan="4"><sx:autocompleter keyName="clientes.clienteSq" value="%{clientes.nomeCliente}" name="clienteSq" href="listaClientes" loadMinimumCount="1" loadOnTextChange="true" preload="false" searchType="substring" forceValidOption="true" cssStyle="width: 90%" showDownArrow="false"/></td>
	</tr><tr>
		<td><s:text name="pedido.condPagto" /></td>
		<td colspan="4"><sx:autocompleter keyName="condPagto.condPagtoSq" value="%{condPagto.descricaoCondPagto}" name="condPagtoSq" href="listaCondPagto" searchType="substring" forceValidOption="true" cssStyle="width: 90%" showDownArrow="false"/></td>
	</tr><tr>
		<td><s:text name="pedido.diasDemonstracao" /></td>
		<td><s:textfield name="diasDemonstracao" maxlength="20" size="20" theme="simple" /></td>
	</tr><tr>
		<td><s:text name="pedido.naturezas" /></td>
		<td colspan="4"><sx:autocompleter keyName="naturezas.naturezaSq" value="%{naturezas.descricaoNatureza}" name="naturezaSq" href="listaNaturezas" searchType="substring" forceValidOption="true" cssStyle="width: 90%" showDownArrow="false"/></td>
	</tr><tr>
		<td><s:text name="pedido.transportadoras" /></td>
		<td colspan="4"><sx:autocompleter keyName="transportadoras.transportadoraSq" value="%{transportadoras.nomeTransportadora}" name="transportadoraSq" href="listaTransportadoras" searchType="substring" forceValidOption="true" cssStyle="width: 90%" showDownArrow="false"/></td>
	</tr><tr>
		<td><s:text name="pedido.vendedores" /></td>
		<td colspan="4"><sx:autocompleter keyName="vendedores.vendedorSq" value="%{vendedores.nomeVendedor}" name="vendedorSq" href="listaVendedores" searchType="substring" forceValidOption="true" cssStyle="width: 90%" showDownArrow="false"/></td>
	</tr><tr>
		<td><s:text name="pedido.freteTransp" /></td>
		<td colspan="4">
			<s:radio name="freteTransp" list="listaFreteTransp" listKey="codigoFreteTransp" listValue="descricaoFreteTransp" 
				value="%{freteTransp}" theme="simple"/>
		</td>
	</tr><tr>
		<td><s:text name="pedido.observacaoPed"/></td>
		<td colspan="4"><s:textarea name="observacaoPed" cssStyle="width:95%;" theme="simple"></s:textarea></td>
	</tr><tr>
		<td><s:text name="pedido.observacaoNf"/></td>
		<td colspan="4"><s:textarea name="observacaoNf" cssStyle="width:95%;" theme="simple"></s:textarea></td>
	</tr><tr>
		<td colspan="5"><hr></td>
	</tr></table></div>
	<div class="pagina" id="aba02">
	<table class="cadastro">
	<tr>
		<td>
		<table class="display" id="table_itens">
		<thead>
			<tr>
				<th width="20%"><s:text name="pedidoItem.codigoProduto"/></th>
				<th width="25%"><s:text name="pedidoItem.descricaoProduto"/></th>
				<th width="25%"><s:text name="pedidoItem.qtdePedidoItem"/></th>
				<th width="15%"><s:text name="pedidoItem.precoUnit"/></th>
				<th width="15%"><s:text name="pedidoItem.vlrTotalItem"/></th>
			</tr>
		</thead>
		<tbody>

		</tbody>
		<tfoot>
			<tr>
				<th><s:text name="pedidoItem.codigoProduto"/></th>
				<th><s:text name="pedidoItem.descricaoProduto"/></th>
				<th><s:text name="pedidoItem.qtdePedidoItem"/></th>
				<th><s:text name="pedidoItem.precoUnit"/></th>
				<th><s:text name="pedidoItem.vlrTotalItem"/></th>
			</tr>
		</tfoot>
		</table>
		
			<display:table name="pedidosItenses" id="registro" class="listaRegistros">
				<display:column property="produtos.codigoProduto" titleKey="pedidoItem.codigoProduto"/>
				<display:column property="produtos.descricaoProduto" titleKey="pedidoItem.descricaoProduto"/>
				<display:column property="qtdePedidoItem" titleKey="pedidoItem.qtdePedidoItem"/>
				<display:column property="precoUnit" titleKey="pedidoItem.precoUnit"/>
				<display:column property="vlrTotalItem" titleKey="pedidoItem.vlrTotalItem"/>
				<display:column property="pedidoItemSq"/>
				<display:column title="" class="link">
					<img alt="Editar" src="${pageContext.request.contextPath}/imagens/edit.gif" border="0" height="23" style="background-color: transparent; cursor: pointer;" title="Editar" onclick="return editarItem(${registro_rowNum-1});"/>
					&nbsp;&nbsp;&nbsp;
					<img alt="Excluir" src="${pageContext.request.contextPath}/imagens/excluir.gif" border="0" height="23" style="background-color: transparent; cursor: pointer;" title="Excluir" onclick="return excluirItem(${registro_rowNum-1});"/>
<script>
	var form = $('form');
	
	$("<input>", {type: "hidden", id: "listaPedidoItem[" 	+ '${registro_rowNum-1}' + "].pedidoItemSq",		name: "listaPedidoItem[" 	+ '${registro_rowNum-1}' + "].pedidoItemSq",		value: '${registro.pedidoItemSq}'}).appendTo(form);
	$("<input>", {type: "hidden", id: "listaPedidoItem[" 	+ '${registro_rowNum-1}' + "].produtos.produtoSq",	name: "listaPedidoItem[" 	+ '${registro_rowNum-1}' + "].produtos.produtoSq",	value: '${registro.produtos.produtoSq}'}).appendTo(form);
	$("<input>", {type: "hidden", id: "listaPedidoItem[" 	+ '${registro_rowNum-1}' + "].produtos.descricaoProduto",	name: "listaPedidoItem[" 	+ '${registro_rowNum-1}' + "].produtos.descricaoProduto",	value: '${registro.produtos.descricaoProduto}'}).appendTo(form);
	$("<input>", {type: "hidden", id: "listaPedidoItem[" 	+ '${registro_rowNum-1}' + "].pesoBruto", 			name: "listaPedidoItem[" 	+ '${registro_rowNum-1}' + "].pesoBruto",			value: '${registro.pesoBruto}'}).appendTo(form);
	$("<input>", {type: "hidden", id: "listaPedidoItem[" 	+ '${registro_rowNum-1}' + "].pesoLiquido", 		name: "listaPedidoItem[" 	+ '${registro_rowNum-1}' + "].pesoLiquido",			value: '${registro.pesoLiquido}'}).appendTo(form);
	$("<input>", {type: "hidden", id: "listaPedidoItem[" 	+ '${registro_rowNum-1}' + "].pctJuros", 			name: "listaPedidoItem[" 	+ '${registro_rowNum-1}' + "].pctJuros",			value: '${registro.pctJuros}'}).appendTo(form);
	$("<input>", {type: "hidden", id: "listaPedidoItem[" 	+ '${registro_rowNum-1}' + "].pctDesc", 			name: "listaPedidoItem[" 	+ '${registro_rowNum-1}' + "].pctDesc",				value: '${registro.pctDesc}'}).appendTo(form);
	$("<input>", {type: "hidden", id: "listaPedidoItem[" 	+ '${registro_rowNum-1}' + "].baseIcmsSubstItem", 	name: "listaPedidoItem[" 	+ '${registro_rowNum-1}' + "].baseIcmsSubstItem",	value: '${registro.baseIcmsSubstItem}'}).appendTo(form);
	$("<input>", {type: "hidden", id: "listaPedidoItem[" 	+ '${registro_rowNum-1}' + "].vlrJuros", 			name: "listaPedidoItem[" 	+ '${registro_rowNum-1}' + "].vlrJuros",			value: '${registro.vlrJuros}'}).appendTo(form);
	$("<input>", {type: "hidden", id: "listaPedidoItem[" 	+ '${registro_rowNum-1}' + "].vlrDesc", 			name: "listaPedidoItem[" 	+ '${registro_rowNum-1}' + "].vlrDesc",				value: '${registro.vlrDesc}'}).appendTo(form);
	$("<input>", {type: "hidden", id: "listaPedidoItem[" 	+ '${registro_rowNum-1}' + "].vlrIcmsItem", 		name: "listaPedidoItem[" 	+ '${registro_rowNum-1}' + "].vlrIcmsItem",			value: '${registro.vlrIcmsItem}'}).appendTo(form);
	$("<input>", {type: "hidden", id: "listaPedidoItem[" 	+ '${registro_rowNum-1}' + "].vlrIcmsSubstItem", 	name: "listaPedidoItem[" 	+ '${registro_rowNum-1}' + "].vlrIcmsSubstItem",	value: '${registro.vlrIcmsSubstItem}'}).appendTo(form);
	$("<input>", {type: "hidden", id: "listaPedidoItem[" 	+ '${registro_rowNum-1}' + "].vlrIpiItem", 			name: "listaPedidoItem[" 	+ '${registro_rowNum-1}' + "].vlrIpiItem",			value: '${registro.vlrIpiItem}'}).appendTo(form);
	$("<input>", {type: "hidden", id: "listaPedidoItem[" 	+ '${registro_rowNum-1}' + "].vlrTotalItem", 		name: "listaPedidoItem[" 	+ '${registro_rowNum-1}' + "].vlrTotalItem",		value: '${registro.vlrTotalItem}'}).appendTo(form);
	$("<input>", {type: "hidden", id: "listaPedidoItem[" 	+ '${registro_rowNum-1}' + "].aliqIcmsItem", 		name: "listaPedidoItem[" 	+ '${registro_rowNum-1}' + "].aliqIcmsItem",		value: '${registro.aliqIcmsItem}'}).appendTo(form);
	$("<input>", {type: "hidden", id: "listaPedidoItem[" 	+ '${registro_rowNum-1}' + "].aliqIpiItem", 		name: "listaPedidoItem[" 	+ '${registro_rowNum-1}' + "].aliqIpiItem",			value: '${registro.aliqIpiItem}'}).appendTo(form);
	$("<input>", {type: "hidden", id: "listaPedidoItem[" 	+ '${registro_rowNum-1}' + "].nrSerieItem", 		name: "listaPedidoItem[" 	+ '${registro_rowNum-1}' + "].nrSerieItem",			value: '${registro.nrSerieItem}'}).appendTo(form);
	$("<input>", {type: "hidden", id: "listaPedidoItem[" 	+ '${registro_rowNum-1}' + "].numeroEstoque", 		name: "listaPedidoItem[" 	+ '${registro_rowNum-1}' + "].numeroEstoque",		value: '${registro.numeroEstoque}'}).appendTo(form);
	$("<input>", {type: "hidden", id: "listaPedidoItem[" 	+ '${registro_rowNum-1}' + "].precoUnit", 			name: "listaPedidoItem[" 	+ '${registro_rowNum-1}' + "].precoUnit",			value: '${registro.precoUnit}'}).appendTo(form);
	$("<input>", {type: "hidden", id: "listaPedidoItem[" 	+ '${registro_rowNum-1}' + "].qtdePedidoItem", 		name: "listaPedidoItem[" 	+ '${registro_rowNum-1}' + "].qtdePedidoItem",		value: '${registro.qtdePedidoItem}'}).appendTo(form);
	$("<input>", {type: "hidden", id: "listaPedidoItem[" 	+ '${registro_rowNum-1}' + "].qtdeProdutoRetorno",	name: "listaPedidoItem[" 	+ '${registro_rowNum-1}' + "].qtdeProdutoRetorno",	value: '${registro.qtdeProdutoRetorno}'}).appendTo(form);
</script>
				</display:column>
			</display:table>
		</td>
	</tr><tr><td colspan="5"><hr></td>
	</tr></table></div>
	<div class="pagina" id="aba03">
	<table class="cadastro">
	<tr>
		<td><s:text name="pedido.pesoBruto" /></td>
		<td><s:textfield name="pesoBruto" maxlength="9" size="9" theme="simple"/></td>
		<td>&nbsp;</td>
		<td><s:text name="pedido.pesoLiquido" /></td>
		<td><s:textfield name="pesoLiquido" maxlength="9" size="9" theme="simple"/></td>
	</tr><tr>
		<td><s:text name="pedido.vlrFrete" /></td>
		<td><s:textfield name="vlrFrete" maxlength="9" size="9" theme="simple"/></td>
		<td>&nbsp;</td>
		<td><s:text name="pedido.pctJuros" /></td>
		<td><s:textfield name="pctJuros" maxlength="9" size="9" theme="simple"/></td>
	</tr><tr>
		<td><s:text name="pedido.vlrJuros" /></td>
		<td><s:textfield name="vlrJuros" maxlength="9" size="9" theme="simple"/></td>
		<td>&nbsp;</td>
		<td><s:text name="pedido.pctDesc" /></td>
		<td><s:textfield name="pctDesc" maxlength="9" size="9" theme="simple"/></td>
	</tr><tr>
		<td><s:text name="pedido.vlrDesc" /></td>
		<td><s:textfield name="vlrDesc" maxlength="9" size="9" theme="simple"/></td>
		<td>&nbsp;</td>
		<td><s:text name="pedido.baseIcms" /></td>
		<td><s:textfield name="baseIcms" maxlength="9" size="9" theme="simple"/></td>
	</tr><tr>
		<td><s:text name="pedido.vlrIcms" /></td>
		<td><s:textfield name="vlrIcms" maxlength="9" size="9" theme="simple"/></td>
		<td>&nbsp;</td>
		<td><s:text name="pedido.baseIcmsSubst" /></td>
		<td><s:textfield name="baseIcmsSubst" maxlength="9" size="9" theme="simple"/></td>
	</tr><tr>
		<td><s:text name="pedido.vlrIcmsSubst" /></td>
		<td><s:textfield name="vlrIcmsSubst" maxlength="9" size="9" theme="simple"/></td>
		<td>&nbsp;</td>
		<td><s:text name="pedido.vlrSeguro" /></td>
		<td><s:textfield name="vlrSeguro" maxlength="9" size="9" theme="simple"/></td>
	</tr><tr>
		<td><s:text name="pedido.vlrIpi" /></td>
		<td><s:textfield name="vlrIpi" maxlength="9" size="9" theme="simple"/></td>
		<td>&nbsp;</td>
		<td><s:text name="pedido.vlrProdutos" /></td>
		<td><s:textfield name="vlrProdutos" maxlength="9" size="9" theme="simple"/></td>
	</tr><tr>
		<td><s:text name="pedido.vlrTotal" /></td>
		<td><s:textfield name="vlrTotal" maxlength="9" size="9" theme="simple"/></td>
	</tr><tr><td colspan="5"><hr></td>
	</tr></table></div></div>
	<div class="atalhos">
		<s:iterator value="dependencias">
			<img src="${pageContext.request.contextPath}/imagens/documento.jpg" id="<s:property value="nomeTabela"/>" title="<s:property value="tituloTabela"/>"/>
		</s:iterator>
	</div>
</form>

<div id="editarItem" hidden="true">
	<table>
		<tr><td><s:text name="pedidoItem.descricaoProduto"/></td>
		<td><input type="text" id="pedidoItem_descricaoProduto" name="pedidoItem.descricaoProduto"/>
		<input type="hidden" id="pedidoItem_produtoSq" name="pedidoItem.produtoSq"/></td>
		</tr><tr>
		<td><s:text name="pedidoItem.pesoBruto" /></td>
		<td><s:textfield name="pedidoItem.pesoBruto" maxlength="9" size="9" theme="simple"/></td>
		</tr><tr>
		<td><s:text name="pedidoItem.pesoLiquido" /></td>
		<td><s:textfield name="pedidoItem.pesoLiquido" maxlength="9" size="9" theme="simple"/></td>
		</tr><tr>
		<td><s:text name="pedidoItem.pctJuros" /></td>
		<td><s:textfield name="pedidoItem.pctJuros" maxlength="9" size="9" theme="simple"/></td>
		</tr><tr>
		<td><s:text name="pedidoItem.pctDesc" /></td>
		<td><s:textfield name="pedidoItem.pctDesc" maxlength="9" size="9" theme="simple"/></td>
		</tr><tr>
		<td><s:text name="pedidoItem.baseIcmsSubstItem" /></td>
		<td><s:textfield name="pedidoItem.baseIcmsSubstItem" maxlength="9" size="9" theme="simple"/></td>
		</tr><tr>
		<td><s:text name="pedidoItem.vlrJuros" /></td>
		<td><s:textfield name="pedidoItem.vlrJuros" maxlength="9" size="9" theme="simple"/></td>
		</tr><tr>
		<td><s:text name="pedidoItem.vlrDesc" /></td>
		<td><s:textfield name="pedidoItem.vlrDesc" maxlength="9" size="9" theme="simple"/></td>
		</tr><tr>
		<td><s:text name="pedidoItem.vlrIcmsItem" /></td>
		<td><s:textfield name="pedidoItem.vlrIcmsItem" maxlength="9" size="9" theme="simple"/></td>
		</tr><tr>
		<td><s:text name="pedidoItem.vlrIcmsSubstItem" /></td>
		<td><s:textfield name="pedidoItem.vlrIcmsSubstItem" maxlength="9" size="9" theme="simple"/></td>
		</tr><tr>
		<td><s:text name="pedidoItem.vlrIpiItem" /></td>
		<td><s:textfield name="pedidoItem.vlrIpiItem" maxlength="9" size="9" theme="simple"/></td>
		</tr><tr>
		<td><s:text name="pedidoItem.vlrTotalItem" /></td>
		<td><s:textfield name="pedidoItem.vlrTotalItem" maxlength="9" size="9" theme="simple"/></td>
		</tr><tr>
		<td><s:text name="pedidoItem.aliqIcmsItem" /></td>
		<td><s:textfield name="pedidoItem.aliqIcmsItem" maxlength="9" size="9" theme="simple"/></td>
		</tr><tr>
		<td><s:text name="pedidoItem.aliqIpiItem" /></td>
		<td><s:textfield name="pedidoItem.aliqIpiItem" maxlength="9" size="9" theme="simple"/></td>
		</tr><tr>
		<td><s:text name="pedidoItem.nrSerieItem" /></td>
		<td><s:textfield name="pedidoItem.nrSerieItem" maxlength="9" size="9" theme="simple"/></td>
		</tr><tr>
		<td><s:text name="pedidoItem.numeroEstoque" /></td>
		<td><s:textfield name="pedidoItem.numeroEstoque" maxlength="9" size="9" theme="simple"/></td>
		</tr><tr>
		<td><s:text name="pedidoItem.precoUnit" /></td>
		<td><s:textfield name="pedidoItem.precoUnit" maxlength="9" size="9" theme="simple"/></td>
		</tr><tr>
		<td><s:text name="pedidoItem.qtdePedidoItem" /></td>
		<td><s:textfield name="pedidoItem.qtdePedidoItem" maxlength="9" size="9" theme="simple"/></td>
		</tr><tr>
		<td><s:text name="pedidoItem.qtdeProdutoRetorno" /></td>
		<td><s:textfield name="pedidoItem.qtdeProdutoRetorno" maxlength="9" size="9" theme="simple"/></td>
		</tr><tr>
			<td colspan="2">
				<div align="right">
					<input type="submit" id="Salvar" name="Salvar" value="Salvar"/>
					<input type="button" id="cancel" name="cancel" value="Cancelar"/>
				</div>
			</td>
		</tr>
	</table>
</div>
</body>
</html>