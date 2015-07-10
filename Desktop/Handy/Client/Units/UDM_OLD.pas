unit UDM_OLD;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, IBCustomDataSet, IBTable, IBDatabase, IBQuery, IBStoredProc,
  IdComponent, IdTCPConnection, IdTCPClient, IdMessageClient, IdSMTP,
  IdBaseComponent, IdMessage, IBUpdateSQL;

type
  TDM_OLD = class(TDataModule)
    DBConn: TIBDatabase;
    IBTransaction1: TIBTransaction;
    dsPedidos: TDataSource;
    dsListaPedidos: TDataSource;
    ibCondPagto: TIBTable;
    ibNaturezas: TIBTable;
    ibProdutos: TIBTable;
    ibNbm: TIBTable;
    ibPedidos: TIBTable;
    ibPedidosItens: TIBTable;
    ibUsuarios: TIBTable;
    ibClientes: TIBTable;
    ibCondPagtoCOND_PAGTO_SQ: TIntegerField;
    ibCondPagtoCODIGO_COND_PAGTO: TIntegerField;
    ibCondPagtoDESCRICAO_COND_PAGTO: TIBStringField;
    ibProdutosPRODUTO_SQ: TIntegerField;
    ibProdutosCODIGO_PRODUTO: TIBStringField;
    ibProdutosDESCRICAO_PRODUTO: TIBStringField;
    ibProdutosQTDE_PRODUTO: TIntegerField;
    ibProdutosNBM_SQ: TIntegerField;
    ibNbmNBM_SQ: TIntegerField;
    ibNbmCODIGO_NBM: TIBStringField;
    ibPedidosPEDIDO_SQ: TIntegerField;
    ibPedidosCLIENTE_SQ: TIntegerField;
    ibPedidosDATA_PEDIDO: TDateTimeField;
    ibPedidosCOND_PAGTO_SQ: TIntegerField;
    ibPedidosNATUREZA_SQ: TIntegerField;
    ibPedidosCOTACAO_DOLAR: TIBBCDField;
    ibPedidosItensPEDIDO_ITEM_SQ: TIntegerField;
    ibPedidosItensPEDIDO_SQ: TIntegerField;
    ibPedidosItensPRODUTO_SQ: TIntegerField;
    ibPedidosItensQTDE_PEDIDO_ITEM: TIntegerField;
    ibUsuariosUSUARIO_SQ: TIntegerField;
    ibUsuariosCODIGO_USUARIO: TIBStringField;
    ibUsuariosNOME_USUARIO: TIBStringField;
    ibUsuariosNIVEL_USUARIO: TIntegerField;
    ibUsuariosSENHA_USUARIO: TIBStringField;
    ibListaCondPagto: TIBQuery;
    ibListaNaturezas: TIBQuery;
    ibListaProdutos: TIBQuery;
    ibListaNBM: TIBQuery;
    ibListaPedidos: TIBQuery;
    ibListaPedidosItens: TIBQuery;
    ibListaUsuarios: TIBQuery;
    ibListaClientes: TIBQuery;
    ibListaCondPagtoCOND_PAGTO_SQ: TIntegerField;
    ibListaCondPagtoCODIGO_COND_PAGTO: TIntegerField;
    ibListaCondPagtoDESCRICAO_COND_PAGTO: TIBStringField;
    ibListaProdutosPRODUTO_SQ: TIntegerField;
    ibListaProdutosCODIGO_PRODUTO: TIBStringField;
    ibListaProdutosDESCRICAO_PRODUTO: TIBStringField;
    ibListaProdutosQTDE_PRODUTO: TIntegerField;
    ibListaProdutosNBM_SQ: TIntegerField;
    ibListaUsuariosUSUARIO_SQ: TIntegerField;
    ibListaUsuariosCODIGO_USUARIO: TIBStringField;
    ibListaUsuariosNOME_USUARIO: TIBStringField;
    ibListaUsuariosNIVEL_USUARIO: TIntegerField;
    ibListaUsuariosSENHA_USUARIO: TIBStringField;
    ibPedidosCODIGO_CLIENTE: TStringField;
    ibPedidosNOME_CLIENTE: TStringField;
    ibPedidosCODIGO_COND_PAGTO: TIntegerField;
    ibPedidosDESCRICAO_COND_PAGTO: TStringField;
    ibPedidosCODIGO_NATUREZA: TIntegerField;
    ibProdutosCODIGO_NBM: TStringField;
    ibListaProdutosCODIGO_NBM: TStringField;
    ibPedidosItensCODIGO_PRODUTO: TStringField;
    ibPedidosItensDESCRICAO_PRODUTO: TStringField;
    ibProdutosMODELO_PRODUTO: TIBStringField;
    ibProdutosUN_PRODUTO: TIBStringField;
    ibProdutosMARCA_PRODUTO: TIBStringField;
    ibProdutosPRECO_UNIT: TIBBCDField;
    ibListaProdutosMODELO_PRODUTO: TIBStringField;
    ibListaProdutosUN_PRODUTO: TIBStringField;
    ibListaProdutosMARCA_PRODUTO: TIBStringField;
    ibListaProdutosPRECO_UNIT: TIBBCDField;
    ibCondPagtoPARCELAS: TIntegerField;
    ibListaCondPagtoPARCELAS: TIntegerField;
    ibListaCondPagtoD00: TIntegerField;
    ibListaCondPagtoD01: TIntegerField;
    ibListaCondPagtoD02: TIntegerField;
    ibListaCondPagtoD03: TIntegerField;
    ibListaCondPagtoD04: TIntegerField;
    ibListaCondPagtoD05: TIntegerField;
    ibListaCondPagtoD06: TIntegerField;
    ibListaCondPagtoD07: TIntegerField;
    ibListaCondPagtoD08: TIntegerField;
    ibListaCondPagtoD09: TIntegerField;
    ibCondPagtoD00: TIntegerField;
    ibCondPagtoD01: TIntegerField;
    ibCondPagtoD02: TIntegerField;
    ibCondPagtoD03: TIntegerField;
    ibCondPagtoD04: TIntegerField;
    ibCondPagtoD05: TIntegerField;
    ibCondPagtoD06: TIntegerField;
    ibCondPagtoD07: TIntegerField;
    ibCondPagtoD08: TIntegerField;
    ibCondPagtoD09: TIntegerField;
    ibPedidosOBSERVACAO: TBlobField;
    ibClientesCLIENTE_SQ: TIntegerField;
    ibClientesCODIGO_CLIENTE: TIBStringField;
    ibClientesNOME_CLIENTE: TIBStringField;
    ibClientesINSCR_ESTADUAL: TIBStringField;
    ibClientesENDERECO: TIBStringField;
    ibClientesNUMERO: TIBStringField;
    ibClientesBAIRRO: TIBStringField;
    ibClientesCIDADE: TIBStringField;
    ibClientesESTADO: TIBStringField;
    ibClientesCEP: TIBStringField;
    ibClientesDDD_FONE1: TIBStringField;
    ibClientesNUMERO_FONE1: TIBStringField;
    ibClientesCOMPL_FONE1: TIBStringField;
    ibClientesDDD_FONE2: TIBStringField;
    ibClientesNUMERO_FONE2: TIBStringField;
    ibClientesCOMPL_FONE2: TIBStringField;
    ibClientesDDD_FONE3: TIBStringField;
    ibClientesNUMERO_FONE3: TIBStringField;
    ibClientesCOMPL_FONE3: TIBStringField;
    ibClientesDDD_CELULAR: TIBStringField;
    ibClientesNUMERO_CELULAR: TIBStringField;
    ibClientesCOMPL_CELULAR: TIBStringField;
    ibClientesDDD_FAX: TIBStringField;
    ibClientesNUMERO_FAX: TIBStringField;
    ibClientesCOMPL_FAX: TIBStringField;
    ibClientesE_MAIL: TIBStringField;
    ibClientesWEB_SITE: TIBStringField;
    ibClientesCONTATO: TIBStringField;
    ibClientesPAIS: TIBStringField;
    ibListaClientesCLIENTE_SQ: TIntegerField;
    ibListaClientesCODIGO_CLIENTE: TIBStringField;
    ibListaClientesNOME_CLIENTE: TIBStringField;
    ibListaClientesINSCR_ESTADUAL: TIBStringField;
    ibListaClientesENDERECO: TIBStringField;
    ibListaClientesNUMERO: TIBStringField;
    ibListaClientesBAIRRO: TIBStringField;
    ibListaClientesCIDADE: TIBStringField;
    ibListaClientesESTADO: TIBStringField;
    ibListaClientesCEP: TIBStringField;
    ibListaClientesDDD_FONE1: TIBStringField;
    ibListaClientesNUMERO_FONE1: TIBStringField;
    ibListaClientesCOMPL_FONE1: TIBStringField;
    ibListaClientesDDD_FONE2: TIBStringField;
    ibListaClientesNUMERO_FONE2: TIBStringField;
    ibListaClientesCOMPL_FONE2: TIBStringField;
    ibListaClientesDDD_FONE3: TIBStringField;
    ibListaClientesNUMERO_FONE3: TIBStringField;
    ibListaClientesCOMPL_FONE3: TIBStringField;
    ibListaClientesDDD_CELULAR: TIBStringField;
    ibListaClientesNUMERO_CELULAR: TIBStringField;
    ibListaClientesCOMPL_CELULAR: TIBStringField;
    ibListaClientesDDD_FAX: TIBStringField;
    ibListaClientesNUMERO_FAX: TIBStringField;
    ibListaClientesCOMPL_FAX: TIBStringField;
    ibListaClientesE_MAIL: TIBStringField;
    ibListaClientesWEB_SITE: TIBStringField;
    ibListaClientesCONTATO: TIBStringField;
    ibListaClientesPAIS: TIBStringField;
    ibListaClientesOBSERVACAO: TBlobField;
    ibPedidosTRANSPORTADORA_SQ: TIntegerField;
    ibPedidosVLR_FRETE: TIBBCDField;
    ibTransportadoras: TIBTable;
    ibTransportadorasTRANSPORTADORA_SQ: TIntegerField;
    ibTransportadorasCODIGO_TRANSPORTADORA: TIBStringField;
    ibTransportadorasNOME_TRANSPORTADORA: TIBStringField;
    ibTransportadorasENDERECO_TRANSPORTADORA: TIBStringField;
    ibTransportadorasMUNICIPIO_TRANSPORTADORA: TIBStringField;
    ibTransportadorasESTADO_TRANSPORTADORA: TIBStringField;
    ibTransportadorasINSCR_ESTADUAL: TIBStringField;
    ibListaTransportadoras: TIBQuery;
    ibListaTransportadorasTRANSPORTADORA_SQ: TIntegerField;
    ibListaTransportadorasCODIGO_TRANSPORTADORA: TIBStringField;
    ibListaTransportadorasNOME_TRANSPORTADORA: TIBStringField;
    ibListaTransportadorasENDERECO_TRANSPORTADORA: TIBStringField;
    ibListaTransportadorasMUNICIPIO_TRANSPORTADORA: TIBStringField;
    ibListaTransportadorasESTADO_TRANSPORTADORA: TIBStringField;
    ibListaTransportadorasINSCR_ESTADUAL: TIBStringField;
    ibPedidosNOME_TRANSPORTADORA: TStringField;
    ibEmpresas: TIBTable;
    ibEmpresasCODIGO_EMPRESA: TIBStringField;
    ibEmpresasNOME_EMPRESA: TIBStringField;
    ibEmpresasACESSOS: TIntegerField;
    ibEmpresasSENHA: TIBStringField;
    ibClientesCOMPL_ENDERECO: TIBStringField;
    ibClientesOBSERVACAO: TBlobField;
    ibListaClientesCOMPL_ENDERECO: TIBStringField;
    ibImprPed: TIBQuery;
    ibImprPedItem: TIBQuery;
    ibNfiscais: TIBTable;
    ibNfiscaisItens: TIBTable;
    ibNfiscaisCODIGO_CLIENTE: TStringField;
    ibNfiscaisNOME_CLIENTE: TStringField;
    ibNfiscaisCODIGO_COND_PAGTO: TIntegerField;
    ibNfiscaisDESCRICAO_COND_PAGTO: TStringField;
    ibNfiscaisCODIGO_NATUREZA: TIntegerField;
    ibNfiscaisNOME_TRANSPORTADORA: TStringField;
    ibNfiscaisNBM2: TStringField;
    ibNfiscaisNBM7: TStringField;
    ibNfiscaisNBM6: TStringField;
    ibNfiscaisNBM5: TStringField;
    ibNfiscaisNBM4: TStringField;
    ibNfiscaisNBM3: TStringField;
    ibNfiscaisNBM1: TStringField;
    ibEmpresasNUMERO_NFISCAL: TIntegerField;
    ibPedidosNFISCAL_SQ: TIntegerField;
    ibPedidosFRETE_TRANSP: TIBStringField;
    ibPedidosItensPRECO_UNIT: TIBBCDField;
    ibPedidosItensVLR_DESC: TIBBCDField;
    ibPedidosItensPCT_DESC: TIBBCDField;
    ibListaProdutosALIQ_ICMS: TFloatField;
    ibListaProdutosALIQ_IPI: TFloatField;
    ibListaNBMNBM_SQ: TIntegerField;
    ibListaNBMCODIGO_NBM: TIBStringField;
    ibPedidosItensALIQ_ICMS_ITEM: TIBBCDField;
    ibPedidosItensALIQ_IPI_ITEM: TIBBCDField;
    ibPedidosItensVLR_ICMS_ITEM: TIBBCDField;
    ibPedidosItensVLR_IPI_ITEM: TIBBCDField;
    ibNfiscaisItensNFISCAL_ITEM_SQ: TIntegerField;
    ibNfiscaisItensNFISCAL_SQ: TIntegerField;
    ibNfiscaisItensITEM: TIntegerField;
    ibNfiscaisItensPRODUTO_SQ: TIntegerField;
    ibNfiscaisItensCLASS_FISCAL: TIBStringField;
    ibNfiscaisItensSTRIBUT: TIntegerField;
    ibNfiscaisItensQTDE_ITEM: TIntegerField;
    ibNfiscaisItensVLR_UNIT_ITEM: TIBBCDField;
    ibNfiscaisItensVLR_TOTAL_ITEM: TIBBCDField;
    ibNfiscaisItensALIQ_ICMS_ITEM: TIBBCDField;
    ibNfiscaisItensALIQ_IPI_ITEM: TIBBCDField;
    ibNfiscaisItensVLR_ICMS_ITEM: TIBBCDField;
    ibNfiscaisItensVLR_IPI_ITEM: TIBBCDField;
    ibListaNfiscais: TIBQuery;
    ibNfiscaisItensCODIGO_PRODUTO: TStringField;
    ibNfiscaisItensDESCRICAO_PRODUTO: TStringField;
    dsNfiscais: TDataSource;
    ibPedidosItensVLR_TOTAL_ITEM: TIBBCDField;
    ibPedidosVLR_DESC: TIBBCDField;
    ibPedidosPCT_DESC: TIBBCDField;
    ibPedidosVLR_ICMS: TIBBCDField;
    ibPedidosVLR_IPI: TIBBCDField;
    ibPedidosVLR_PRODUTOS: TIBBCDField;
    ibEmpresasESTADO: TIBStringField;
    ibPedidosBASE_ICMS: TIBBCDField;
    ibPedidosDESCRICAO_NATUREZA: TStringField;
    ibNfiscaisNFISCAL_SQ: TIntegerField;
    ibNfiscaisNUMERO_NFISCAL: TIntegerField;
    ibNfiscaisDTEMISSAO_NFISCAL: TDateTimeField;
    ibNfiscaisDTSAIDA_NFISCAL: TDateTimeField;
    ibNfiscaisPEDIDO_SQ: TIntegerField;
    ibNfiscaisCLIENTE_SQ: TIntegerField;
    ibNfiscaisCOND_PAGTO_SQ: TIntegerField;
    ibNfiscaisNATUREZA_SQ: TIntegerField;
    ibNfiscaisTRANSPORTADORA_SQ: TIntegerField;
    ibNfiscaisBASE_ICMS: TIBBCDField;
    ibNfiscaisVLR_ICMS: TIBBCDField;
    ibNfiscaisBASE_ICMS_SUBST: TIBBCDField;
    ibNfiscaisVLR_ICMS_SUBST: TIBBCDField;
    ibNfiscaisVLR_PRODUTOS: TIBBCDField;
    ibNfiscaisVLR_FRETE: TIBBCDField;
    ibNfiscaisVLR_SEGURO: TIBBCDField;
    ibNfiscaisVLR_DESP_ACESS: TIBBCDField;
    ibNfiscaisVLR_IPI: TIBBCDField;
    ibNfiscaisVLR_TOTAL: TIBBCDField;
    ibNfiscaisFRETE_TRANSP: TIBStringField;
    ibNfiscaisPLACA_TRANSP: TIBStringField;
    ibNfiscaisUF_PLACA_TRANSP: TIBStringField;
    ibNfiscaisQTDE_TRANSP: TIntegerField;
    ibNfiscaisESPECIE_TRANSP: TIBStringField;
    ibNfiscaisMARCA_TRANSP: TIBStringField;
    ibNfiscaisNUMERO_TRANSP: TIBStringField;
    ibNfiscaisPBRUTO_TRANSP: TIBStringField;
    ibNfiscaisPLIQUIDO_TRANSP: TIBStringField;
    ibNfiscaisCLASS_FISCAL1: TIntegerField;
    ibNfiscaisCLASS_FISCAL2: TIntegerField;
    ibNfiscaisCLASS_FISCAL3: TIntegerField;
    ibNfiscaisCLASS_FISCAL4: TIntegerField;
    ibNfiscaisCLASS_FISCAL5: TIntegerField;
    ibNfiscaisCLASS_FISCAL6: TIntegerField;
    ibNfiscaisCLASS_FISCAL7: TIntegerField;
    ibNfiscaisMENSAGEM: TBlobField;
    ibNfiscaisCANCELADA: TIBStringField;
    ibNaturezasNATUREZA_SQ: TIntegerField;
    ibNaturezasCODIGO_NATUREZA: TIntegerField;
    ibNaturezasDESCRICAO_NATUREZA: TIBStringField;
    ibNaturezasCFO: TIBStringField;
    ibNaturezasALIQ_ICMS: TIBBCDField;
    ibNaturezasALIQ_IPI: TIBBCDField;
    ibNaturezasENT_SAI: TIBStringField;
    ibNaturezasOBSERVACAO: TBlobField;
    ibNaturezasUF01: TIBStringField;
    ibNaturezasUF02: TIBStringField;
    ibNaturezasUF03: TIBStringField;
    ibNaturezasUF04: TIBStringField;
    ibNaturezasUF05: TIBStringField;
    ibNaturezasUF06: TIBStringField;
    ibNaturezasUF07: TIBStringField;
    ibNaturezasUF08: TIBStringField;
    ibNaturezasUF09: TIBStringField;
    ibNaturezasUF10: TIBStringField;
    ibNaturezasUF11: TIBStringField;
    ibNaturezasUF12: TIBStringField;
    ibNaturezasUF13: TIBStringField;
    ibNaturezasUF14: TIBStringField;
    ibNaturezasUF15: TIBStringField;
    ibNaturezasUF16: TIBStringField;
    ibNaturezasUF17: TIBStringField;
    ibNaturezasUF18: TIBStringField;
    ibNaturezasUF19: TIBStringField;
    ibNaturezasUF20: TIBStringField;
    ibNaturezasUF21: TIBStringField;
    ibNaturezasUF22: TIBStringField;
    ibNaturezasUF23: TIBStringField;
    ibNaturezasUF24: TIBStringField;
    ibNaturezasUF25: TIBStringField;
    ibNaturezasUF26: TIBStringField;
    ibNaturezasUF27: TIBStringField;
    ibNaturezasUF28: TIBStringField;
    ibNaturezasUF29: TIBStringField;
    ibNaturezasUF30: TIBStringField;
    ibListaNBMALIQ_ICMS: TIBBCDField;
    ibListaNBMALIQ_IPI: TIBBCDField;
    ibNbmALIQ_ICMS: TIBBCDField;
    ibNbmALIQ_IPI: TIBBCDField;
    ibListaNaturezasNATUREZA_SQ: TIntegerField;
    ibListaNaturezasCODIGO_NATUREZA: TIntegerField;
    ibListaNaturezasDESCRICAO_NATUREZA: TIBStringField;
    ibListaNaturezasCFO: TIBStringField;
    ibListaNaturezasALIQ_ICMS: TIBBCDField;
    ibListaNaturezasALIQ_IPI: TIBBCDField;
    ibListaNaturezasENT_SAI: TIBStringField;
    ibListaNaturezasOBSERVACAO: TBlobField;
    ibListaNaturezasUF01: TIBStringField;
    ibListaNaturezasUF02: TIBStringField;
    ibListaNaturezasUF03: TIBStringField;
    ibListaNaturezasUF04: TIBStringField;
    ibListaNaturezasUF05: TIBStringField;
    ibListaNaturezasUF06: TIBStringField;
    ibListaNaturezasUF07: TIBStringField;
    ibListaNaturezasUF08: TIBStringField;
    ibListaNaturezasUF09: TIBStringField;
    ibListaNaturezasUF10: TIBStringField;
    ibListaNaturezasUF11: TIBStringField;
    ibListaNaturezasUF12: TIBStringField;
    ibListaNaturezasUF13: TIBStringField;
    ibListaNaturezasUF14: TIBStringField;
    ibListaNaturezasUF15: TIBStringField;
    ibListaNaturezasUF16: TIBStringField;
    ibListaNaturezasUF17: TIBStringField;
    ibListaNaturezasUF18: TIBStringField;
    ibListaNaturezasUF19: TIBStringField;
    ibListaNaturezasUF20: TIBStringField;
    ibListaNaturezasUF21: TIBStringField;
    ibListaNaturezasUF22: TIBStringField;
    ibListaNaturezasUF23: TIBStringField;
    ibListaNaturezasUF24: TIBStringField;
    ibListaNaturezasUF25: TIBStringField;
    ibListaNaturezasUF26: TIBStringField;
    ibListaNaturezasUF27: TIBStringField;
    ibListaNaturezasUF28: TIBStringField;
    ibListaNaturezasUF29: TIBStringField;
    ibListaNaturezasUF30: TIBStringField;
    ibEmpresasNUMERO_PEDIDO: TIntegerField;
    ibPedidosNUMERO_PEDIDO: TIntegerField;
    ibspPK: TIBStoredProc;
    ibNaturezasISENCAO_IPI: TIBStringField;
    ibNaturezasISENCAO_ICMS: TIBStringField;
    ibListaNaturezasISENCAO_IPI: TIBStringField;
    ibListaNaturezasISENCAO_ICMS: TIBStringField;
    ibPedidosDIAS_DEMONSTRACAO: TIntegerField;
    ibNfiscaisDIAS_DEMONSTRACAO: TIntegerField;
    ibListaPedidosPEDIDO_SQ: TIntegerField;
    ibListaPedidosCLIENTE_SQ: TIntegerField;
    ibListaPedidosDATA_PEDIDO: TDateTimeField;
    ibListaPedidosCOND_PAGTO_SQ: TIntegerField;
    ibListaPedidosNATUREZA_SQ: TIntegerField;
    ibListaPedidosCOTACAO_DOLAR: TIBBCDField;
    ibListaPedidosOBSERVACAO: TBlobField;
    ibListaPedidosTRANSPORTADORA_SQ: TIntegerField;
    ibListaPedidosVLR_FRETE: TIBBCDField;
    ibListaPedidosFRETE_TRANSP: TIBStringField;
    ibListaPedidosNFISCAL_SQ: TIntegerField;
    ibListaPedidosVLR_DESC: TIBBCDField;
    ibListaPedidosPCT_DESC: TIBBCDField;
    ibListaPedidosVLR_ICMS: TIBBCDField;
    ibListaPedidosVLR_IPI: TIBBCDField;
    ibListaPedidosVLR_PRODUTOS: TIBBCDField;
    ibListaPedidosBASE_ICMS: TIBBCDField;
    ibListaPedidosNUMERO_PEDIDO: TIntegerField;
    ibListaPedidosDIAS_DEMONSTRACAO: TIntegerField;
    ibListaPedidosItensPEDIDO_ITEM_SQ: TIntegerField;
    ibListaPedidosItensPEDIDO_SQ: TIntegerField;
    ibListaPedidosItensPRODUTO_SQ: TIntegerField;
    ibListaPedidosItensQTDE_PEDIDO_ITEM: TIntegerField;
    ibListaPedidosItensPRECO_UNIT: TIBBCDField;
    ibListaPedidosItensVLR_DESC: TIBBCDField;
    ibListaPedidosItensPCT_DESC: TIBBCDField;
    ibListaPedidosItensALIQ_ICMS_ITEM: TIBBCDField;
    ibListaPedidosItensALIQ_IPI_ITEM: TIBBCDField;
    ibListaPedidosItensVLR_ICMS_ITEM: TIBBCDField;
    ibListaPedidosItensVLR_IPI_ITEM: TIBBCDField;
    ibListaPedidosItensVLR_TOTAL_ITEM: TIBBCDField;
    ibImprPedPEDIDO_SQ: TIntegerField;
    ibImprPedCLIENTE_SQ: TIntegerField;
    ibImprPedDATA_PEDIDO: TDateTimeField;
    ibImprPedCOND_PAGTO_SQ: TIntegerField;
    ibImprPedNATUREZA_SQ: TIntegerField;
    ibImprPedCOTACAO_DOLAR: TIBBCDField;
    ibImprPedOBSERVACAO: TBlobField;
    ibImprPedTRANSPORTADORA_SQ: TIntegerField;
    ibImprPedVLR_FRETE: TIBBCDField;
    ibImprPedFRETE_TRANSP: TIBStringField;
    ibImprPedNFISCAL_SQ: TIntegerField;
    ibImprPedVLR_DESC: TIBBCDField;
    ibImprPedPCT_DESC: TIBBCDField;
    ibImprPedVLR_ICMS: TIBBCDField;
    ibImprPedVLR_IPI: TIBBCDField;
    ibImprPedVLR_PRODUTOS: TIBBCDField;
    ibImprPedBASE_ICMS: TIBBCDField;
    ibImprPedNUMERO_PEDIDO: TIntegerField;
    ibImprPedDIAS_DEMONSTRACAO: TIntegerField;
    ibImprPedCLIENTE_SQ1: TIntegerField;
    ibImprPedCODIGO_CLIENTE: TIBStringField;
    ibImprPedNOME_CLIENTE: TIBStringField;
    ibImprPedINSCR_ESTADUAL: TIBStringField;
    ibImprPedENDERECO: TIBStringField;
    ibImprPedNUMERO: TIBStringField;
    ibImprPedBAIRRO: TIBStringField;
    ibImprPedCOMPL_ENDERECO: TIBStringField;
    ibImprPedCIDADE: TIBStringField;
    ibImprPedESTADO: TIBStringField;
    ibImprPedCEP: TIBStringField;
    ibImprPedDDD_FONE1: TIBStringField;
    ibImprPedNUMERO_FONE1: TIBStringField;
    ibImprPedCOMPL_FONE1: TIBStringField;
    ibImprPedDDD_FONE2: TIBStringField;
    ibImprPedNUMERO_FONE2: TIBStringField;
    ibImprPedCOMPL_FONE2: TIBStringField;
    ibImprPedDDD_FONE3: TIBStringField;
    ibImprPedNUMERO_FONE3: TIBStringField;
    ibImprPedCOMPL_FONE3: TIBStringField;
    ibImprPedDDD_CELULAR: TIBStringField;
    ibImprPedNUMERO_CELULAR: TIBStringField;
    ibImprPedCOMPL_CELULAR: TIBStringField;
    ibImprPedDDD_FAX: TIBStringField;
    ibImprPedNUMERO_FAX: TIBStringField;
    ibImprPedCOMPL_FAX: TIBStringField;
    ibImprPedE_MAIL: TIBStringField;
    ibImprPedWEB_SITE: TIBStringField;
    ibImprPedCONTATO: TIBStringField;
    ibImprPedPAIS: TIBStringField;
    ibImprPedOBSERVACAO1: TBlobField;
    ibImprPedCOND_PAGTO_SQ1: TIntegerField;
    ibImprPedCODIGO_COND_PAGTO: TIntegerField;
    ibImprPedDESCRICAO_COND_PAGTO: TIBStringField;
    ibImprPedPARCELAS: TIntegerField;
    ibImprPedD00: TIntegerField;
    ibImprPedD01: TIntegerField;
    ibImprPedD02: TIntegerField;
    ibImprPedD03: TIntegerField;
    ibImprPedD04: TIntegerField;
    ibImprPedD05: TIntegerField;
    ibImprPedD06: TIntegerField;
    ibImprPedD07: TIntegerField;
    ibImprPedD08: TIntegerField;
    ibImprPedD09: TIntegerField;
    ibImprPedNATUREZA_SQ1: TIntegerField;
    ibImprPedCODIGO_NATUREZA: TIntegerField;
    ibImprPedDESCRICAO_NATUREZA: TIBStringField;
    ibImprPedCFO: TIBStringField;
    ibImprPedALIQ_ICMS: TIBBCDField;
    ibImprPedALIQ_IPI: TIBBCDField;
    ibImprPedENT_SAI: TIBStringField;
    ibImprPedOBSERVACAO2: TBlobField;
    ibImprPedUF01: TIBStringField;
    ibImprPedUF02: TIBStringField;
    ibImprPedUF03: TIBStringField;
    ibImprPedUF04: TIBStringField;
    ibImprPedUF05: TIBStringField;
    ibImprPedUF06: TIBStringField;
    ibImprPedUF07: TIBStringField;
    ibImprPedUF08: TIBStringField;
    ibImprPedUF09: TIBStringField;
    ibImprPedUF10: TIBStringField;
    ibImprPedUF11: TIBStringField;
    ibImprPedUF12: TIBStringField;
    ibImprPedUF13: TIBStringField;
    ibImprPedUF14: TIBStringField;
    ibImprPedUF15: TIBStringField;
    ibImprPedUF16: TIBStringField;
    ibImprPedUF17: TIBStringField;
    ibImprPedUF18: TIBStringField;
    ibImprPedUF19: TIBStringField;
    ibImprPedUF20: TIBStringField;
    ibImprPedUF21: TIBStringField;
    ibImprPedUF22: TIBStringField;
    ibImprPedUF23: TIBStringField;
    ibImprPedUF24: TIBStringField;
    ibImprPedUF25: TIBStringField;
    ibImprPedUF26: TIBStringField;
    ibImprPedUF27: TIBStringField;
    ibImprPedUF28: TIBStringField;
    ibImprPedUF29: TIBStringField;
    ibImprPedUF30: TIBStringField;
    ibImprPedISENCAO_IPI: TIBStringField;
    ibImprPedISENCAO_ICMS: TIBStringField;
    ibImprPedTRANSPORTADORA_SQ1: TIntegerField;
    ibImprPedCODIGO_TRANSPORTADORA: TIBStringField;
    ibImprPedNOME_TRANSPORTADORA: TIBStringField;
    ibImprPedENDERECO_TRANSPORTADORA: TIBStringField;
    ibImprPedMUNICIPIO_TRANSPORTADORA: TIBStringField;
    ibImprPedESTADO_TRANSPORTADORA: TIBStringField;
    ibImprPedINSCR_ESTADUAL1: TIBStringField;
    ibImprPedItemPEDIDO_ITEM_SQ: TIntegerField;
    ibImprPedItemPEDIDO_SQ: TIntegerField;
    ibImprPedItemPRODUTO_SQ: TIntegerField;
    ibImprPedItemQTDE_PEDIDO_ITEM: TIntegerField;
    ibImprPedItemPRECO_UNIT: TIBBCDField;
    ibImprPedItemVLR_DESC: TIBBCDField;
    ibImprPedItemPCT_DESC: TIBBCDField;
    ibImprPedItemALIQ_ICMS_ITEM: TIBBCDField;
    ibImprPedItemALIQ_IPI_ITEM: TIBBCDField;
    ibImprPedItemVLR_ICMS_ITEM: TIBBCDField;
    ibImprPedItemVLR_IPI_ITEM: TIBBCDField;
    ibImprPedItemVLR_TOTAL_ITEM: TIBBCDField;
    ibImprPedItemPRODUTO_SQ1: TIntegerField;
    ibImprPedItemCODIGO_PRODUTO: TIBStringField;
    ibImprPedItemDESCRICAO_PRODUTO: TIBStringField;
    ibImprPedItemQTDE_PRODUTO: TIntegerField;
    ibImprPedItemNBM_SQ: TIntegerField;
    ibImprPedItemMODELO_PRODUTO: TIBStringField;
    ibImprPedItemUN_PRODUTO: TIBStringField;
    ibImprPedItemMARCA_PRODUTO: TIBStringField;
    ibImprPedItemPRECO_UNIT1: TIBBCDField;
    ibImprPedItemNBM_SQ1: TIntegerField;
    ibImprPedItemCODIGO_NBM: TIBStringField;
    ibImprPedItemALIQ_ICMS: TIBBCDField;
    ibImprPedItemALIQ_IPI: TIBBCDField;
    ibListaNfiscaisNFISCAL_SQ: TIntegerField;
    ibListaNfiscaisNUMERO_NFISCAL: TIntegerField;
    ibListaNfiscaisDTEMISSAO_NFISCAL: TDateTimeField;
    ibListaNfiscaisDTSAIDA_NFISCAL: TDateTimeField;
    ibListaNfiscaisPEDIDO_SQ: TIntegerField;
    ibListaNfiscaisCLIENTE_SQ: TIntegerField;
    ibListaNfiscaisCOND_PAGTO_SQ: TIntegerField;
    ibListaNfiscaisNATUREZA_SQ: TIntegerField;
    ibListaNfiscaisTRANSPORTADORA_SQ: TIntegerField;
    ibListaNfiscaisBASE_ICMS: TIBBCDField;
    ibListaNfiscaisVLR_ICMS: TIBBCDField;
    ibListaNfiscaisBASE_ICMS_SUBST: TIBBCDField;
    ibListaNfiscaisVLR_ICMS_SUBST: TIBBCDField;
    ibListaNfiscaisVLR_PRODUTOS: TIBBCDField;
    ibListaNfiscaisVLR_FRETE: TIBBCDField;
    ibListaNfiscaisVLR_SEGURO: TIBBCDField;
    ibListaNfiscaisVLR_DESP_ACESS: TIBBCDField;
    ibListaNfiscaisVLR_IPI: TIBBCDField;
    ibListaNfiscaisVLR_TOTAL: TIBBCDField;
    ibListaNfiscaisFRETE_TRANSP: TIBStringField;
    ibListaNfiscaisPLACA_TRANSP: TIBStringField;
    ibListaNfiscaisUF_PLACA_TRANSP: TIBStringField;
    ibListaNfiscaisQTDE_TRANSP: TIntegerField;
    ibListaNfiscaisESPECIE_TRANSP: TIBStringField;
    ibListaNfiscaisMARCA_TRANSP: TIBStringField;
    ibListaNfiscaisNUMERO_TRANSP: TIBStringField;
    ibListaNfiscaisPBRUTO_TRANSP: TIBStringField;
    ibListaNfiscaisPLIQUIDO_TRANSP: TIBStringField;
    ibListaNfiscaisCLASS_FISCAL1: TIntegerField;
    ibListaNfiscaisCLASS_FISCAL2: TIntegerField;
    ibListaNfiscaisCLASS_FISCAL3: TIntegerField;
    ibListaNfiscaisCLASS_FISCAL4: TIntegerField;
    ibListaNfiscaisCLASS_FISCAL5: TIntegerField;
    ibListaNfiscaisCLASS_FISCAL6: TIntegerField;
    ibListaNfiscaisCLASS_FISCAL7: TIntegerField;
    ibListaNfiscaisMENSAGEM: TBlobField;
    ibListaNfiscaisCANCELADA: TIBStringField;
    ibListaNfiscaisDIAS_DEMONSTRACAO: TIntegerField;
    ibPedidosItensNR_SERIE_ITEM: TIBStringField;
    ibImprPedItemNR_SERIE_ITEM: TIBStringField;
    ibListaPedidosItensNR_SERIE_ITEM: TIBStringField;
    ibPedidosPCT_JUROS: TIBBCDField;
    ibPedidosVLR_JUROS: TIBBCDField;
    ibListaPedidosPCT_JUROS: TIBBCDField;
    ibListaPedidosVLR_JUROS: TIBBCDField;
    ibImprPedPCT_JUROS: TIBBCDField;
    ibImprPedVLR_JUROS: TIBBCDField;
    ibClientesREVENDA: TIBStringField;
    ibClientesBIRO: TIBStringField;
    ibListaClientesREVENDA: TIBStringField;
    ibListaClientesBIRO: TIBStringField;
    ibImprPedREVENDA: TIBStringField;
    ibImprPedBIRO: TIBStringField;
    ibImprEst: TIBQuery;
    ibImprEstPRODUTO_SQ: TIntegerField;
    ibImprEstCODIGO_PRODUTO: TIBStringField;
    ibImprEstDESCRICAO_PRODUTO: TIBStringField;
    ibImprEstQTDE_PRODUTO: TIntegerField;
    ibImprEstNBM_SQ: TIntegerField;
    ibImprEstMODELO_PRODUTO: TIBStringField;
    ibImprEstUN_PRODUTO: TIBStringField;
    ibImprEstMARCA_PRODUTO: TIBStringField;
    ibImprEstPRECO_UNIT: TIBBCDField;
    ibImprEstCODIGO_NBM: TIBStringField;
    ibKardex: TIBTable;
    ibKardexKARDEX_SQ: TIntegerField;
    ibKardexPRODUTO_SQ: TIntegerField;
    ibKardexTIPO_MOV: TIBStringField;
    ibKardexQTDE: TIntegerField;
    ibKardexDATA: TDateTimeField;
    ibKardexNFISCAL: TIntegerField;
    ibKardexUSUARIO_SQ: TIntegerField;
    ibKardexVALOR: TIBBCDField;
    ibKardexCODIGO_PRODUTO: TStringField;
    ibKardexDESCRICAO_PRODUTO: TStringField;
    ibImprHistClientes1: TIBQuery;
    ibImprHistClientes2: TIBQuery;
    ibImprHistClientes3: TIBQuery;
    dsImprHistClientes1: TDataSource;
    dsImprHistClientes2: TDataSource;
    ibImprHistClientes2PEDIDO_SQ: TIntegerField;
    ibImprHistClientes2NUMERO_PEDIDO: TIntegerField;
    ibImprHistClientes2DATA_PEDIDO: TDateTimeField;
    ibImprHistClientes2COTACAO_DOLAR: TIBBCDField;
    ibImprHistClientes2VLR_FRETE: TIBBCDField;
    ibImprHistClientes2VLR_DESC: TIBBCDField;
    ibImprHistClientes2PCT_DESC: TIBBCDField;
    ibImprHistClientes2VLR_ICMS: TIBBCDField;
    ibImprHistClientes2VLR_IPI: TIBBCDField;
    ibImprHistClientes2VLR_PRODUTOS: TIBBCDField;
    ibImprHistClientes2VLR_JUROS: TIBBCDField;
    ibImprHistClientes2PCT_JUROS: TIBBCDField;
    ibImprHistClientes2DESCRICAO_COND_PAGTO: TIBStringField;
    ibImprHistClientes2DESCRICAO_NATUREZA: TIBStringField;
    ibImprHistClientes2CFO: TIBStringField;
    ibImprHistClientes2NOME_TRANSPORTADORA: TIBStringField;
    ibImprHistClientes3PEDIDO_ITEM_SQ: TIntegerField;
    ibImprHistClientes3PEDIDO_SQ: TIntegerField;
    ibImprHistClientes3PRODUTO_SQ: TIntegerField;
    ibImprHistClientes3QTDE_PEDIDO_ITEM: TIntegerField;
    ibImprHistClientes3NR_SERIE_ITEM: TIBStringField;
    ibImprHistClientes3PRECO_UNIT: TIBBCDField;
    ibImprHistClientes3VLR_DESC: TIBBCDField;
    ibImprHistClientes3PCT_DESC: TIBBCDField;
    ibImprHistClientes3ALIQ_ICMS_ITEM: TIBBCDField;
    ibImprHistClientes3ALIQ_IPI_ITEM: TIBBCDField;
    ibImprHistClientes3VLR_ICMS_ITEM: TIBBCDField;
    ibImprHistClientes3VLR_IPI_ITEM: TIBBCDField;
    ibImprHistClientes3VLR_TOTAL_ITEM: TIBBCDField;
    ibImprHistClientes3PRODUTO_SQ1: TIntegerField;
    ibImprHistClientes3CODIGO_PRODUTO: TIBStringField;
    ibImprHistClientes3DESCRICAO_PRODUTO: TIBStringField;
    ibImprHistClientes3QTDE_PRODUTO: TIntegerField;
    ibImprHistClientes3NBM_SQ: TIntegerField;
    ibImprHistClientes3MODELO_PRODUTO: TIBStringField;
    ibImprHistClientes3UN_PRODUTO: TIBStringField;
    ibImprHistClientes3MARCA_PRODUTO: TIBStringField;
    ibImprHistClientes3PRECO_UNIT1: TIBBCDField;
    ibImprHistClientes3NBM_SQ1: TIntegerField;
    ibImprHistClientes3CODIGO_NBM: TIBStringField;
    ibImprHistClientes3ALIQ_ICMS: TIBBCDField;
    ibImprHistClientes3ALIQ_IPI: TIBBCDField;
    ibImprHistClientes1CLIENTE_SQ: TIntegerField;
    ibImprHistClientes1CODIGO_CLIENTE: TIBStringField;
    ibImprHistClientes1NOME_CLIENTE: TIBStringField;
    ibImprHistClientes1INSCR_ESTADUAL: TIBStringField;
    ibImprHistClientes1ENDERECO: TIBStringField;
    ibImprHistClientes1NUMERO: TIBStringField;
    ibImprHistClientes1BAIRRO: TIBStringField;
    ibImprHistClientes1COMPL_ENDERECO: TIBStringField;
    ibImprHistClientes1CIDADE: TIBStringField;
    ibImprHistClientes1ESTADO: TIBStringField;
    ibImprHistClientes1CEP: TIBStringField;
    ibImprHistClientes1DDD_FONE1: TIBStringField;
    ibImprHistClientes1NUMERO_FONE1: TIBStringField;
    ibImprHistClientes1COMPL_FONE1: TIBStringField;
    ibImprHistClientes1DDD_FONE2: TIBStringField;
    ibImprHistClientes1NUMERO_FONE2: TIBStringField;
    ibImprHistClientes1COMPL_FONE2: TIBStringField;
    ibImprHistClientes1DDD_FONE3: TIBStringField;
    ibImprHistClientes1NUMERO_FONE3: TIBStringField;
    ibImprHistClientes1COMPL_FONE3: TIBStringField;
    ibImprHistClientes1DDD_CELULAR: TIBStringField;
    ibImprHistClientes1NUMERO_CELULAR: TIBStringField;
    ibImprHistClientes1COMPL_CELULAR: TIBStringField;
    ibImprHistClientes1DDD_FAX: TIBStringField;
    ibImprHistClientes1NUMERO_FAX: TIBStringField;
    ibImprHistClientes1COMPL_FAX: TIBStringField;
    ibImprHistClientes1E_MAIL: TIBStringField;
    ibImprHistClientes1WEB_SITE: TIBStringField;
    ibImprHistClientes1CONTATO: TIBStringField;
    ibImprHistClientes1PAIS: TIBStringField;
    ibImprHistClientes1REVENDA: TIBStringField;
    ibImprHistClientes1BIRO: TIBStringField;
    ibImprHistClientes2FRETE_TRANSP: TIBStringField;
    ibNfiscaisItensNBM_SQ: TIntegerField;
    ibNfiscaisItensNR_SERIE_ITEM: TIBStringField;
    ibImprNf: TIBQuery;
    ibImprNfItem: TIBQuery;
    ibImprNfItemNFISCAL_ITEM_SQ: TIntegerField;
    ibImprNfItemNFISCAL_SQ: TIntegerField;
    ibImprNfItemITEM: TIntegerField;
    ibImprNfItemPRODUTO_SQ: TIntegerField;
    ibImprNfItemNR_SERIE_ITEM: TIBStringField;
    ibImprNfItemCLASS_FISCAL: TIBStringField;
    ibImprNfItemSTRIBUT: TIntegerField;
    ibImprNfItemQTDE_ITEM: TIntegerField;
    ibImprNfItemVLR_UNIT_ITEM: TIBBCDField;
    ibImprNfItemVLR_TOTAL_ITEM: TIBBCDField;
    ibImprNfItemALIQ_ICMS_ITEM: TIBBCDField;
    ibImprNfItemALIQ_IPI_ITEM: TIBBCDField;
    ibImprNfItemVLR_ICMS_ITEM: TIBBCDField;
    ibImprNfItemVLR_IPI_ITEM: TIBBCDField;
    ibImprNfItemPRODUTO_SQ1: TIntegerField;
    ibImprNfItemCODIGO_PRODUTO: TIBStringField;
    ibImprNfItemDESCRICAO_PRODUTO: TIBStringField;
    ibImprNfItemQTDE_PRODUTO: TIntegerField;
    ibImprNfItemNBM_SQ: TIntegerField;
    ibImprNfItemMODELO_PRODUTO: TIBStringField;
    ibImprNfItemUN_PRODUTO: TIBStringField;
    ibImprNfItemMARCA_PRODUTO: TIBStringField;
    ibImprNfItemPRECO_UNIT: TIBBCDField;
    ibImprNfItemNBM_SQ1: TIntegerField;
    ibImprNfItemCODIGO_NBM: TIBStringField;
    ibImprNfItemALIQ_ICMS: TIBBCDField;
    ibImprNfItemALIQ_IPI: TIBBCDField;
    ibListaPedidosNUMERO_NFISCAL: TIntegerField;
    ibImprNfNFISCAL_SQ: TIntegerField;
    ibImprNfNUMERO_NFISCAL: TIntegerField;
    ibImprNfDTEMISSAO_NFISCAL: TDateTimeField;
    ibImprNfDTSAIDA_NFISCAL: TDateTimeField;
    ibImprNfPEDIDO_SQ: TIntegerField;
    ibImprNfCLIENTE_SQ: TIntegerField;
    ibImprNfCOND_PAGTO_SQ: TIntegerField;
    ibImprNfNATUREZA_SQ: TIntegerField;
    ibImprNfTRANSPORTADORA_SQ: TIntegerField;
    ibImprNfBASE_ICMS: TIBBCDField;
    ibImprNfVLR_ICMS: TIBBCDField;
    ibImprNfBASE_ICMS_SUBST: TIBBCDField;
    ibImprNfVLR_ICMS_SUBST: TIBBCDField;
    ibImprNfVLR_PRODUTOS: TIBBCDField;
    ibImprNfVLR_FRETE: TIBBCDField;
    ibImprNfVLR_SEGURO: TIBBCDField;
    ibImprNfVLR_DESP_ACESS: TIBBCDField;
    ibImprNfVLR_IPI: TIBBCDField;
    ibImprNfVLR_TOTAL: TIBBCDField;
    ibImprNfFRETE_TRANSP: TIBStringField;
    ibImprNfPLACA_TRANSP: TIBStringField;
    ibImprNfUF_PLACA_TRANSP: TIBStringField;
    ibImprNfQTDE_TRANSP: TIntegerField;
    ibImprNfESPECIE_TRANSP: TIBStringField;
    ibImprNfMARCA_TRANSP: TIBStringField;
    ibImprNfNUMERO_TRANSP: TIBStringField;
    ibImprNfPBRUTO_TRANSP: TIBStringField;
    ibImprNfPLIQUIDO_TRANSP: TIBStringField;
    ibImprNfCLASS_FISCAL1: TIntegerField;
    ibImprNfCLASS_FISCAL2: TIntegerField;
    ibImprNfCLASS_FISCAL3: TIntegerField;
    ibImprNfCLASS_FISCAL4: TIntegerField;
    ibImprNfCLASS_FISCAL5: TIntegerField;
    ibImprNfCLASS_FISCAL6: TIntegerField;
    ibImprNfCLASS_FISCAL7: TIntegerField;
    ibImprNfMENSAGEM: TBlobField;
    ibImprNfCANCELADA: TIBStringField;
    ibImprNfDIAS_DEMONSTRACAO: TIntegerField;
    ibImprNfCLIENTE_SQ1: TIntegerField;
    ibImprNfCODIGO_CLIENTE: TIBStringField;
    ibImprNfNOME_CLIENTE: TIBStringField;
    ibImprNfINSCR_ESTADUAL: TIBStringField;
    ibImprNfENDERECO: TIBStringField;
    ibImprNfNUMERO: TIBStringField;
    ibImprNfBAIRRO: TIBStringField;
    ibImprNfCOMPL_ENDERECO: TIBStringField;
    ibImprNfCIDADE: TIBStringField;
    ibImprNfESTADO: TIBStringField;
    ibImprNfCEP: TIBStringField;
    ibImprNfDDD_FONE1: TIBStringField;
    ibImprNfNUMERO_FONE1: TIBStringField;
    ibImprNfCOMPL_FONE1: TIBStringField;
    ibImprNfDDD_FONE2: TIBStringField;
    ibImprNfNUMERO_FONE2: TIBStringField;
    ibImprNfCOMPL_FONE2: TIBStringField;
    ibImprNfDDD_FONE3: TIBStringField;
    ibImprNfNUMERO_FONE3: TIBStringField;
    ibImprNfCOMPL_FONE3: TIBStringField;
    ibImprNfDDD_CELULAR: TIBStringField;
    ibImprNfNUMERO_CELULAR: TIBStringField;
    ibImprNfCOMPL_CELULAR: TIBStringField;
    ibImprNfDDD_FAX: TIBStringField;
    ibImprNfNUMERO_FAX: TIBStringField;
    ibImprNfCOMPL_FAX: TIBStringField;
    ibImprNfE_MAIL: TIBStringField;
    ibImprNfWEB_SITE: TIBStringField;
    ibImprNfCONTATO: TIBStringField;
    ibImprNfPAIS: TIBStringField;
    ibImprNfOBSERVACAO: TBlobField;
    ibImprNfREVENDA: TIBStringField;
    ibImprNfBIRO: TIBStringField;
    ibImprNfCOND_PAGTO_SQ1: TIntegerField;
    ibImprNfCODIGO_COND_PAGTO: TIntegerField;
    ibImprNfDESCRICAO_COND_PAGTO: TIBStringField;
    ibImprNfPARCELAS: TIntegerField;
    ibImprNfD00: TIntegerField;
    ibImprNfD01: TIntegerField;
    ibImprNfD02: TIntegerField;
    ibImprNfD03: TIntegerField;
    ibImprNfD04: TIntegerField;
    ibImprNfD05: TIntegerField;
    ibImprNfD06: TIntegerField;
    ibImprNfD07: TIntegerField;
    ibImprNfD08: TIntegerField;
    ibImprNfD09: TIntegerField;
    ibImprNfNATUREZA_SQ1: TIntegerField;
    ibImprNfCODIGO_NATUREZA: TIntegerField;
    ibImprNfDESCRICAO_NATUREZA: TIBStringField;
    ibImprNfCFO: TIBStringField;
    ibImprNfALIQ_ICMS: TIBBCDField;
    ibImprNfALIQ_IPI: TIBBCDField;
    ibImprNfENT_SAI: TIBStringField;
    ibImprNfOBSERVACAO1: TBlobField;
    ibImprNfUF01: TIBStringField;
    ibImprNfUF02: TIBStringField;
    ibImprNfUF03: TIBStringField;
    ibImprNfUF04: TIBStringField;
    ibImprNfUF05: TIBStringField;
    ibImprNfUF06: TIBStringField;
    ibImprNfUF07: TIBStringField;
    ibImprNfUF08: TIBStringField;
    ibImprNfUF09: TIBStringField;
    ibImprNfUF10: TIBStringField;
    ibImprNfUF11: TIBStringField;
    ibImprNfUF12: TIBStringField;
    ibImprNfUF13: TIBStringField;
    ibImprNfUF14: TIBStringField;
    ibImprNfUF15: TIBStringField;
    ibImprNfUF16: TIBStringField;
    ibImprNfUF17: TIBStringField;
    ibImprNfUF18: TIBStringField;
    ibImprNfUF19: TIBStringField;
    ibImprNfUF20: TIBStringField;
    ibImprNfUF21: TIBStringField;
    ibImprNfUF22: TIBStringField;
    ibImprNfUF23: TIBStringField;
    ibImprNfUF24: TIBStringField;
    ibImprNfUF25: TIBStringField;
    ibImprNfUF26: TIBStringField;
    ibImprNfUF27: TIBStringField;
    ibImprNfUF28: TIBStringField;
    ibImprNfUF29: TIBStringField;
    ibImprNfUF30: TIBStringField;
    ibImprNfISENCAO_IPI: TIBStringField;
    ibImprNfISENCAO_ICMS: TIBStringField;
    ibImprNfTRANSPORTADORA_SQ1: TIntegerField;
    ibImprNfCODIGO_TRANSPORTADORA: TIBStringField;
    ibImprNfNOME_TRANSPORTADORA: TIBStringField;
    ibImprNfENDERECO_TRANSPORTADORA: TIBStringField;
    ibImprNfMUNICIPIO_TRANSPORTADORA: TIBStringField;
    ibImprNfESTADO_TRANSPORTADORA: TIBStringField;
    ibImprNfINSCR_ESTADUAL1: TIBStringField;
    ibImprNfNBM_SQ: TIntegerField;
    ibImprNfCODIGO_NBM: TIBStringField;
    ibImprNfALIQ_ICMS1: TIBBCDField;
    ibImprNfALIQ_IPI1: TIBBCDField;
    ibImprNfNBM_SQ1: TIntegerField;
    ibImprNfCODIGO_NBM1: TIBStringField;
    ibImprNfALIQ_ICMS2: TIBBCDField;
    ibImprNfALIQ_IPI2: TIBBCDField;
    ibImprNfNBM_SQ2: TIntegerField;
    ibImprNfCODIGO_NBM2: TIBStringField;
    ibImprNfALIQ_ICMS3: TIBBCDField;
    ibImprNfALIQ_IPI3: TIBBCDField;
    ibImprNfNBM_SQ3: TIntegerField;
    ibImprNfCODIGO_NBM3: TIBStringField;
    ibImprNfALIQ_ICMS4: TIBBCDField;
    ibImprNfALIQ_IPI4: TIBBCDField;
    ibImprNfNBM_SQ4: TIntegerField;
    ibImprNfCODIGO_NBM4: TIBStringField;
    ibImprNfALIQ_ICMS5: TIBBCDField;
    ibImprNfALIQ_IPI5: TIBBCDField;
    ibImprNfNBM_SQ5: TIntegerField;
    ibImprNfCODIGO_NBM5: TIBStringField;
    ibImprNfALIQ_ICMS6: TIBBCDField;
    ibImprNfALIQ_IPI6: TIBBCDField;
    ibImprNfNBM_SQ6: TIntegerField;
    ibImprNfCODIGO_NBM6: TIBStringField;
    ibImprNfALIQ_ICMS7: TIBBCDField;
    ibImprNfALIQ_IPI7: TIBBCDField;
    ibDuplicatas: TIBTable;
    ibDuplicatasDUPLICATA_SQ: TIntegerField;
    ibDuplicatasNUMERO_DUPLICATA: TIntegerField;
    ibDuplicatasITEM_DUPLICATA: TIntegerField;
    ibDuplicatasSEQ_DUPLICATA: TIntegerField;
    ibDuplicatasNFISCAL_SQ: TIntegerField;
    ibDuplicatasVALOR_DUPLICATA: TIBBCDField;
    ibDuplicatasDTEMISSAO_DUPLICATA: TDateTimeField;
    ibDuplicatasDTVENCTO_DUPLICATA: TDateTimeField;
    ibDuplicatasDTPGTO_DUPLICATA: TDateTimeField;
    ibDuplicatasVALORPG_DUPLICATA: TIBBCDField;
    ibListaDuplicatas: TIBQuery;
    ibListaDuplicatasDUPLICATA_SQ: TIntegerField;
    ibListaDuplicatasNUMERO_DUPLICATA: TIntegerField;
    ibListaDuplicatasITEM_DUPLICATA: TIntegerField;
    ibListaDuplicatasSEQ_DUPLICATA: TIntegerField;
    ibListaDuplicatasNFISCAL_SQ: TIntegerField;
    ibListaDuplicatasVALOR_DUPLICATA: TIBBCDField;
    ibListaDuplicatasDTEMISSAO_DUPLICATA: TDateTimeField;
    ibListaDuplicatasDTVENCTO_DUPLICATA: TDateTimeField;
    ibListaDuplicatasDTPGTO_DUPLICATA: TDateTimeField;
    ibListaDuplicatasVALORPG_DUPLICATA: TIBBCDField;
    Msg: TIdMessage;
    IdSMTP1: TIdSMTP;
    ibUsuariosERRO_EMAIL_FROM: TIBStringField;
    ibUsuariosERRO_NOME_FROM: TIBStringField;
    ibUsuariosERRO_EMAIL_TO: TIBStringField;
    ibUsuariosERRO_NOME_TO: TIBStringField;
    ibUsuariosERRO_SMTP: TIBStringField;
    ibUsuariosERRO_USERNAME: TIBStringField;
    ibUsuariosERRO_PASSWORD: TIBStringField;
    ibListaUsuariosERRO_EMAIL_FROM: TIBStringField;
    ibListaUsuariosERRO_NOME_FROM: TIBStringField;
    ibListaUsuariosERRO_EMAIL_TO: TIBStringField;
    ibListaUsuariosERRO_NOME_TO: TIBStringField;
    ibListaUsuariosERRO_SMTP: TIBStringField;
    ibListaUsuariosERRO_USERNAME: TIBStringField;
    ibListaUsuariosERRO_PASSWORD: TIBStringField;
    ibNaturezasDESCRICAO_NATUREZA_NFISCAL: TIBStringField;
    ibListaNaturezasDESCRICAO_NATUREZA_NFISCAL: TIBStringField;
    ibImprNfDESCRICAO_NATUREZA_NFISCAL: TIBStringField;
    ibEmpresasALT_DATA_PEDIDO: TIBStringField;
    ibEmpresasALT_DTEMISSAO_NFISCAL: TIBStringField;
    ibEmpresasALIQ_ICMS: TIBBCDField;
    ibImprNfDups: TIBQuery;
    ibImprNfDupsDUPLICATA_SQ: TIntegerField;
    ibImprNfDupsNUMERO_DUPLICATA: TIntegerField;
    ibImprNfDupsITEM_DUPLICATA: TIntegerField;
    ibImprNfDupsSEQ_DUPLICATA: TIntegerField;
    ibImprNfDupsNFISCAL_SQ: TIntegerField;
    ibImprNfDupsVALOR_DUPLICATA: TIBBCDField;
    ibImprNfDupsDTEMISSAO_DUPLICATA: TDateTimeField;
    ibImprNfDupsDTVENCTO_DUPLICATA: TDateTimeField;
    ibImprNfDupsDTPGTO_DUPLICATA: TDateTimeField;
    ibImprNfDupsVALORPG_DUPLICATA: TIBBCDField;
    ibListaPedidosItensCODIGO_PRODUTO: TIBStringField;
    ibListaPedidosItensDESCRICAO_PRODUTO: TIBStringField;
    ibListaPedidosItensQTDE_PRODUTO: TIntegerField;
    ibListaPedidosItensCODIGO_NBM: TIBStringField;
    ibListaNfiscaisItens: TIBQuery;
    dsListaNfiscais: TDataSource;
    ibListaNfiscaisItensNFISCAL_ITEM_SQ: TIntegerField;
    ibListaNfiscaisItensNFISCAL_SQ: TIntegerField;
    ibListaNfiscaisItensITEM: TIntegerField;
    ibListaNfiscaisItensPRODUTO_SQ: TIntegerField;
    ibListaNfiscaisItensNR_SERIE_ITEM: TIBStringField;
    ibListaNfiscaisItensCLASS_FISCAL: TIBStringField;
    ibListaNfiscaisItensSTRIBUT: TIntegerField;
    ibListaNfiscaisItensQTDE_ITEM: TIntegerField;
    ibListaNfiscaisItensVLR_UNIT_ITEM: TIBBCDField;
    ibListaNfiscaisItensVLR_TOTAL_ITEM: TIBBCDField;
    ibListaNfiscaisItensALIQ_ICMS_ITEM: TIBBCDField;
    ibListaNfiscaisItensALIQ_IPI_ITEM: TIBBCDField;
    ibListaNfiscaisItensVLR_ICMS_ITEM: TIBBCDField;
    ibListaNfiscaisItensVLR_IPI_ITEM: TIBBCDField;
    ibListaNfiscaisItensCODIGO_PRODUTO: TIBStringField;
    ibListaNfiscaisItensDESCRICAO_PRODUTO: TIBStringField;
    ibListaNfiscaisItensQTDE_PRODUTO: TIntegerField;
    ibListaNfiscaisItensCODIGO_NBM: TIBStringField;
    ibEmpresasSTRIBUT: TIntegerField;
    ibEmpresasALT_NR_PEDIDO: TIBStringField;
    ibEmpresasALT_NR_NFISCAL: TIBStringField;
    ibTransportadorasDDD_FONE: TIBStringField;
    ibTransportadorasNUMERO_FONE: TIBStringField;
    ibTransportadorasCOMPL_FONE: TIBStringField;
    ibListaTransportadorasDDD_FONE: TIBStringField;
    ibListaTransportadorasNUMERO_FONE: TIBStringField;
    ibListaTransportadorasCOMPL_FONE: TIBStringField;
    ibNfiscaisCOTACAO_DOLAR: TIBBCDField;
    ibListaNfiscaisCOTACAO_DOLAR: TIBBCDField;
    ibImprNfCOTACAO_DOLAR: TIBBCDField;
    ibImprNfDDD_FONE: TIBStringField;
    ibImprNfNUMERO_FONE: TIBStringField;
    ibImprNfCOMPL_FONE: TIBStringField;
    ibImprClientesUF: TIBQuery;
    ibImprClientesUFCODIGO_CLIENTE: TIBStringField;
    ibImprClientesUFNOME_CLIENTE: TIBStringField;
    ibImprClientesUFCIDADE: TIBStringField;
    ibImprClientesUFVALOR: TIBBCDField;
    ibImprClientesUFQTDE: TLargeintField;
    ibImprClientesUFDATA: TDateTimeField;
    ibNaturezasTIPO_NFISCAL: TIBStringField;
    ibListaNaturezasTIPO_NFISCAL: TIBStringField;
    ibImprPedDESCRICAO_NATUREZA_NFISCAL: TIBStringField;
    ibImprPedTIPO_NFISCAL: TIBStringField;
    ibImprPedDDD_FONE: TIBStringField;
    ibImprPedNUMERO_FONE: TIBStringField;
    ibImprPedCOMPL_FONE: TIBStringField;
    ibNfiscaisNR_NFISCAL_RETORNO: TIntegerField;
    ibNfiscaisDT_NFISCAL_RETORNO: TDateTimeField;
    ibListaNfiscaisNR_NFISCAL_RETORNO: TIntegerField;
    ibListaNfiscaisDT_NFISCAL_RETORNO: TDateTimeField;
    IBTransaction2: TIBTransaction;
    DBCep: TIBDatabase;
    ibCep: TIBQuery;
    ibCepCEP: TIBStringField;
    ibCepLOGRADOURO: TIBStringField;
    ibCepBAIRRO: TIBStringField;
    ibCepCIDADE: TIBStringField;
    ibCepUF: TIBStringField;
    ibspMax: TIBStoredProc;
    procedure ibPedidosItensPCT_DESCValidate(Sender: TField);
    procedure ibPedidosItensPRODUTO_SQChange(Sender: TField);
    procedure ibPedidosItensPRECO_UNITValidate(Sender: TField);
    procedure ibEmpresasESTADOValidate(Sender: TField);
    procedure ibImprHistClientes1AfterScroll(DataSet: TDataSet);
    procedure ibClientesDeleteError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure ibClientesEditError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure ibClientesPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure ibClientesUpdateError(DataSet: TDataSet; E: EDatabaseError;
      UpdateKind: TUpdateKind; var UpdateAction: TIBUpdateAction);
    procedure ibEmpresasBeforeClose(DataSet: TDataSet);
    procedure DBConnBeforeDisconnect(Sender: TObject);
    procedure ibPedidosBeforeDelete(DataSet: TDataSet);
  private
  public
    estados, estado, ucod, unom, err_email_from, err_nome_from, err_email_to,
    err_nome_to, err_smtp, err_username, err_password, alt_dtped, alt_dtnf,
    alt_nrped, alt_nrnf: string;
    useq, univ, strib: Integer;
    dtsenha: TDate;
    aliq_icms: Real;
    Function TestaCPF(Text : string) : Boolean;
    Function TestaCNPJ(Text : string) : Boolean;
    function VerificaSenha (): Integer;
    function EnviarEmail (Tabela, Operacao, Erro: String): Boolean;
    function EnviarEmail2 (Mensagem: String): Boolean;
    function Login (nivel:integer): Boolean;
    function Maximo (Tabela, Campo: String): Integer;
    procedure FinalizaNfiscal ();
    procedure FinalizaPedido ();
    procedure AtualizaVariaveis ();
  end;

var
  DM_OLD: TDM_OLD;

implementation

uses uPwd, USplash, UMainMenu, UImprimirHistClientes;

{$R *.DFM}

// TestaCPF - validacao do CPF
Function TDM_OLD.TestaCPF(Text : string) : Boolean;
Var i, code : Integer;
// D, d3 : String;
d2 : Array[1..9] of Integer;
DF4, DF5, DF6, RESTO1, Pridig, Segdig : Integer;
Pridig2, Segdig2 : String;

Begin
For i := 1 to 9 do Val(Copy (Text, i, 1),D2[i],Code);

DF4 := 10 * D2[1] + 9 * D2[2] + 8 * D2[3] + 7 * D2[4] + 6 * D2[5] + 5 * D2[6] + 4 * D2[7] + 3 * D2[8] + 2 * D2[9];
DF5 := DF4 div 11;
DF6 := DF5 * 11;
Resto1 := Df4 - DF6;

If (Resto1=0) or (Resto1=1) then
Pridig:=0
else
Pridig:=11 - Resto1;

For i := 1 to 9 do Val(Copy (Text, i, 1),D2[i],Code);

DF4 := 11 * D2[1] + 10 * D2[2] + 9 * D2[3] + 8 * D2[4] + 7 * D2[5] + 6 * D2[6] + 5 * D2[7] + 4 * D2[8] + 3 *
D2[9] + 2 * Pridig;
DF5 := DF4 div 11;
DF6 := DF5 * 11;
Resto1 := Df4 - DF6;
If (Resto1=0) or (Resto1=1) then
Segdig:=0
else
Segdig:=11 - Resto1;

Str(Pridig, Pridig2);
Str(Segdig, Segdig2);

If not (Pridig2=Text[10]) or not (SegDig2=Text[11]) then
Result := False
else
Result := True;

End;

// TestaCGC - validacao do CGC
Function TDM_OLD.TestaCNPJ(Text : string) : Boolean;
Var i, code : Integer;
// D, d3 : String;
d2 : Array[1..12] of Integer;
DF4, DF5, DF6, RESTO1, Pridig, Segdig : Integer;
Pridig2, Segdig2 : String;

Begin
For i := 1 to 12 do Val(Copy (Text, i, 1),D2[i],Code);

DF4 := 5 * D2[1] + 4 * D2[2] + 3 * D2[3] + 2 * D2[4] + 9 * D2[5] + 8 * D2[6] + 7 * D2[7]
+ 6 * D2[8] + 5 * D2[9] + 4 * D2[10] + 3 * D2[11] + 2 * D2[12];
DF5 := DF4 div 11;
DF6 := DF5 * 11;
Resto1 := Df4 - DF6;

If (Resto1=0) or (Resto1=1) then Pridig:=0 else Pridig:=11 - Resto1;

For i := 1 to 12 do Val(Copy (Text, i, 1),D2[i],Code);

DF4 := 6 * D2[1] + 5 * D2[2] + 4 * D2[3] + 3 * D2[4] + 2 * D2[5]
+ 9 * D2[6] + 8 * D2[7] + 7 * D2[8] + 6 * D2[9] + 5 * D2[10] +4 * D2[11]
+ 3 * D2[12] + 2 * Pridig;
DF5 := DF4 div 11;
DF6 := DF5 * 11;
Resto1 := Df4 - DF6;

If (Resto1=0) or (Resto1=1) then Segdig:=0 else Segdig:=11 - Resto1;

Str(Pridig, Pridig2);
Str(Segdig, Segdig2);
If not (Pridig2=Text[13]) or not (SegDig2=Text[14]) then
Result := False
else
Result := True;
End;

function TDM_OLD.Login (nivel:integer): Boolean;
begin
  Result := False;
  try
    Application.CreateForm(TPasswordDlg, PasswordDlg);
    if PasswordDlg.ShowModal = mrOk then
    begin
      if PasswordDlg.Usuario.Text = '' then
        raise Exception.Create ('Usuário não Cadastrado!');
      ibListaUsuarios.Open;
      ibListaUsuarios.Filter := 'CODIGO_USUARIO = ''' + PasswordDlg.Usuario.Text + '''';
      if ibListaUsuarios.RecordCount = 0 then
        raise Exception.Create ('Usuário não Cadastrado!');
      if ibListaUsuariosSENHA_USUARIO.Value <> PasswordDlg.Password.Text then
        raise Exception.Create ('Senha Inválida!');
    end
    else raise Exception.Create ('Operação Abortada!');
    univ := ibListaUsuariosNIVEL_USUARIO.Value;
    ucod := ibListaUsuariosCODIGO_USUARIO.Value;
    useq := ibListaUsuariosUSUARIO_SQ.Value;
    unom := ibListaUsuariosNOME_USUARIO.Value;
    err_email_from := ibListaUsuariosERRO_EMAIL_FROM.Value;
    err_nome_from  := ibListaUsuariosERRO_NOME_FROM.Value;
    err_email_to   := ibListaUsuariosERRO_EMAIL_TO.Value;
    err_nome_to    := ibListaUsuariosERRO_NOME_TO.Value;
    err_smtp       := ibListaUsuariosERRO_SMTP.Value;
    err_username   := ibListaUsuariosERRO_USERNAME.Value;
    err_password   := ibListaUsuariosERRO_PASSWORD.Value;
    if dtsenha < (date + 10) then
      EnviarEmail2 ('Senha Vence em ' + FormatDateTime ('dd/mm/yyyy', dtsenha));
    Result := True;
  except
    on E: Exception do
    begin
      ShowMessage(E.Message);
      if nivel = 0 then Application.Terminate;
    end;
  end;
  PasswordDlg.Free;
  DBConn.Close;
end;

function TDM_OLD.Maximo (Tabela, Campo: String): Integer;
begin
  ibspMax.ParamByName('TABELA').AsString := Tabela;
  ibspMax.ParamByName('CAMPO').AsString  := Campo;
  ibspMax.ExecProc;
  Result := ibspMax.ParamByName('VALOR').AsInteger;
end;

function TDM_OLD.VerificaSenha (): Integer;
var
  i1: integer;
  s1, s2: string;
  r1: Real;
begin
  try
    Result := 1;
    ibEmpresas.Open;
    ibEmpresas.First;
    ibEmpresas.Edit;
    ibEmpresasACESSOS.Value := ibEmpresasACESSOS.Value + 1;
    ibEmpresas.Post;
    s1 := '';
    for i1 := 1 to 14 do
    begin
      s2 := InttoStr (Pos (Copy (ibEmpresasSENHA.AsString, i1, 1), 'SergioPaulo'));
      if s2 = '10' then s2 := '0';
      s1 := Concat (s1, s2);
    end;
    r1 := StrToFloat (s1);
    r1 := r1-ibEmpresasCODIGO_EMPRESA.AsFloat;
    r1 := Sqrt (r1);
    if (r1 < date) or (r1 > date+90) then
      raise Exception.Create ('Senha desatualizada!');
    dtsenha   := r1;
    AtualizaVariaveis;
    ibEmpresas.Close;
  except
    on E: Exception do
    begin
      ShowMessage(E.Message);
      Result := 0;
    end;
  end;
end;

procedure TDM_OLD.FinalizaNfiscal ();
begin
  ibEmpresas.Open;

  ibNfiscais.Edit;
  ibNfiscaisNUMERO_NFISCAL.AsInteger := ibEmpresasNUMERO_NFISCAL.AsInteger + 1;
  ibNfiscais.Post;

  ibEmpresas.Edit;
  ibEmpresasNUMERO_NFISCAL.AsInteger := ibEmpresasNUMERO_NFISCAL.AsInteger + 1;
  ibEmpresas.Post;
  ibEmpresas.Close;
end;

procedure TDM_OLD.FinalizaPedido ();
begin
  ibEmpresas.Open;

  ibPedidos.Edit;
  ibPedidosNUMERO_PEDIDO.AsInteger  := ibEmpresasNUMERO_PEDIDO.AsInteger + 1;
  ibPedidos.Post;

  ibEmpresas.Edit;
  ibEmpresasNUMERO_PEDIDO.AsInteger := ibEmpresasNUMERO_PEDIDO.AsInteger + 1;
  ibEmpresas.Post;
  ibEmpresas.Close;
end;

function TDM_OLD.EnviarEmail (Tabela, Operacao, Erro: String): Boolean;
begin
  Result := True;
  try
    if IdSMTP1.Connected then
     IdSMTP1.Disconnect;
    Msg.From.Address := err_email_from;
    Msg.From.Name    := err_nome_from;
    Msg.Recipients.Clear;
    Msg.Recipients.Add;
    Msg.Recipients.Items[0].Address := err_email_to;
    Msg.Recipients.Items[0].Name    := err_nome_to;
    IdSMTP1.Host := err_smtp;
    IdSMTP1.Username := err_username;
    IdSMTP1.Password := err_password;
    IdSMTP1.Connect();
    if IdSMTP1.Connected then
    begin
      Msg.Date := Date;
      Msg.Body.Clear;
      Msg.Subject := 'Erro no Programa ' + Application.Title;
      Msg.Body.Add ('Mensagem de Erro!!!');
      Msg.Body.Add ('Tentando ' + Operacao + ' registro na Tabela ' + Tabela + '.');
      Msg.Body.Add ('Mensagem de Erro: ' + Erro + '.');
      Msg.Body.Add ('Operacao realizada por: ' + unom + '.');
      IdSMTP1.Send(Msg);
      IdSMTP1.Disconnect;
    end;
  except
    Result := False;
  end;
end;

function TDM_OLD.EnviarEmail2 (Mensagem: String): Boolean;
begin
  Result := True;
  try
    if IdSMTP1.Connected then
     IdSMTP1.Disconnect;
    Msg.From.Address := err_email_from;
    Msg.From.Name    := err_nome_from;
    Msg.Recipients.Clear;
    Msg.Recipients.Add;
    Msg.Recipients.Items[0].Address := err_email_to;
    Msg.Recipients.Items[0].Name    := err_nome_to;
    IdSMTP1.Host := err_smtp;
    IdSMTP1.Username := err_username;
    IdSMTP1.Password := err_password;
    IdSMTP1.Connect();
    if IdSMTP1.Connected then
    begin
      Msg.Date := Date;
      Msg.Body.Clear;
      Msg.Subject := 'Erro no Programa ' + Application.Title;
      Msg.Body.Add (Mensagem);
      Msg.Body.Add ('Operacao realizada por: ' + unom + '.');
      IdSMTP1.Send(Msg);
      IdSMTP1.Disconnect;
    end;
  except
    Result := False;
  end;
end;

procedure TDM_OLD.ibPedidosItensPCT_DESCValidate(Sender: TField);
begin
//  ibPedidosItensVLR_DESC.AsCurrency := ibPedidosItensPRECO_UNIT.AsCurrency * ibPedidosItensQTDE_PEDIDO_ITEM.Value * ibPedidosItensPCT_DESC.AsCurrency / 100;
end;

procedure TDM_OLD.ibPedidosItensPRODUTO_SQChange(Sender: TField);
begin
  ibPedidosItensPRECO_UNIT.AsCurrency := ibListaProdutosPRECO_UNIT.AsCurrency;
end;

procedure TDM_OLD.ibPedidosItensPRECO_UNITValidate(Sender: TField);
begin
  if (ibPedidosItensQTDE_PEDIDO_ITEM.AsInteger <> 0) and (ibPedidosItensPRECO_UNIT.AsCurrency <> 0) then
  begin
    ibPedidosItensPCT_DESC.AsCurrency   := ibPedidosItensVLR_DESC.AsCurrency * 100 / (ibPedidosItensPRECO_UNIT.AsCurrency * ibPedidosItensQTDE_PEDIDO_ITEM.AsInteger);
    ibPedidosItensALIQ_IPI_ITEM.Value   := ibListaProdutosALIQ_IPI.AsCurrency;
    if ibListaClientesESTADO.Value = estado then
      ibPedidosItensALIQ_ICMS_ITEM.Value  := ibListaProdutosALIQ_ICMS.AsCurrency
    else
      ibPedidosItensALIQ_ICMS_ITEM.Value  := ibListaNaturezasALIQ_ICMS.AsCurrency;
    if (ibListaClientesINSCR_ESTADUAL.Value = '') or (Pos ('ISENT', ibListaClientesINSCR_ESTADUAL.Value) <> 0) then
      ibPedidosItensALIQ_ICMS_ITEM.Value  := aliq_icms;
    if ibListaNaturezasISENCAO_IPI.Value  = 'S' then ibPedidosItensALIQ_IPI_ITEM.Value  := 0;
    if ibListaNaturezasISENCAO_ICMS.Value = 'S' then ibPedidosItensALIQ_ICMS_ITEM.Value := 0;
    ibPedidosItensVLR_IPI_ITEM.Value    := ibPedidosCOTACAO_DOLAR.AsCurrency * (ibPedidosItensPRECO_UNIT.AsCurrency * ibPedidosItensQTDE_PEDIDO_ITEM.AsInteger - ibPedidosItensVLR_DESC.AsCurrency) * (ibPedidosItensALIQ_IPI_ITEM.AsCurrency / (100 + ibPedidosItensALIQ_IPI_ITEM.AsCurrency));
    ibPedidosItensVLR_ICMS_ITEM.Value   := (ibPedidosCOTACAO_DOLAR.AsCurrency * (ibPedidosItensPRECO_UNIT.AsCurrency * ibPedidosItensQTDE_PEDIDO_ITEM.AsInteger - ibPedidosItensVLR_DESC.AsCurrency) - ibPedidosItensVLR_IPI_ITEM.Value) * (ibPedidosItensALIQ_ICMS_ITEM.AsCurrency/100);
    ibPedidosItensVLR_TOTAL_ITEM.Value  := ibPedidosCOTACAO_DOLAR.AsCurrency * (ibPedidosItensPRECO_UNIT.AsCurrency    * ibPedidosItensQTDE_PEDIDO_ITEM.AsInteger - ibPedidosItensVLR_DESC.AsCurrency);
  end;
end;

procedure TDM_OLD.ibEmpresasESTADOValidate(Sender: TField);
begin
  if Pos (ibEmpresasESTADO.Value, Estados) = 0 then
  begin
    ibempresasESTADO.Value := '';
    raise Exception.Create ('Estado Invalido!');
  end;
end;

procedure TDM_OLD.ibImprHistClientes1AfterScroll(DataSet: TDataSet);
var
  TotItens: Integer;
  VlrTotal: Real;
begin
  VlrTotal := 0;
  TotItens := 0;
  if ibImprHistClientes2.Active = True then
  begin
    ibImprHistClientes2.First;
    While not ibImprHistClientes2.Eof do
    begin
      ibImprHistclientes3.First;
      While not ibImprHistClientes3.Eof do
      begin
        TotItens := TotItens + ibImprHistClientes3QTDE_PEDIDO_ITEM.Value;
        VlrTotal := VlrTotal + ibImprHistClientes3VLR_TOTAL_ITEM.Value;
        ibImprHistClientes3.Next;
      end;
      ibImprHistClientes2.Next;
    end;
    ibImprHistClientes2.First;
    ibImprHistclientes3.First;
  end;
  FImprimirHistClientes.lbItens.Caption := IntToStr (TotItens);
  FImprimirHistClientes.lbValor.Caption := FloatToStrf (VlrTotal, ffCurrency, 10, 2);
end;

procedure TDM_OLD.ibClientesDeleteError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin
  EnviarEmail (DataSet.Name, 'APAGAR', E.Message);
end;

procedure TDM_OLD.ibClientesEditError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin
  EnviarEmail (DataSet.Name, 'EDITAR', E.Message);
end;

procedure TDM_OLD.ibClientesPostError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin
  EnviarEmail (DataSet.Name, 'GRAVAR', E.Message);
end;

procedure TDM_OLD.ibClientesUpdateError(DataSet: TDataSet; E: EDatabaseError;
  UpdateKind: TUpdateKind; var UpdateAction: TIBUpdateAction);
begin
  EnviarEmail (DataSet.Name, 'ALTERAR', E.Message);
end;

procedure TDM_OLD.ibEmpresasBeforeClose(DataSet: TDataSet);
begin
  AtualizaVariaveis ();
end;

procedure TDM_OLD.AtualizaVariaveis ();
begin
  estado    := ibEmpresasESTADO.Value;
  alt_dtped := ibEmpresasALT_DATA_PEDIDO.Value;
  alt_dtnf  := ibEmpresasALT_DTEMISSAO_NFISCAL.Value;
  alt_nrped := ibEmpresasALT_NR_PEDIDO.Value;
  alt_nrnf  := ibEmpresasALT_NR_NFISCAL.Value;
  aliq_icms := ibEmpresasALIQ_ICMS.Value;
  strib     := ibEmpresasSTRIBUT.Value;
end;

procedure TDM_OLD.DBConnBeforeDisconnect(Sender: TObject);
begin
  if IBTransaction1.InTransaction then IBTransaction1.Rollback;
end;

procedure TDM_OLD.ibPedidosBeforeDelete(DataSet: TDataSet);
begin
  ibPedidosItens.Open;
  ibPedidosItens.First;
  While not ibPedidosItens.Eof do
    if ibPedidosItensPEDIDO_SQ.Value = ibPedidosPEDIDO_SQ.Value then
      ibPedidosItens.Delete else
      ibPedidosItens.Next;
  ibPedidosItens.Close;
end;

end.
