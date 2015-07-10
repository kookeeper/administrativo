package br.com.msystem.bo;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import br.com.msystem.exceptions.SystemException;
import br.com.msystem.util.TipoNfiscal;
import br.com.msystem.vo.CondPagto;
import br.com.msystem.vo.Duplicatas;
import br.com.msystem.vo.Empresas;
import br.com.msystem.vo.Nfiscais;

public class DuplicatasBo extends GenericBo<Duplicatas> {

	private DuplicatasBo(Class<Duplicatas> argClass) throws SystemException {
		super(argClass);
	}

	private static DuplicatasBo instance;

	public static DuplicatasBo getInstance() throws SystemException {
		if (instance == null)
			instance = new DuplicatasBo(Duplicatas.class);
		return instance;
	}

	public void criarDuplicatas(Nfiscais nfiscal, int numeroNfe) throws SystemException {
		Integer numeroDuplicata;
		if ((nfiscal.getNumeroNfe() != null) && (nfiscal.getNumeroNfe() != 0)) {
			numeroDuplicata = nfiscal.getNumeroNfe();
		} else if (numeroNfe != 0) {
			numeroDuplicata = numeroNfe;
		} else {
			numeroDuplicata = nfiscal.getNumeroNfiscal();
		}
		
		TipoNfiscal tipoNfiscal = TipoNfiscal.fromInteger(nfiscal.getNaturezasByNaturezaSq().getTipoNfiscal());
		
		Duplicatas exemplo = new Duplicatas();
		exemplo.setNfiscais(nfiscal);
		List<Duplicatas> listaDuplicatas = listar(exemplo, false, null);
		
		if (listaDuplicatas.size() == 0) {
			atualizarCondicaoPagamento(nfiscal.getNaturezasByNaturezaSq().getTipoNfiscal(), nfiscal.getCondPagto(), 
					numeroDuplicata, nfiscal.getVlrTotal().longValue(), nfiscal.getDtemissaoNfiscal(), nfiscal.getDiasDemonstracao());
			
			if (tipoNfiscal.equals(TipoNfiscal.Vendas)) {
				for (Duplicatas item: listaDuplicatas) {
					salvar(item);
				}
			}
		}
	}
	
	public List<Duplicatas> atualizarCondicaoPagamento(int tipoNfiscal, CondPagto condPagto, int nfiscal, long valorTotal, Date dataEmissao, int diasDemonstracao) throws SystemException {
		List<Duplicatas> listaDuplicatas = new ArrayList<Duplicatas>();
		CondPagtoBo condPagtoBo = (CondPagtoBo) GenericBo.getInstance(CondPagto.class);
		Empresas empresa = GenericBo.getInstance(Empresas.class).buscaPorId(1);
		
		if (tipoNfiscal < 0)
			return listaDuplicatas;
		
		if (condPagto.getParcelas() == 0)
			return listaDuplicatas;
		

		if (TipoNfiscal.fromInteger(tipoNfiscal).equals(TipoNfiscal.Demonstracao)) {
			Calendar cal = Calendar.getInstance();
			cal.setTime(dataEmissao);
			cal.add(Calendar.DAY_OF_MONTH, diasDemonstracao);
			
			Duplicatas duplicata  = new Duplicatas();
			duplicata.setNumeroDuplicata(nfiscal);
			duplicata.setValorDuplicata(new BigDecimal(valorTotal));
			duplicata.setDtemissaoDuplicata(cal.getTime());
			listaDuplicatas.add(duplicata);
		} else {
			for (int i=1; i < condPagto.getParcelas(); i++) {
				Duplicatas duplicata = new Duplicatas();
				duplicata.setNumeroDuplicata(nfiscal);
				if (condPagto.getP00() == 0) { // significa que vai dividir igualmente e arredondar no final
					if (i < condPagto.getParcelas()) {
						duplicata.setValorDuplicata(new BigDecimal(valorTotal / condPagto.getParcelas()));
					} else {
						duplicata.setValorDuplicata(new BigDecimal(valorTotal - (listaDuplicatas.get(i-1).getValorDuplicata().longValue() * (condPagto.getParcelas() - 1))));
					}
				} else {
					duplicata.setValorDuplicata(new BigDecimal(valorTotal * condPagtoBo.buscarPercentual(condPagto, i)));
				}
				
				Calendar cal = Calendar.getInstance();
				cal.setTime(dataEmissao);
				cal.add(Calendar.DAY_OF_MONTH, condPagtoBo.buscarDias(condPagto, i));
				
				duplicata.setDtemissaoDuplicata(cal.getTime());
				duplicata.setJurosDuplicata(new BigDecimal(duplicata.getValorDuplicata().longValue() * empresa.getJurosReceber().longValue() / 100));
				listaDuplicatas.add(duplicata);
			}
		}
		
		return listaDuplicatas;
		
			
	}
}
