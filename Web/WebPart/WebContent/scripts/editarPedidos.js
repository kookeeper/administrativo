	$(document).ready(function() {
		carregaImagemAtalho('pedidos.pedidoSq', document.getElementById("id"));
		montaCabecalho();
		mostraDiv(1);
		$(document).data('tabela', 'Pedidos');

		$('#table_itens').dataTable( {
	        "sAjaxSource": "listaPedidoItem",
	        "bProcessing": true,
            "sPaginationType": "full_numbers",
            "bJQueryUI": true,
	        "aoColumns": [
	            { "mData": "codigoProduto" },
	            { "mData": "descricaoProduto" },
	            { "mData": "qtdePedidoItem" },
	            { "mData": "precoUnit" },
	            { "mData": "vlrTotalItem" }
	        ]
	    } );
		
		$('form').validate({
			rules:{
				numeroPedido:{
						validarRegistro: true
				}
			},
			onfocusout: false,
	       	onkeyup: false,
	       	onclick: false,
	       	errorPlacement: function(error, element) {
	       	    $('#errors').after(error);
	       	}
		});
		jq162( "#pedidoItem_descricaoProduto" ).combogrid({
			  colModel: [{'columnName':'codigoProduto','width':'45','label':'Código'}, {'columnName':'descricaoProduto','width':'45','label':'Descrição'}],
			  url: 'listarProdutos',
			  select: function( event, ui ) {
				  $( "#pedidoItem_produtoSq" ).val( ui.item.produtoSq);
				  $( "#pedidoItem_descricaoProduto" ).val( ui.item.descricaoProduto );
				  return false;
			  }
		  });
		jq162(".combogrid").css("width", "600px");
	});
	
	function editarItem(indice) {
		var div = $('div#editarItem');
		var form = $('form');

		div.find('#pedidoItem_produtoSq').val(form.find('#listaPedidoItem\\[' + indice + '\\]\\.produtos\\.produtoSq').val());
		div.find('#pedidoItem_descricaoProduto').val(form.find('#listaPedidoItem\\[' + indice + '\\]\\.produtos\\.descricaoProduto').val());
		div.find('#pedidoItem_pesoBruto').val(form.find('#listaPedidoItem\\[' + indice + '\\]\\.pesoBruto').val());
		div.find('#pedidoItem_pesoLiquido').val(form.find('#listaPedidoItem\\[' + indice + '\\]\\.pesoLiquido').val());
		div.find('#pedidoItem_pctJuros').val(form.find('#listaPedidoItem\\[' + indice + '\\]\\.pctJuros').val());
		div.find('#pedidoItem_pctDesc').val(form.find('#listaPedidoItem\\[' + indice + '\\]\\.pctDesc').val());
		div.find('#pedidoItem_baseIcmsSubstItem').val(form.find('#listaPedidoItem\\[' + indice + '\\]\\.baseIcmsSubstItem').val());
		div.find('#pedidoItem_vlrJuros').val(form.find('#listaPedidoItem\\[' + indice + '\\]\\.vlrJuros').val());
		div.find('#pedidoItem_vlrDesc').val(form.find('#listaPedidoItem\\[' + indice + '\\]\\.vlrDesc').val());
		div.find('#pedidoItem_vlrIcmsItem').val(form.find('#listaPedidoItem\\[' + indice + '\\]\\.vlrIcmsItem').val());
		div.find('#pedidoItem_vlrIcmsSubstItem').val(form.find('#listaPedidoItem\\[' + indice + '\\]\\.vlrIcmsSubstItem').val());
		div.find('#pedidoItem_vlrIpiItem').val(form.find('#listaPedidoItem\\[' + indice + '\\]\\.vlrIpiItem').val());
		div.find('#pedidoItem_vlrTotalItem').val(form.find('#listaPedidoItem\\[' + indice + '\\]\\.vlrTotalItem').val());
		div.find('#pedidoItem_aliqIcmsItem').val(form.find('#listaPedidoItem\\[' + indice + '\\]\\.aliqIcmsItem').val());
		div.find('#pedidoItem_aliqIpiItem').val(form.find('#listaPedidoItem\\[' + indice + '\\]\\.aliqIpiItem').val());
		div.find('#pedidoItem_nrSerieItem').val(form.find('#listaPedidoItem\\[' + indice + '\\]\\.nrSerieItem').val());
		div.find('#pedidoItem_numeroEstoque').val(form.find('#listaPedidoItem\\[' + indice + '\\]\\.numeroEstoque').val());
		div.find('#pedidoItem_precoUnit').val(form.find('#listaPedidoItem\\[' + indice + '\\]\\.precoUnit').val());
		div.find('#pedidoItem_qtdePedidoItem').val(form.find('#listaPedidoItem\\[' + indice + '\\]\\.qtdePedidoItem').val());
		div.find('#pedidoItem_qtdeProdutoRetorno').val(form.find('#listaPedidoItem\\[' + indice + '\\]\\.qtdeProdutoRetorno').val());

		div.find('input#Salvar').click(function () {
			return salvarItem(indice);
		});

		div.find('input#cancel').click(function () {
			return cancelarItem();
		});

	    var width = $(document).width();

		$.blockUI({
			message: div,
			centerY: false,
			baseZ: 2,
			css: {
				left: width/2 - (div.width() / 2),  // half width - half element width
	            top: '50px',
	            width: '800px'
			}
			});

		return false;
	}
	
	function salvarItem(indice) {
		var div = $('div#editarItem');
		var form = $('form');

		form.find('#listaPedidoItem\\[' + indice + '\\]\\.produtos\\.produtoSq').val(div.find('#pedidoItem_produtoSq').val());
		form.find('#listaPedidoItem\\[' + indice + '\\]\\.produtos\\.descricaoProduto').val(div.find('#pedidoItem_descricaoProduto').val());
		form.find('#listaPedidoItem\\[' + indice + '\\]\\.pesoBruto').val(div.find('#pedidoItem_pesoBruto').val());
		form.find('#listaPedidoItem\\[' + indice + '\\]\\.pesoLiquido').val(div.find('#pedidoItem_pesoLiquido').val());
		form.find('#listaPedidoItem\\[' + indice + '\\]\\.pctJuros').val(div.find('#pedidoItem_pctJuros').val());
		form.find('#listaPedidoItem\\[' + indice + '\\]\\.pctDesc').val(div.find('#pedidoItem_pctDesc').val());
		form.find('#listaPedidoItem\\[' + indice + '\\]\\.baseIcmsSubstItem').val(div.find('#pedidoItem_baseIcmsSubstItem').val());
		form.find('#listaPedidoItem\\[' + indice + '\\]\\.vlrJuros').val(div.find('#pedidoItem_vlrJuros').val());
		form.find('#listaPedidoItem\\[' + indice + '\\]\\.vlrDesc').val(div.find('#pedidoItem_vlrDesc').val());
		form.find('#listaPedidoItem\\[' + indice + '\\]\\.vlrIcmsItem').val(div.find('#pedidoItem_vlrIcmsItem').val());
		form.find('#listaPedidoItem\\[' + indice + '\\]\\.vlrIcmsSubstItem').val(div.find('#pedidoItem_vlrIcmsSubstItem').val());
		form.find('#listaPedidoItem\\[' + indice + '\\]\\.vlrIpiItem').val(div.find('#pedidoItem_vlrIpiItem').val());
		form.find('#listaPedidoItem\\[' + indice + '\\]\\.vlrTotalItem').val(div.find('#pedidoItem_vlrTotalItem').val());
		form.find('#listaPedidoItem\\[' + indice + '\\]\\.aliqIcmsItem').val(div.find('#pedidoItem_aliqIcmsItem').val());
		form.find('#listaPedidoItem\\[' + indice + '\\]\\.aliqIpiItem').val(div.find('#pedidoItem_aliqIpiItem').val());
		form.find('#listaPedidoItem\\[' + indice + '\\]\\.nrSerieItem').val(div.find('#pedidoItem_nrSerieItem').val());
		form.find('#listaPedidoItem\\[' + indice + '\\]\\.numeroEstoque').val(div.find('#pedidoItem_numeroEstoque').val());
		form.find('#listaPedidoItem\\[' + indice + '\\]\\.precoUnit').val(div.find('#pedidoItem_precoUnit').val());
		form.find('#listaPedidoItem\\[' + indice + '\\]\\.qtdePedidoItem').val(div.find('#pedidoItem_qtdePedidoItem').val());
		form.find('#listaPedidoItem\\[' + indice + '\\]\\.qtdeProdutoRetorno').val(div.find('#pedidoItem_qtdeProdutoRetorno').val());

		$.unblockUI();
		return false;
	}
	
	function cancelarItem() {
		$.unblockUI();
	}
	
	function excluirItem(indice) {
		return false;
	}
