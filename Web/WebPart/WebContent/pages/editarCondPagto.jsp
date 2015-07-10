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
		carregaImagemAtalho('condPagto.condPagtoSq', <s:text name="condPagtoSq" />);
		montaCabecalho();
		$(document).data('tabela', 'CondPagto');

		$('form').validate({
			rules: {
				codigoCondPagto: {
					required: true
				},
				descricaoCondPagto: {
					required: true
				},
				parcelas: {
					required: true
				}
			}
		});
		$('#parcelas').bind('change', mostraParcelas);
		mostraParcelas();
		$('.colRight').css('text-align', 'right');
	});

	function mostraParcelas() {
		var parcelas = $('#parcelas').val();
		$('.listaParcelas').hide();
		for (var i = 0; i < 10; i++) {
			if (parcelas > i)
				$('.parcela0' + i).show();
			else
				$('.parcela0' + i).hide();
		}
		if (parcelas > 0)
			$('.listaParcelas').show();
	}
</script>
</head>
<body>

	<s:a id="submit" href="#"><img src="${pageContext.request.contextPath}/imagens/Salvar.png" title="Salvar"/></s:a>
	<s:a id="cancel" href="#"><img src="${pageContext.request.contextPath}/imagens/Cancelar.png" title="Cancelar"/></s:a>

<form action="salvarCondPagto">
	<s:hidden name="id"/>
	<div class="corpoCadastro">
	<table class="cadastro">
	<tr>
		<td><s:text name="condPagto.codigoCondPagto" /></td>
		<td colspan="3"><s:textfield name="codigoCondPagto" maxlength="20" size="20" theme="simple"  /></td>
	</tr><tr>
		<td><s:text name="condPagto.descricaoCondPagto" /></td>
		<td colspan="3"><s:textfield name="descricaoCondPagto" maxlength="50" size="50" theme="simple" /></td>
	</tr><tr>
		<td><s:text name="condPagto.parcelas" /></td>
		<td colspan="3"><s:textfield name="parcelas" maxlength="5" size="5" theme="simple" cssClass="numericField"/></td>
	</tr><tr><td colspan="4"><table class="listaParcelas"><tr>
	<th></th>
	<th>Vencimento</th><th>Percentual</th>
	</tr><tr class="parcela00">
		<td><s:text name="condPagto.d00" /></td>
		<td class="colRight"><s:textfield name="d00" maxlength="4" size="4" theme="simple" cssClass="numericField"/>dias</td>
		<td class="colRight"><s:textfield name="p00" maxlength="4" size="4" theme="simple" cssClass="numericField"/>%</td>
	</tr><tr class="parcela01">
		<td><s:text name="condPagto.d01" /></td>
		<td class="colRight"><s:textfield name="d01" maxlength="4" size="4" theme="simple" cssClass="numericField"/>dias</td>
		<td class="colRight"><s:textfield name="p01" maxlength="4" size="4" theme="simple" cssClass="numericField"/>%</td>
	</tr><tr class="parcela02">
		<td><s:text name="condPagto.d02" /></td>
		<td class="colRight"><s:textfield name="d02" maxlength="4" size="4" theme="simple" cssClass="numericField"/>dias</td>
		<td class="colRight"><s:textfield name="p02" maxlength="4" size="4" theme="simple" cssClass="numericField"/>%</td>
	</tr><tr class="parcela03">
		<td><s:text name="condPagto.d03" /></td>
		<td class="colRight"><s:textfield name="d03" maxlength="4" size="4" theme="simple" cssClass="numericField"/>dias</td>
		<td class="colRight"><s:textfield name="p03" maxlength="4" size="4" theme="simple" cssClass="numericField"/>%</td>
	</tr><tr class="parcela04">
		<td><s:text name="condPagto.d04" /></td>
		<td class="colRight"><s:textfield name="d04" maxlength="4" size="4" theme="simple" cssClass="numericField"/>dias</td>
		<td class="colRight"><s:textfield name="p04" maxlength="4" size="4" theme="simple" cssClass="numericField"/>%</td>
	</tr><tr class="parcela05">
		<td><s:text name="condPagto.d05" /></td>
		<td class="colRight"><s:textfield name="d05" maxlength="4" size="4" theme="simple" cssClass="numericField"/>dias</td>
		<td class="colRight"><s:textfield name="p05" maxlength="4" size="4" theme="simple" cssClass="numericField"/>%</td>
	</tr><tr class="parcela06">
		<td><s:text name="condPagto.d06" /></td>
		<td class="colRight"><s:textfield name="d06" maxlength="4" size="4" theme="simple" cssClass="numericField"/>dias</td>
		<td class="colRight"><s:textfield name="p06" maxlength="4" size="4" theme="simple" cssClass="numericField"/>%</td>
	</tr><tr class="parcela07">
		<td><s:text name="condPagto.d07" /></td>
		<td class="colRight"><s:textfield name="d07" maxlength="4" size="4" theme="simple" cssClass="numericField"/>dias</td>
		<td class="colRight"><s:textfield name="p07" maxlength="4" size="4" theme="simple" cssClass="numericField"/>%</td>
	</tr><tr class="parcela08">
		<td><s:text name="condPagto.d08" /></td>
		<td class="colRight"><s:textfield name="d08" maxlength="4" size="4" theme="simple" cssClass="numericField"/>dias</td>
		<td class="colRight"><s:textfield name="p08" maxlength="4" size="4" theme="simple" cssClass="numericField"/>%</td>
	</tr><tr class="parcela09">
		<td><s:text name="condPagto.d09" /></td>
		<td class="colRight"><s:textfield name="d09" maxlength="4" size="4" theme="simple" cssClass="numericField"/>dias</td>
		<td class="colRight"><s:textfield name="p09" maxlength="4" size="4" theme="simple" cssClass="numericField"/>%</td>
	</tr></table></td></tr>
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