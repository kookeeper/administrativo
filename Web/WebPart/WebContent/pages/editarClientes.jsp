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
			carregaImagemAtalho('clientes.clienteSq', <s:text name="clienteSq" />);
			montaCabecalho();
			mostraDiv(1);
			$(document).data('tabela', 'Clientes');
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

<form action="salvarClientes">
	<div>
	<s:hidden name="id"/>
	<hr>
	</div>
	<div class="corpoCadastro">
	<div class="pagina" id="aba01">
	<table class="cadastro">
	<tr>
		<td><s:text name="cliente.codigoCliente" /></td>
		<td><s:textfield name="codigoCliente" maxlength="15" size="15" theme="simple"/></td>
		<td>&nbsp;</td>
		<td><s:text name="cliente.nomeCliente" /></td>
		<td><s:textfield name="nomeCliente" maxlength="50" size="50" theme="simple"/></td>
	</tr><tr>
		<td><s:text name="cliente.inscrEstadual" /></td>
		<td><s:textfield name="inscrEstadual" maxlength="20" size="20" theme="simple" /></td>
		<td>&nbsp;</td>
		<td><s:text name="cliente.inscrMunicipal" /></td>
		<td><s:textfield name="inscrMunicipal" maxlength="20" size="20" theme="simple" /></td>
	</tr><tr>
		<td colspan="2"><s:checkbox  name="biro" fieldValue="S" value="%{isBiroSet}" theme="simple"/>
		<s:text name="cliente.biro" /></td>
		<td>&nbsp;</td>
		<td><s:text name="cliente.tipoCliente" /></td>
		<td><s:select 	 name="tipoCliente"		list="listaTipoCliente"		listValue="descricaoTipo"		listKey="tipoClienteSq"		value="tipoCliente.tipoClienteSq" theme="simple" /></td>
	</tr><tr>
		<td><s:text name="cliente.classificacao" /></td>
		<td colspan="4"><s:select name="classificacaoSq"	list="listaClassificacao"	listValue="codigoClassificacao"	listKey="classificacaoSq"	value="classificacao.classificacaoSq" theme="simple"/></td>
	</tr><tr>
		<td><s:text name="cliente.transportadoras" /></td>
		<td colspan="4"><s:select name="transportadorasSq"	list="listaTransportadoras"	listValue="nomeTransportadora"	listKey="transportadoraSq"	value="transportadoras.transportadoraSq" theme="simple"/></td>
	</tr><tr><td colspan="5"><hr></td>
	</tr><tr>
		<td><s:text name="cliente.cep" /></td>
		<td><s:textfield name="cep" maxlength="8" size="8" theme="simple" /></td>
		<td>&nbsp;</td>
		<td><s:text name="cliente.endereco" /></td>
		<td><s:textfield name="endereco" maxlength="50" size="50" theme="simple" /></td>
	</tr><tr>
		<td><s:text name="cliente.numero" /></td>
		<td><s:textfield name="numero" maxlength="20" size="20" theme="simple" /></td>
		<td>&nbsp;</td>
		<td><s:text name="cliente.complEndereco" /></td>
		<td><s:textfield name="complEndereco" maxlength="50" size="50" theme="simple" /></td>
	</tr><tr>
		<td><s:text name="cliente.bairro" /></td>
		<td><s:textfield name="bairro" maxlength="30" size="30" theme="simple" /></td>
		<td>&nbsp;</td>
		<td><s:text name="cliente.cidade" /></td>
		<td><s:textfield name="cidade" maxlength="30" size="30" theme="simple" /></td>
	</tr><tr>
		<td><s:text name="cliente.estado" /></td>
		<td><s:textfield name="estado" maxlength="2" size="2" theme="simple" /></td>
		<td>&nbsp;</td>
		<td><s:text name="cliente.pais" /></td>
		<td><s:textfield name="pais" maxlength="50" size="50" theme="simple" /></td>
	</tr><tr><td colspan="5"><hr></td>
	</tr></table></div>
	<div class="pagina" id="aba02">
	<table class="cadastro">
	<tr>
		<td><s:text name="cliente.nomeFantasia" /></td>
		<td colspan="4"><s:textfield name="nomeFantasia" maxlength="50" size="50" theme="simple" /></td>
	</tr><tr>
		<td><s:text name="cliente.contato" /></td>
		<td colspan="4"><s:textfield name="contato" maxlength="50" size="50" theme="simple" /></td>
	</tr><tr>
		<td><s:text name="cliente.vendedores" /></td>
		<td colspan="4"><s:select name="vendedoresSq"		list="listaVendedores"		listValue="nomeVendedor"		listKey="vendedorSq"		value="vendedores.vendedorSq" theme="simple"/></td>
	</tr><tr><td colspan="5"><hr></td>
	</tr><tr>
		<td><s:text name="cliente.celular" /></td>
		<td colspan="4"><s:textfield name="dddCelular" maxlength="4" size="4" theme="simple" />
		<s:textfield name="numeroCelular" maxlength="15" size="15" theme="simple" />
		<s:textfield name="complCelular" maxlength="10" size="10" theme="simple" /></td>
	</tr><tr>
		<td><s:text name="cliente.fax" /></td>
		<td colspan="4"><s:textfield name="dddFax" maxlength="4" size="4" theme="simple" />
		<s:textfield name="numeroFax" maxlength="15" size="15" theme="simple" />
		<s:textfield name="complFax" maxlength="10" size="10" theme="simple" /></td>
	</tr><tr>
		<td><s:text name="cliente.fone1" /></td>
		<td colspan="4"><s:textfield name="dddFone1" maxlength="4" size="4" theme="simple" />
		<s:textfield name="numeroFone1" maxlength="15" size="15" theme="simple" />
		<s:textfield name="complFone1" maxlength="10" size="10" theme="simple" /></td>
	</tr><tr>
		<td><s:text name="cliente.fone2" /></td>
		<td colspan="4"><s:textfield name="dddFone2" maxlength="4" size="4" theme="simple" />
		<s:textfield name="numeroFone2" maxlength="15" size="15" theme="simple" />
		<s:textfield name="complFone2" maxlength="10" size="10" theme="simple" /></td>
	</tr><tr>
		<td><s:text name="cliente.fone3" /></td>
		<td colspan="4"><s:textfield name="dddFone3" maxlength="4" size="4" theme="simple" />
		<s:textfield name="numeroFone3" maxlength="15" size="15" theme="simple" />
		<s:textfield name="complFone3" maxlength="10" size="10" theme="simple" /></td>
	</tr><tr>
		<td><s:text name="cliente.EMail" /></td>
		<td colspan="4"><s:textfield name="EMail" maxlength="100" size="100" theme="simple" /></td>
	</tr><tr>
		<td><s:text name="cliente.webSite" /></td>
		<td colspan="4"><s:textfield name="webSite" maxlength="100" size="100" theme="simple" /></td>
	</tr><tr><td colspan="5"><hr></td>
	</tr></table></div>
	<div class="pagina" id="aba03">
	<table class="cadastro">
	<tr>
		<td><s:text name="cliente.dataFundacao" /></td>
		<td><s:textfield name="dataFundacao" maxlength="12" size="12" theme="simple" /></td>
		<td>&nbsp;</td>
		<td><s:text name="cliente.faturamentoMensal" /></td>
		<td><s:textfield name="faturamentoMensal" maxlength="10" size="10" theme="simple" /></td>
	</tr><tr>
		<td><s:text name="cliente.capitalAtual" /></td>
		<td><s:textfield name="capitalAtual" maxlength="10" size="10" theme="simple" /></td>
	</tr><tr><td colspan="5"><hr></td>
	</tr><tr>
		<td><s:text name="cliente.observacao" /></td>
		<td colspan="4"><s:textarea name="observacao" cols="60" rows="6" theme="simple" /></td>
	</tr><tr><td colspan="5"><hr></td>
	</tr><tr>
		<td><s:text name="cliente.dataCadastro" /></td>
		<td><s:textfield name="dataCadastro" maxlength="20" size="20" readonly="true" theme="simple" /></td>
		<td>&nbsp;</td>
		<td><s:text name="cliente.dataAlt" /></td>
		<td><s:textfield name="dataAlt" size="20" readonly="true" theme="simple" /></td>
	</tr><tr>
		<td><s:text name="cliente.usuarioSqAlt" /></td>
	  <td colspan="4"><s:textfield name="usuarioAlt.nomeUsuario" maxlength="50" size="50" readonly="true" theme="simple" /></td>
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