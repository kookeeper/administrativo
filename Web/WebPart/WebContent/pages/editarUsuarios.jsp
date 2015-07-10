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
		carregaImagemAtalho('usuarios.usuarioSq', <s:text name="usuarioSq" />);
		montaCabecalho();
		$(document).data('tabela', 'Usuarios');

		$('form').validate({
			rules: {
				senhaUsuario: {
					required: true
				},
				senhaUsuario2: {
					comparaSenha: 'senhaUsuario'
				}
			}
		});
		$.validator.addMethod("comparaSenha", function(value, element, params) {
			return value == document.getElementsByName(params)[0].value;
			}, "A senha informada não é igual à primeira senha.");
	});
</script>
</head>
<body>

	<s:a id="submit" href="#"><img src="${pageContext.request.contextPath}/imagens/Salvar.png" title="Salvar"/></s:a>
	<s:a id="cancel" href="#"><img src="${pageContext.request.contextPath}/imagens/Cancelar.png" title="Cancelar"/></s:a>

<form action="salvarUsuarios">
	<s:hidden name="id"/>
	<div class="corpoCadastro">
	<table class="cadastro">
	<tr>
		<td><s:text name="usuario.codigoUsuario" /></td>
		<td><s:textfield name="codigoUsuario" maxlength="20" size="20" theme="simple"  /></td>
	</tr><tr>
		<td><s:text name="usuario.nomeUsuario" /></td>
		<td><s:textfield name="nomeUsuario" maxlength="50" size="50" theme="simple" /></td>
	</tr><tr>
		<td><s:text name="usuario.senhaUsuario" /></td>
		<td><input type="password" name="senhaUsuario" maxlength="50" size="50"/></td>
	</tr><tr>
		<td><s:text name="usuario.senhaUsuario2" /></td>
		<td><input type="password" name="senhaUsuario2" maxlength="50" size="50"/></td>
	</tr><tr>
		<td><s:text name="usuario.vendedor" /></td>
		<td colspan="4"><s:select name="vendedorSq" list="listaVendedores" listValue="nomeVendedor" listKey="vendedorSq" value="vendedores.vendedorSq" theme="simple" /></td>
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