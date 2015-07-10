package br.com.msystem.action;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.ResultPath;
import org.hibernate.Hibernate;

import br.com.msystem.bo.PedidosItensBo;
import br.com.msystem.bean.FreteTransp;
import br.com.msystem.exceptions.SystemException;
import br.com.msystem.vo.Pedidos;
import br.com.msystem.vo.PedidosItens;

@Namespace("/pages/pedidos")
@ResultPath(value = "/")
public class PedidosAction extends AbstractAction<Pedidos> {

	/**
	 * 
	 */
	private static final long serialVersionUID = -7121460813317569809L;
	
	public List<FreteTransp> listaFreteTransp = FreteTransp.getListaFreteTransp();

	private List<PedidosItens> listaPedidoItem = new ArrayList<PedidosItens>();

	public List<PedidosItens> getListaPedidoItem() throws SystemException {
    	listaPedidoItem = PedidosItensBo.getInstance().listarItens(2);
    	return listaPedidoItem;    	
    }

    public void setListaPedidoItem(List<PedidosItens> listaPedidos) {this.listaPedidoItem = listaPedidos;}

	
	public PedidosAction() {
		super();
		setTituloActionListar(getText("pedido.tituloLista"));
		addColuna(getText("pedido.numeroPedido"), "numeroPedido");
		addColuna(getText("pedido.dataPedido"), "dataPedido");
	}
	
	@Override
	public void prepareIncluir() throws SystemException {
		super.prepareIncluir();
		getRegistro().setDataPedido(new Date());
	}
	
	@Override
	public void prepareSalvar() throws SystemException {
		super.prepareSalvar();
		Hibernate.initialize(getRegistro().getPedidosItenses());
	}

	@Override
	@Action(value = "salvar*", results = {
			@Result(name = "error", location = "/errorPage.jsp"),
			@Result(name = "input", location = "../editar{1}.jsp"),
			@Result(name = "success", type = "redirectAction", location = "listar{1}")
			})
	public String salvar() throws SystemException {
		
		for (PedidosItens item: getListaPedidoItem()) {
			if (item.getPedidoItemSq() == 0) { // item novo
				getRegistro().getPedidosItenses().add(item);
			} else { // item alterado
				PedidosItens itemBanco = null;
				for (Object item2: getRegistro().getPedidosItenses().toArray()) {
					if (((PedidosItens)item2).getPedidoItemSq() == item.getPedidoItemSq()) {
						itemBanco = (PedidosItens)item2;
						break;
					}
				}
				
				if (itemBanco == null) {
					throw new SystemException("pedidoitem.nao.encontrado");
				}
				
				itemBanco.setAliqIcmsItem(item.getAliqIcmsItem());
				itemBanco.setAliqIpiItem(item.getAliqIpiItem());
				itemBanco.setBaseIcmsSubstItem(item.getBaseIcmsSubstItem());
				itemBanco.setNrSerieItem(item.getNrSerieItem());
				itemBanco.setNumeroEstoque(item.getNumeroEstoque());
				itemBanco.setPctDesc(item.getPctDesc());
				itemBanco.setPctJuros(item.getPctJuros());
				itemBanco.setPesoBruto(item.getPesoBruto());
				itemBanco.setPesoLiquido(item.getPesoLiquido());
				itemBanco.setPrecoUnit(item.getPrecoUnit());
				itemBanco.setProdutos(item.getProdutos());
				itemBanco.setQtdePedidoItem(item.getQtdePedidoItem());
				itemBanco.setQtdeProdutoRetorno(item.getQtdeProdutoRetorno());
				itemBanco.setVlrDesc(item.getVlrDesc());
				itemBanco.setVlrIcmsItem(item.getVlrIcmsItem());
				itemBanco.setVlrIcmsSubstItem(item.getVlrIcmsSubstItem());
				itemBanco.setVlrIpiItem(item.getVlrIpiItem());
				itemBanco.setVlrJuros(item.getVlrJuros());
				itemBanco.setVlrTotalItem(item.getVlrTotalItem());
			}
		}
		
		// item apagado
		boolean eof = false;
		while (!eof) {
			for (PedidosItens item: getRegistro().getPedidosItenses()) {
				boolean apaga = true;
				for (PedidosItens item2: getListaPedidoItem()) {
					if (item.getPedidoItemSq() == item2.getPedidoItemSq()) {
						apaga  = false;
						break;
					}
				}
				if (apaga) {
					getRegistro().getPedidosItenses().remove(item);
					break;
				}
			}
			eof = (getRegistro().getPedidosItenses().size() == getListaPedidoItem().size());
		}

		return super.salvar();
	}

	@Action(value = "listaPedidoItem", results = { @Result(name="input", type = "json") })
	public String listaPedidoItem() throws SystemException {
		return SUCCESS;
	}

}
