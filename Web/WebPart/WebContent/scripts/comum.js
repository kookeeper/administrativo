$(document).ready(function() {

	$('input.pickerfield').datetimepicker({
		dateFormat: "dd/mm/yy"
	});
	$('input.timepickerfield').datetimepicker({
		dateFormat: "dd/mm/yy"
	});
/*
	$('input.pickerfield').datetime({
		userLang	: 'pt-BR',
		americanMode: false
	});
	$('input.timepickerfield').time({
		userLang	: 'pt-BR',
		americanMode: false
	});
*/
	$('.numericField').numeric();
	$('.colRight').css('text-align', 'right');

	$.validator.addMethod("validarRegistro", function(value, element, params){
		var result = ajaxValidarRegistro(element); // método ajax que será descrito a seguir
		
		if (result == '') {
			return true;
		} else {
			$.validator.messages.validarRegistro = result;
			return false;
		}
	});

});

function excluirFiltro() {
	$(this).parent().parent().remove();
	filtrarLista();
}

function filtrarLista() {
	var pagina = window.location.pathname,
	campo = $('select').find(':selected').attr('id'),
	valor = $('input#filtro').val(),
	url=pagina+'?filtro'+campo+'='+valor;
	
	if (valor == '') {
		window.location.href = pagina;
	} else {
		$('div.filtros').find('div.filtro').each(function(i, e){
			if ($(e).attr('value') != undefined)
				url += '&filtro' + $(e).attr('id') + '=' + $(e).attr('value');
		});
		window.location.href = url;
	}
};

function escondeCabecalho() {
	$(this).css('display', 'none');
};

function mostraCabecalho() {
	$(this).css('display', 'block');
};

function submit() {
	$(document).find('form').validate();
	$(document).find('form').submit();
};

function cancel() {
	window.location.href = 'listar' + $(document).data('tabela');
};

function mostraDiv(ordem) {
	ordem == 1 ? $('#aba01').fadeIn() : $('#aba01').fadeOut();
	ordem == 2 ? $('#aba02').fadeIn() : $('#aba02').fadeOut();
	ordem == 3 ? $('#aba03').fadeIn() : $('#aba03').fadeOut();
	ordem == 4 ? $('#aba04').fadeIn() : $('#aba04').fadeOut();
	ordem == 5 ? $('#aba05').fadeIn() : $('#aba05').fadeOut();
	$('#link1').removeClass('selecionado');
	$('#link2').removeClass('selecionado');
	$('#link3').removeClass('selecionado');
	$('#link4').removeClass('selecionado');
	$('#link5').removeClass('selecionado');
	$('#link'+ordem).addClass('selecionado');
};

function montaCabecalho() {
	$('div.pagina').bind('fadeIn', function() {
		$(this).fadeIn(400, escondeCabecalho());
	});
	$('div.pagina').bind('fadeOut', function() {
		$(this).fadeOut(400, mostraCabecalho());
	});
	$('#submit').bind('click', submit);
	$('#cancel').bind('click', cancel);

	$('li a').each(function(i, e) {
		var texto = $(e).html();

		$(e).html('');
		$(e).prepend('<div class="imagem"/>');
		$(e).find('div.imagem')
			.prepend('<div class="titulo"/>')
			.prepend('<img/>')
			.find('div.titulo')
				.append(texto);
	});

	$('div.imagem')
		.css('position', 'relative')
		.find('img')
			.height(30)
			.width(140)
			.css('position', 'absolute')
			.css('top', '3px;')
			.attr('src', contextPath + '/imagens/botao.png');

	$('div.imagem div.titulo')
		.css('position', 'relative')
		.css('top', '8px')
		.css('left', '10px')
		.css('width', '140px');

	montaRodapeAtalhos();
};

function montaRodapeAtalhos() {
	var $atalhos = $('div.atalhos');
	$atalhos.find('img').each(function(i, e) {
		$(e).bind("click", {botao: $(e).attr('id')}, clickAtalho);
	});
	$atalhos.append('<b><label id="titulo"></label></b>');
	$atalhos.append('<img class="fechar"/>');
	$atalhos.append('<iframe class="listaSimples" src=""></iframe>');
	$atalhos.find('img.fechar')
		.attr('src', contextPath + '/imagens/baixo.jpg')
		.attr('title', 'Esconder')
		.css('position', 'absolute')
		.css('right', '10px')
		.css('top', '10px')
		.css('cursor', 'pointer')
		.bind('click', function() {
			esconderListaSimples();
		});

	esconderListaSimples();
};

function montaFiltro(campo, valor) {
	if (!$('div.busca').find('div.filtros').length)
		$('div.busca').append('<div class="filtros"/>');
	
	if ((campo=='null') || valor=='')
		return;

	var input = $('div.filtros').find('#'+campo);
	if (!input.length)
		$('div.filtros').append('<div class="filtro" id="' + campo + '"/>');

	var divCampo = $('div.filtros').find('#'+campo);

	divCampo.attr('value', valor);
	divCampo.append('<label>'+$('div.busca option[id='+campo+']').html()+': \''+valor+'\'  <a/></label>');
	divCampo.find('a').bind('click', excluirFiltro);
	divCampo.find('a').append('<img/>');
	divCampo.find('a img').attr('src', '../imagens/excluir2.gif');
	if (divCampo.html()!=null) {
		divCampo.css('width', divCampo.html().length*2.5);
	}
};

function carregaImagemAtalho(id, idValue) {
	var $atalhos = $('div.atalhos');
	if (idValue==0) {
		esconderListaSimples();
	} else {
		$atalhos.find('img').each(function(i, e) {
			$(e).data('id', id);
			$(e).data('idValue', idValue);
		});
	}
}

function clickAtalho(event) {
	var $lista = $('iframe.listaSimples').data('lista');

	if ($lista==event.data.botao) {
		esconderListaSimples();
	} else {
		mostrarListaSimples(event);
	}
}

function esconderListaSimples() {
	var $frame = $('iframe.listaSimples'),
		$atalhos = $('div.atalhos'),
		$titulo = $atalhos.find('#titulo');
	
	$frame.slideUp();
	$frame.removeData('lista');
	
	$atalhos.removeClass('down').addClass('up');
	$atalhos.find('img.fechar').css('visibility', 'hidden');
	$titulo.css('visibility', 'hidden');
}

function mostrarListaSimples(event) {
	var $botao = $('#'+event.data.botao),
		$id = $botao.data('id'),
		$idValue = $botao.data('idValue'),
		$atalhos = $('div.atalhos'),
		$frame = $('iframe.listaSimples'),
		$titulo = $atalhos.find('#titulo');
	
	$frame.data({'lista': event.data.botao});
	$frame.slideDown();
	$frame.attr('src', 'listar' + event.data.botao + '?cabecalho=reduzido&filtro'+$id+'='+$idValue);
	$atalhos.removeClass('up').addClass('down');
	$atalhos.find('img.fechar').css('visibility', 'visible');
	$titulo.css('visibility', 'visible');
}

function ajaxValidarRegistro(element) {
	var result = $.ajax({
		type: "POST",
		url: "validarRegistro.action",
		data: "form=" + $('form').serialize(),
		async: false,
		global: false,
	}).responseText;
	return result;
}
