<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="http://displaytag.sf.net" prefix="display" %>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<html>
<head>
	<title><s:property value="titulo"/></title>
	<script type="text/javascript" src="<s:url value="/scripts/jquery-1.9.1.js"/>"></script>
	<script type="text/javascript" src="<s:url value="/scripts/jQueryFiles.js"/>"></script>
	<script type="text/javascript">
		var $cab = '<%=request.getParameter("cabecalho")%>';

		$(document).ready(function() {

			if ($cab!='reduzido') {
				$('div.busca').css('visibility', 'visible'); /*.detach();*/
				$('div.listaRegistros').css('top', '55px');
			}
			
			$('a.procurar').bind('click', filtrarLista);

			$('#filtro').keyup(function(e) {
				if(e.keyCode == 13) {
					filtrarLista();
				}
			});

			var $tituloLista = $('#titulo', window.parent.document);
			if ($tituloLista.length) {
				$tituloLista.html('<%=request.getAttribute("registro.tituloTabela")%>');
			}

<%
			java.util.Enumeration<String> e = request.getParameterNames();
			while (e.hasMoreElements()) {
				String parametro = e.nextElement();
				if (parametro.startsWith("filtro")) {
					out.println("montaFiltro('"+parametro.substring(6)+"','"+request.getParameter(parametro)+"');");
				}
			}
%>
		});
	</script>
</head>

<body>
<div class="busca">
	<b style="font-size: medium;"><s:text name="tituloActionListar"/>&nbsp;&nbsp;&nbsp;-&nbsp;&nbsp;&nbsp;</b>
	Filtrar a lista pela coluna
	<select>
		<s:iterator value="colunas">
			<option id="<%=request.getAttribute("value").toString()%>"><%=request.getAttribute("key").toString()%></option>
		</s:iterator>
	</select>
	contendo
	<s:textfield name="filtro"></s:textfield>
	<a class="procurar" href="#">
		<img alt="Procurar" src="${pageContext.request.contextPath}/imagens/find.gif" border="0" height="25" width="25" title="Procurar"/>
	</a>
	<a class="novo" href="incluir<%=request.getAttribute("clazz")%>">
		<img alt="Incluir" src="${pageContext.request.contextPath}/imagens/incluir.png" border="0" height="25" width="25" title="Incluir"/>
	</a>
</div>

<div class="listaRegistros">
	<display:table sort="list" requestURI="#" name="registros" decorator="br.com.msystem.decorator.Wrapper" class="listaRegistros" id="registro">
		<s:iterator value="colunas">
			<display:column 
				title="<%=request.getAttribute("key").toString()%>" 
				property="<%=request.getAttribute("value").toString()%>"
				sortable="true" 
				/>
		</s:iterator>
		<display:column title="" property="botoes" class="link"/>
	</display:table>
</div>
</body>
</html>