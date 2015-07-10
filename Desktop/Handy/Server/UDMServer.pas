unit UDMServer;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  Windows, Messages, SysUtils, Classes, ComServ, ComObj, VCLCom, DataBkr,
  DBClient, PrServer_TLB, StdVcl, DB, Dialogs, Provider, Registry,
  IdMessage, PJVersionInfo, ScktComp, DBTables, Variants, IdComponent,
  IdTCPConnection, IdTCPClient, IdMessageClient, IdSMTP, IdBaseComponent,
  IdTCPServer, ExtCtrls;

type
  TServer = class(TRemoteDataModule, IServer)
    Msg: TIdMessage;
    IdSMTP1: TIdSMTP;
    DBConn: TDatabase;
    Session1: TSession;
    qrVerIndice: TQuery;
    Query1: TQuery;
    dspLista: TDataSetProvider;
    dspBuscaProdutos: TDataSetProvider;
    dspBuscaClientes: TDataSetProvider;
    qrLista: TQuery;
    qrBuscaProdutos: TQuery;
    qrBuscaClientes: TQuery;
    dspImprPed: TDataSetProvider;
    dspImprNfDups: TDataSetProvider;
    dspImprNfItem: TDataSetProvider;
    dspImprNf: TDataSetProvider;
    dspImprPedItem: TDataSetProvider;
    dspImprEst: TDataSetProvider;
    dspImprHistClientes1: TDataSetProvider;
    dspImprHistClientes2: TDataSetProvider;
    dspImprHistClientes3: TDataSetProvider;
    dspImprClientesUF: TDataSetProvider;
    dspImprDemPrev: TDataSetProvider;
    dspImprNfVend: TDataSetProvider;
    dspImprNfSerie: TDataSetProvider;
    qrImprPed: TQuery;
    qrImprPedPEDIDO_SQ: TIntegerField;
    qrImprPedDDD_FONE1: TStringField;
    qrImprPedNUMERO_FONE1: TStringField;
    qrImprPedCOMPL_FONE1: TStringField;
    qrImprPedDDD_CELULAR: TStringField;
    qrImprPedNUMERO_CELULAR: TStringField;
    qrImprPedCOMPL_CELULAR: TStringField;
    qrImprPedENDERECO: TStringField;
    qrImprPedNUMERO: TStringField;
    qrImprPedCOMPL_ENDERECO: TStringField;
    qrImprPedDDD_FONE2: TStringField;
    qrImprPedNUMERO_FONE2: TStringField;
    qrImprPedCOMPL_FONE2: TStringField;
    qrImprPedDDD_FONE3: TStringField;
    qrImprPedNUMERO_FONE3: TStringField;
    qrImprPedCOMPL_FONE3: TStringField;
    qrImprPedDDD_FAX: TStringField;
    qrImprPedNUMERO_FAX: TStringField;
    qrImprPedCOMPL_FAX: TStringField;
    qrImprPedCODIGO_CLIENTE: TStringField;
    qrImprPedNOME_CLIENTE: TStringField;
    qrImprPedCONTATO: TStringField;
    qrImprPedINSCR_ESTADUAL: TStringField;
    qrImprPedBAIRRO: TStringField;
    qrImprPedCIDADE: TStringField;
    qrImprPedESTADO: TStringField;
    qrImprPedPAIS: TStringField;
    qrImprPedCEP: TStringField;
    qrImprPedNOME_VENDEDOR: TStringField;
    qrImprPedCODIGO_VENDEDOR: TIntegerField;
    qrImprPedTIPO_NFISCAL: TIntegerField;
    qrImprPedDESCRICAO_NATUREZA: TStringField;
    qrImprPedCFO: TStringField;
    qrImprPedCODIGO_TRANSPORTADORA: TStringField;
    qrImprPedNOME_TRANSPORTADORA: TStringField;
    qrImprPedOBSERVACAO_NAT: TMemoField;
    qrImprPedVLR_FRETE: TBCDField;
    qrImprPedFRETE_TRANSP: TStringField;
    qrImprPedDIAS_DEMONSTRACAO: TIntegerField;
    qrImprPedDATA_PEDIDO: TDateTimeField;
    qrImprPedNUMERO_PEDIDO: TIntegerField;
    qrImprPedCOTACAO_DOLAR: TBCDField;
    qrImprPedOBSERVACAO_PED: TMemoField;
    qrImprPedOBSERVACAO_NF: TMemoField;
    qrImprPedVLR_PRODUTOS: TBCDField;
    qrImprPedVLR_IPI: TBCDField;
    qrImprPedVLR_ICMS: TBCDField;
    qrImprPedD00: TIntegerField;
    qrImprPedD01: TIntegerField;
    qrImprPedD02: TIntegerField;
    qrImprPedD03: TIntegerField;
    qrImprPedD04: TIntegerField;
    qrImprPedD05: TIntegerField;
    qrImprPedD06: TIntegerField;
    qrImprPedD07: TIntegerField;
    qrImprPedD08: TIntegerField;
    qrImprPedD09: TIntegerField;
    qrImprPedPARCELAS: TIntegerField;
    qrImprPedDESCRICAO_COND_PAGTO: TStringField;
    qrImprPedItem: TQuery;
    qrImprPedItemNR_SERIE_ITEM: TMemoField;
    qrImprPedItemCODIGO_PRODUTO: TStringField;
    qrImprPedItemDESCRICAO_PRODUTO: TStringField;
    qrImprPedItemQTDE_PEDIDO_ITEM: TIntegerField;
    qrImprPedItemCODIGO_NBM: TStringField;
    qrImprPedItemPRECO_UNIT: TBCDField;
    qrImprPedItemVLR_DESC: TBCDField;
    qrImprPedItemVLR_IPI_ITEM: TBCDField;
    qrImprPedItemALIQ_ICMS_ITEM: TBCDField;
    qrImprPedItemALIQ_IPI_ITEM: TBCDField;
    qrImprPedItemVLR_TOTAL_ITEM: TBCDField;
    qrImprNfItem: TQuery;
    qrImprNfItemPRODUTO_SQ: TIntegerField;
    qrImprNfItemCODIGO_PRODUTO: TStringField;
    qrImprNfItemDESCRICAO_PRODUTO: TStringField;
    qrImprNfItemCLASS_FISCAL: TStringField;
    qrImprNfItemVLR_TOTAL_ITEM: TBCDField;
    qrImprNfItemVLR_UNIT_ITEM: TBCDField;
    qrImprNfItemUN_PRODUTO: TStringField;
    qrImprNfItemSTRIBUT: TIntegerField;
    qrImprNfItemVLR_IPI_ITEM: TBCDField;
    qrImprNfItemALIQ_IPI_ITEM: TBCDField;
    qrImprNfItemALIQ_ICMS_ITEM: TBCDField;
    qrImprNfItemNR_SERIE_ITEM: TMemoField;
    qrImprNf: TQuery;
    qrImprNfNFISCAL_SQ: TIntegerField;
    qrImprNfNOME_CLIENTE: TStringField;
    qrImprNfCODIGO_CLIENTE: TStringField;
    qrImprNfINSCR_ESTADUAL: TStringField;
    qrImprNfENDERECO: TStringField;
    qrImprNfCOMPL_ENDERECO: TStringField;
    qrImprNfNUMERO: TStringField;
    qrImprNfENT_SAI: TStringField;
    qrImprNfBAIRRO: TStringField;
    qrImprNfCIDADE: TStringField;
    qrImprNfESTADO: TStringField;
    qrImprNfCEP: TStringField;
    qrImprNfDTEMISSAO_NFISCAL: TDateTimeField;
    qrImprNfDTSAIDA_NFISCAL: TDateTimeField;
    qrImprNfDESCRICAO_NATUREZA_NFISCAL: TStringField;
    qrImprNfCFO: TStringField;
    qrImprNfMENSAGEM: TMemoField;
    qrImprNfBASE_ICMS: TBCDField;
    qrImprNfVLR_FRETE: TBCDField;
    qrImprNfVLR_ICMS: TBCDField;
    qrImprNfBASE_ICMS_SUBST: TBCDField;
    qrImprNfVLR_SEGURO: TBCDField;
    qrImprNfVLR_DESP_ACESS: TBCDField;
    qrImprNfVLR_ICMS_SUBST: TBCDField;
    qrImprNfVLR_TOTAL: TBCDField;
    qrImprNfVLR_PRODUTOS: TBCDField;
    qrImprNfVLR_IPI: TBCDField;
    qrImprNfNOME_TRANSPORTADORA: TStringField;
    qrImprNfENDERECO_TRANSPORTADORA: TStringField;
    qrImprNfINSCR_ESTADUAL_TRANSP: TStringField;
    qrImprNfQTDE_TRANSP: TIntegerField;
    qrImprNfESTADO_TRANSPORTADORA: TStringField;
    qrImprNfMUNICIPIO_TRANSPORTADORA: TStringField;
    qrImprNfPLIQUIDO_TRANSP: TStringField;
    qrImprNfPBRUTO_TRANSP: TStringField;
    qrImprNfNUMERO_TRANSP: TStringField;
    qrImprNfMARCA_TRANSP: TStringField;
    qrImprNfESPECIE_TRANSP: TStringField;
    qrImprNfCODIGO_TRANSPORTADORA: TStringField;
    qrImprNfUF_PLACA_TRANSP: TStringField;
    qrImprNfPLACA_TRANSP: TStringField;
    qrImprNfFRETE_TRANSP: TStringField;
    qrImprNfCLASS_FISCAL1: TIntegerField;
    qrImprNfCLASS_FISCAL2: TIntegerField;
    qrImprNfCLASS_FISCAL3: TIntegerField;
    qrImprNfCLASS_FISCAL4: TIntegerField;
    qrImprNfCLASS_FISCAL5: TIntegerField;
    qrImprNfCLASS_FISCAL6: TIntegerField;
    qrImprNfCLASS_FISCAL7: TIntegerField;
    qrImprNfDDD_FONE1: TStringField;
    qrImprNfNUMERO_FONE1: TStringField;
    qrImprNfCOMPL_FONE1: TStringField;
    qrImprNfNUMERO_NFISCAL: TIntegerField;
    qrImprNfPARCELAS: TIntegerField;
    qrImprNfCOND_PAGTO_SQ: TIntegerField;
    qrImprNfNATUREZA_SQ: TIntegerField;
    qrImprNfDIAS_DEMONSTRACAO: TIntegerField;
    qrImprNfVend: TQuery;
    qrImprNfVendnfiscal_sq: TIntegerField;
    qrImprNfVendnumero_nfiscal: TIntegerField;
    qrImprNfVenddtemissao_nfiscal: TDateTimeField;
    qrImprNfVendvlr_total: TBCDField;
    qrImprNfVenddup1: TIntegerField;
    qrImprNfVendit1: TIntegerField;
    qrImprNfVendvlr1: TBCDField;
    qrImprNfVendvct1: TDateTimeField;
    qrImprNfVenddup2: TIntegerField;
    qrImprNfVendit2: TIntegerField;
    qrImprNfVendvlr2: TBCDField;
    qrImprNfVendvct2: TDateTimeField;
    qrImprNfVenddup3: TIntegerField;
    qrImprNfVendit3: TIntegerField;
    qrImprNfVendvlr3: TBCDField;
    qrImprNfVendvct3: TDateTimeField;
    qrImprNfVenddup4: TIntegerField;
    qrImprNfVendit4: TIntegerField;
    qrImprNfVendvlr4: TBCDField;
    qrImprNfVendvct4: TDateTimeField;
    qrImprNfVenddup5: TIntegerField;
    qrImprNfVendit5: TIntegerField;
    qrImprNfVendvlr5: TBCDField;
    qrImprNfVendvct5: TDateTimeField;
    qrImprNfDups: TQuery;
    qrImprEst: TQuery;
    qrImprHistClientes1: TQuery;
    qrImprHistClientes3: TQuery;
    qrImprHistClientes2: TQuery;
    qrImprDemPrev: TQuery;
    qrImprDemPrevNUMERO_NFISCAL: TIntegerField;
    qrImprDemPrevNOME_CLIENTE: TStringField;
    qrImprDemPrevDTEMISSAO_NFISCAL: TDateTimeField;
    qrImprDemPrevDIAS_DEMONSTRACAO: TIntegerField;
    qrImprDemPrevDT_NFISCAL_RETORNO: TDateTimeField;
    qrImprClientesUF: TQuery;
    qrImprNfSerie: TQuery;
    qrImprNfSerieNR_SERIE_ITEM: TMemoField;
    qrImprNfSerieNFISCAL_SQ: TIntegerField;
    qrImprNfSerieNUMERO_NFISCAL: TIntegerField;
    qrImprNfSerieDTEMISSAO_NFISCAL: TDateTimeField;
    qrImprNfSerieDTSAIDA_NFISCAL: TDateTimeField;
    qrImprNfSeriePEDIDO_SQ: TIntegerField;
    qrImprNfSerieCLIENTE_SQ: TIntegerField;
    qrImprNfSerieCOND_PAGTO_SQ: TIntegerField;
    qrImprNfSerieNATUREZA_SQ: TIntegerField;
    qrImprNfSerieTRANSPORTADORA_SQ: TIntegerField;
    qrImprNfSerieBASE_ICMS: TBCDField;
    qrImprNfSerieVLR_ICMS: TBCDField;
    qrImprNfSerieBASE_ICMS_SUBST: TBCDField;
    qrImprNfSerieVLR_ICMS_SUBST: TBCDField;
    qrImprNfSerieVLR_PRODUTOS: TBCDField;
    qrImprNfSerieVLR_FRETE: TBCDField;
    qrImprNfSerieVLR_SEGURO: TBCDField;
    qrImprNfSerieVLR_DESP_ACESS: TBCDField;
    qrImprNfSerieVLR_IPI: TBCDField;
    qrImprNfSerieVLR_TOTAL: TBCDField;
    qrImprNfSerieFRETE_TRANSP: TStringField;
    qrImprNfSeriePLACA_TRANSP: TStringField;
    qrImprNfSerieUF_PLACA_TRANSP: TStringField;
    qrImprNfSerieQTDE_TRANSP: TIntegerField;
    qrImprNfSerieESPECIE_TRANSP: TStringField;
    qrImprNfSerieMARCA_TRANSP: TStringField;
    qrImprNfSerieNUMERO_TRANSP: TStringField;
    qrImprNfSeriePBRUTO_TRANSP: TStringField;
    qrImprNfSeriePLIQUIDO_TRANSP: TStringField;
    qrImprNfSerieCLASS_FISCAL1: TIntegerField;
    qrImprNfSerieCLASS_FISCAL2: TIntegerField;
    qrImprNfSerieCLASS_FISCAL3: TIntegerField;
    qrImprNfSerieCLASS_FISCAL4: TIntegerField;
    qrImprNfSerieCLASS_FISCAL5: TIntegerField;
    qrImprNfSerieCLASS_FISCAL6: TIntegerField;
    qrImprNfSerieCLASS_FISCAL7: TIntegerField;
    qrImprNfSerieMENSAGEM: TMemoField;
    qrImprNfSerieCANCELADA: TStringField;
    qrImprNfSerieDIAS_DEMONSTRACAO: TIntegerField;
    qrImprNfSerieCOTACAO_DOLAR: TBCDField;
    qrImprNfSerieNR_NFISCAL_RETORNO: TIntegerField;
    qrImprNfSerieDT_NFISCAL_RETORNO: TDateTimeField;
    qrImprNfSerieCONCLUIDA: TStringField;
    qrImprNfSerieVENDEDOR_SQ: TIntegerField;
    qrImprNfSerieNF_MANUAL: TStringField;
    qrImprNfSerieRETORNO_PRODUTO: TStringField;
    qrImprNfSerieRETORNO_OBSERVACAO: TMemoField;
    qrImprNfSerieNATUREZA_RET_DEM: TIntegerField;
    qrImprNfSerieNOME_CLIENTE: TStringField;
    qrImprNfSerieDESCRICAO_COND_PAGTO: TStringField;
    qrImprNfSerieDESCRICAO_NATUREZA: TStringField;
    qrImprNfSerieNOME_VENDEDOR: TStringField;
    dspImprNfFech: TDataSetProvider;
    qrImprNfFech: TQuery;
    dspImprAssist: TDataSetProvider;
    dspImprAssistItem: TDataSetProvider;
    dspImprAssistEquip: TDataSetProvider;
    qrImprAssist: TQuery;
    qrImprAssistASSISTENCIA_SQ: TIntegerField;
    qrImprAssistNUMERO_ASSISTENCIA: TIntegerField;
    qrImprAssistDATA_CHAMADO: TDateTimeField;
    qrImprAssistDATA_ASSISTENCIA: TDateTimeField;
    qrImprAssistCOTACAO_DOLAR: TBCDField;
    qrImprAssistCLIENTE_SQ: TIntegerField;
    qrImprAssistCOND_PAGTO_SQ: TIntegerField;
    qrImprAssistDESP_CHAMADO: TBCDField;
    qrImprAssistDESP_HTEC_AD: TBCDField;
    qrImprAssistDESP_DESLOC: TBCDField;
    qrImprAssistVLR_PECAS: TBCDField;
    qrImprAssistVLR_TOTAL: TBCDField;
    qrImprAssistHORA_INICIO: TTimeField;
    qrImprAssistHORA_FIM: TTimeField;
    qrImprAssistGARANTIA: TStringField;
    qrImprAssistCONTRATO: TStringField;
    qrImprAssistDDD_FONE1: TStringField;
    qrImprAssistNUMERO_FONE1: TStringField;
    qrImprAssistCOMPL_FONE1: TStringField;
    qrImprAssistDDD_CELULAR: TStringField;
    qrImprAssistNUMERO_CELULAR: TStringField;
    qrImprAssistCOMPL_CELULAR: TStringField;
    qrImprAssistENDERECO: TStringField;
    qrImprAssistNUMERO: TStringField;
    qrImprAssistCOMPL_ENDERECO: TStringField;
    qrImprAssistDDD_FONE2: TStringField;
    qrImprAssistNUMERO_FONE2: TStringField;
    qrImprAssistCOMPL_FONE2: TStringField;
    qrImprAssistDDD_FONE3: TStringField;
    qrImprAssistNUMERO_FONE3: TStringField;
    qrImprAssistCOMPL_FONE3: TStringField;
    qrImprAssistDDD_FAX: TStringField;
    qrImprAssistNUMERO_FAX: TStringField;
    qrImprAssistCOMPL_FAX: TStringField;
    qrImprAssistCODIGO_CLIENTE: TStringField;
    qrImprAssistNOME_CLIENTE: TStringField;
    qrImprAssistCONTATO: TStringField;
    qrImprAssistINSCR_ESTADUAL: TStringField;
    qrImprAssistBAIRRO: TStringField;
    qrImprAssistCIDADE: TStringField;
    qrImprAssistESTADO: TStringField;
    qrImprAssistPAIS: TStringField;
    qrImprAssistCEP: TStringField;
    qrImprAssistD00: TIntegerField;
    qrImprAssistD01: TIntegerField;
    qrImprAssistD02: TIntegerField;
    qrImprAssistD03: TIntegerField;
    qrImprAssistD04: TIntegerField;
    qrImprAssistD05: TIntegerField;
    qrImprAssistD06: TIntegerField;
    qrImprAssistD07: TIntegerField;
    qrImprAssistD08: TIntegerField;
    qrImprAssistD09: TIntegerField;
    qrImprAssistPARCELAS: TIntegerField;
    qrImprAssistDESCRICAO_COND_PAGTO: TStringField;
    qrImprAssistEquip: TQuery;
    qrImprAssistEquipASSISTENCIA_EQUIP_SQ: TIntegerField;
    qrImprAssistEquipASSISTENCIA_SQ: TIntegerField;
    qrImprAssistEquipPRODUTO_SQ: TIntegerField;
    qrImprAssistEquipNR_SERIE_EQUIP: TMemoField;
    qrImprAssistEquipDEFEITO: TBlobField;
    qrImprAssistEquipCODIGO_PRODUTO: TStringField;
    qrImprAssistEquipDESCRICAO_PRODUTO: TStringField;
    qrImprAssistEquipCODIGO_NBM: TStringField;
    qrAssistItem: TQuery;
    qrAssistItemASSISTENCIA_ITEM_SQ: TIntegerField;
    qrAssistItemPRODUTO_SQ: TIntegerField;
    qrAssistItemQTDE_ASSISTENCIA_ITEM: TIntegerField;
    qrAssistItemPRECO_UNIT: TBCDField;
    qrAssistItemCODIGO_PRODUTO: TStringField;
    qrAssistItemDESCRICAO_PRODUTO: TStringField;
    qrAssistItemCODIGO_NBM: TStringField;
    dspImprNFServicos: TDataSetProvider;
    qrImprNFServicos: TQuery;
    qrImprNFServicosNF_SERVICO_SQ: TIntegerField;
    qrImprNFServicosNUMERO_NF_SERVICO: TIntegerField;
    qrImprNFServicosDATA_NF_SERVICO: TDateTimeField;
    qrImprNFServicosCLIENTE_SQ: TIntegerField;
    qrImprNFServicosTTL_NF_SERVICO: TBCDField;
    qrImprNFServicosALIQ_ISS_NF_SERVICO: TBCDField;
    qrImprNFServicosVLR_ISS_NF_SERVICO: TBCDField;
    qrImprNFServicosNOME_CLIENTE: TStringField;
    dspImprNFClientes: TDataSetProvider;
    qrImprNFClientes: TQuery;
    qrImprNFClientesNFISCAL: TIntegerField;
    qrImprNFClientesCFO: TStringField;
    qrImprNFClientesDESCRICAO_NATUREZA_NFISCAL: TStringField;
    qrImprNFClientesVLR_PRODUTOS: TBCDField;
    qrImprNFClientesVLR_TOTAL: TBCDField;
    qrImprNFClientesVLR_ICMS: TBCDField;
    qrImprNFClientesVLR_IPI: TBCDField;
    qrImprNFClientesNOME_CLIENTE: TStringField;
    qrImprNFClientesENT_SAI: TStringField;
    qrImprNFClientesTIPO_NFISCAL: TIntegerField;
    qrImprNFClientesCANCELADA: TStringField;
    dspImprResVend: TDataSetProvider;
    qrImprResVend: TQuery;
    qrImprResVendnome_vendedor: TStringField;
    qrImprResVendtotal: TBCDField;
    dspImprResVendProd: TDataSetProvider;
    qrImprResVendProd: TQuery;
    qrImprResVendProddescricao_produto: TStringField;
    qrImprResVendProdtotal: TBCDField;
    dspImprSugCompra: TDataSetProvider;
    qrImprSugCompra: TQuery;
    qrImprNFClientesDTEMISSAO: TDateTimeField;
    qrImprNfCOTACAO_DOLAR: TBCDField;
    qrImprPedP00: TIntegerField;
    qrImprPedP01: TIntegerField;
    qrImprPedP02: TIntegerField;
    qrImprPedP03: TIntegerField;
    qrImprPedP04: TIntegerField;
    qrImprPedP05: TIntegerField;
    qrImprPedP06: TIntegerField;
    qrImprPedP07: TIntegerField;
    qrImprPedP08: TIntegerField;
    qrImprPedP09: TIntegerField;
    qrImprAssistP00: TIntegerField;
    qrImprAssistP01: TIntegerField;
    qrImprAssistP02: TIntegerField;
    qrImprAssistP03: TIntegerField;
    qrImprAssistP04: TIntegerField;
    qrImprAssistP05: TIntegerField;
    qrImprAssistP06: TIntegerField;
    qrImprAssistP07: TIntegerField;
    qrImprAssistP08: TIntegerField;
    qrImprAssistP09: TIntegerField;
    dspImprClientesNovos: TDataSetProvider;
    qrImprClientesNovos: TQuery;
    dspImprRMA1: TDataSetProvider;
    qrImprRMA1: TQuery;
    qrImprAssistEquipservicos: TMemoField;
    qrAssistItemassistencia_equip_sq: TIntegerField;
    qrImprRMA1RMANO: TIntegerField;
    qrImprRMA1ReceiveDate: TDateTimeField;
    qrImprRMA1ProcessDate: TDateTimeField;
    qrImprRMA1RepairCenter: TStringField;
    qrImprRMA1CustomerName: TStringField;
    qrImprRMA1Phone: TStringField;
    qrImprRMA1Model: TStringField;
    qrImprRMA1Serialnumber: TMemoField;
    qrImprRMA1InOutofWarranty: TStringField;
    qrImprRMA1Quantity: TFloatField;
    qrImprRMA1Defectedreason: TMemoField;
    qrImprRMA1Howtorepair: TMemoField;
    qrImprRMA1Changecomponent: TStringField;
    qrImprRMA1Partsnumber: TStringField;
    qrImprRMA1Result: TStringField;
    qrImprRMA1assistencia_sq: TIntegerField;
    qrImprRMA1assistencia_equip_sq: TIntegerField;
    qrImprAssistvendedor_sq: TIntegerField;
    qrImprRMA1Technician: TStringField;
    PJVersionInfo1: TPJVersionInfo;
    dspImprResVendMes: TDataSetProvider;
    qrImprResVendMes: TQuery;
    qrImprResVendMestotal: TBCDField;
    qrImprResVendMesano_mes: TStringField;
    qrImprResVendMesnome_vendedor: TStringField;
    qrImprDemPrevVLR_TOTAL: TBCDField;
    qrImprNfNUMERO_PEDIDO: TIntegerField;
    Query2: TQuery;
    qrImprNfCLASS_FISCAL8: TIntegerField;
    qrImprNfCLASS_FISCAL9: TIntegerField;
    qrImprNfCLASS_FISCAL10: TIntegerField;
    qrImprNfCLASS_FISCAL11: TIntegerField;
    qrImprNfCLASS_FISCAL12: TIntegerField;
    qrImprNfCLASS_FISCAL13: TIntegerField;
    qrImprNfCLASS_FISCAL14: TIntegerField;
    qrImprNfCLASS_FISCAL15: TIntegerField;
    qrImprNfCLASS_FISCAL16: TIntegerField;
    qrImprNfCLASS_FISCAL17: TIntegerField;
    qrImprNfCLASS_FISCAL18: TIntegerField;
    qrImprNfCLASS_FISCAL19: TIntegerField;
    qrImprNfCLASS_FISCAL20: TIntegerField;
    qrImprNfCLASS_FISCAL21: TIntegerField;
    qrImprNfCLASS_FISCAL22: TIntegerField;
    qrImprNfCLASS_FISCAL23: TIntegerField;
    qrImprNfCLASS_FISCAL24: TIntegerField;
    qrImprNfINF_ADICIONAL: TStringField;
    qrImprNfCFO_SUBST: TStringField;
    qrImprNfItemVLR_ICMS_SUBST_ITEM: TBCDField;
    qrImprNfVendlinha_sq: TIntegerField;
    qrImprNfVendVENDEDOR_SQ: TIntegerField;
    qrImprNfVendCODIGO_VENDEDOR: TIntegerField;
    qrImprNfVendNOME_VENDEDOR: TStringField;
    qrImprNfVendpct_comissao_propria: TBCDField;
    qrImprNfVendbase_comissao: TStringField;
    qrImprNfVendpct_comissao_desconto: TBCDField;
    qrImprNfVendpct_comissao_parceria: TBCDField;
    qrImprNfVendobs_comissao_desconto: TStringField;
    qrImprNfVendcodigo_cliente: TStringField;
    qrImprNfVendnome_cliente: TStringField;
    qrImprComissao: TQuery;
    dspImprComissao: TDataSetProvider;
    qrImprNfItemITEM: TIntegerField;
    qrImprNfItemBASE_ICMS_SUBST_ITEM: TBCDField;
    qrImprNfItemVLR_ICMS_ITEM: TBCDField;
    qrImprNfCANCELADA: TStringField;
    qrImprNfNUMERO_NFE: TIntegerField;
    qrImprNfItemORIGEM_MERCADORIA: TIntegerField;
    qrImprNfNFISCAL_SQ_REFERENCIA: TIntegerField;
    qrImprNfRECIBO_NFE: TStringField;
    qrImprRMA1Freight: TStringField;
    qrImprRMA1Warraty: TStringField;
    qrImprRMA1referencia: TStringField;
    dspImprRMA2: TDataSetProvider;
    qrImprRMA2: TQuery;
    dspImprRMA2Item: TDataSetProvider;
    qrImprRMA2Item: TQuery;
    qrImprNfVendnumero_nfe: TIntegerField;
    qrImprNfVendtipo_vendedor: TStringField;
    qrImprNfVenddata_cadastro: TDateField;
    qrImprNfVenddata_inativacao: TDateField;
    DbNotif: TDatabase;
    qrImprNfItemqtde_item: TIntegerField;
    qrImprPedVLR_SEGURO: TBCDField;
    qrImprNfCLIENTE_SQ: TIntegerField;
    qrImprNfVLR_II: TBCDField;
    qrImprNfuf_embarque: TStringField;
    qrImprNflocal_embarque: TStringField;
    tbProdutoImagem: TTable;
    dspProdutoImagem: TDataSetProvider;
    procedure RemoteDataModuleCreate(Sender: TObject);
    procedure qrImprNfSerieBeforeOpen(DataSet: TDataSet);
    procedure qrImprHistClientes2BeforeOpen(DataSet: TDataSet);
    procedure qrImprDemPrevBeforeOpen(DataSet: TDataSet);
    procedure qrImprNfVendBeforeOpen(DataSet: TDataSet);
    procedure qrImprNfFechBeforeOpen(DataSet: TDataSet);
    procedure qrImprResVendBeforeOpen(DataSet: TDataSet);
    procedure qrImprResVendProdBeforeOpen(DataSet: TDataSet);
    procedure qrImprSugCompraBeforeOpen(DataSet: TDataSet);
    procedure qrImprRMA1CalcFields(DataSet: TDataSet);
    procedure qrImprComissaoBeforeOpen(DataSet: TDataSet);
  private
    procedure RegistraSelect(sql: String);
    { Private declarations }
  protected
    class procedure UpdateRegistry(Register: Boolean; const ClassID, ProgID: string); override;
    function ApagaRegistro(Campos: OleVariant): WideString; safecall;
//    function RegistraLogin(Usuario: Integer; Data: TDateTime; const IP: WideString): WideString; safecall;
    procedure CriaLista(const Sql: WideString); safecall;
//    function VerificaSenha: TDateTime; safecall;
//    function CriaRegistro(const TABELA: WideString; usuario: Integer; Novo: Byte; var Chave: Integer; CAMPOS: OleVariant): WideString; safecall;
//    function VerificaIndice(const TABELA: WideString; const CAMPO: WideString; const VALOR: WideString): Integer; safecall;
//    function CancelaNFiscal(nfiscal_sq: Integer; useq: Integer): WideString; safecall;
//    function FinalizaNfiscal(Nfiscal: Integer; useq: Integer): WideString; safecall;
//    function FinalizaNFe(numero_nfiscal: Integer; numero_nfe: Integer; const chaveNFe: WideString; const motivo: WideString; const recibo_nfe: WideString): WideString; safecall;
//    function Classificacao(Cliente_sq: Integer; AnoMes: Integer): Integer; safecall;
//    function EntradaEstoque(NfEntrada_sq: Integer; useq: Integer): WideString; safecall;
//    function GravaNumeroSerie(nfiscal_item_sq: Integer; const nr_serie_item: WideString): WideString; safecall;
//    function Maximo(const Tabela: WideString; const Campo: WideString): Integer; safecall;
//    procedure BuscaProdutos(const Sql: WideString); safecall;
//    procedure BuscaClientes(const Sql: WideString); safecall;
//    function CancelaEntradaEstoque(nfEntrada_sq: Integer; useq: Integer): WideString; safecall;
//    function TrocaSenha(usuario_sq: Integer; const senha: WideString): WideString; safecall;
//    function VerificaVersao(const versao: WideString): WideString; safecall;
//    function Diretorio: WideString; safecall;
//    function FinalizaPedido(pedido: Integer; useq: Integer ): WideString; safecall;
//    function StatusPedido(pedido: Integer; useq: Integer; const status: WideString): WideString; safecall;
  public
    observacao: String;

//    procedure gravaProduto(Valor: OleVariant; Novo: Byte; var Chave: Integer);
//    procedure gravaTransportadora(Valor: OleVariant; Novo: Byte; var Chave: Integer);
//    procedure gravaUsuario(Valor: OleVariant; Novo: Byte; var Chave: Integer);
//    procedure gravaNBM(Valor: OleVariant; Novo: Byte; var Chave: Integer);
//    procedure gravaNatureza(Valor: OleVariant; Novo: Byte; var Chave: Integer);
//    procedure gravaDuplicata(Valor: OleVariant; Novo: Byte; var Chave: Integer);
//    procedure gravaKardex(Valor: OleVariant; Novo: Byte; var Chave: Integer);
//    procedure gravaNfDemonstracao(Valor: OleVariant; Novo: Byte; var Chave: Integer);
//    procedure gravaCondPagto(Valor: OleVariant; Novo: Byte; var Chave: Integer);
//    procedure gravaTipoCliente(Valor: OleVariant; Novo: Byte; var Chave: Integer);
//    procedure gravaCliente(Valor: OleVariant; Novo: Byte; var Chave: Integer);
//    procedure gravaPedido(Valor: OleVariant; Novo: Byte; var Chave: Integer);
//    procedure gravaEmpresa(Valor: OleVariant; Novo: Byte; var Chave: Integer);
//    procedure gravaNFiscal(Valor: OleVariant; Novo: Byte; var Chave: Integer);
//    procedure gravaAssistencia(Valor: OleVariant; Novo: Byte; var Chave: Integer);
//    procedure gravaModelo(Valor: OleVariant; Novo: Byte; var Chave: Integer);
//    function gravaVendedor(Valor: OleVariant; Novo: Byte): Integer;
//    procedure gravaContasPagar(Valor: OleVariant; Novo: Byte; var Chave: Integer);
//    procedure gravaContasPagarAuto(Valor: OleVariant; Novo: Byte; var Chave: Integer);
//    procedure gravaAcesso(Valor: OleVariant; Novo: Byte; var Chave: Integer);
//    procedure gravaClassificacao(Valor: OleVariant; Novo: Byte; var Chave: Integer);
//    procedure gravaNfServico(Valor: OleVariant; Novo: Byte; var Chave: Integer);
//    procedure gravaNfEntrada(Valor: OleVariant; Novo: Byte; var Chave: Integer);
//    procedure gravaConteiner(Valor: OleVariant; Novo: Byte; var Chave: Integer);
//    procedure gravaHistAlteracao(Tabela: String; chave_sq, tipoAlteracao, usuario: Integer; observacao: String);
//    procedure gravaAgenda(Valor: OleVariant; Novo: Byte; var Chave: Integer);
//    procedure gravaProdutoFaltante(Valor: OleVariant; Novo: Byte; var Chave: Integer);
//    procedure gravaLinha(Valor: OleVariant; Novo: Byte; var Chave: Integer);
//    procedure gravaEstado(Valor: OleVariant; Novo: Byte; var Chave: Integer);
    procedure ExecSQL(const sql: WideString); safecall;
    procedure ExecSQL2(const sql: WideString); safecall;
    procedure BurcarImagemProduto(produto_sq: Integer); safecall;
    { Public declarations }
  end;

implementation

uses Math, StrUtils;

{$R *.DFM}

class procedure TServer.UpdateRegistry(Register: Boolean; const ClassID, ProgID: string);
begin
  if Register then
  begin
    inherited UpdateRegistry(Register, ClassID, ProgID);
    EnableSocketTransport(ClassID);
    EnableWebTransport(ClassID);
  end else
  begin
    DisableSocketTransport(ClassID);
    DisableWebTransport(ClassID);
    inherited UpdateRegistry(Register, ClassID, ProgID);
  end;
end;
{
function TServer.VerificaSenha: TDateTime;
var
  i1: integer;
  s1, s2: string;
  r1: Real;
begin
  try
    Query1.SQL.Clear;
    Query1.SQL.Add('UPDATE empresas SET');
    Query1.SQL.Add('ACESSOS = ACESSOS + 1');
    Query1.ExecSQL;

    Query1.SQL.Clear;
    Query1.SQL.Add('SELECT * FROM empresas');
    Query1.Open;

    s1 := '';
    for i1 := 1 to 14 do
    begin
      s2 := InttoStr (Pos (Copy (Query1.FieldByName('SENHA').AsString, i1, 1), 'SergioPaulo'));
      if s2 = '10' then s2 := '0';
      s1 := Concat (s1, s2);
    end;
    r1 := StrToFloat (s1);
    r1 := r1-Query1.FieldByName('CODIGO_EMPRESA').AsFloat;
    r1 := Sqrt (r1);
    Result := r1;
  except
    on E: Exception do
    begin
      ShowMessage(E.Message);
      Result := 0;
    end;
  end;
end;
}
{
procedure TServer.gravaProduto(Valor: OleVariant; Novo: Byte; var Chave: Integer);
begin
  if (Valor[18] = Null) or (Valor[18] = 0) then
    Valor[18] := 'null'
  else
    Valor[18] := QuotedStr(IntToStr(Valor[18]));

      Query1.SQL.Clear;
      if novo = 255 then
      begin
        Query1.SQL.Add('INSERT INTO produtos (' +
                       'CODIGO_PRODUTO, DESCRICAO_PRODUTO, ' +
                       'QTDE_PRODUTO_LOJA, QTDE_PRODUTO_ARMAZEM, ' +
                       'NBM_SQ, MODELO_SQ, ' +
                       'UN_PRODUTO, MARCA_PRODUTO, ' +
                       'PRECO_UNIT, TIPO_PRODUTO, ' +
                       'QTDE_PRODUTO_DEMO, QTDE_PRODUTO_DEFEITO, ' +
                       'QTDE_PRODUTO_EM_USO, QTDE_PRODUTO_BACKUP, ' +
                       'QTDE_PRODUTO_DEMO_CLI, QTDE_PRODUTO_HLC, ' +
                       'PESO_BRUTO, PESO_LIQUIDO, ' +
                       'linha_sq, ALIQ_ICMS_SUBST, ' +
                       'origem_mercadoria) ' +
                       'VALUES (' +
                       '''' + Valor[0]  + ''', ' +
                       '''' + Valor[1]  + ''', ' +
                       '''' + InttoStr   (Valor[2])  + ''', ' +
                       '''' + InttoStr   (Valor[3])  + ''', ' +
                       '''' + InttoStr   (Valor[4])  + ''', ' +
                       '''' + InttoStr   (Valor[5])  + ''', ' +
                       '''' + Valor[6]  + ''', ' +
                       '''' + Valor[7]  + ''', ' +
                       '''' + FloattoStr (Valor[8])  + ''', ' +
                       '''' + InttoStr   (Valor[9])  + ''', ' +
                       '''' + InttoStr   (Valor[10]) + ''', ' +
                       '''' + InttoStr   (Valor[11]) + ''', ' +
                       '''' + InttoStr   (Valor[12]) + ''', ' +
                       '''' + InttoStr   (Valor[13]) + ''', ' +
                       '''' + InttoStr   (Valor[14]) + ''', ' +
                       '''' + InttoStr   (Valor[15]) + ''', ' +
                       '''' + FloattoStr (Valor[16]) + ''', ' +
                       '''' + FloattoStr (Valor[17]) + ''', ' +
                       Valor[18] + ', ' +
                       '''' + FloattoStr (Valor[19]) + ''', ' +
                       QuotedStr(InttoStr(Valor[20])) + ')' );
      end
      else begin
        Query1.SQL.Add ('UPDATE produtos set ');
        Query1.SQL.Add ('CODIGO_PRODUTO = '''        +            Valor[0]   + ''', ');
        Query1.SQL.Add ('DESCRICAO_PRODUTO = '''     +            Valor[1]   + ''', ');
        Query1.SQL.Add ('QTDE_PRODUTO_LOJA = '''     + InttoStr  (Valor[2])  + ''', ');
        Query1.SQL.Add ('QTDE_PRODUTO_ARMAZEM = '''  + InttoStr  (Valor[3])  + ''', ');
        Query1.SQL.Add ('NBM_SQ = '''                + InttoStr  (Valor[4])  + ''', ');
        Query1.SQL.Add ('MODELO_SQ = '''             + InttoStr  (Valor[5])  + ''', ');
        Query1.SQL.Add ('UN_PRODUTO = '''            +            Valor[6]   + ''', ');
        Query1.SQL.Add ('MARCA_PRODUTO = '''         +            Valor[7]   + ''', ');
        Query1.SQL.Add ('PRECO_UNIT = '''            + FloattoStr(Valor[8])  + ''', ');
        Query1.SQL.Add ('TIPO_PRODUTO = '''          + InttoStr  (Valor[9])  + ''', ');
        Query1.SQL.Add ('QTDE_PRODUTO_DEMO = '''     + InttoStr  (Valor[10]) + ''', ');
        Query1.SQL.Add ('QTDE_PRODUTO_DEFEITO = '''  + InttoStr  (Valor[11]) + ''', ');
        Query1.SQL.Add ('QTDE_PRODUTO_EM_USO = '''   + InttoStr  (Valor[12]) + ''', ');
        Query1.SQL.Add ('QTDE_PRODUTO_BACKUP = '''   + InttoStr  (Valor[13]) + ''', ');
        Query1.SQL.Add ('QTDE_PRODUTO_DEMO_CLI = ''' + InttoStr  (Valor[14]) + ''', ');
        Query1.SQL.Add ('QTDE_PRODUTO_HLC = '''      + InttoStr  (Valor[15]) + ''', ');
        Query1.SQL.Add ('PESO_BRUTO = '''            + FloattoStr(Valor[16]) + ''', ');
        Query1.SQL.Add ('PESO_LIQUIDO = '''          + FloattoStr(Valor[17]) + ''', ');
        Query1.SQL.Add ('linha_sq = '                +            Valor[18]  + ', ');
        Query1.SQL.Add ('ALIQ_ICMS_SUBST = '''       + FloattoStr(Valor[19]) + ''', ');
        Query1.SQL.Add ('origem_mercadoria = '       + QuotedStr(IntToStr(Valor[20])));
        Query1.SQL.Add ('WHERE PRODUTO_SQ = ' + InttoStr (Chave));
      end;
      Query1.ExecSQL;

  if novo = 255 then
  begin
    Query1.SQL.Clear;
    Query1.SQL.Add('SELECT LAST_INSERT_ID() as CHAVE');
    Query1.Open;
    Chave := Query1.FieldByName('CHAVE').AsInteger;
  end;
end;
}
{
procedure TServer.gravaTransportadora(Valor: OleVariant; Novo: Byte; var Chave: Integer);
begin
      Query1.SQL.Clear;
      if novo = 255 then
      begin
        Query1.SQL.Add('INSERT INTO transportadoras (' +
                       'CODIGO_TRANSPORTADORA, NOME_TRANSPORTADORA, ' +
                       'ENDERECO_TRANSPORTADORA, MUNICIPIO_TRANSPORTADORA, ' +
                       'INSCR_ESTADUAL, ESTADO_TRANSPORTADORA, ' +
                       'DDD_FONE, NUMERO_FONE, COMPL_FONE) ' +
                       'VALUES (' +
                       '''' + Valor[0]  + ''', ' +
                       '''' + Valor[1]  + ''', ' +
                       '''' + Valor[2]  + ''', ' +
                       '''' + Valor[3]  + ''', ' +
                       '''' + Valor[4]  + ''', ' +
                       '''' + Valor[5]  + ''', ' +
                       '''' + Valor[6]  + ''', ' +
                       '''' + Valor[7]  + ''', ' +
                       '''' + Valor[8]  + ''')');
      end
      else begin
        Query1.SQL.Add('UPDATE transportadoras SET ');
        Query1.SQL.Add ('CODIGO_TRANSPORTADORA = '''    + Valor[0] + ''', ');
        Query1.SQL.Add ('NOME_TRANSPORTADORA = '''      + Valor[1] + ''', ');
        Query1.SQL.Add ('ENDERECO_TRANSPORTADORA = '''  + Valor[2] + ''', ');
        Query1.SQL.Add ('MUNICIPIO_TRANSPORTADORA = ''' + Valor[3] + ''', ');
        Query1.SQL.Add ('INSCR_ESTADUAL = '''           + Valor[4] + ''', ');
        Query1.SQL.Add ('ESTADO_TRANSPORTADORA = '''    + Valor[5] + ''', ');
        Query1.SQL.Add ('DDD_FONE = '''                 + Valor[6] + ''', ');
        Query1.SQL.Add ('NUMERO_FONE = '''              + Valor[7] + ''', ');
        Query1.SQL.Add ('COMPL_FONE = '''               + Valor[8] + ''' ');
        Query1.SQL.Add ('WHERE TRANSPORTADORA_SQ = ' + InttoStr (Chave));
      end;
      Query1.ExecSQL;
      
  if novo = 255 then
  begin
    Query1.SQL.Clear;
    Query1.SQL.Add('SELECT LAST_INSERT_ID() as CHAVE');
    Query1.Open;
    Chave := Query1.FieldByName('CHAVE').AsInteger;
  end;

end;
}
{
procedure TServer.gravaUsuario(Valor: OleVariant; Novo: Byte; var Chave: Integer);
begin
  Query1.SQL.Clear;

  if ((Valor[10] = null) or (Valor[10]=0)) then
    Valor[10] := 'null'
  else
    Valor[10] := QuotedStr(IntToStr(Valor[10]));

  if novo = 255 then
  begin
      Query1.SQL.Add('INSERT INTO usuarios (' +
                   'CODIGO_USUARIO, NOME_USUARIO, ' +
                   'SENHA_USUARIO, ERRO_EMAIL_FROM, ' +
                   'ERRO_NOME_FROM, ERRO_EMAIL_TO, ' +
                   'ERRO_NOME_TO, ERRO_SMTP, ' +
                   'ERRO_USERNAME, ERRO_PASSWORD, ' +
                   'VENDEDOR_SQ) ' +
                   'VALUES (' +
                   '''' + Valor[0]  + ''', ' +
                   '''' + Valor[1]  + ''', ' +
                   '''' + Valor[2]  + ''', ' +
                   '''' + Valor[3]  + ''', ' +
                   '''' + Valor[4]  + ''', ' +
                   '''' + Valor[5]  + ''', ' +
                   '''' + Valor[6]  + ''', ' +
                   '''' + Valor[7]  + ''', ' +
                   '''' + Valor[8]  + ''', ' +
                   '''' + Valor[9]  + ''', ' +
                          Valor[10] + ')');
  end
  else begin
    Query1.SQL.Add('UPDATE usuarios SET ');
    Query1.SQL.Add ('CODIGO_USUARIO = '''  + Valor[0] + ''', ');
    Query1.SQL.Add ('NOME_USUARIO = '''    + Valor[1] + ''', ');
    Query1.SQL.Add ('SENHA_USUARIO = '''   + Valor[2] + ''', ');
    Query1.SQL.Add ('ERRO_EMAIL_FROM = ''' + Valor[3] + ''', ');
    Query1.SQL.Add ('ERRO_NOME_FROM = '''  + Valor[4] + ''', ');
    Query1.SQL.Add ('ERRO_EMAIL_TO = '''   + Valor[5] + ''', ');
    Query1.SQL.Add ('ERRO_NOME_TO = '''    + Valor[6] + ''', ');
    Query1.SQL.Add ('ERRO_SMTP = '''       + Valor[7] + ''', ');
    Query1.SQL.Add ('ERRO_USERNAME = '''   + Valor[8] + ''', ');
    Query1.SQL.Add ('ERRO_PASSWORD = '''   + Valor[9] + ''', ');
    Query1.SQL.Add ('VENDEDOR_SQ = '       + Valor[10]);
    Query1.SQL.Add ('WHERE USUARIO_SQ = ' + InttoStr (Chave));
  end;
  Query1.ExecSQL;

  if novo = 255 then
  begin
    Query1.SQL.Clear;
    Query1.SQL.Add('SELECT LAST_INSERT_ID() as CHAVE');
    Query1.Open;
    Chave := Query1.FieldByName('CHAVE').AsInteger;
  end;
end;
}
{
procedure TServer.gravaNBM(Valor: OleVariant; Novo: Byte; var Chave: Integer);
begin
  Query1.SQL.Clear;
  if novo = 255 then
    Query1.SQL.Add('INSERT INTO nbm (' +
                   'CODIGO_NBM, ALIQ_ICMS, ' +
                   'ALIQ_IPI, ALIQ_IVA) ' +
                   'VALUES (' +
                   QuotedStr(Valor[0]) + ', ' +
                   QuotedStr(FloattoStr (Valor[1])) + ', ' +
                   QuotedStr(FloattoStr (Valor[2])) + ', ' +
                   QuotedStr(FloattoStr (Valor[3])) + ')')
  else begin
    Query1.SQL.Add('UPDATE nbm SET ');
    Query1.SQL.Add ('CODIGO_NBM = ' + QuotedStr(Valor[0]));
    Query1.SQL.Add (',ALIQ_ICMS = ' + QuotedStr(FloattoStr(Valor[1])));
    Query1.SQL.Add (',ALIQ_IPI = '  + QuotedStr(FloattoStr(Valor[2])));
    Query1.SQL.Add (',ALIQ_IVA = '  + QuotedStr(FloattoStr(Valor[3])));
    Query1.SQL.Add ('WHERE NBM_SQ = ' + InttoStr (Chave));
  end;

  if novo = 0 then
  begin
    Query2.SQL.Clear;
    Query2.SQL.Add('select * from nbm where nbm_sq = ' + IntToStr(Chave));
    Query2.Open;
    if Query2.FieldByName('codigo_nbm').AsString <> Valor[0] then
      observacao := observacao + 'Alteração do NCM (' + Query2.FieldByName('codigo_nbm').AsString + ' -> ' + Valor[0] + ')' + chr(13);
    if Query2.FieldByName('aliq_icms').AsFloat <> Valor[1] then
      observacao := observacao + 'Alteração da Aliquota do ICMS (' + Query2.FieldByName('aliq_icms').AsString + ' -> ' + FloattoStr(Valor[1]) + ')' + chr(13);
    if Query2.FieldByName('aliq_ipi').AsFloat <> Valor[2] then
      observacao := observacao + 'Alteração da Aliquota do IPI (' + Query2.FieldByName('aliq_ipi').AsString + ' -> ' + FloattoStr(Valor[2]) + ')' + chr(13);
    if Query2.FieldByName('aliq_iva').AsFloat <> Valor[3] then
      observacao := observacao + 'Alteração da Aliquota do IVA (' + Query2.FieldByName('aliq_iva').AsString + ' -> ' + FloattoStr(Valor[3]) + ')' + chr(13);
  end;

  Query1.ExecSQL;

  if novo = 255 then
  begin
    Query1.SQL.Clear;
    Query1.SQL.Add('SELECT LAST_INSERT_ID() as CHAVE');
    Query1.Open;
    Chave := Query1.FieldByName('CHAVE').AsInteger;
  end;

end;
}
{
procedure TServer.gravaNatureza(Valor: OleVariant; Novo: Byte; var Chave: Integer);
begin
      if Valor[7] = 0 then
        Valor[7] := 'E' else
        Valor[7] := 'S';

      if Valor[9] then
        Valor[9] := 'S' else
        Valor[9] := 'N';

      if Valor[10] then
        Valor[10] := 'S' else
        Valor[10] := 'N';

      if Valor[11] then
        Valor[11] := 'S' else
        Valor[11] := 'N';

      Query1.SQL.Clear;
      if novo = 255 then
      begin
        Query1.SQL.Add('INSERT INTO naturezas (' +
                       'CODIGO_NATUREZA, DESCRICAO_NATUREZA, ' +
                       'DESCRICAO_NATUREZA_NFISCAL, CFO, ' +
                       'ALIQ_ICMS, ALIQ_IPI, ' +
                       'TIPO_NFISCAL, ' +
                       'ENT_SAI, OBSERVACAO, ' +
                       'ISENCAO_ICMS, ISENCAO_IPI, ' +
                       'ICMS_SUBST, CFO_SUBST, ' +
                       'UF01, UF02, UF03, UF04, UF05, ' +
                       'UF06, UF07, UF08, UF09, UF10, ' +
                       'UF11, UF12, UF13, UF14, UF15, ' +
                       'UF16, UF17, UF18, UF19, UF20, ' +
                       'UF21, UF22, UF23, UF24, UF25, ' +
                       'UF26, UF27, UF28, UF29, UF30) ' +
                       'VALUES (' +
                       '''' + Valor[0]  + ''', ' +
                       '''' + Valor[1]  + ''', ' +
                       '''' + Valor[2]  + ''', ' +
                       '''' + Valor[3]  + ''', ' +
                       '''' + FloattoStr(Valor[4]) + ''', ' +
                       '''' + FloattoStr(Valor[5]) + ''', ' +
                       '''' + InttoStr(Valor[6]) + ''', ' +
                       '''' + Valor[7]  + ''', ' +
                       '''' + Valor[8]  + ''', ' +
                       '''' + Valor[9]  + ''', ' +
                       '''' + Valor[10] + ''', ' +
                       '''' + Valor[11] + ''', ' +
                       '''' + Valor[13] + ''', ' +
                       '''' + Valor[12][0]   + ''', ' +
                       '''' + Valor[12][1]   + ''', ' +
                       '''' + Valor[12][2]   + ''', ' +
                       '''' + Valor[12][3]   + ''', ' +
                       '''' + Valor[12][4]   + ''', ' +
                       '''' + Valor[12][5]   + ''', ' +
                       '''' + Valor[12][6]   + ''', ' +
                       '''' + Valor[12][7]   + ''', ' +
                       '''' + Valor[12][8]   + ''', ' +
                       '''' + Valor[12][9]   + ''', ' +
                       '''' + Valor[12][10]  + ''', ' +
                       '''' + Valor[12][11]  + ''', ' +
                       '''' + Valor[12][12]  + ''', ' +
                       '''' + Valor[12][13]  + ''', ' +
                       '''' + Valor[12][14]  + ''', ' +
                       '''' + Valor[12][15]  + ''', ' +
                       '''' + Valor[12][16]  + ''', ' +
                       '''' + Valor[12][17]  + ''', ' +
                       '''' + Valor[12][18]  + ''', ' +
                       '''' + Valor[12][19]  + ''', ' +
                       '''' + Valor[12][20]  + ''', ' +
                       '''' + Valor[12][21]  + ''', ' +
                       '''' + Valor[12][22]  + ''', ' +
                       '''' + Valor[12][23]  + ''', ' +
                       '''' + Valor[12][24]  + ''', ' +
                       '''' + Valor[12][25]  + ''', ' +
                       '''' + Valor[12][26]  + ''', ' +
                       '''' + Valor[12][27]  + ''', ' +
                       '''' + Valor[12][28]  + ''', ' +
                       '''' + Valor[12][29]  + ''')');
      end
      else begin
        Query1.SQL.Add('UPDATE naturezas SET ');
        Query1.SQL.Add ('CODIGO_NATUREZA = '''            +            Valor[0]      + ''', ');
        Query1.SQL.Add ('DESCRICAO_NATUREZA = '''         +            Valor[1]      + ''', ');
        Query1.SQL.Add ('DESCRICAO_NATUREZA_NFISCAL = ''' +            Valor[2]      + ''', ');
        Query1.SQL.Add ('CFO = '''                        +            Valor[3]      + ''', ');
        Query1.SQL.Add ('ALIQ_ICMS = '''                  + FloattoStr(Valor[4])     + ''', ');
        Query1.SQL.Add ('ALIQ_IPI = '''                   + FloattoStr(Valor[5])     + ''', ');
        Query1.SQL.Add ('TIPO_NFISCAL = '''               + InttoStr  (Valor[6])     + ''', ');
        Query1.SQL.Add ('ENT_SAI = '''                    +            Valor[7]      + ''', ');
        Query1.SQL.Add ('OBSERVACAO = '''                 +            Valor[8]      + ''', ');
        Query1.SQL.Add ('ISENCAO_ICMS = '''               +            Valor[9]      + ''', ');
        Query1.SQL.Add ('ISENCAO_IPI = '''                +            Valor[10]     + ''', ');
        Query1.SQL.Add ('ICMS_SUBST = '''                 +            Valor[11]     + ''', ');
        Query1.SQL.Add ('CFO_SUBST = '''                  +            Valor[13]     + ''', ');
        Query1.SQL.Add ('UF01 = '''                       +            Valor[12][00] + ''', ');
        Query1.SQL.Add ('UF02 = '''                       +            Valor[12][01] + ''', ');
        Query1.SQL.Add ('UF03 = '''                       +            Valor[12][02] + ''', ');
        Query1.SQL.Add ('UF04 = '''                       +            Valor[12][03] + ''', ');
        Query1.SQL.Add ('UF05 = '''                       +            Valor[12][04] + ''', ');
        Query1.SQL.Add ('UF06 = '''                       +            Valor[12][05] + ''', ');
        Query1.SQL.Add ('UF07 = '''                       +            Valor[12][06] + ''', ');
        Query1.SQL.Add ('UF08 = '''                       +            Valor[12][07] + ''', ');
        Query1.SQL.Add ('UF09 = '''                       +            Valor[12][08] + ''', ');
        Query1.SQL.Add ('UF10 = '''                       +            Valor[12][09] + ''', ');
        Query1.SQL.Add ('UF11 = '''                       +            Valor[12][10] + ''', ');
        Query1.SQL.Add ('UF12 = '''                       +            Valor[12][11] + ''', ');
        Query1.SQL.Add ('UF13 = '''                       +            Valor[12][12] + ''', ');
        Query1.SQL.Add ('UF14 = '''                       +            Valor[12][13] + ''', ');
        Query1.SQL.Add ('UF15 = '''                       +            Valor[12][14] + ''', ');
        Query1.SQL.Add ('UF16 = '''                       +            Valor[12][15] + ''', ');
        Query1.SQL.Add ('UF17 = '''                       +            Valor[12][16] + ''', ');
        Query1.SQL.Add ('UF18 = '''                       +            Valor[12][17] + ''', ');
        Query1.SQL.Add ('UF19 = '''                       +            Valor[12][18] + ''', ');
        Query1.SQL.Add ('UF20 = '''                       +            Valor[12][19] + ''', ');
        Query1.SQL.Add ('UF21 = '''                       +            Valor[12][20] + ''', ');
        Query1.SQL.Add ('UF22 = '''                       +            Valor[12][21] + ''', ');
        Query1.SQL.Add ('UF23 = '''                       +            Valor[12][22] + ''', ');
        Query1.SQL.Add ('UF24 = '''                       +            Valor[12][23] + ''', ');
        Query1.SQL.Add ('UF25 = '''                       +            Valor[12][24] + ''', ');
        Query1.SQL.Add ('UF26 = '''                       +            Valor[12][25] + ''', ');
        Query1.SQL.Add ('UF27 = '''                       +            Valor[12][26] + ''', ');
        Query1.SQL.Add ('UF28 = '''                       +            Valor[12][27] + ''', ');
        Query1.SQL.Add ('UF29 = '''                       +            Valor[12][28] + ''', ');
        Query1.SQL.Add ('UF30 = '''                       +            Valor[12][29] + ''' ');
        Query1.SQL.Add ('WHERE NATUREZA_SQ = ' + InttoStr (Chave));
      end;
      Query1.ExecSQL;
      
  if novo = 255 then
  begin
    Query1.SQL.Clear;
    Query1.SQL.Add('SELECT LAST_INSERT_ID() as CHAVE');
    Query1.Open;
    Chave := Query1.FieldByName('CHAVE').AsInteger;
  end;

end;
}
{
procedure TServer.gravaDuplicata(Valor: OleVariant; Novo: Byte; var Chave: Integer);
var
  i: Integer;
begin
  Query1.SQL.Clear;
  if novo = 255 then
  begin
    Query1.SQL.Add('INSERT INTO duplicatas (' +
                   'NUMERO_DUPLICATA, ITEM_DUPLICATA, ' +
                   'SEQ_DUPLICATA, NFISCAL_SQ, ' +
                   'VALOR_DUPLICATA, DTEMISSAO_DUPLICATA, ' +
                   'DTVENCTO_DUPLICATA, juros_duplicata, ' +
                   'desconto_duplicata) ' +
                   'VALUES (' +
                   QuotedStr(InttoStr   (Valor[0])) + ', ' +
                   QuotedStr(InttoStr   (Valor[1])) + ', ' +
                   QuotedStr('0')                   + ', ' +
                   QuotedStr(InttoStr   (Valor[2])) + ', ' +
                   QuotedStr(FloattoStr (Valor[3])) + ', ' +
                   QuotedStr(FormatDateTime  ('yyyy-mm-dd', Valor[4])) + ', ' +
                   QuotedStr(FormatDateTime  ('yyyy-mm-dd', Valor[5])) + ', ' +
                   QuotedStr(FloattoStr (Valor[6])) + ', ' +
                   QuotedStr(FloattoStr (Valor[7])) + ')');
  end
  else begin
    Query1.SQL.Add('UPDATE duplicatas SET ');
    Query1.SQL.Add ('NUMERO_DUPLICATA = '    + QuotedStr(IntToStr                    (Valor[0])) + ', ');
    Query1.SQL.Add ('ITEM_DUPLICATA = '      + QuotedStr(IntToStr                    (Valor[1])) + ', ');
    Query1.SQL.Add ('SEQ_DUPLICATA = 0, ');
    Query1.SQL.Add ('NFISCAL_SQ = '          + QuotedStr(InttoStr                    (Valor[2])) + ', ');
    Query1.SQL.Add ('VALOR_DUPLICATA = '     + QuotedStr(FloattoStr                  (Valor[3])) + ', ');
    Query1.SQL.Add ('DTEMISSAO_DUPLICATA = ' + QuotedStr(FormatDateTime('yyyy-mm-dd', Valor[4])) + ', ');
    Query1.SQL.Add ('DTVENCTO_DUPLICATA = '  + QuotedStr(FormatDateTime('yyyy-mm-dd', Valor[5])) + ', ');
    Query1.SQL.Add ('juros_duplicata = '     + QuotedStr(FloattoStr                  (Valor[6])) + ', ');
    Query1.SQL.Add ('desconto_duplicata = '  + QuotedStr(FloattoStr                  (Valor[7])));
    Query1.SQL.Add ('WHERE DUPLICATA_SQ = '  + InttoStr(Chave));
  end;
  Query1.ExecSQL;

  if novo = 255 then
  begin
    Query1.SQL.Clear;
    Query1.SQL.Add('SELECT LAST_INSERT_ID() as CHAVE');
    Query1.Open;
    Chave := Query1.FieldByName('CHAVE').AsInteger;
  end;

  if Valor[8] = null then
    Exit;

  Query2.SQL.Clear;
  Query2.SQL.Add('select * from duplicatas_pgto where duplicata_sq = ' + IntToStr(Chave));
  Query2.Open;
  While not Query2.Eof do
  begin
    for i := 0 to Valor[8] do
      if Valor[9][i][0] = Query2.FieldByName('duplicata_pgto_sq').AsInteger then
        Break;

    if i > Valor[8] then
    begin
      observacao := observacao + 'Exclusão de pagamento (' + Query2.FieldByName('dt_pgto').AsString + ', ' + Query2.FieldByName('valor_pgto').AsString + ')' + chr(13);
      Query1.SQL.Text := 'delete from duplicatas_pgto where duplicata_pgto_sq = ' + Query2.FieldByName('duplicata_pgto_sq').AsString;
      Query1.ExecSQL;
    end;

    Query2.Next;
  end;

  for i := 0 to Valor[8] do
  if Valor[9][i][0] > 0 then
  begin
    Query2.SQL.Clear;
    Query2.SQL.Add('select * from duplicatas_pgto where duplicata_pgto_sq = ' + IntToStr(Valor[9][i][0]));
    Query2.Open;
    if Query2.FieldByName('dt_pgto').AsDateTime <> Valor[9][i][2] then
      observacao := observacao + 'Alteração da data de pagamento (' + Query2.FieldByName('dt_pgto').AsString + ' -> ' + DateTimeToStr(Valor[9][i][2]) + ')' + chr(13);

    if Query2.FieldByName('valor_pgto').AsCurrency <> Valor[9][i][3] then
      observacao := observacao + 'Alteração do valor pago (' + Query2.FieldByName('valor_pgto').AsString + ' -> ' + FloatToStr(Valor[9][i][3]) + ')' + chr(13);

    Query1.SQL.Clear;
    Query1.SQL.Add('UPDATE duplicatas_pgto SET ');
    Query1.SQL.Add ('dt_pgto = '                 + QuotedStr(FormatDateTime('yyyy-mm-dd', Valor[9][i][2])) + ', ');
    Query1.SQL.Add ('valor_pgto = '              + QuotedStr(FloatToStr(Valor[9][i][3])) + ', ');
    Query1.SQL.Add ('forma_pgto = '              + QuotedStr(Valor[9][i][4]) + ', ');
    Query1.SQL.Add ('observacao = '              + QuotedStr(Valor[9][i][5]));
    Query1.SQL.Add ('WHERE duplicata_pgto_sq = ' + InttoStr (Valor[9][i][0]));
    Query1.ExecSQL;
  end
  else begin
    observacao := observacao + 'Inclusão de pagamento (' + DateTimeToStr(Valor[9][i][2]) + ', ' + FloatToStr(Valor[9][i][3]) + ')' + chr(13);
    Query1.SQL.Clear;
    Query1.SQL.Add('INSERT INTO duplicatas_pgto (' +
                   'duplicata_sq, ' +
                   'dt_pgto, valor_pgto, ' +
                   'forma_pgto, observacao) ' +
                   'VALUES (' +
                   QuotedStr(InttoStr (Chave)) + ', ' +
                   QuotedStr(FormatDateTime('yyyy-mm-dd', Valor[9][i][2])) + ', ' +
                   QuotedStr(FloatToStr (Valor[9][i][3])) + ', ' +
                   QuotedStr(Valor[9][i][4]) + ', ' +
                   QuotedStr(Valor[9][i][5]) + ')');
    Query1.ExecSQL;
  end;
end;
}
{
procedure TServer.gravaKardex(Valor: OleVariant; Novo: Byte; var Chave: Integer);
var
  tipo_nfiscal, Qtde: Integer;
  sinal: String;
begin
  Qtde := Valor[2]+Valor[3]+Valor[4];

  if Valor[10] = Null then
    Valor[10] := 'null'
  else
    Valor[10] := QuotedStr(IntToStr(Valor[10]));

      Query1.SQL.Clear;
      if novo = 255 then
      begin
        Query1.SQL.Add('INSERT INTO kardex (' +
                       'PRODUTO_SQ, TIPO_MOV, ' +
                       'QTDE, DATA, ' +
                       'NFISCAL, VALOR, ' +
                       'USUARIO_SQ, NR_SERIE, ' +
                       'pedido_item_sq) ' +
                       'VALUES (' +
                       QuotedStr(InttoStr  (Valor[0])) + ', ' +
                       QuotedStr(Valor[1])  + ', ' +
                       QuotedStr(InttoStr  (Qtde)) + ', ' +
                       QuotedStr(FormatDateTime  ('yyyy-mm-dd hh:nn:ss', Valor[5])) + ', ' +
                       QuotedStr(InttoStr  (Valor[6])) + ', ' +
                       QuotedStr(FloattoStr(Valor[7])) + ', ' +
                       QuotedStr(InttoStr  (Valor[8])) + ', ' +
                       QuotedStr(Valor[9]) + ', ' +
                       Valor[10] + ') ');

      end
      else begin
        Query1.SQL.Add('UPDATE kardex SET ');
        Query1.SQL.Add ('PRODUTO_SQ = '   + QuotedStr(InttoStr                             (Valor[0])) + ', ');
        Query1.SQL.Add ('TIPO_MOV = '     + QuotedStr(                                      Valor[1] ) + ', ');
        Query1.SQL.Add ('QTDE = '         + QuotedStr(InttoStr                             (Qtde))     + ', ');
        Query1.SQL.Add ('DATA = '         + QuotedStr(FormatDateTime('yyyy-mm-dd hh:nn:ss', Valor[5])) + ', ');
        Query1.SQL.Add ('NFISCAL = '      + QuotedStr(IntToStr                             (Valor[6])) + ', ');
        Query1.SQL.Add ('VALOR = '        + QuotedStr(FloattoStr                           (Valor[7])) + ', ');
        Query1.SQL.Add ('USUARIO_SQ = '   + QuotedStr(InttoStr                             (Valor[8])) + ', ');
        Query1.SQL.Add ('NR_SERIE = '     + QuotedStr(                                      Valor[9] ) + ', ');
        Query1.SQL.Add ('pedido_item_sq ' +                                       Valor[10]);
        Query1.SQL.Add ('WHERE KARDEX_SQ = ' + InttoStr (Chave));
      end;
      Query1.ExecSQL;

      if novo = 255 then
      begin
        Query1.SQL.Clear;
        Query1.SQL.Add('SELECT LAST_INSERT_ID() as CHAVE');
        Query1.Open;
        Chave := Query1.FieldByName('CHAVE').AsInteger;
      end;

      if novo = 255 then
      begin
        if Valor[1] = 'S' then Qtde := Qtde * (-1);

        if Valor[1] = 'S' then
          sinal := '-'
        else
          sinal := '+';

        Query1.SQL.Clear;
        Query1.SQL.Add('select TIPO_NFISCAL from kardex K');
        Query1.SQL.Add('left outer join nfiscais N on (N.NUMERO_NFISCAL = K.NFISCAL)');
        Query1.SQL.Add('left outer join naturezas NA on (NA.NATUREZA_SQ = N.NATUREZA_SQ)');
        Query1.SQL.Add('where KARDEX_SQ = ' + InttoStr (chave));
        Query1.Open;
        if Query1.FieldByName('TIPO_NFISCAL').IsNull then
          tipo_nfiscal := 0
        else
          tipo_nfiscal := Query1.FieldByName ('TIPO_NFISCAL').AsInteger;

        Query1.SQL.Clear;
        if (tipo_nfiscal = 0) or (tipo_nfiscal = 1) or (tipo_nfiscal = 4)
        or (tipo_nfiscal = 5) or (tipo_nfiscal = 6) then
        begin
          Query1.SQL.Add('UPDATE produtos SET');
          if tipo_nfiscal = 1 then
          begin
              Query1.SQL.Add('QTDE_PRODUTO_DEMO = QTDE_PRODUTO_DEMO + ' + InttoStr (Qtde));
              Query1.SQL.Add(', QTDE_PRODUTO_DEMO_CLI = QTDE_PRODUTO_DEMO_CLI - ' + InttoStr (Qtde));
          end
          else
          begin
              Query1.SQL.Add('QTDE_PRODUTO_LOJA    = QTDE_PRODUTO_LOJA '    + sinal + ' ' + InttoStr (Valor[2]));
              Query1.SQL.Add(',QTDE_PRODUTO_ARMAZEM = QTDE_PRODUTO_ARMAZEM ' + sinal + ' ' + InttoStr (Valor[3]));
              Query1.SQL.Add(',QTDE_PRODUTO_DEMO    = QTDE_PRODUTO_DEMO '    + sinal + ' ' + InttoStr (Valor[4]));
          end;

          Query1.SQL.Add('WHERE PRODUTO_SQ = ' + InttoStr (Valor[0]));
          Query1.ExecSQL;
        end
        else if tipo_nfiscal = 10 then
        begin
          Query1.SQL.Add('UPDATE produtos SET');
          Query1.SQL.Add('  QTDE_PRODUTO_LOJA    = QTDE_PRODUTO_LOJA '    + IfThen(Valor[1] = 'S', '- ', '+ ') + IntToStr(Valor[2]+Valor[3]+Valor[4]));
          Query1.SQL.Add(', QTDE_PRODUTO_ARMAZEM = QTDE_PRODUTO_ARMAZEM ' + IfThen(Valor[1] = 'S', '+ ', '- ') + IntToStr(Valor[2]+Valor[3]+Valor[4]));
          Query1.SQL.Add('WHERE PRODUTO_SQ = ' + InttoStr (Valor[0]));
          Query1.ExecSQL;
        end
        else if tipo_nfiscal = 11 then
        begin
          Query1.SQL.Add('UPDATE produtos SET');
          Query1.SQL.Add('  QTDE_PRODUTO_ARMAZEM = QTDE_PRODUTO_ARMAZEM ' + IfThen(Valor[1] = 'S', '- ', '+ ') + IntToStr(Valor[2]+Valor[3]+Valor[4]));
          Query1.SQL.Add(', QTDE_PRODUTO_LOJA    = QTDE_PRODUTO_LOJA '    + IfThen(Valor[1] = 'S', '+ ', '- ') + IntToStr(Valor[2]+Valor[3]+Valor[4]));
          Query1.SQL.Add('WHERE PRODUTO_SQ = ' + InttoStr (Valor[0]));
          Query1.ExecSQL;
        end;
      end;
end;
}
{
procedure TServer.gravaNfDemonstracao(Valor: OleVariant; Novo: Byte; var Chave: Integer);
begin
  if Valor[1] = 0 then
    Valor[1] := 'null' else
    Valor[1] := QuotedStr(FormatDateTime('yyyy-mm-dd', Valor[1]));

  if Valor[3] then
    Valor[3] := 'S' else
    Valor[3] := 'N';

  Query1.SQL.Clear;
  Query1.SQL.Add('UPDATE nfiscais SET');
  Query1.SQL.Add('NR_NFISCAL_RETORNO = ''' + InttoStr (Valor[0]) + ''', ');
  Query1.SQL.Add('DT_NFISCAL_RETORNO = ' + Valor[1] + ', ');
  Query1.SQL.Add('NATUREZA_RET_DEM   = ''' + InttoStr (Valor[2]) + ''', ');
  Query1.SQL.Add('RETORNO_PRODUTO    = ''' + Valor[3] + ''', ');
  Query1.SQL.Add('RETORNO_OBSERVACAO = ''' + Valor[4] + ''' ');
  Query1.SQL.Add('WHERE NFISCAL_SQ = ' + InttoStr (Chave));
  Query1.ExecSQL;
end;
}
{
procedure TServer.gravaCondPagto(Valor: OleVariant; Novo: Byte; var Chave: Integer);
begin
      Query1.SQL.Clear;
      if novo = 255 then
      begin
        Query1.SQL.Add('INSERT INTO cond_pagto (' +
                       'CODIGO_COND_PAGTO, DESCRICAO_COND_PAGTO, ' +
                       'PARCELAS, D00, ' +
                       'D01, D02, ' +
                       'D03, D04, ' +
                       'D05, D06, ' +
                       'D07, D08, ' +
                       'D09, P00, ' +
                       'P01, P02, ' +
                       'P03, P04, ' +
                       'P05, P06, ' +
                       'P07, P08, ' +
                       'P09) ' +
                       'VALUES (' +
                       '''' + Valor[0]  + ''', ' +
                       '''' + Valor[1]  + ''', ' +
                       '''' + InttoStr  (Valor[2])  + ''', ' +
                       '''' + InttoStr  (Valor[3])  + ''', ' +
                       '''' + InttoStr  (Valor[4])  + ''', ' +
                       '''' + InttoStr  (Valor[5])  + ''', ' +
                       '''' + InttoStr  (Valor[6])  + ''', ' +
                       '''' + InttoStr  (Valor[7])  + ''', ' +
                       '''' + InttoStr  (Valor[8])  + ''', ' +
                       '''' + InttoStr  (Valor[9])  + ''', ' +
                       '''' + InttoStr  (Valor[10]) + ''', ' +
                       '''' + InttoStr  (Valor[11]) + ''', ' +
                       '''' + InttoStr  (Valor[12]) + ''', ' +
                       '''' + InttoStr  (Valor[13]) + ''', ' +
                       '''' + InttoStr  (Valor[14]) + ''', ' +
                       '''' + InttoStr  (Valor[15]) + ''', ' +
                       '''' + InttoStr  (Valor[16]) + ''', ' +
                       '''' + InttoStr  (Valor[17]) + ''', ' +
                       '''' + InttoStr  (Valor[18]) + ''', ' +
                       '''' + InttoStr  (Valor[19]) + ''', ' +
                       '''' + InttoStr  (Valor[20]) + ''', ' +
                       '''' + InttoStr  (Valor[21]) + ''', ' +
                       '''' + InttoStr  (Valor[22]) + ''')');
      end
      else begin
        Query1.SQL.Add('UPDATE cond_pagto SET ');
        Query1.SQL.Add ('CODIGO_COND_PAGTO = '''    +            Valor[0]   + ''', ');
        Query1.SQL.Add ('DESCRICAO_COND_PAGTO = ''' +            Valor[1]   + ''', ');
        Query1.SQL.Add ('PARCELAS = '''               + InttoStr(Valor[2])  + ''', ');
        Query1.SQL.Add ('D00 = '''                    + InttoStr(Valor[3])  + ''', ');
        Query1.SQL.Add ('D01 = '''                    + InttoStr(Valor[4])  + ''', ');
        Query1.SQL.Add ('D02 = '''                    + InttoStr(Valor[5])  + ''', ');
        Query1.SQL.Add ('D03 = '''                    + InttoStr(Valor[6])  + ''', ');
        Query1.SQL.Add ('D04 = '''                    + InttoStr(Valor[7])  + ''', ');
        Query1.SQL.Add ('D05 = '''                    + InttoStr(Valor[8])  + ''', ');
        Query1.SQL.Add ('D06 = '''                    + InttoStr(Valor[9])  + ''', ');
        Query1.SQL.Add ('D07 = '''                    + InttoStr(Valor[10]) + ''', ');
        Query1.SQL.Add ('D08 = '''                    + InttoStr(Valor[11]) + ''', ');
        Query1.SQL.Add ('D09 = '''                    + InttoStr(Valor[12]) + ''', ');
        Query1.SQL.Add ('P00 = '''                    + InttoStr(Valor[13]) + ''', ');
        Query1.SQL.Add ('P01 = '''                    + InttoStr(Valor[14]) + ''', ');
        Query1.SQL.Add ('P02 = '''                    + InttoStr(Valor[15]) + ''', ');
        Query1.SQL.Add ('P03 = '''                    + InttoStr(Valor[16]) + ''', ');
        Query1.SQL.Add ('P04 = '''                    + InttoStr(Valor[17]) + ''', ');
        Query1.SQL.Add ('P05 = '''                    + InttoStr(Valor[18]) + ''', ');
        Query1.SQL.Add ('P06 = '''                    + InttoStr(Valor[19]) + ''', ');
        Query1.SQL.Add ('P07 = '''                    + InttoStr(Valor[20]) + ''', ');
        Query1.SQL.Add ('P08 = '''                    + InttoStr(Valor[21]) + ''', ');
        Query1.SQL.Add ('P09 = '''                    + InttoStr(Valor[22]) + ''' ');
        Query1.SQL.Add ('WHERE COND_PAGTO_SQ = ' + InttoStr (Chave));
      end;
      Query1.ExecSQL;

  if novo = 255 then
  begin
    Query1.SQL.Clear;
    Query1.SQL.Add('SELECT LAST_INSERT_ID() as CHAVE');
    Query1.Open;
    Chave := Query1.FieldByName('CHAVE').AsInteger;
  end;
end;
}
{
procedure TServer.gravaTipoCliente(Valor: OleVariant; Novo: Byte; var Chave: Integer);
begin
  Query1.SQL.Clear;
  if novo = 255 then
  begin
    Query1.SQL.Add('INSERT INTO tipo_cliente (' +
                   'descricao_tipo) ' +
                   'VALUES (' +
                   QuotedStr(Valor[0])  + ')');
  end
  else begin
    Query1.SQL.Add('UPDATE tipo_cliente SET ');
    Query1.SQL.Add ('descricao_tipo = ' + QuotedStr(Valor[0]));
    Query1.SQL.Add ('WHERE tipo_cliente_sq = ' + InttoStr (Chave));
  end;
  Query1.ExecSQL;

  if novo = 255 then
  begin
    Query1.SQL.Clear;
    Query1.SQL.Add('SELECT LAST_INSERT_ID() as CHAVE');
    Query1.Open;
    Chave := Query1.FieldByName('CHAVE').AsInteger;
  end;
end;
}
{
procedure TServer.gravaCliente(Valor: OleVariant; Novo: Byte; var Chave: Integer);
var
  i: Integer;
  s, nfiscal_item_sq: String;
begin
      if Valor[30] then
        Valor[30] := 'S' else
        Valor[30] := 'N';

      if Valor[8] = null then
        Valor[8] := 'null'
      else
        Valor[8] := QuotedStr(Valor[8]);

      if (Valor[29] = null) or (Valor[29] = 0) then
        Valor[29] := 'null'
      else
        Valor[29] := IntToStr(Valor[29]);

      if (Valor[33] = null) or (Valor[33] = 0) then
        Valor[33] := 'null'
      else
        Valor[33] := IntToStr(Valor[33]);

      if (Valor[39] = null) or (Valor[39] = 0) then
        Valor[39] := 'null'
      else
        Valor[39] := IntToStr(Valor[39]);

      Query1.SQL.Clear;
      if novo = 255 then
      begin
        Query1.SQL.Add('INSERT INTO clientes (' +
                       'CODIGO_CLIENTE, NOME_CLIENTE, ' +
                       'INSCR_ESTADUAL, ENDERECO, ' +
                       'NUMERO, BAIRRO, ' +
                       'COMPL_ENDERECO, CIDADE, ' +
                       'ESTADO, CEP, ' +
                       'DDD_FONE1, NUMERO_FONE1, ' +
                       'COMPL_FONE1, DDD_FONE2, ' +
                       'NUMERO_FONE2, COMPL_FONE2, ' +
                       'DDD_FONE3, NUMERO_FONE3, ' +
                       'COMPL_FONE3, DDD_CELULAR, ' +
                       'NUMERO_CELULAR, COMPL_CELULAR, ' +
                       'DDD_FAX, NUMERO_FAX, ' +
                       'COMPL_FAX, E_MAIL, ' +
                       'WEB_SITE, CONTATO, ' +
                       'PAIS, TIPO_CLIENTE_SQ, ' +
                       'BIRO, DATA_ALT, ' +
                       'USUARIO_SQ_ALT, TRANSPORTADORA_SQ, ' +
                       'DATA_CADASTRO, OBSERVACAO, ' +
                       'vendedor_sq) ' +
                       'VALUES (' +
                       '''' + Valor[0]  + ''', ' +
                       '''' + Valor[1]  + ''', ' +
                       '''' + Valor[2]  + ''', ' +
                       '''' + Valor[3]  + ''', ' +
                       '''' + Valor[4]  + ''', ' +
                       '''' + Valor[5]  + ''', ' +
                       '''' + Valor[6]  + ''', ' +
                       '''' + Valor[7]  + ''', ' +
                              Valor[8]  + ', '   +
                       '''' + Valor[9]  + ''', ' +
                       '''' + Valor[10] + ''', ' +
                       '''' + Valor[11] + ''', ' +
                       '''' + Valor[12] + ''', ' +
                       '''' + Valor[13] + ''', ' +
                       '''' + Valor[14] + ''', ' +
                       '''' + Valor[15] + ''', ' +
                       '''' + Valor[16] + ''', ' +
                       '''' + Valor[17] + ''', ' +
                       '''' + Valor[18] + ''', ' +
                       '''' + Valor[19] + ''', ' +
                       '''' + Valor[20] + ''', ' +
                       '''' + Valor[21] + ''', ' +
                       '''' + Valor[22] + ''', ' +
                       '''' + Valor[23] + ''', ' +
                       '''' + Valor[24] + ''', ' +
                       '''' + Valor[25] + ''', ' +
                       '''' + Valor[26] + ''', ' +
                       '''' + Valor[27] + ''', ' +
                       '''' + Valor[28] + ''', ' +
                              Valor[29] + ', ' +
                       '''' + Valor[30] + ''', ' +
                       '''' + FormatDateTime  ('yyyy-mm-dd', Valor[31])  + ''', ' +
                       '''' + InttoStr (Valor[32])  + ''', ' +
                              Valor[33]  + ', ' +
                       '''' + FormatDateTime  ('yyyy-mm-dd hh:nn:ss', Date+Time) + ''', ' +
                       '''' + Valor[38] + ''',' +
                       Valor[39] + ')');
      end
      else begin
        Query1.SQL.Add('SELECT * FROM clientes C ' +
          'LEFT OUTER JOIN transportadoras T ON (T.TRANSPORTADORA_SQ = C.TRANSPORTADORA_SQ) ' +
          'left outer join tipo_cliente tc on (tc.tipo_cliente_sq = C.tipo_cliente_sq) ' +
          'left outer join vendedores v on (v.vendedor_sq = C.vendedor_sq) ' +
          'WHERE CLIENTE_SQ = ' + InttoStr(Chave));
        Query1.Open;
        if Query1.FieldByName('CODIGO_CLIENTE').AsString    <> Valor[0]  then observacao := observacao + 'Código ('         + Query1.FieldByName('CODIGO_CLIENTE').AsString      + ' -> ' + Valor[0]  + ')' + chr(13);
        if Query1.FieldByName('NOME_CLIENTE').AsString      <> Valor[1]  then observacao := observacao + 'Nome ('           + Query1.FieldByName('NOME_CLIENTE').AsString        + ' -> ' + Valor[1]  + ')' + chr(13);
        if Query1.FieldByName('INSCR_ESTADUAL').AsString    <> Valor[2]  then observacao := observacao + 'Inscrição Estadual (' + Query1.FieldByName('INSCR_ESTADUAL').AsString  + ' -> ' + Valor[2]  + ')' + chr(13);
        if Query1.FieldByName('ENDERECO').AsString          <> Valor[3]  then observacao := observacao + 'Endereço ('       + Query1.FieldByName('ENDERECO').AsString            + ' -> ' + Valor[3]  + ')' + chr(13);
        if Query1.FieldByName('NUMERO').AsString            <> Valor[4]  then observacao := observacao + 'Número ('         + Query1.FieldByName('NUMERO').AsString              + ' -> ' + Valor[4]  + ')' + chr(13);
        if Query1.FieldByName('BAIRRO').AsString            <> Valor[5]  then observacao := observacao + 'Bairro ('         + Query1.FieldByName('BAIRRO').AsString              + ' -> ' + Valor[5]  + ')' + chr(13);
        if Query1.FieldByName('COMPL_ENDERECO').AsString    <> Valor[6]  then observacao := observacao + 'Complemento ('    + Query1.FieldByName('COMPL_ENDERECO').AsString      + ' -> ' + Valor[6]  + ')' + chr(13);
        if Query1.FieldByName('CIDADE').AsString            <> Valor[7]  then observacao := observacao + 'Cidade ('         + Query1.FieldByName('CIDADE').AsString              + ' -> ' + Valor[7]  + ')' + chr(13);
        if Query1.FieldByName('ESTADO').AsString            <> Valor[8]  then observacao := observacao + 'Estado ('         + Query1.FieldByName('ESTADO').AsString              + ' -> ' + Valor[8]  + ')' + chr(13);
        if Query1.FieldByName('CEP').AsString               <> Valor[9]  then observacao := observacao + 'CEP ('            + Query1.FieldByName('CEP').AsString                 + ' -> ' + Valor[9]  + ')' + chr(13);
        if Query1.FieldByName('DDD_FONE1').AsString         <> Valor[10] then observacao := observacao + 'DDD Fone 1 ('     + Query1.FieldByName('DDD_FONE1').AsString           + ' -> ' + Valor[10] + ')' + chr(13);
        if Query1.FieldByName('NUMERO_FONE1').AsString      <> Valor[11] then observacao := observacao + 'Numero Fone 1 ('  + Query1.FieldByName('NUMERO_FONE1').AsString        + ' -> ' + Valor[11] + ')' + chr(13);
        if Query1.FieldByName('COMPL_FONE1').AsString       <> Valor[12] then observacao := observacao + 'Compl. Fone 1 ('  + Query1.FieldByName('COMPL_FONE1').AsString         + ' -> ' + Valor[12] + ')' + chr(13);
        if Query1.FieldByName('DDD_FONE2').AsString         <> Valor[13] then observacao := observacao + 'DDD Fone 2 ('     + Query1.FieldByName('DDD_FONE2').AsString           + ' -> ' + Valor[13] + ')' + chr(13);
        if Query1.FieldByName('NUMERO_FONE2').AsString      <> Valor[14] then observacao := observacao + 'Numero Fone 2 ('  + Query1.FieldByName('NUMERO_FONE2').AsString        + ' -> ' + Valor[14] + ')' + chr(13);
        if Query1.FieldByName('COMPL_FONE2').AsString       <> Valor[15] then observacao := observacao + 'Compl. Fone 2 ('  + Query1.FieldByName('COMPL_FONE2').AsString         + ' -> ' + Valor[15] + ')' + chr(13);
        if Query1.FieldByName('DDD_FONE3').AsString         <> Valor[16] then observacao := observacao + 'DDD Fone 3 ('     + Query1.FieldByName('DDD_FONE3').AsString           + ' -> ' + Valor[16] + ')' + chr(13);
        if Query1.FieldByName('NUMERO_FONE3').AsString      <> Valor[17] then observacao := observacao + 'Numero Fone 3 ('  + Query1.FieldByName('NUMERO_FONE3').AsString        + ' -> ' + Valor[17] + ')' + chr(13);
        if Query1.FieldByName('COMPL_FONE3').AsString       <> Valor[18] then observacao := observacao + 'Compl. Fone 3 ('  + Query1.FieldByName('COMPL_FONE3').AsString         + ' -> ' + Valor[18] + ')' + chr(13);
        if Query1.FieldByName('DDD_CELULAR').AsString       <> Valor[19] then observacao := observacao + 'DDD Celular ('    + Query1.FieldByName('DDD_CELULAR').AsString         + ' -> ' + Valor[19] + ')' + chr(13);
        if Query1.FieldByName('NUMERO_CELULAR').AsString    <> Valor[20] then observacao := observacao + 'Numero Celular (' + Query1.FieldByName('NUMERO_CELULAR').AsString      + ' -> ' + Valor[20] + ')' + chr(13);
        if Query1.FieldByName('COMPL_CELULAR').AsString     <> Valor[21] then observacao := observacao + 'Compl. Celular (' + Query1.FieldByName('COMPL_CELULAR').AsString       + ' -> ' + Valor[21] + ')' + chr(13);
        if Query1.FieldByName('DDD_FAX').AsString           <> Valor[22] then observacao := observacao + 'DDD Fax ('        + Query1.FieldByName('DDD_FAX').AsString             + ' -> ' + Valor[22] + ')' + chr(13);
        if Query1.FieldByName('NUMERO_FAX').AsString        <> Valor[23] then observacao := observacao + 'Numero Fax ('     + Query1.FieldByName('NUMERO_FAX').AsString          + ' -> ' + Valor[23] + ')' + chr(13);
        if Query1.FieldByName('COMPL_FAX').AsString         <> Valor[24] then observacao := observacao + 'Compl. Fax ('     + Query1.FieldByName('COMPL_FAX').AsString           + ' -> ' + Valor[24] + ')' + chr(13);
        if Query1.FieldByName('E_MAIL').AsString            <> Valor[25] then observacao := observacao + 'E-Mail ('         + Query1.FieldByName('E_MAIL').AsString              + ' -> ' + Valor[25] + ')' + chr(13);
        if Query1.FieldByName('WEB_SITE').AsString          <> Valor[26] then observacao := observacao + 'Web site ('       + Query1.FieldByName('WEB_SITE').AsString            + ' -> ' + Valor[26] + ')' + chr(13);
        if Query1.FieldByName('CONTATO').AsString           <> Valor[27] then observacao := observacao + 'Contato ('        + Query1.FieldByName('CONTATO').AsString             + ' -> ' + Valor[27] + ')' + chr(13);
        if Query1.FieldByName('PAIS').AsString              <> Valor[28] then observacao := observacao + 'Pais ('           + Query1.FieldByName('PAIS').AsString                + ' -> ' + Valor[28] + ')' + chr(13);
        if (Valor[29] <> 'null') and (Query1.FieldByName('TIPO_CLIENTE_SQ').AsString <> Valor[29]) then
        begin
          Query2.SQL.Clear;
          Query2.SQL.Add('SELECT descricao_tipo FROM tipo_cliente WHERE tipo_cliente_sq = ' + Valor[29]);
          Query2.Open;
          observacao := observacao + 'Tipo cliente (' + Query1.FieldByName('descricao_tipo').AsString + ' -> ' + Query2.FieldByName('descricao_tipo').AsString + ')' + chr(13);
        end;
        if Query1.FieldByName('BIRO').AsString              <> Valor[30] then observacao := observacao + 'Biro ('           + Query1.FieldByName('BIRO').AsString                + ' -> ' + Valor[30] + ')' + chr(13);
        if (Valor[33] <> 'null') and (Query1.FieldByName('TRANSPORTADORA_SQ').AsString <> Valor[33]) then
        begin
          s := Query1.FieldByName('NOME_TRANSPORTADORA').AsString;
          Query1.SQL.Clear;
          Query1.SQL.Add('SELECT * FROM transportadoras WHERE TRANSPORTADORA_SQ = ' + Valor[33]);
          Query1.Open;
          observacao := observacao + 'Transportadora (' + s + ' -> ' + Query1.FieldByName('NOME_TRANSPORTADORA').AsString + ')' + chr(13);
        end;
        if (Valor[39] <> 'null') and (Query1.FieldByName('vendedor_sq').AsString <> Valor[39]) then
        begin
          Query2.SQL.Clear;
          Query2.SQL.Add('SELECT nome_vendedor FROM vendedores WHERE vendedor_sq = ' + Valor[39]);
          Query2.Open;
          observacao := observacao + 'Vendedor (' + Query1.FieldByName('nome_vendedor').AsString + ' -> ' + Query2.FieldByName('nome_vendedor').AsString + ')' + chr(13);
        end;
        Query1.SQL.Clear;

        Query1.SQL.Add('UPDATE clientes SET ');
        Query1.SQL.Add ('CODIGO_CLIENTE = '''    +           Valor[0] + ''', ');
        Query1.SQL.Add ('NOME_CLIENTE = '''      +           Valor[1] + ''', ');
        Query1.SQL.Add ('INSCR_ESTADUAL = '''    +           Valor[2] + ''', ');
        Query1.SQL.Add ('ENDERECO = '''          +           Valor[3] + ''', ');
        Query1.SQL.Add ('NUMERO = '''            +           Valor[4] + ''', ');
        Query1.SQL.Add ('BAIRRO = '''            +           Valor[5] + ''', ');
        Query1.SQL.Add ('COMPL_ENDERECO = '''    +           Valor[6] + ''', ');
        Query1.SQL.Add ('CIDADE = '''            +           Valor[7] + ''', ');
        Query1.SQL.Add ('ESTADO = '              +           Valor[8] + ', ');
        Query1.SQL.Add ('CEP = '''               +           Valor[9] + ''', ');
        Query1.SQL.Add ('DDD_FONE1 = '''         +           Valor[10] + ''', ');
        Query1.SQL.Add ('NUMERO_FONE1 = '''      +           Valor[11] + ''', ');
        Query1.SQL.Add ('COMPL_FONE1 = '''       +           Valor[12] + ''', ');
        Query1.SQL.Add ('DDD_FONE2 = '''         +           Valor[13] + ''', ');
        Query1.SQL.Add ('NUMERO_FONE2 = '''      +           Valor[14] + ''', ');
        Query1.SQL.Add ('COMPL_FONE2 = '''       +           Valor[15] + ''', ');
        Query1.SQL.Add ('DDD_FONE3 = '''         +           Valor[16] + ''', ');
        Query1.SQL.Add ('NUMERO_FONE3 = '''      +           Valor[17] + ''', ');
        Query1.SQL.Add ('COMPL_FONE3 = '''       +           Valor[18] + ''', ');
        Query1.SQL.Add ('DDD_CELULAR = '''       +           Valor[19] + ''', ');
        Query1.SQL.Add ('NUMERO_CELULAR = '''    +           Valor[20] + ''', ');
        Query1.SQL.Add ('COMPL_CELULAR = '''     +           Valor[21] + ''', ');
        Query1.SQL.Add ('DDD_FAX = '''           +           Valor[22] + ''', ');
        Query1.SQL.Add ('NUMERO_FAX = '''        +           Valor[23] + ''', ');
        Query1.SQL.Add ('COMPL_FAX = '''         +           Valor[24] + ''', ');
        Query1.SQL.Add ('E_MAIL = '''            +           Valor[25] + ''', ');
        Query1.SQL.Add ('WEB_SITE = '''          +           Valor[26] + ''', ');
        Query1.SQL.Add ('CONTATO = '''           +           Valor[27] + ''', ');
        Query1.SQL.Add ('PAIS = '''              +           Valor[28] + ''', ');
        Query1.SQL.Add ('TIPO_CLIENTE_SQ = '     +           Valor[29] + ', ');
        Query1.SQL.Add ('BIRO = '''              +           Valor[30] + ''', ');
        Query1.SQL.Add ('DATA_ALT = '''          + FormatDateTime  ('yyyy-mm-dd', Valor[31]) + ''', ');
        Query1.SQL.Add ('USUARIO_SQ_ALT = '''    + InttoStr (Valor[32]) + ''', ');
        Query1.SQL.Add ('TRANSPORTADORA_SQ = '   +           Valor[33] + ', ');
        Query1.SQL.Add ('OBSERVACAO = '''        +           Valor[38]  + ''',');
        Query1.SQL.Add ('vendedor_sq = '         +           Valor[39]);
        Query1.SQL.Add ('WHERE CLIENTE_SQ = ' + InttoStr (Chave));
      end;
      Query1.ExecSQL;

      if novo = 255 then
      begin
        Query1.SQL.Clear;
        Query1.SQL.Add('SELECT LAST_INSERT_ID() as CHAVE');
        Query1.Open;
        Chave := Query1.FieldByName('CHAVE').AsInteger;
      end;

      for i := 0 to Valor[34] do
      if Valor[35][i] <> 0 then
      begin
        Query1.SQL.Clear;
        Query1.SQL.Add('DELETE FROM contatos WHERE CONTATO_SQ = ' + InttoStr (Valor[35][i]));
        Query1.ExecSQL;
      end;

      for i := 0 to Valor[36] do
      if Valor[37][i][0] <> -1 then
      begin
        if Valor[37][i][6] = '' then nfiscal_item_sq := 'null'
        else nfiscal_item_sq := ' ''' + Valor[37][i][6] + ''' ';
        Query1.SQL.Clear;
        if Valor[37][i][0] > 0 then
        begin
          Query1.SQL.Add('UPDATE contatos SET ');
          Query1.SQL.Add ('DATA_CONTATO = '''   + FormatDateTime ('yyyy-mm-dd hh:nn:ss', Valor[37][i][1]) + ''', ');
          Query1.SQL.Add ('CLIENTE_SQ = '''     + InttoStr  (Chave) + ''', ');
          Query1.SQL.Add ('VENDEDOR_SQ = '''    + InttoStr  (Valor[37][i][2]) + ''', ');
          Query1.SQL.Add ('TIPO_CONTATO = '''   +            Valor[37][i][3]  + ''', ');
          Query1.SQL.Add ('FORMA_CONTATO = '''  +            Valor[37][i][4]  + ''', ');
          Query1.SQL.Add ('OBSERVACAO = '''     +            Valor[37][i][5]  + ''', ');
          Query1.SQL.Add ('NFISCAL_ITEM_SQ = '  +            nfiscal_item_sq  + ', ');
          Query1.SQL.Add ('QTDE_PRODUTOS = '''  + InttoStr  (Valor[37][i][7]) + '''  ');
          Query1.SQL.Add ('WHERE CONTATO_SQ = ' + InttoStr  (Valor[37][i][0]));
        end
        else begin
        Query1.SQL.Add('INSERT INTO contatos (' +
                       'DATA_CONTATO, CLIENTE_SQ, ' +
                       'VENDEDOR_SQ, TIPO_CONTATO, ' +
                       'FORMA_CONTATO, OBSERVACAO, ' +
                       'NFISCAL_ITEM_SQ, QTDE_PRODUTOS) ' +
                       'VALUES (' +
                       '''' + FormatDateTime ('yyyy-mm-dd hh:nn:ss', Valor[37][i][1]) + ''', ' +
                       '''' + InttoStr (Chave) + ''', ' +
                       '''' + InttoStr (Valor[37][i][2])  + ''', ' +
                       '''' + Valor[37][i][3] + ''', ' +
                       '''' + Valor[37][i][4] + ''', ' +
                       '''' + Valor[37][i][5]  + ''', ' +
                              nfiscal_item_sq  + ', ' +
                       '''' + InttoStr (Valor[37][i][7]) + ''')');
        end;
        Query1.ExecSQL;
      end;
end;
}
{
procedure TServer.gravaPedido(Valor: OleVariant; Novo: Byte; var Chave: Integer);
var
  i: Integer;
  s: String;
begin
  Valor[7] := Valor[7] + 1;
  if (Valor[31] = Null) or (Valor[31] = 0) then
    Valor[31] := 'null'
  else
    Valor[31] := QuotedStr(IntToStr(Valor[31]));

  Query1.SQL.Clear;
  if novo = 255 then
  begin
    Query1.SQL.Add('INSERT INTO pedidos (' +
                   'NUMERO_PEDIDO, DATA_PEDIDO, ' +
                   'COTACAO_DOLAR, DIAS_DEMONSTRACAO, ' +
                   'VLR_FRETE, PCT_JUROS, ' +
                   'VLR_JUROS, FRETE_TRANSP, ' +
                   'VLR_DESC, BASE_ICMS, ' +
                   'VLR_ICMS, VLR_IPI, ' +
                   'VLR_PRODUTOS, PCT_DESC, ' +
                   'OBSERVACAO_PED, OBSERVACAO_NF, ' +
                   'CLIENTE_SQ, COND_PAGTO_SQ, ' +
                   'NATUREZA_SQ, TRANSPORTADORA_SQ, ' +
                   'VENDEDOR_SQ, PESO_BRUTO, ' +
                   'PESO_LIQUIDO, VLR_SEGURO, ' +
                   'linha_sq) ' +
                   'VALUES (' +
                   '''' + InttoStr   (Valor[0]) + ''', ' +
                   '''' + FormatDateTime  ('yyyy-mm-dd hh:nn:ss', Valor[1]) + ''', ' +
                   '''' + FloattoStr (Valor[2]) + ''', ' +
                   '''' + InttoStr   (Valor[3]) + ''', ' +
                   '''' + FloattoStr (Valor[4]) + ''', ' +
                   '''' + FloattoStr (Valor[5]) + ''', ' +
                   '''' + FloattoStr (Valor[6]) + ''', ' +
                   '''' + InttoStr   (Valor[7]) + ''', ' +
                   '''' + FloattoStr (Valor[8]) + ''', ' +
                   '''' + FloattoStr (Valor[9]) + ''', ' +
                   '''' + FloattoStr (Valor[10]) + ''', ' +
                   '''' + FloattoStr (Valor[11]) + ''', ' +
                   '''' + FloattoStr (Valor[12]) + ''', ' +
                   '''' + FloattoStr (Valor[13]) + ''', ' +
                   ''''     + Valor[14]  + ''', ' +
                   ''''     + Valor[15]  + ''', ' +
                   '''' + InttoStr   (Valor[16]) + ''', ' +
                   '''' + InttoStr   (Valor[17]) + ''', ' +
                   '''' + InttoStr   (Valor[18]) + ''', ' +
                   '''' + InttoStr   (Valor[19]) + ''', ' +
                   '''' + InttoStr   (Valor[20]) + ''', ' +
                   '''' + FloattoStr (Valor[28]) + ''', ' +
                   '''' + FloattoStr (Valor[29]) + ''', ' +
                   '''' + FloattoStr (Valor[30]) + ''', ' +
                   Valor[31] + ')');
  end
  else begin
    observacao := 'Pedido Alterado' + chr(13);

    Query1.SQL.Add('UPDATE pedidos SET ');
    Query1.SQL.Add ('NUMERO_PEDIDO = '''        + InttoStr  (Valor[0]) + ''', ');
    Query1.SQL.Add ('DATA_PEDIDO = '''        + FormatDateTime  ('yyyy-mm-dd hh:nn:ss', Valor[1]) + ''', ');
    Query1.SQL.Add ('COTACAO_DOLAR = '''        + FloattoStr(Valor[2]) + ''', ');
    Query1.SQL.Add ('DIAS_DEMONSTRACAO = '''    + InttoStr  (Valor[3]) + ''', ');
    Query1.SQL.Add ('VLR_FRETE = '''            + FloattoStr(Valor[4]) + ''', ');
    Query1.SQL.Add ('PCT_JUROS = '''            + FloattoStr(Valor[5]) + ''', ');
    Query1.SQL.Add ('VLR_JUROS = '''            + FloattoStr(Valor[6]) + ''', ');
    Query1.SQL.Add ('FRETE_TRANSP = '''         + InttoStr  (Valor[7]) + ''', ');
    Query1.SQL.Add ('VLR_DESC = '''             + FloattoStr(Valor[8]) + ''', ');
    Query1.SQL.Add ('BASE_ICMS = '''            + FloattoStr(Valor[9]) + ''', ');
    Query1.SQL.Add ('VLR_ICMS = '''             + FloattoStr(Valor[10]) + ''', ');
    Query1.SQL.Add ('VLR_IPI = '''              + FloattoStr(Valor[11]) + ''', ');
    Query1.SQL.Add ('VLR_PRODUTOS = '''         + FloattoStr(Valor[12]) + ''', ');
    Query1.SQL.Add ('PCT_DESC = '''             + FloattoStr(Valor[13]) + ''', ');
    Query1.SQL.Add ('OBSERVACAO_PED = '''       +            Valor[14]  + ''', ');
    Query1.SQL.Add ('OBSERVACAO_NF = '''        +            Valor[15]  + ''', ');
    Query1.SQL.Add ('CLIENTE_SQ = '''           + InttoStr  (Valor[16]) + ''', ');
    Query1.SQL.Add ('COND_PAGTO_SQ = '''        + InttoStr  (Valor[17]) + ''', ');
    Query1.SQL.Add ('NATUREZA_SQ = '''          + InttoStr  (Valor[18]) + ''', ');
    Query1.SQL.Add ('TRANSPORTADORA_SQ = '''    + InttoStr  (Valor[19]) + ''', ');
    Query1.SQL.Add ('VENDEDOR_SQ = '''          + InttoStr  (Valor[20]) + ''', ');
    Query1.SQL.Add ('PESO_BRUTO = '''           + FloattoStr(Valor[28]) + ''', ');
    Query1.SQL.Add ('PESO_LIQUIDO = '''         + FloattoStr(Valor[29]) + ''', ');
    Query1.SQL.Add ('VLR_SEGURO = '''           + FloattoStr(Valor[30]) + ''', ');
    Query1.SQL.Add('linha_sq = '                +            Valor[31]  + ' ');
    Query1.SQL.Add ('WHERE PEDIDO_SQ = ' + InttoStr (Chave));
  end;
  Query1.ExecSQL;

  if novo = 255 then
  begin
    Query1.SQL.Clear;
    Query1.SQL.Add('SELECT LAST_INSERT_ID() as CHAVE');
    Query1.Open;
    Chave := Query1.FieldByName('CHAVE').AsInteger;
  end;

  Query2.SQL.Clear;
  Query2.SQL.Add('select pi.pedido_item_sq, p.codigo_produto from pedidos_itens pi inner join produtos p on (p.produto_sq=pi.produto_sq) where pedido_sq = ' + IntToStr(Chave));
  Query2.Open;
  While not Query2.Eof do
  begin
    for i := 0 to Valor[23] do
      if Valor[24][i][0] = Query2.FieldByName('pedido_item_sq').AsInteger then
        Break;

    if i > Valor[23] then
    begin
      observacao := observacao + 'Exclusão de item (' + Query2.FieldByName('codigo_produto').AsString + ')' + chr(13);
      Query1.SQL.Text := 'delete from pedidos_itens where pedido_item_sq = ' + Query2.FieldByName('pedido_item_sq').AsString;
      Query1.ExecSQL;
    end;

    Query2.Next;
  end;

  for i := 0 to Valor[23] do
  begin
    Query1.SQL.Clear;
    if Valor[24][i][0] <> 0 then
    begin
      Query1.SQL.Add('SELECT P.PRODUTO_SQ, CODIGO_PRODUTO, QTDE_PEDIDO_ITEM FROM pedidos_itens PI LEFT OUTER JOIN produtos P ON (P.PRODUTO_SQ=PI.PRODUTO_SQ) WHERE PEDIDO_ITEM_SQ = ' + InttoStr (Valor[24][i][0]));
      Query1.Open;
      if Query1.FieldByName('QTDE_PEDIDO_ITEM').AsInteger <> Valor[24][i][4] then observacao := observacao + 'Alteração de Quantidade do Produto "' + Query1.FieldByName('CODIGO_PRODUTO').AsString + '" (' + Query1.FieldByName('QTDE_PEDIDO_ITEM').AsString + ' -> ' + InttoStr(Valor[24][i][4]) + ')' + chr(13);
      if Query1.FieldByName('PRODUTO_SQ').AsInteger <> Valor[24][i][1] then
      begin
        s := Query1.FieldByName('CODIGO_PRODUTO').AsString;
        Query1.SQL.Clear;
        Query1.SQL.Add('SELECT CODIGO_PRODUTO FROM produtos WHERE PRODUTO_SQ = ' + InttoStr (Valor[24][i][1]));
        Query1.Open;
        observacao := observacao + 'Alteração de Produto (' + s + ' -> ' + Query1.FieldByName('CODIGO_PRODUTO').AsString + ')' + chr(13);
      end;
      Query1.SQL.Clear;

      Query1.SQL.Add('UPDATE pedidos_itens SET ');
      Query1.SQL.Add ('PRODUTO_SQ = '''       + InttoStr  (Valor[24][i][1])  + ''', ');
      Query1.SQL.Add ('QTDE_PEDIDO_ITEM = ''' + InttoStr  (Valor[24][i][4])  + ''', ');
      Query1.SQL.Add ('NR_SERIE_ITEM = '''    +            Valor[24][i][13]  + ''', ');
      Query1.SQL.Add ('PRECO_UNIT = '''       + FloattoStr(Valor[24][i][5])  + ''', ');
      Query1.SQL.Add ('VLR_DESC = '''         + FloattoStr(Valor[24][i][6])  + ''', ');
      Query1.SQL.Add ('PCT_DESC = '''         + FloattoStr(Valor[24][i][7])  + ''', ');
      Query1.SQL.Add ('ALIQ_ICMS_ITEM = '''   + FloattoStr(Valor[24][i][8])  + ''', ');
      Query1.SQL.Add ('ALIQ_IPI_ITEM = '''    + FloattoStr(Valor[24][i][10]) + ''', ');
      Query1.SQL.Add ('VLR_ICMS_ITEM = '''    + FloattoStr(Valor[24][i][9])  + ''', ');
      Query1.SQL.Add ('VLR_IPI_ITEM = '''     + FloattoStr(Valor[24][i][11]) + ''', ');
      Query1.SQL.Add ('VLR_TOTAL_ITEM = '''   + FloattoStr(Valor[24][i][12]) + ''', ');
      Query1.SQL.Add ('PESO_BRUTO = '''       + FloattoStr(Valor[24][i][14]) + ''', ');
      Query1.SQL.Add ('PESO_LIQUIDO = '''     + FloattoStr(Valor[24][i][15]) + ''', ');
      Query1.SQL.Add ('VLR_JUROS = '''        + FloattoStr(Valor[24][i][16]) + ''', ');
      Query1.SQL.Add ('PCT_JUROS = '''        + FloattoStr(Valor[24][i][17]) + ''' ');
      Query1.SQL.Add ('WHERE PEDIDO_ITEM_SQ = ' + InttoStr (Valor[24][i][0]));
    end
    else begin
      Query1.SQL.Add('SELECT * FROM produtos WHERE PRODUTO_SQ = ' + InttoStr (Valor[24][i][1]));
      Query1.Open;
      observacao := observacao + 'Inclusão de Produto (' + Query1.FieldByName('CODIGO_PRODUTO').AsString + ') com Quantidade (' + InttoStr(Valor[24][i][4]) + ')' + chr(13);
      Query1.SQL.Clear;

      Query1.SQL.Add('INSERT INTO pedidos_itens (' +
                     'PEDIDO_SQ, PRODUTO_SQ, ' +
                     'QTDE_PEDIDO_ITEM, NR_SERIE_ITEM, ' +
                     'PRECO_UNIT, VLR_DESC, ' +
                     'PCT_DESC, ALIQ_ICMS_ITEM, ' +
                     'ALIQ_IPI_ITEM, VLR_ICMS_ITEM, ' +
                     'VLR_IPI_ITEM, VLR_TOTAL_ITEM, ' +
                     'PESO_BRUTO, PESO_LIQUIDO, ' +
                     'VLR_JUROS, PCT_JUROS) ' +
                     'VALUES (' +
                     '''' + InttoStr (Chave) + ''', ' +
                     '''' + InttoStr (Valor[24][i][1])  + ''', ' +
                     '''' + InttoStr (Valor[24][i][4])  + ''', ' +
                     '''' + Valor[24][i][13]  + ''', '  +
                     '''' + FloattoStr (Valor[24][i][5])  + ''', ' +
                     '''' + FloattoStr (Valor[24][i][6])  + ''', ' +
                     '''' + FloattoStr (Valor[24][i][7])  + ''', ' +
                     '''' + FloattoStr (Valor[24][i][8])  + ''', ' +
                     '''' + FloattoStr (Valor[24][i][10]) + ''', ' +
                     '''' + FloattoStr (Valor[24][i][9])  + ''', ' +
                     '''' + FloattoStr (Valor[24][i][11]) + ''', ' +
                     '''' + FloattoStr (Valor[24][i][12]) + ''', ' +
                     '''' + FloattoStr (Valor[24][i][14]) + ''', ' +
                     '''' + FloattoStr (Valor[24][i][15]) + ''', ' +
                     '''' + FloattoStr (Valor[24][i][16]) + ''', ' +
                     '''' + FloattoStr (Valor[24][i][17]) + ''')');
    end;
    Query1.ExecSQL;
  end;

  if (novo = 255) and (Valor[0] = 0) then
  begin
    While (Valor[0]=0) do
    begin
      Query1.SQL.Clear;
      Query1.SQL.Add('UPDATE empresas SET NUMERO_PEDIDO = NUMERO_PEDIDO + 1');
      Query1.ExecSQL;

      Query1.SQL.Clear;
      Query1.SQL.Add('SELECT NUMERO_PEDIDO FROM empresas');
      Query1.Open;
      i := Query1.FieldByName ('NUMERO_PEDIDO').AsInteger;

      Query1.SQL.Clear;
      Query1.SQL.Add('select count(*) from pedidos where numero_pedido = ' + IntToStr(i));
      Query1.Open;
      if Query1.Fields[0].AsInteger = 0 then
        Valor[0] := i;
    end;

    Query1.SQL.Clear;
    Query1.SQL.Add('UPDATE pedidos SET');
    Query1.SQL.Add('NUMERO_PEDIDO = ''' + InttoStr (Valor[0]) + '''');
    Query1.SQL.Add('WHERE PEDIDO_SQ = ' + InttoStr (Chave));
    Query1.ExecSQL;
  end;
end;
}
{
procedure TServer.gravaEmpresa(Valor: OleVariant; Novo: Byte; var Chave: Integer);
var
  dtsenha: TDateTime;
begin
      if Valor[11] then
        Valor[11] := 'S' else
        Valor[11] := 'N';
      if Valor[12] then
        Valor[12] := 'S' else
        Valor[12] := 'N';
      if Valor[13] then
        Valor[13] := 'S' else
        Valor[13] := 'N';
      if Valor[14] then
        Valor[14] := 'S' else
        Valor[14] := 'N';
      if Valor[21] then
        Valor[21] := 'S' else
        Valor[21] := 'N';

      Query1.SQL.Clear;
      Query1.SQL.Add('UPDATE empresas SET');
      Query1.SQL.Add('CODIGO_EMPRESA = '''        + Valor[0] + ''', ');
      Query1.SQL.Add('NOME_EMPRESA = '''          + Valor[1] + ''', ');
      Query1.SQL.Add('SENHA = '''                 + Valor[2] + ''', ');
      Query1.SQL.Add('ESTADO = '''                + Valor[3] + ''', ');
      Query1.SQL.Add('NUMERO_NFISCAL = '''        + InttoStr (Valor[4]) + ''', ');
      Query1.SQL.Add('NUMERO_PEDIDO = '''         + InttoStr (Valor[5]) + ''', ');
      Query1.SQL.Add('NUMERO_ASSISTENCIA = '''    + InttoStr (Valor[6]) + ''', ');
      Query1.SQL.Add('ALIQ_ICMS_PROD1 = '''       + FloattoStr (Valor[7]) + ''', ');
      Query1.SQL.Add('ALIQ_ICMS_PEC1 = '''        + FloattoStr (Valor[8]) + ''', ');
      Query1.SQL.Add('STRIBUT = '''               + InttoStr (Valor[9]) + ''', ');
      Query1.SQL.Add('DIAS_DEMONSTRACAO = '''     + InttoStr (Valor[10]) + ''', ');
      Query1.SQL.Add('ALT_DATA_PEDIDO = '''       + Valor[11] + ''', ');
      Query1.SQL.Add('ALT_DTEMISSAO_NFISCAL = ''' + Valor[12] + ''', ');
      Query1.SQL.Add('ALT_NR_PEDIDO = '''         + Valor[13] + ''', ');
      Query1.SQL.Add('ALT_NR_NFISCAL = '''        + Valor[14] + ''', ');
      Query1.SQL.Add('ALIQ_PIS = '''              + FloattoStr (Valor[15]) + ''', ');
      Query1.SQL.Add('ALIQ_COFINS = '''           + FloattoStr (Valor[16]) + ''', ');
      Query1.SQL.Add('ALIQ_ISS = '''              + FloattoStr (Valor[17]) + ''', ');
      Query1.SQL.Add('MARGEM_ESQ_NF = '''         + FloattoStr (Valor[18]) + ''', ');
      Query1.SQL.Add('MARGEM_SUP_NF = '''         + FloattoStr (Valor[19]) + ''', ');
      Query1.SQL.Add('BANCO_IMAGENS = '''         +             Valor[20]  + ''', ');
      Query1.SQL.Add('baixa_estoque_pedido = '''  + Valor[21] + ''', ');
      Query1.SQL.Add('juros_receber = '           + QuotedStr(FloatToStr(Valor[22])));
      Query1.ExecSQL;

      dtsenha := VerificaSenha;
      if (dtsenha < Date) or (dtsenha > Date + 90) then
        raise Exception.Create ('Senha Inválida!');
end;
}
{
procedure TServer.gravaNFiscal(Valor: OleVariant; Novo: Byte; var Chave: Integer);
var
  i: Integer;
  s: String;
  finalizado: Boolean;
begin
  if Valor[2] = null then
    Valor[2] := 'null'
  else
    Valor[2] := QuotedStr(FormatDateTime('yyyy-mm-dd', Valor[2]));

      Valor[19] := Valor[19] + 1;

      if Valor[22] = '' then Valor[22] := '0';

      if Valor[47] then
        Valor[47] := 'S' else
        Valor[47] := 'N';

      if (Valor[48] = Null) or (Valor[48] = 0) then
        Valor[48] := 'null'
      else
        Valor[48] := QuotedStr(IntToStr(Valor[48]));

      if Valor[67] = 0 then
        Valor[67] := 'null'
      else
        Valor[67] := IntToStr(Valor[67]);

      Query1.SQL.Clear;
      if novo = 255 then
      begin
        Query1.SQL.Add('INSERT INTO nfiscais (' +
                       'NUMERO_NFISCAL, DTEMISSAO_NFISCAL, ' +
                       'DTSAIDA_NFISCAL, PEDIDO_SQ, ' +
                       'COTACAO_DOLAR, CLIENTE_SQ, ' +
                       'COND_PAGTO_SQ, NATUREZA_SQ, ' +
                       'TRANSPORTADORA_SQ, BASE_ICMS, ' +
                       'VLR_ICMS, BASE_ICMS_SUBST, ' +
                       'VLR_ICMS_SUBST, VLR_PRODUTOS, ' +
                       'VLR_FRETE, VLR_SEGURO, ' +
                       'VLR_DESP_ACESS, VLR_IPI, ' +
                       'VLR_TOTAL, FRETE_TRANSP, ' +
                       'PLACA_TRANSP, UF_PLACA_TRANSP, ' +
                       'QTDE_TRANSP, ESPECIE_TRANSP, ' +
                       'MARCA_TRANSP, NUMERO_TRANSP, ' +
                       'PBRUTO_TRANSP, PLIQUIDO_TRANSP, ' +
                       'CLASS_FISCAL1, CLASS_FISCAL2, ' +
                       'CLASS_FISCAL3, CLASS_FISCAL4, ' +
                       'CLASS_FISCAL5, CLASS_FISCAL6, ' +
                       'CLASS_FISCAL7, MENSAGEM, ' +
                       'CANCELADA, DIAS_DEMONSTRACAO, ' +
                       'VENDEDOR_SQ, NF_MANUAL, ' +
                       'linha_sq, class_fiscal8, ' +
                       'class_fiscal9, class_fiscal10, ' +
                       'class_fiscal11, class_fiscal12, ' +
                       'class_fiscal13, class_fiscal14, ' +
                       'class_fiscal15, class_fiscal16, ' +
                       'class_fiscal17, class_fiscal18, ' +
                       'class_fiscal19, class_fiscal20, ' +
                       'class_fiscal21, class_fiscal22, ' +
                       'class_fiscal23, class_fiscal24, ' +
                       'inf_adicional, nfiscal_sq_referencia) ');
        Query1.SQL.Add('VALUES (' +
                       '''' + InttoStr  (Valor[0]) + ''', ' +
                       '''' + FormatDateTime  ('yyyy-mm-dd', Valor[1]) + ''', ' +
                       Valor[2] + ', ' +
                       '''' + InttoStr  (Valor[3]) + ''', ' +
                       '''' + FloattoStr(Valor[4]) + ''', ' +
                       '''' + InttoStr  (Valor[5]) + ''', ' +
                       '''' + InttoStr  (Valor[6]) + ''', ' +
                       '''' + InttoStr  (Valor[7]) + ''', ' +
                       '''' + InttoStr  (Valor[8]) + ''', ' +
                       '''' + FloattoStr(Valor[9]) + ''', ' +
                       '''' + FloattoStr(Valor[10]) + ''', ');
        Query1.SQL.Add('''' + FloattoStr(Valor[11]) + ''', ' +
                       '''' + FloattoStr(Valor[12]) + ''', ' +
                       '''' + FloattoStr(Valor[13]) + ''', ' +
                       '''' + FloattoStr(Valor[14]) + ''', ' +
                       '''' + FloattoStr(Valor[15]) + ''', ' +
                       '''' + FloattoStr(Valor[16]) + ''', ' +
                       '''' + FloattoStr(Valor[17]) + ''', ' +
                       '''' + FloattoStr(Valor[18]) + ''', ' +
                       '''' + InttoStr  (Valor[19]) + ''', ' +
                       '''' + Valor[20]  + ''', ');
        Query1.SQL.Add('''' + Valor[21]  + ''', ' +
                       '''' + InttoStr  (Valor[22]) + ''', ' +
                       '''' + Valor[23]  + ''', ' +
                       '''' + Valor[24]  + ''', ' +
                       '''' + Valor[25]  + ''', ' +
                       '''' + Valor[26]  + ''', ' +
                       '''' + Valor[27]  + ''', ' +
                       '''' + InttoStr  (Valor[28]) + ''', ' +
                       '''' + InttoStr  (Valor[29]) + ''', ' +
                       '''' + InttoStr  (Valor[30]) + ''', ');
        Query1.SQL.Add('''' + InttoStr  (Valor[31]) + ''', ' +
                       '''' + InttoStr  (Valor[32]) + ''', ' +
                       '''' + InttoStr  (Valor[33]) + ''', ' +
                       '''' + InttoStr  (Valor[34]) + ''', ' +
                       '''' + Valor[35]  + ''', ' +
                       '''' + Valor[36]  + ''', ' +
                       '''' + InttoStr  (Valor[37]) + ''', ' +
                       '''' + InttoStr  (Valor[38]) + ''', ' +
                       '''' + Valor[47] + ''', ' +
                       Valor[48] + ', ' +
                       '''' + InttoStr  (Valor[49]) + ''', ' +
                       '''' + InttoStr  (Valor[50]) + ''', ');
        Query1.SQL.Add('''' + InttoStr  (Valor[51]) + ''', ' +
                       '''' + InttoStr  (Valor[52]) + ''', ' +
                       '''' + InttoStr  (Valor[53]) + ''', ' +
                       '''' + InttoStr  (Valor[54]) + ''', ' +
                       '''' + InttoStr  (Valor[55]) + ''', ' +
                       '''' + InttoStr  (Valor[56]) + ''', ' +
                       '''' + InttoStr  (Valor[57]) + ''', ' +
                       '''' + InttoStr  (Valor[58]) + ''', ' +
                       '''' + InttoStr  (Valor[59]) + ''', ' +
                       '''' + InttoStr  (Valor[60]) + ''', ' +
                       '''' + InttoStr  (Valor[61]) + ''', ' +
                       '''' + InttoStr  (Valor[62]) + ''', ' +
                       '''' + InttoStr  (Valor[63]) + ''', ' +
                       '''' + InttoStr  (Valor[64]) + ''', ' +
                       '''' + InttoStr  (Valor[65]) + ''', ' +
                       '''' + Valor[66] + ''', ' +
                              Valor[67] + ') ');
      end
      else begin
        observacao := 'Nota Fiscal Alterada' + chr(13);

        Query1.SQL.Add('UPDATE nfiscais SET ');
        Query1.SQL.Add('NUMERO_NFISCAL = '''      + InttoStr  (Valor[0]) + ''', ');
        Query1.SQL.Add('DTEMISSAO_NFISCAL = ''' + FormatDateTime  ('yyyy-mm-dd', Valor[1]) + ''', ');
        Query1.SQL.Add('DTSAIDA_NFISCAL = '       + Valor[2] + ', ');
        Query1.SQL.Add('PEDIDO_SQ = '''           + InttoStr  (Valor[3]) + ''', ');
        Query1.SQL.Add('COTACAO_DOLAR = '''       + FloattoStr(Valor[4]) + ''', ');
        Query1.SQL.Add('CLIENTE_SQ = '''          + InttoStr  (Valor[5]) + ''', ');
        Query1.SQL.Add('COND_PAGTO_SQ = '''       + InttoStr  (Valor[6]) + ''', ');
        Query1.SQL.Add('NATUREZA_SQ = '''         + InttoStr  (Valor[7]) + ''', ');
        Query1.SQL.Add('TRANSPORTADORA_SQ = '''   + InttoStr  (Valor[8]) + ''', ');
        Query1.SQL.Add('BASE_ICMS = '''           + FloattoStr(Valor[9]) + ''', ');
        Query1.SQL.Add('VLR_ICMS = '''            + FloattoStr(Valor[10]) + ''', ');
        Query1.SQL.Add('BASE_ICMS_SUBST = '''     + FloattoStr(Valor[11]) + ''', ');
        Query1.SQL.Add('VLR_ICMS_SUBST = '''      + FloattoStr(Valor[12]) + ''', ');
        Query1.SQL.Add('VLR_PRODUTOS = '''        + FloattoStr(Valor[13]) + ''', ');
        Query1.SQL.Add('VLR_FRETE = '''           + FloattoStr(Valor[14]) + ''', ');
        Query1.SQL.Add('VLR_SEGURO = '''          + FloattoStr(Valor[15]) + ''', ');
        Query1.SQL.Add('VLR_DESP_ACESS = '''      + FloattoStr(Valor[16]) + ''', ');
        Query1.SQL.Add('VLR_IPI = '''             + FloattoStr(Valor[17]) + ''', ');
        Query1.SQL.Add('VLR_TOTAL = '''           + FloattoStr(Valor[18]) + ''', ');
        Query1.SQL.Add('FRETE_TRANSP = '''        + InttoStr  (Valor[19]) + ''', ');
        Query1.SQL.Add('PLACA_TRANSP = '''        +            Valor[20]  + ''', ');
        Query1.SQL.Add('UF_PLACA_TRANSP = '''     +            Valor[21]  + ''', ');
        Query1.SQL.Add('QTDE_TRANSP = '''         + InttoStr  (Valor[22]) + ''', ');
        Query1.SQL.Add('ESPECIE_TRANSP = '''      +            Valor[23]  + ''', ');
        Query1.SQL.Add('MARCA_TRANSP = '''        +            Valor[24]  + ''', ');
        Query1.SQL.Add('NUMERO_TRANSP = '''       +            Valor[25]  + ''', ');
        Query1.SQL.Add('PBRUTO_TRANSP = '''       +            Valor[26]  + ''', ');
        Query1.SQL.Add('PLIQUIDO_TRANSP = '''     +            Valor[27]  + ''', ');
        Query1.SQL.Add('CLASS_FISCAL1 = '''       + InttoStr  (Valor[28]) + ''', ');
        Query1.SQL.Add('CLASS_FISCAL2 = '''       + InttoStr  (Valor[29]) + ''', ');
        Query1.SQL.Add('CLASS_FISCAL3 = '''       + InttoStr  (Valor[30]) + ''', ');
        Query1.SQL.Add('CLASS_FISCAL4 = '''       + InttoStr  (Valor[31]) + ''', ');
        Query1.SQL.Add('CLASS_FISCAL5 = '''       + InttoStr  (Valor[32]) + ''', ');
        Query1.SQL.Add('CLASS_FISCAL6 = '''       + InttoStr  (Valor[33]) + ''', ');
        Query1.SQL.Add('CLASS_FISCAL7 = '''       + InttoStr  (Valor[34]) + ''', ');
        Query1.SQL.Add('MENSAGEM = '''            +            Valor[35]  + ''', ');
        Query1.SQL.Add('CANCELADA = '''           +            Valor[36]  + ''', ');
        Query1.SQL.Add('DIAS_DEMONSTRACAO = '''   + InttoStr  (Valor[37]) + ''', ');
        Query1.SQL.Add('VENDEDOR_SQ = '''         + InttoStr  (Valor[38]) + ''', ');
        Query1.SQL.Add('NF_MANUAL = '''           +            Valor[47]  + ''', ');
        Query1.SQL.Add('linha_sq = '              +            Valor[48]  + ', ');
        Query1.SQL.Add('CLASS_FISCAL8 = '''       + InttoStr  (Valor[49]) + ''', ');
        Query1.SQL.Add('CLASS_FISCAL9 = '''       + InttoStr  (Valor[50]) + ''', ');
        Query1.SQL.Add('CLASS_FISCAL10 = '''      + InttoStr  (Valor[51]) + ''', ');
        Query1.SQL.Add('CLASS_FISCAL11 = '''      + InttoStr  (Valor[52]) + ''', ');
        Query1.SQL.Add('CLASS_FISCAL12 = '''      + InttoStr  (Valor[53]) + ''', ');
        Query1.SQL.Add('CLASS_FISCAL13 = '''      + InttoStr  (Valor[54]) + ''', ');
        Query1.SQL.Add('CLASS_FISCAL14 = '''      + InttoStr  (Valor[55]) + ''', ');
        Query1.SQL.Add('CLASS_FISCAL15 = '''      + InttoStr  (Valor[56]) + ''', ');
        Query1.SQL.Add('CLASS_FISCAL16 = '''      + InttoStr  (Valor[57]) + ''', ');
        Query1.SQL.Add('CLASS_FISCAL17 = '''      + InttoStr  (Valor[58]) + ''', ');
        Query1.SQL.Add('CLASS_FISCAL18 = '''      + InttoStr  (Valor[59]) + ''', ');
        Query1.SQL.Add('CLASS_FISCAL19 = '''      + InttoStr  (Valor[60]) + ''', ');
        Query1.SQL.Add('CLASS_FISCAL20 = '''      + InttoStr  (Valor[61]) + ''', ');
        Query1.SQL.Add('CLASS_FISCAL21 = '''      + InttoStr  (Valor[62]) + ''', ');
        Query1.SQL.Add('CLASS_FISCAL22 = '''      + InttoStr  (Valor[63]) + ''', ');
        Query1.SQL.Add('CLASS_FISCAL23 = '''      + InttoStr  (Valor[64]) + ''', ');
        Query1.SQL.Add('CLASS_FISCAL24 = '''      + InttoStr  (Valor[65]) + ''', ');
        Query1.SQL.Add('INF_ADICIONAL = '''       +            Valor[66]  + ''', ');
        Query1.SQL.Add('NFISCAL_SQ_REFERENCIA = ' +            Valor[67]);
        Query1.SQL.Add ('WHERE NFISCAL_SQ = ' + InttoStr (Chave));
      end;
      Query1.ExecSQL;

      if novo = 255 then
      begin
        Query1.SQL.Clear;
        Query1.SQL.Add('SELECT LAST_INSERT_ID() as CHAVE');
        Query1.Open;
        Chave := Query1.FieldByName('CHAVE').AsInteger;
      end;

//      for i := 0 to Valor[39] do
//      if Valor[40][i] <> 0 then
//      begin
//        Query1.SQL.Clear;
//        Query1.SQL.Add('SELECT CODIGO_PRODUTO FROM nfiscais_itens NI LEFT OUTER JOIN produtos P ON (P.PRODUTO_SQ = NI.PRODUTO_SQ) WHERE NFISCAL_ITEM_SQ = ' + InttoStr(Valor[40][i]));
//        Query1.Open;
//        observacao := observacao + 'Exclusão de Item (' + Query1.FieldByName('CODIGO_PRODUTO').AsString + ')' + chr(13);
//
//        Query1.SQL.Clear;
//        Query1.SQL.Add('DELETE FROM nfiscais_itens WHERE NFISCAL_ITEM_SQ = ' + InttoStr (Valor[40][i]));
//        Query1.ExecSQL;
//      end;

  Query2.SQL.Clear;
  Query2.SQL.Add('select ni.nfiscal_item_sq, p.codigo_produto from nfiscais_itens ni inner join produtos p on (p.produto_sq=ni.produto_sq) where nfiscal_sq = ' + IntToStr(Chave));
  Query2.Open;
  While not Query2.Eof do
  begin
    for i := 0 to Valor[41] do
      if Valor[42][i][0] = Query2.FieldByName('nfiscal_item_sq').AsInteger then
        Break;

    if i > Valor[41] then
    begin
      observacao := observacao + 'Exclusão de item (' + Query2.FieldByName('codigo_produto').AsString + ')' + chr(13);
      Query1.SQL.Text := 'delete from nfiscais_itens where nfiscal_item_sq = ' + Query2.FieldByName('nfiscal_item_sq').AsString;
      Query1.ExecSQL;
    end;

    Query2.Next;
  end;

  for i := 0 to Valor[41] do
  begin
    Query1.SQL.Clear;
    if Valor[42][i][0] <> 0 then
    begin
      Query1.SQL.Add('SELECT P.PRODUTO_SQ, CODIGO_PRODUTO, (QTDE_ITEM_LOJA+QTDE_ITEM_ARMAZEM+QTDE_ITEM_DEMO) AS QTDE_ITEM FROM nfiscais_itens NI LEFT OUTER JOIN produtos P ON (P.PRODUTO_SQ=NI.PRODUTO_SQ) WHERE NFISCAL_ITEM_SQ = ' + InttoStr (Valor[42][i][0]));
      Query1.Open;
      if Query1.FieldByName('QTDE_ITEM').AsInteger <> Valor[42][i][4] then observacao := observacao + 'Alteração de Quantidade do Produto "' + Query1.FieldByName('CODIGO_PRODUTO').AsString + '" (' + Query1.FieldByName('QTDE_ITEM').AsString + ' -> ' + InttoStr(Valor[42][i][4]) + ')' + chr(13);
      if Query1.FieldByName('PRODUTO_SQ').AsInteger <> Valor[42][i][1] then
      begin
        s := Query1.FieldByName('CODIGO_PRODUTO').AsString;
        Query1.SQL.Clear;
        Query1.SQL.Add('SELECT CODIGO_PRODUTO FROM produtos WHERE PRODUTO_SQ = ' + InttoStr (Valor[42][i][1]));
        Query1.Open;
        observacao := observacao + 'Alteração de Produto (' + s + ' -> ' + Query1.FieldByName('CODIGO_PRODUTO').AsString + ')' + chr(13);
      end;
      Query1.SQL.Clear;

      Query1.SQL.Add('UPDATE nfiscais_itens SET ');
      Query1.SQL.Add ('PRODUTO_SQ = '''        + InttoStr  (Valor[42][i][1])  + ''', ');
      Query1.SQL.Add ('QTDE_ITEM_LOJA = '''    + InttoStr  (Valor[42][i][4])  + ''', ');
      Query1.SQL.Add ('QTDE_ITEM_ARMAZEM = ''' + InttoStr  (Valor[42][i][16]) + ''', ');
      Query1.SQL.Add ('QTDE_ITEM_DEMO = '''    + InttoStr  (Valor[42][i][17]) + ''', ');
      Query1.SQL.Add ('NR_SERIE_ITEM = '''     +            Valor[42][i][13]  + ''', ');
      Query1.SQL.Add ('VLR_UNIT_ITEM = '''     + FloattoStr(Valor[42][i][5])  + ''', ');
      Query1.SQL.Add ('CLASS_FISCAL = '''      +            Valor[42][i][6]   + ''', ');
      Query1.SQL.Add ('STRIBUT = '''           + InttoStr  (Valor[42][i][7])  + ''', ');
      Query1.SQL.Add ('ALIQ_ICMS_ITEM = '''    + FloattoStr(Valor[42][i][8])  + ''', ');
      Query1.SQL.Add ('ALIQ_IPI_ITEM = '''     + FloattoStr(Valor[42][i][10])  + ''', ');
      Query1.SQL.Add ('VLR_ICMS_ITEM = '''     + FloattoStr(Valor[42][i][9])  + ''', ');
      Query1.SQL.Add ('VLR_IPI_ITEM = '''      + FloattoStr(Valor[42][i][11]) + ''', ');
      Query1.SQL.Add ('VLR_TOTAL_ITEM = '''    + FloattoStr(Valor[42][i][12]) + ''', ');
      Query1.SQL.Add ('PESO_BRUTO = '''        + FloattoStr(Valor[42][i][14]) + ''', ');
      Query1.SQL.Add ('PESO_LIQUIDO = '''      + FloattoStr(Valor[42][i][15]) + ''', ');
      Query1.SQL.Add ('BASE_ICMS_SUBST_ITEM = ''' + FloattoStr(Valor[42][i][18]) + ''', ');
      Query1.SQL.Add ('VLR_ICMS_SUBST_ITEM = '''  + FloattoStr(Valor[42][i][19]) + ''', ');
      Query1.SQL.Add ('ORIGEM_MERCADORIA = '''  + IntToStr(Valor[42][i][20]) + ''' ');
      Query1.SQL.Add ('WHERE NFISCAL_ITEM_SQ = ' + InttoStr (Valor[42][i][0]));
    end
    else begin
      Query1.SQL.Add('SELECT * FROM produtos WHERE PRODUTO_SQ = ' + InttoStr (Valor[42][i][1]));
      Query1.Open;
      observacao := observacao + 'Inclusão de Produto (' + Query1.FieldByName('CODIGO_PRODUTO').AsString + ') com Quantidade (' + InttoStr(Valor[42][i][4]) + ')' + chr(13);
      Query1.SQL.Clear;

      Query1.SQL.Add('INSERT INTO nfiscais_itens (' +
                     'NFISCAL_SQ, ITEM, PRODUTO_SQ, ' +
                     'QTDE_ITEM_LOJA, QTDE_ITEM_ARMAZEM, ' +
                     'QTDE_ITEM_DEMO, NR_SERIE_ITEM, ' +
                     'VLR_UNIT_ITEM, CLASS_FISCAL, ' +
                     'STRIBUT, ALIQ_ICMS_ITEM, ' +
                     'ALIQ_IPI_ITEM, VLR_ICMS_ITEM, ' +
                     'VLR_IPI_ITEM, VLR_TOTAL_ITEM, ' +
                     'PESO_BRUTO, PESO_LIQUIDO, ' +
                     'BASE_ICMS_SUBST_ITEM, VLR_ICMS_SUBST_ITEM, ' +
                     'ORIGEM_MERCADORIA) ' +
                     'VALUES (' +
                     '''' + InttoStr (Chave) + ''', ' +
                     '''' + InttoStr (i+1) + ''', ' +
                     '''' + InttoStr (Valor[42][i][1])  + ''', ' +
                     '''' + InttoStr (Valor[42][i][4])  + ''', ' +
                     '''' + InttoStr (Valor[42][i][16])  + ''', ' +
                     '''' + InttoStr (Valor[42][i][17])  + ''', ' +
                     '''' + Valor[42][i][13]  + ''', ' +
                     '''' + FloattoStr (Valor[42][i][5])  + ''', ' +
                     '''' + Valor[42][i][6]  + ''', ' +
                     '''' + InttoStr (Valor[42][i][7])  + ''', ' +
                     '''' + FloattoStr (Valor[42][i][8])  + ''', ' +
                     '''' + FloattoStr (Valor[42][i][10])  + ''', ' +
                     '''' + FloattoStr (Valor[42][i][9])  + ''', ' +
                     '''' + FloattoStr (Valor[42][i][11]) + ''', ' +
                     '''' + FloattoStr (Valor[42][i][12])  + ''', ' +
                     '''' + FloattoStr (Valor[42][i][14])  + ''', ' +
                     '''' + FloattoStr (Valor[42][i][15])  + ''', ' +
                     '''' + FloattoStr (Valor[42][i][18])  + ''', ' +
                     '''' + FloattoStr (Valor[42][i][19])  + ''', ' +
                     '''' + InttoStr (Valor[42][i][20]) + ''')');
    end;
    Query1.ExecSQL;
  end;

  if novo = 255 then
  begin
    if Valor[3] <> 0 then
    begin
      finalizado := True;
      Query1.SQL.Clear;
      Query1.SQL.Add('select produto_sq, sum(qtde_faturado) qtde_aberto from (' +
        ' select pi.produto_sq, sum(pi.qtde_pedido_item) qtde_faturado ' +
        ' from pedidos_itens pi ' +
        ' where pi.pedido_sq=' + IntToStr(Valor[3]) +
        ' group by pi.produto_sq ' +
        ' union ' +
        ' select ni.produto_sq, -1 * sum(ni.qtde_item_loja + ni.qtde_item_armazem + ni.qtde_item_demo) qtde_faturado ' +
        ' from nfiscais_itens ni ' +
        ' inner join nfiscais n on (n.nfiscal_sq=ni.nfiscal_sq) ' +
        ' where n.cancelada <> ''S'' and n.pedido_sq=' + IntToStr(Valor[3]) +
        ' group by ni.produto_sq ' +
        ' ) a group by produto_sq');
      Query1.Open;
      While not Query1.Eof do
      begin
        if Query1.FieldByName('qtde_aberto').AsInteger > 0 then
          finalizado := False;
        Query1.Next;
      end;

      if finalizado then
      begin
        Query1.SQL.Clear;
        Query1.SQL.Add('UPDATE pedidos SET status = ''F'' WHERE PEDIDO_SQ = ' + InttoStr (Valor[3]));
        Query1.ExecSQL;
      end;
    end;

    if (novo = 255) and (Valor[0] = 0) then
    begin
      While (Valor[0]=0) do
      begin
        Query1.SQL.Clear;
        Query1.SQL.Add('UPDATE empresas SET NUMERO_NFISCAL = NUMERO_NFISCAL + 1');
        Query1.ExecSQL;

        Query1.SQL.Clear;
        Query1.SQL.Add('SELECT NUMERO_NFISCAL FROM empresas');
        Query1.Open;
        i := Query1.FieldByName ('NUMERO_NFISCAL').AsInteger;

        Query1.SQL.Clear;
        Query1.SQL.Add('select count(*) from nfiscais where NUMERO_NFISCAL = ' + IntToStr(i));
        Query1.Open;
        if Query1.Fields[0].AsInteger = 0 then
          Valor[0] := i;
      end;

      Query1.SQL.Clear;
      Query1.SQL.Add('UPDATE nfiscais SET');
      Query1.SQL.Add('NUMERO_NFISCAL = ''' + InttoStr (Valor[0]) + '''');
      Query1.SQL.Add('WHERE NFISCAL_SQ = ' + InttoStr (Chave));
      Query1.ExecSQL;
    end;
  end;
end;
}
{
procedure TServer.gravaAssistencia(Valor: OleVariant; Novo: Byte; var Chave: Integer);
var
  i: Integer;
  chaves: array of integer;
begin
      if Valor[13] then
        Valor[13] := 'S' else
        Valor[13] := 'N';
      if Valor[14] then
        Valor[14] := 'S' else
        Valor[14] := 'N';
      if Valor[16] then
        Valor[16] := 'S' else
        Valor[16] := 'N';

      Query1.SQL.Clear;
      if novo = 255 then
      begin
        Query1.SQL.Add('INSERT INTO assistencias (' +
                       'NUMERO_ASSISTENCIA, DATA_CHAMADO, ' +
                       'DATA_ASSISTENCIA, COTACAO_DOLAR, ' +
                       'CLIENTE_SQ, COND_PAGTO_SQ, ' +
                       'DESP_CHAMADO, DESP_HTEC_AD, ' +
                       'DESP_DESLOC, VLR_PECAS, ' +
                       'VLR_TOTAL, HORA_INICIO, ' +
                       'HORA_FIM, GARANTIA, ' +
                       'CONTRATO, VENDEDOR_SQ, ' +
                       'FRETE) ' +
                       'VALUES (' +
                       '''' + InttoStr  (Valor[0]) + ''', ' +
                       '''' + FormatDateTime  ('yyyy-mm-dd', Valor[1]) + ''', ' +
                       '''' + FormatDateTime  ('yyyy-mm-dd', Valor[2]) + ''', ' +
                       '''' + FloattoStr (Valor[3])  + ''', ' +
                       '''' + InttoStr  (Valor[4]) + ''', ' +
                       '''' + InttoStr  (Valor[5]) + ''', ' +
                       '''' + FloattoStr (Valor[6])  + ''', ' +
                       '''' + FloattoStr (Valor[7])  + ''', ' +
                       '''' + FloattoStr (Valor[8])  + ''', ' +
                       '''' + FloattoStr (Valor[9])  + ''', ' +
                       '''' + FloattoStr (Valor[10])  + ''', ' +
                       '''' + TimetoStr (Valor[11]) + ''', ' +
                       '''' + TimetoStr (Valor[12]) + ''', ' +
                       '''' + Valor[13]  + ''', ' +
                       '''' + Valor[14]  + ''', ' +
                       '''' + InttoStr  (Valor[15])  + ''', ' +
                       '''' + Valor[16] + ''') ');
      end
      else begin
        Query1.SQL.Add('UPDATE assistencias SET ');
        Query1.SQL.Add('NUMERO_ASSISTENCIA = ''' + InttoStr  (Valor[0]) + ''', ');
        Query1.SQL.Add('DATA_CHAMADO = '''       + FormatDateTime  ('yyyy-mm-dd', Valor[1]) + ''', ');
        Query1.SQL.Add('DATA_ASSISTENCIA = '''   + FormatDateTime  ('yyyy-mm-dd', Valor[2]) + ''', ');
        Query1.SQL.Add('COTACAO_DOLAR = '''      + FloattoStr(Valor[3])  + ''', ');
        Query1.SQL.Add('CLIENTE_SQ = '''         + InttoStr  (Valor[4])  + ''', ');
        Query1.SQL.Add('COND_PAGTO_SQ = '''      + InttoStr  (Valor[5])  + ''', ');
        Query1.SQL.Add('DESP_CHAMADO = '''       + FloattoStr(Valor[6])  + ''', ');
        Query1.SQL.Add('DESP_HTEC_AD = '''       + FloattoStr(Valor[7])  + ''', ');
        Query1.SQL.Add('DESP_DESLOC = '''        + FloattoStr(Valor[8])  + ''', ');
        Query1.SQL.Add('VLR_PECAS = '''          + FloattoStr(Valor[9])  + ''', ');
        Query1.SQL.Add('VLR_TOTAL = '''          + FloattoStr(Valor[10]) + ''', ');
        Query1.SQL.Add('HORA_INICIO = '''        + TimetoStr (Valor[11]) + ''', ');
        Query1.SQL.Add('HORA_FIM = '''           + TimetoStr (Valor[12]) + ''', ');
        Query1.SQL.Add('GARANTIA = '''           +            Valor[13]  + ''', ');
        Query1.SQL.Add('CONTRATO = '''           +            Valor[14]  + ''', ');
        Query1.SQL.Add('VENDEDOR_SQ = '''        + InttoStr  (Valor[15]) + ''', ');
        Query1.SQL.Add('FRETE = '''              +            Valor[16]  + ''' ');
        Query1.SQL.Add ('WHERE ASSISTENCIA_SQ = ' + InttoStr (Chave));
      end;
      Query1.ExecSQL;

      if novo = 255 then
      begin
        Query1.SQL.Clear;
        Query1.SQL.Add('SELECT LAST_INSERT_ID() as CHAVE');
        Query1.Open;
        Chave := Query1.FieldByName('CHAVE').AsInteger;
      end;

      for i := 0 to Valor[16] do
      if Valor[17][i] <> 0 then
      begin
        Query1.SQL.Clear;
        Query1.SQL.Add('SELECT CODIGO_PRODUTO FROM assistencias_equips AE LEFT OUTER JOIN produtos P ON (P.PRODUTO_SQ = AE.PRODUTO_SQ) WHERE ASSISTENCIA_EQUIP_SQ = ' + InttoStr(Valor[17][i]));
        Query1.Open;
        observacao := observacao + 'Exclusão de Equipamento (' + Query1.FieldByName('CODIGO_PRODUTO').AsString + ')' + chr(13);

        Query1.SQL.Clear;
        Query1.SQL.Add('DELETE FROM assistencias_equips WHERE ASSISTENCIA_EQUIP_SQ = ' + InttoStr (Valor[17][i]));
        Query1.ExecSQL;
      end;

      SetLength(chaves, StrtoInt(Valor[18])+1);
      for i := 0 to Valor[18] do
      if Valor[19][i][0] <> '' then
      begin
        Query1.SQL.Clear;
        if Valor[19][i][0] <> '0' then
        begin
          Query1.SQL.Add('UPDATE assistencias_equips SET ');
          Query1.SQL.Add ('PRODUTO_SQ = '''     +           Valor[19][i][1] + ''', ');
          Query1.SQL.Add ('NR_SERIE_EQUIP = ''' +           Valor[19][i][2] + ''', ');
          Query1.SQL.Add ('DEFEITO = '''        +           Valor[19][i][3] + ''', ');
          Query1.SQL.Add ('SERVICOS = '''       +           Valor[19][i][4] + ''' ');
          Query1.SQL.Add ('WHERE ASSISTENCIA_EQUIP_SQ = ' + Valor[19][i][0]);
          chaves[i] := Valor[19][i][0];
        end
        else begin
          Query1.SQL.Add('INSERT INTO assistencias_equips (' +
                         'ASSISTENCIA_SQ, PRODUTO_SQ, ' +
                         'NR_SERIE_EQUIP, DEFEITO, ' +
                         'SERVICOS) ' +
                         'VALUES (' +
                         '''' + InttoStr (Chave) + ''', ' +
                         '''' + Valor[19][i][1] + ''', ' +
                         '''' + Valor[19][i][2] + ''', ' +
                         '''' + Valor[19][i][3] + ''', ' +
                         '''' + Valor[19][i][4] + ''')');
        end;
        Query1.ExecSQL;
        if Valor[19][i][0] = '0' then
        begin
          Query1.SQL.Clear;
          Query1.SQL.Add('SELECT LAST_INSERT_ID() as CHAVE');
          Query1.Open;
          chaves[i] := Query1.FieldByName('CHAVE').AsInteger;
        end;
      end;

      for i := 0 to Valor[20] do
      if Valor[21][i] <> 0 then
      begin
        Query1.SQL.Clear;
        Query1.SQL.Add('SELECT CODIGO_PRODUTO FROM assistencias_itens AI LEFT OUTER JOIN produtos P ON (P.PRODUTO_SQ = AI.PRODUTO_SQ) WHERE ASSISTENCIA_ITEM_SQ = ' + InttoStr(Valor[21][i]));
        Query1.Open;
        observacao := observacao + 'Exclusão de Item (' + Query1.FieldByName('CODIGO_PRODUTO').AsString + ')' + chr(13);

        Query1.SQL.Clear;
        Query1.SQL.Add('DELETE FROM assistencias_itens WHERE ASSISTENCIA_ITEM_SQ = ' + InttoStr (Valor[21][i]));
        Query1.ExecSQL;
      end;

      for i := 0 to Valor[22] do
      if Valor[23][i][0] <> '' then
      begin
        Query1.SQL.Clear;
        if Valor[23][i][0] <> '0' then
        begin
          Query1.SQL.Add('UPDATE assistencias_itens SET ');
          Query1.SQL.Add ('PRODUTO_SQ = '''              + InttoStr  (Valor[23][i][1]) + ''', ');
          Query1.SQL.Add ('QTDE_ASSISTENCIA_ITEM = '''   + InttoStr  (Valor[23][i][2]) + ''', ');
          Query1.SQL.Add ('PRECO_UNIT = '''              + FloattoStr(Valor[23][i][3]) + ''' ');
          Query1.SQL.Add ('WHERE ASSISTENCIA_ITEM_SQ = ' + InttoStr  (Valor[23][i][0]));
        end
        else begin
          Query1.SQL.Add('INSERT INTO assistencias_itens (' +
                         'ASSISTENCIA_EQUIP_SQ, PRODUTO_SQ, ' +
                         'QTDE_ASSISTENCIA_ITEM, PRECO_UNIT) ' +
                         'VALUES (' +
                         '''' + InttoStr  (chaves[StrtoInt(Valor[23][i][4])]) + ''', ' +
                         '''' + InttoStr  (Valor[23][i][1]) + ''', ' +
                         '''' + InttoStr  (Valor[23][i][2]) + ''', ' +
                         '''' + FloattoStr(Valor[23][i][3]) + ''')');
        end;
        Query1.ExecSQL;
      end;

      if (novo = 255) and (Valor[0] = 0) then
      begin
        Query1.SQL.Clear;
        Query1.SQL.Add('UPDATE empresas SET NUMERO_ASSISTENCIA = NUMERO_ASSISTENCIA + 1');
        Query1.ExecSQL;

        Query1.SQL.Clear;
        Query1.SQL.Add('SELECT NUMERO_ASSISTENCIA FROM EMPRESAS');
        Query1.Open;
        Valor[0] := Query1.FieldByName ('NUMERO_ASSISTENCIA').AsInteger;

        Query1.SQL.Clear;
        Query1.SQL.Add('UPDATE assistencias SET');
        Query1.SQL.Add('NUMERO_ASSISTENCIA = ''' + InttoStr (Valor[0]) + '''');
        Query1.SQL.Add('WHERE ASSISTENCIA_SQ = ' + InttoStr (Chave));
        Query1.ExecSQL;
      end;
end;
}
{
procedure TServer.gravaModelo(Valor: OleVariant; Novo: Byte; var Chave: Integer);
begin
      Query1.SQL.Clear;
      if novo = 255 then
      begin
        Query1.SQL.Add('INSERT INTO modelos (' +
                       'CODIGO_MODELO, DESCRICAO_MODELO) ' +
                       'VALUES (' +
                       '''' + Valor[0] + ''', ' +
                       '''' + Valor[1] + ''') ');
      end
      else begin
        Query1.SQL.Add('UPDATE modelos SET ');
        Query1.SQL.Add ('CODIGO_MODELO = '''     + Valor[0] + ''', ');
        Query1.SQL.Add ('DESCRICAO_MODELO = '''  + Valor[1] + ''' ');
        Query1.SQL.Add ('WHERE MODELO_SQ = '     + InttoStr (Chave));
      end;
      Query1.ExecSQL;
      
  if novo = 255 then
  begin
    Query1.SQL.Clear;
    Query1.SQL.Add('SELECT LAST_INSERT_ID() as CHAVE');
    Query1.Open;
    Chave := Query1.FieldByName('CHAVE').AsInteger;
  end;
end;
}
{
function TServer.gravaVendedor(Valor: OleVariant; Novo: Byte): Integer;
var
  sql: String;
  reg: TVendedor;
begin
  reg := TVendedor.Criar;
  reg.fromString(Valor[0]);

  if novo = 255 then
    sql := 'INSERT INTO vendedores (CODIGO_VENDEDOR, NOME_VENDEDOR, ' +
      'pct_comissao_propria, pct_comissao_parceria, base_comissao, ' +
      'pct_comissao_desconto, obs_comissao_desconto) VALUES (%d, %s, %f, %f, %s, %f, %s)'
  else
    sql := 'UPDATE vendedores SET CODIGO_VENDEDOR = %d, NOME_VENDEDOR = %s, ' +
      'pct_comissao_propria = %f, pct_comissao_parceria = %f, base_comissao = %s, ' +
      'pct_comissao_desconto = %f, obs_comissao_desconto = %s ' +
      'WHERE VENDEDOR_SQ = ' + IntToStr(reg.vendedor_sq);

  Query1.SQL.Clear;
  Query1.SQL.Add(Format(sql, [
    reg.codigo_vendedor,
    QuotedStr(reg.nome_vendedor),
    reg.pct_comissao_propria,
    reg.pct_comissao_parceiro,
    QuotedStr(reg.base_comissao),
    reg.pct_comissao_desconto,
    QuotedStr(reg.obs_comissao_desconto)]));
  Query1.ExecSQL;

  if novo = 255 then
  begin
    Query1.SQL.Clear;
    Query1.SQL.Add('SELECT LAST_INSERT_ID() as CHAVE');
    Query1.Open;
    result := Query1.FieldByName('CHAVE').AsInteger;
  end
  else
    result := reg.vendedor_sq;
end;
}
{
procedure TServer.gravaContasPagar(Valor: OleVariant; Novo: Byte; var Chave: Integer);
var
  sql: String;
begin

  if Valor[5] = null then
    Valor[5] := 'null'
  else
    Valor[5] := QuotedStr(FormatDateTime('yyyy-mm-dd', Valor[5]));

  if Valor[10] = null then
    Valor[10] := 'null'
  else
    Valor[10] := QuotedStr(IntToStr(Valor[10]));

  if Valor[12] = null then
    Valor[12] := 'null'
  else
    Valor[12] := QuotedStr(IntToStr(Valor[12]));

  if novo = 255 then
    sql := 'INSERT INTO contas_pagar (fornecedor_sq, numero_duplicata, ' +
      'valor_duplicata, dtcadastro_duplicata, dtvencimento_duplicata, ' +
      'dt_pgto, valor_desconto, valor_juros, valor_pgto, forma_pgto, ' +
      'conta_banco_sq, observacao, conta_pagar_auto_sq, referencia_auto) ' +
      'VALUES (%d, %s, %f, %s, %s, %s, %f, %f, %f, %s, %s, %s, %s, %d)'
  else
    sql := 'UPDATE contas_pagar SET fornecedor_sq = %d, numero_duplicata = %s, ' +
      'valor_duplicata = %f, dtcadastro_duplicata = %s, dtvencimento_duplicata = %s, ' +
      'dt_pgto = %s, valor_desconto = %f, valor_juros = %f, valor_pgto = %f, ' +
      'forma_pgto = %s, conta_banco_sq = %s, observacao = %s, ' +
      'conta_pagar_auto_sq = %s, referencia_auto = %d where conta_pagar_sq = ' + IntToStr(Chave);

  Query1.SQL.Clear;
  Query1.SQL.Add(Format(sql, [
    StrToInt(Valor[0]),
    QuotedStr(Valor[1]),
    StrToFloat(Valor[2]),
    QuotedStr(FormatDateTime('yyyy-mm-dd', Valor[3])),
    QuotedStr(FormatDateTime('yyyy-mm-dd', Valor[4])),
    Valor[5],
    StrToFloat(Valor[6]),
    StrToFloat(Valor[7]),
    StrToFloat(Valor[8]),
    QuotedStr(Valor[9]),
    Valor[10],
    QuotedStr(Valor[11]),
    Valor[12],
    StrToInt(Valor[13])
    ]));
  Query1.ExecSQL;

  if novo = 255 then
  begin
    Query1.SQL.Clear;
    Query1.SQL.Add('SELECT LAST_INSERT_ID() as CHAVE');
    Query1.Open;
    Chave := Query1.FieldByName('CHAVE').AsInteger;
  end;
end;
}
{
procedure TServer.gravaContasPagarAuto(Valor: OleVariant; Novo: Byte; var Chave: Integer);
var
  sql: String;
begin
  if novo = 255 then
    sql := 'INSERT INTO contas_pagar_auto (fornecedor_sq, valor, ' +
      'data_inicial, parcelas, observacao) VALUES (%d, %f, %s, %d, %s)'
  else
    sql := 'UPDATE contas_pagar_auto SET fornecedor_sq = %d, valor = %f, ' +
      'data_inicial = %s, parcelas = %d, observacao = %s where conta_pagar_auto_sq = ' + IntToStr(Chave);

  Query1.SQL.Clear;
  Query1.SQL.Add(Format(sql, [
    StrToInt(Valor[0]),
    StrToFloat(Valor[1]),
    QuotedStr(FormatDateTime('yyyy-mm-dd', Valor[2])),
    StrToInt(Valor[3]),
    QuotedStr(Valor[4])]));
  Query1.ExecSQL;

  if novo = 255 then
  begin
    Query1.SQL.Clear;
    Query1.SQL.Add('SELECT LAST_INSERT_ID() as CHAVE');
    Query1.Open;
    Chave := Query1.FieldByName('CHAVE').AsInteger;
  end;
end;
}
{
procedure TServer.gravaAcesso(Valor: OleVariant; Novo: Byte; var Chave: Integer);
begin
      Query1.SQL.Clear;
      if novo = 255 then
      begin
        Query1.SQL.Add('INSERT INTO acessos (' +
                       'NOME_PROGRAMA, USUARIO_SQ, ' +
                       'VISUALIZAR, CRIAR, ' +
                       'EDITAR, APAGAR) ' +
                       'VALUES (' +
                       '''' + Valor[0] + ''', ' +
                       '''' + InttoStr (Valor[1]) + ''', ' +
                       '''' + Valor[2] + ''', ' +
                       '''' + Valor[3] + ''', ' +
                       '''' + Valor[4] + ''', ' +
                       '''' + Valor[5] + ''') ');
      end
      else begin
        Query1.SQL.Add('UPDATE acessos SET ');
        Query1.SQL.Add ('NOME_PROGRAMA = ''' +           Valor[0] + ''', ');
        Query1.SQL.Add ('USUARIO_SQ = '''    + InttoStr (Valor[1]) + ''', ');
        Query1.SQL.Add ('VISUALIZAR = '''    +           Valor[2] + ''', ');
        Query1.SQL.Add ('CRIAR = '''         +           Valor[3] + ''', ');
        Query1.SQL.Add ('EDITAR = '''        +           Valor[4] + ''', ');
        Query1.SQL.Add ('APAGAR = '''        +           Valor[5] + ''' ');
        Query1.SQL.Add ('WHERE ACESSO_SQ = ' + InttoStr (Chave));
      end;
      Query1.ExecSQL;
      
  if novo = 255 then
  begin
    Query1.SQL.Clear;
    Query1.SQL.Add('SELECT LAST_INSERT_ID() as CHAVE');
    Query1.Open;
    Chave := Query1.FieldByName('CHAVE').AsInteger;
  end;

end;
}
{
procedure TServer.gravaClassificacao(Valor: OleVariant; Novo: Byte; var Chave: Integer);
begin
      Query1.SQL.Clear;
      if novo = 255 then
      begin
        Query1.SQL.Add('INSERT INTO classificacao (' +
                       'CODIGO_CLASSIFICACAO, LIMITE_MINIMO, ' +
                       'LIMITE_MAXIMO, MESES_BONUS) ' +
                       'VALUES (' +
                       '''' + Valor[0] + ''', ' +
                       '''' + FloattoStr (Valor[1]) + ''', ' +
                       '''' + FloattoStr (Valor[2]) + ''', ' +
                       '''' + InttoStr (Valor[3]) + ''') ');
      end
      else begin
        Query1.SQL.Add('UPDATE classificacao SET ');
        Query1.SQL.Add ('CODIGO_CLASSIFICACAO = ''' +             Valor[0] + ''', ');
        Query1.SQL.Add ('LIMITE_MINIMO = '''        + FloattoStr (Valor[1]) + ''', ');
        Query1.SQL.Add ('LIMITE_MAXIMO = '''        + FloattoStr (Valor[2]) + ''', ');
        Query1.SQL.Add ('MESES_BONUS = '''          + InttoStr   (Valor[3]) + ''' ');
        Query1.SQL.Add ('WHERE CLASSIFICACAO_SQ = ' + InttoStr (Chave));
      end;
      Query1.ExecSQL;
      
  if novo = 255 then
  begin
    Query1.SQL.Clear;
    Query1.SQL.Add('SELECT LAST_INSERT_ID() as CHAVE');
    Query1.Open;
    Chave := Query1.FieldByName('CHAVE').AsInteger;
  end;

end;
}
{
procedure TServer.gravaNfServico(Valor: OleVariant; Novo: Byte; var Chave: Integer);
begin
      Query1.SQL.Clear;
      if novo = 255 then
      begin
        Query1.SQL.Add('INSERT INTO nf_servicos (' +
                       'NUMERO_NF_SERVICO, DATA_NF_SERVICO, ' +
                       'CLIENTE_SQ, TTL_NF_SERVICO, ' +
                       'ALIQ_ISS_NF_SERVICO, VLR_ISS_NF_SERVICO) ' +
                       'VALUES (' +
                       '''' + InttoStr   (Valor[0]) + ''', ' +
                       '''' + FormatDateTime  ('yyyy-mm-dd', Valor[1]) + ''', ' +
                       '''' + InttoStr   (Valor[2]) + ''', ' +
                       '''' + FloattoStr (Valor[3]) + ''', ' +
                       '''' + FloattoStr (Valor[4]) + ''', ' +
                       '''' + FloattoStr (Valor[5]) + ''') ');
      end
      else begin
        Query1.SQL.Add('UPDATE nf_servicos SET ');
        Query1.SQL.Add ('NUMERO_NF_SERVICO = '''   + InttoStr   (Valor[0]) + ''', ');
        Query1.SQL.Add ('DATA_NF_SERVICO = '''     + FormatDateTime  ('yyyy-mm-dd', Valor[1]) + ''', ');
        Query1.SQL.Add ('CLIENTE_SQ = '''          + InttoStr   (Valor[2]) + ''', ');
        Query1.SQL.Add ('TTL_NF_SERVICO = '''      + FloattoStr (Valor[3]) + ''', ');
        Query1.SQL.Add ('ALIQ_ISS_NF_SERVICO = ''' + FloattoStr (Valor[4]) + ''', ');
        Query1.SQL.Add ('VLR_ISS_NF_SERVICO = '''  + FloattoStr (Valor[5]) + ''' ');
        Query1.SQL.Add ('WHERE NF_SERVICO_SQ = '   + InttoStr (Chave));
      end;
      Query1.ExecSQL;
      
  if novo = 255 then
  begin
    Query1.SQL.Clear;
    Query1.SQL.Add('SELECT LAST_INSERT_ID() as CHAVE');
    Query1.Open;
    Chave := Query1.FieldByName('CHAVE').AsInteger;
  end;

end;
}
{
procedure TServer.gravaNfEntrada(Valor: OleVariant; Novo: Byte; var Chave: Integer);
var
  i: Integer;
begin
      Query1.SQL.Clear;
      if novo = 255 then
      begin
        Query1.SQL.Add('INSERT INTO nf_entradas (' +
                       'NUMERO_NF_ENT, DTEMISSAO_NF_ENT, ' +
                       'CLIENTE_SQ, BASE_ICMS, ' +
                       'VLR_ICMS, BASE_ICMS_SUBST, ' +
                       'VLR_ICMS_SUBST, VLR_PRODUTOS, ' +
                       'VLR_FRETE, VLR_SEGURO, ' +
                       'VLR_DESP_ACESS, VLR_IPI, ' +
                       'VLR_TOTAL, OBSERVACAO, ' +
                       'TRANSFERIDA, NATUREZA_SQ)');
        Query1.SQL.Add('VALUES (' +
                       '''' + InttoStr  (Valor[0]) + ''', ' +
                       '''' + FormatDateTime  ('yyyy-mm-dd', Valor[1]) + ''', ' +
                       '''' + InttoStr  (Valor[2]) + ''', ' +
                       '''' + FloattoStr(Valor[3]) + ''', ' +
                       '''' + FloattoStr(Valor[4]) + ''', ' +
                       '''' + FloattoStr(Valor[5]) + ''', ' +
                       '''' + FloattoStr(Valor[6]) + ''', ' +
                       '''' + FloattoStr(Valor[7]) + ''', ' +
                       '''' + FloattoStr(Valor[8]) + ''', ' +
                       '''' + FloattoStr(Valor[9]) + ''', ' +
                       '''' + FloattoStr(Valor[10]) + ''', ' +
                       '''' + FloattoStr(Valor[11]) + ''', ' +
                       '''' + FloattoStr(Valor[12]) + ''', ' +
                       '''' + Valor[13]   + ''', '  +
                       '''' + Valor[21]   + ''', '  +
                       '''' + InttoStr  (Valor[22]) + ''') ');
      end
      else begin
        Query1.SQL.Add('UPDATE nf_entradas SET ');
        Query1.SQL.Add('NUMERO_NF_ENT = '''    + InttoStr  (Valor[0]) + ''', ');
        Query1.SQL.Add('DTEMISSAO_NF_ENT = ''' + FormatDateTime  ('yyyy-mm-dd', Valor[1]) + ''', ');
        Query1.SQL.Add('CLIENTE_SQ = '''       +   IntToStr(Valor[2]) + ''', ');
        Query1.SQL.Add('BASE_ICMS = '''        + FloattoStr(Valor[3]) + ''', ');
        Query1.SQL.Add('VLR_ICMS = '''         + FloattoStr(Valor[4]) + ''', ');
        Query1.SQL.Add('BASE_ICMS_SUBST = '''  + FloattoStr(Valor[5]) + ''', ');
        Query1.SQL.Add('VLR_ICMS_SUBST = '''   + FloattoStr(Valor[6]) + ''', ');
        Query1.SQL.Add('VLR_PRODUTOS = '''     + FloattoStr(Valor[7]) + ''', ');
        Query1.SQL.Add('VLR_FRETE = '''        + FloattoStr(Valor[8]) + ''', ');
        Query1.SQL.Add('VLR_SEGURO = '''       + FloattoStr(Valor[9]) + ''', ');
        Query1.SQL.Add('VLR_DESP_ACESS = '''   + FloattoStr(Valor[10]) + ''', ');
        Query1.SQL.Add('VLR_IPI = '''          + FloattoStr(Valor[11]) + ''', ');
        Query1.SQL.Add('VLR_TOTAL = '''        + FloattoStr(Valor[12]) + ''', ');
        Query1.SQL.Add('OBSERVACAO = '''       +            Valor[13] + ''', ');
        Query1.SQL.Add('TRANSFERIDA = '''      +            Valor[21] + ''', ');
        Query1.SQL.Add('NATUREZA_SQ = '''      +   IntToStr(Valor[22]) + ''' ');
        Query1.SQL.Add ('WHERE NF_ENTRADA_SQ = ' + InttoStr (Chave));
      end;
      Query1.ExecSQL;

      if novo = 255 then
      begin
        Query1.SQL.Clear;
        Query1.SQL.Add('SELECT LAST_INSERT_ID() as CHAVE');
        Query1.Open;
        Chave := Query1.FieldByName('CHAVE').AsInteger;
      end;

      for i := 0 to Valor[14] do
      if Valor[15][i] <> 0 then
      begin
        Query1.SQL.Clear;
        Query1.SQL.Add('SELECT CODIGO_PRODUTO FROM nf_entradas_itens NI LEFT OUTER JOIN produtos P ON (P.PRODUTO_SQ = NI.PRODUTO_SQ) WHERE NF_ENTRADA_ITEM_SQ = ' + InttoStr(Valor[15][i]));
        Query1.Open;
        observacao := observacao + 'Exclusão de Item (' + Query1.FieldByName('CODIGO_PRODUTO').AsString + ')' + chr(13);

        Query1.SQL.Clear;
        Query1.SQL.Add('DELETE FROM nf_entradas_itens WHERE NF_ENTRADA_ITEM_SQ = ' + InttoStr (Valor[15][i]));
        Query1.ExecSQL;
      end;

      for i := 0 to Valor[16] do
      if (Valor[18] >= 0) and (Valor[19][0] <> 0) then
      begin
        Query1.SQL.Clear;
        if Valor[20][i] <> '0' then
        begin
          Query1.SQL.Add('UPDATE nf_entradas_itens SET ');
          Query1.SQL.Add ('PRODUTO_SQ = '''       + InttoStr  (Valor[19][i]) + ''', ');
          Query1.SQL.Add ('NR_SERIE_ITEM = '''    +            Valor[17][i][10] + ''', ');
          Query1.SQL.Add ('QTDE_ITEM = '''        + InttoStr  (Valor[17][i][3]) + ''', ');
          Query1.SQL.Add ('VLR_UNIT_ITEM = '''    + FloattoStr(Valor[17][i][4]) + ''', ');
          Query1.SQL.Add ('VLR_TOTAL_ITEM = '''   + FloattoStr(Valor[17][i][9]) + ''', ');
          Query1.SQL.Add ('ALIQ_ICMS_ITEM = '''   + FloattoStr(Valor[17][i][5]) + ''', ');
          Query1.SQL.Add ('ALIQ_IPI_ITEM = '''    + FloattoStr(Valor[17][i][7]) + ''', ');
          Query1.SQL.Add ('VLR_ICMS_ITEM = '''    + FloattoStr(Valor[17][i][6]) + ''', ');
          Query1.SQL.Add ('VLR_IPI_ITEM = '''     + FloattoStr(Valor[17][i][8]) + ''' ');
          Query1.SQL.Add ('WHERE NF_ENTRADA_ITEM_SQ = ' + InttoStr (Valor[20][i]));
        end
        else begin
          Query1.SQL.Add('INSERT INTO nf_entradas_itens (' +
                         'NF_ENTRADA_SQ, ITEM, ' +
                         'PRODUTO_SQ, NR_SERIE_ITEM, ' +
                         'QTDE_ITEM, VLR_UNIT_ITEM, ' +
                         'VLR_TOTAL_ITEM, ALIQ_ICMS_ITEM, ' +
                         'ALIQ_IPI_ITEM, VLR_ICMS_ITEM, ' +
                         'VLR_IPI_ITEM) ' +
                         'VALUES (' +
                         '''' + InttoStr   (Chave) + ''', ' +
                         '''' + InttoStr   (i+1) + ''', ' +
                         '''' + InttoStr   (Valor[19][i])  + ''', ' +
                         '''' +             Valor[17][i][10]  + ''', ' +
                         '''' + InttoStr   (Valor[17][i][3])  + ''', ' +
                         '''' + FloattoStr (Valor[17][i][4])  + ''', ' +
                         '''' + FloattoStr (Valor[17][i][9])  + ''', ' +
                         '''' + FloattoStr (Valor[17][i][5])  + ''', ' +
                         '''' + FloattoStr (Valor[17][i][7]) + ''', ' +
                         '''' + FloattoStr (Valor[17][i][6]) + ''', ' +
                         '''' + FloattoStr (Valor[17][i][8]) + ''')');
        end;
        Query1.ExecSQL;
      end;
end;
}
{
procedure TServer.gravaConteiner(Valor: OleVariant; Novo: Byte; var Chave: Integer);
var
  i: Integer;
  s: string;
begin
      Query1.SQL.Clear;
      if novo = 255 then
      begin
        Query1.SQL.Add('INSERT INTO conteiner (' +
                       'INVOICE_NUMBER, DATA_REMESSA, ' +
                       'DATA_CHEGADA, TIPO_ENVIO, ' +
                       'CONHECIMENTO, OBSERVACAO) ' +
                       'VALUES (' +
                       '''' +                              Valor[0]  + ''', ' +
                       '''' + FormatDateTime('yyyy-mm-dd', Valor[1]) + ''', ' +
                       '''' + FormatDateTime('yyyy-mm-dd', Valor[2]) + ''', ' +
                       '''' +                              Valor[3]  + ''', ' +
                       '''' +                              Valor[4]  + ''', ' +
                       '''' +                              Valor[5]  + ''') ');
      end
      else begin
        Query1.SQL.Add('SELECT * FROM conteiner WHERE CONTEINER_SQ = ' + InttoStr(Chave));
        Query1.Open;
        if Query1.FieldByName('INVOICE_NUMBER').AsString <> Valor[0]             then observacao := observacao + 'Invoice Number ('  + Query1.FieldByName('INVOICE_NUMBER').AsString + ' -> ' +            Valor[0]  + ')' + chr(13);
        if Query1.FieldByName('DATA_REMESSA').AsString   <> DatetoStr (Valor[1]) then observacao := observacao + 'Data da Remessa (' + Query1.FieldByName('DATA_REMESSA').AsString   + ' -> ' + DatetoStr (Valor[1]) + ')' + chr(13);
        if Query1.FieldByName('DATA_CHEGADA').AsString   <> DatetoStr (Valor[2]) then observacao := observacao + 'Data de Chegada (' + Query1.FieldByName('DATA_CHEGADA').AsString   + ' -> ' + DatetoStr (Valor[2]) + ')' + chr(13);
        if Query1.FieldByName('TIPO_ENVIO').AsString     <> Valor[3]             then observacao := observacao + 'Tipo de Envio ('   + Query1.FieldByName('TIPO_ENVIO').AsString     + ' -> ' +            Valor[3]  + ')' + chr(13);
        if Query1.FieldByName('CONHECIMENTO').AsString   <> Valor[4]             then observacao := observacao + 'Conhecimento ('    + Query1.FieldByName('CONHECIMENTO').AsString   + ' -> ' +            Valor[4]  + ')' + chr(13);
        Query1.SQL.Clear;

        Query1.SQL.Add('UPDATE conteiner SET ');
        Query1.SQL.Add('INVOICE_NUMBER = '''    +                              Valor[0]  + ''', ');
        Query1.SQL.Add('DATA_REMESSA = '''      + FormatDateTime('yyyy-mm-dd', Valor[1]) + ''', ');
        Query1.SQL.Add('DATA_CHEGADA = '''      + FormatDateTime('yyyy-mm-dd', Valor[2]) + ''', ');
        Query1.SQL.Add('TIPO_ENVIO = '''        +                              Valor[3]  + ''', ');
        Query1.SQL.Add('CONHECIMENTO = '''      +                              Valor[4]  + ''', ');
        Query1.SQL.Add('OBSERVACAO = '''        +                              Valor[5]  + ''' ');
        Query1.SQL.Add ('WHERE CONTEINER_SQ = ' + InttoStr (Chave));
      end;
      Query1.ExecSQL;

      if novo = 255 then
      begin
        Query1.SQL.Clear;
        Query1.SQL.Add('SELECT LAST_INSERT_ID() as CHAVE');
        Query1.Open;
        Chave := Query1.FieldByName('CHAVE').AsInteger;
      end;

      for i := 0 to Valor[6] do
      if Valor[7][i] <> 0 then
      begin
        Query1.SQL.Clear;
        Query1.SQL.Add('SELECT CODIGO_PRODUTO FROM conteiner_itens CI LEFT OUTER JOIN produtos P ON (P.PRODUTO_SQ=CI.PRODUTO_SQ) WHERE CONTEINER_ITEM_SQ = ' + InttoStr (Valor[7][i]));
        Query1.Open;
        observacao := observacao + 'Exclusão de Item (' + Query1.FieldByName('CODIGO_PRODUTO').AsString + ')' + chr(13);

        Query1.SQL.Clear;
        Query1.SQL.Add('DELETE FROM conteiner_itens WHERE CONTEINER_ITEM_SQ = ' + InttoStr (Valor[7][i]));
        Query1.ExecSQL;
      end;

      for i := 0 to Valor[8] do
      if Valor[9][i][0] <> -1 then
      begin
        Query1.SQL.Clear;
        if Valor[9][i][0] <> 0 then
        begin
          Query1.SQL.Add('SELECT P.PRODUTO_SQ, CODIGO_PRODUTO, QUANTIDADE FROM conteiner_itens CI LEFT OUTER JOIN produtos P ON (P.PRODUTO_SQ=CI.PRODUTO_SQ) WHERE CONTEINER_ITEM_SQ = ' + InttoStr (Valor[9][i][0]));
          Query1.Open;
          if Query1.FieldByName('QUANTIDADE').AsInteger <> Valor[9][i][2] then observacao := observacao + 'Alteração de Quantidade do Produto "' + Query1.FieldByName('CODIGO_PRODUTO').AsString + '" (' + Query1.FieldByName('QUANTIDADE').AsString + ' -> ' + InttoStr(Valor[9][i][2]) + ')' + chr(13);
          if Query1.FieldByName('PRODUTO_SQ').AsInteger <> Valor[9][i][1] then
          begin
            s := Query1.FieldByName('CODIGO_PRODUTO').AsString;
            Query1.SQL.Clear;
            Query1.SQL.Add('SELECT CODIGO_PRODUTO FROM produtos WHERE PRODUTO_SQ = ' + InttoStr (Valor[9][i][1]));
            Query1.Open;
            observacao := observacao + 'Alteração de Produto (' + s + ' -> ' + Query1.FieldByName('CODIGO_PRODUTO').AsString + ')' + chr(13);
          end;

          Query1.SQL.Clear;
          Query1.SQL.Add('UPDATE conteiner_itens SET ');
          Query1.SQL.Add ('PRODUTO_SQ = '''            + InttoStr (Valor[9][i][1]) + ''', ');
          Query1.SQL.Add ('QUANTIDADE = '''            + InttoStr (Valor[9][i][2]) + ''' ');
          Query1.SQL.Add ('WHERE CONTEINER_ITEM_SQ = ' + InttoStr (Valor[9][i][0]));
        end
        else begin
          Query1.SQL.Add('SELECT * FROM produtos WHERE PRODUTO_SQ = ' + InttoStr (Valor[9][i][1]));
          Query1.Open;
          observacao := observacao + 'Inclusão de Produto (' + Query1.FieldByName('CODIGO_PRODUTO').AsString + ') com Quantidade (' + InttoStr(Valor[9][i][2]) + ')' + chr(13);
          Query1.SQL.Clear;

          Query1.SQL.Add('INSERT INTO conteiner_itens (' +
                         'CONTEINER_SQ, PRODUTO_SQ, ' +
                         'QUANTIDADE) ' +
                         'VALUES (' +
                         '''' + InttoStr (Chave) + ''', ' +
                         '''' + InttoStr (Valor[9][i][1]) + ''', ' +
                         '''' + InttoStr (Valor[9][i][2]) + ''')');
        end;
        Query1.ExecSQL;
      end;
end;
}
{
procedure TServer.gravaHistAlteracao(Tabela: String; chave_sq, tipoAlteracao, usuario: Integer; observacao: String);
begin
  Query1.SQL.Clear;
  Query1.SQL.Add('INSERT INTO hist_alteracoes (' +
                 'NOME_TABELA, CHAVE_SQ, ' +
                 'TIPO_ALTERACAO, USUARIO_SQ, ' +
                 'DATA_ALTERACAO, OBSERVACAO) ' +
                 'VALUES (' +
                 '''' + Tabela + ''', ' +
                 '''' + InttoStr (chave_sq) + ''', ' +
                 '''' + InttoStr (tipoAlteracao) + ''', ' +
                 '''' + InttoStr (usuario) + ''', ' +
                 '''' + FormatDateTime ('yyyy-mm-dd hh:nn:ss', Date+Time) + ''', ' +
                        QuotedStr(observacao) + ') ');
  Query1.ExecSQL;
end;
}
{
procedure TServer.gravaAgenda(Valor: OleVariant; Novo: Byte; var Chave: Integer);
begin
  if Valor[4] then Valor[4] := 'S' else Valor[4] := 'N';
  Query1.SQL.Clear;
  if novo = 255 then
    Query1.SQL.Add('INSERT INTO agenda (' +
                   'DATA_AGENDA, VENDEDOR_SQ, ' +
                   'CLIENTE_SQ, OBSERVACAO, ' +
                   'REALIZADO, USUARIO_PAI_SQ) ' +
                   'VALUES (' +
                   '''' + FormatDateTime('yyyy-mm-dd hh:nn', Valor[0]) + ''', ' +
                   '''' + InttoStr (Valor[1]) + ''', ' +
                   '''' + InttoStr (Valor[2]) + ''', ' +
                   '''' + Valor[3] + ''', ' +
                   '''' + Valor[4] + ''', ' +
                   '''' + InttoStr (Valor[5]) + ''') ')
  else begin
    Query1.SQL.Add('UPDATE agenda SET ');
    Query1.SQL.Add ('DATA_AGENDA = '''    + FormatDateTime  ('yyyy-mm-dd hh:nn', Valor[0]) + ''', ');
    Query1.SQL.Add ('VENDEDOR_SQ = '''    + InttoStr(Valor[1]) + ''', ');
    Query1.SQL.Add ('CLIENTE_SQ = '''     + InttoStr(Valor[2]) + ''', ');
    Query1.SQL.Add ('OBSERVACAO = '''     +          Valor[3]  + ''', ');
    Query1.SQL.Add ('REALIZADO = '''      +          Valor[4]  + ''', ');
    Query1.SQL.Add ('USUARIO_PAI_SQ = ''' + InttoStr(Valor[5]) + ''' ');
    Query1.SQL.Add ('WHERE AGENDA_SQ = ' + InttoStr (Chave));
  end;
  Query1.ExecSQL;
  
  if novo = 255 then
  begin
    Query1.SQL.Clear;
    Query1.SQL.Add('SELECT LAST_INSERT_ID() as CHAVE');
    Query1.Open;
    Chave := Query1.FieldByName('CHAVE').AsInteger;
  end;

end;
}
{
procedure TServer.gravaProdutoFaltante(Valor: OleVariant; Novo: Byte; var Chave: Integer);
begin
  if Valor[3] <> Null then
    Valor[3] := InttoStr (Valor[3]) else
    Valor[3] := 'Null';

  if Valor[4] <> Null then
    Valor[4] := InttoStr (Valor[4]) else
    Valor[4] := 'Null';

  Query1.SQL.Clear;
  if novo = 255 then
    Query1.SQL.Add('INSERT INTO produtos_faltantes (' +
                   'PRODUTO_SQ, QTDE_PRODUTO_FALTANTE, ' +
                   'DATA_PRODUTO_FALTANTE, NF_ENTRADA_SQ, ' +
                   'CLIENTE_SQ) ' +
                   'VALUES (' +
                   '''' + InttoStr (Valor[0]) + ''', ' +
                   '''' + InttoStr (Valor[1]) + ''', ' +
                   '''' + FormatDateTime('yyyy-mm-dd hh:nn', Valor[2]) + ''', ' +
                        +           Valor[3]  + ', '   +
                        +           Valor[4]  + ') ')
  else begin
    Query1.SQL.Add('UPDATE produtos_faltantes SET ');
    Query1.SQL.Add ('PRODUTO_SQ =            ''' + InttoStr(Valor[0]) + ''', ');
    Query1.SQL.Add ('QTDE_PRODUTO_FALTANTE = ''' + InttoStr(Valor[1]) + ''', ');
    Query1.SQL.Add ('DATA_PRODUTO_FALTANTE = ''' + FormatDateTime  ('yyyy-mm-dd hh:nn', Valor[2]) + ''', ');
    Query1.SQL.Add ('NF_ENTRADA_SQ = '           +          Valor[3]  + ', ');
    Query1.SQL.Add ('CLIENTE_SQ = '              +          Valor[4]  + ' ');
    Query1.SQL.Add ('WHERE PRODUTO_FALTANTE_SQ = ' + InttoStr (Chave));
  end;
  Query1.ExecSQL;

  if novo = 255 then
  begin
    Query1.SQL.Clear;
    Query1.SQL.Add('SELECT LAST_INSERT_ID() as CHAVE');
    Query1.Open;
    Chave := Query1.FieldByName('CHAVE').AsInteger;
  end;
end;
}
{
procedure TServer.gravaLinha(Valor: OleVariant; Novo: Byte; var Chave: Integer);
begin
  if Valor[1] then
    Valor[1] := 'S'
  else
    Valor[1] := 'N';
    
  Query1.SQL.Clear;
  if novo = 255 then
    Query1.SQL.Add('insert into linha (' +
                   'descricao_linha, exclusiva) ' +
                   'VALUES (' +
                   QuotedStr(Valor[0]) + ',' +
                   QuotedStr(Valor[1]) + ')')
  else begin
    Query1.SQL.Add('update linha set ');
    Query1.SQL.Add ('descricao_linha = ' + QuotedStr(Valor[0]));
    Query1.SQL.Add (',exclusiva = ' + QuotedStr(Valor[1]));
    Query1.SQL.Add ('where linha_sq = ' + InttoStr (Chave));
  end;
  Query1.ExecSQL;

  if novo = 255 then
  begin
    Query1.SQL.Clear;
    Query1.SQL.Add('SELECT LAST_INSERT_ID() as CHAVE');
    Query1.Open;
    Chave := Query1.FieldByName('CHAVE').AsInteger;
  end;
end;
}
{
procedure TServer.gravaEstado(Valor: OleVariant; Novo: Byte;
  var Chave: Integer);
begin
  Query1.SQL.Clear;
  if novo = 255 then
    Query1.SQL.Add('insert into estado (' +
                   'codigo_estado, aliq_icms_intra, ' +
                   'descricao_estado, codigo_ibge) ' +
                   'VALUES (' +
                   QuotedStr(Valor[0]) + ',' +
                   QuotedStr(FloattoStr(Valor[1])) + ',' +
                   QuotedStr(Valor[2]) + ',' +
                   IntToStr(Valor[3]) + ') ')
  else begin
    Query1.SQL.Add('update estado set ');
    Query1.SQL.Add ('codigo_estado    = ' + QuotedStr(Valor[0]));
    Query1.SQL.Add (',aliq_icms_intra  = ' + QuotedStr(FloatToStr(Valor[1])));
    Query1.SQL.Add (',descricao_estado = ' + QuotedStr(Valor[2]));
    Query1.SQL.Add (',codigo_ibge      = ' + IntToStr(Valor[3]));
    Query1.SQL.Add ('where estado_sq = ' + InttoStr (Chave));
  end;
  Query1.ExecSQL;

  if novo = 255 then
  begin
    Query1.SQL.Clear;
    Query1.SQL.Add('SELECT LAST_INSERT_ID() as CHAVE');
    Query1.Open;
    Chave := Query1.FieldByName('CHAVE').AsInteger;
  end;
end;
}
{
function TServer.CriaRegistro(const TABELA: WideString; usuario: Integer; Novo: Byte;
  var Chave: Integer; CAMPOS: OleVariant): WideString;
var
  Valor: array of Variant;
  i, i2, tipoAlteracao: Integer;
  s: String;
  transacao: Boolean;
begin
  SetLength (Valor, VarArrayHighBound(Campos, 1)+1);
  DecimalSeparator := '.';
  if TABELA = 'Vendedores' then
    Valor[0] := Campos[0]
  else
    for i := 0 to VarArrayHighBound(Campos, 1) do
    try
      Valor[i] := Campos[i];
      for i2 := Length (Valor[i]) downto 1 do
      begin
        if Copy (Valor[i], i2, 1) = '''' then
        begin
          s := Valor[i];
          Insert ('''', s, i2);
          Valor[i] := s;
        end;
        if Copy (Valor[i], i2, 1) = '\' then
        begin
          s := Valor[i];
          Insert ('\', s, i2);
          Valor[i] := s;
        end;
      end;
    except
    end;

  Result := '';
  transacao := DBConn.InTransaction;
  if not DBConn.InTransaction then
  begin
    DBConn.Open;
    DBConn.StartTransaction;
  end;

  try
    observacao := '';

    if TABELA = 'Acessos'         then gravaAcesso        (Valor, Novo, Chave);
    if TABELA = 'Agenda'          then gravaAgenda        (Valor, Novo, Chave);
    if TABELA = 'Assistencias'    then gravaAssistencia   (Valor, Novo, Chave);
    if TABELA = 'Classificacao'   then gravaClassificacao (Valor, Novo, Chave);
    if TABELA = 'Clientes'        then gravaCliente       (Valor, Novo, Chave);
    if TABELA = 'Cond_Pagto'      then gravaCondPagto     (Valor, Novo, Chave);
    if TABELA = 'Conteiner'       then gravaConteiner     (Valor, Novo, Chave);
    if TABELA = 'Duplicatas'      then gravaDuplicata     (Valor, Novo, Chave);
    if TABELA = 'Contas_Pagar'    then gravaContasPagar   (Valor, Novo, Chave);
    if TABELA = 'Contas_Pagar_Auto' then gravaContasPagarAuto(Valor, Novo, Chave);
    if TABELA = 'Empresas'        then gravaEmpresa       (Valor, Novo, Chave);
    if TABELA = 'Kardex'          then gravaKardex        (Valor, Novo, Chave);
    if TABELA = 'Modelos'         then gravaModelo        (Valor, Novo, Chave);
    if TABELA = 'Naturezas'       then gravaNatureza      (Valor, Novo, Chave);
    if TABELA = 'NBM'             then gravaNBM           (Valor, Novo, Chave);
    if TABELA = 'Nf_Servicos'     then gravaNfServico     (Valor, Novo, Chave);
    if TABELA = 'Nf_Entradas'     then gravaNfEntrada     (Valor, Novo, Chave);
    if TABELA = 'NfDemonstracao'  then gravaNfDemonstracao(Valor, Novo, Chave);
    if TABELA = 'NFiscais'        then gravaNfiscal       (Valor, Novo, Chave);
    if TABELA = 'Pedidos'         then gravaPedido        (Valor, Novo, Chave);
    if TABELA = 'Produtos'        then gravaProduto       (Valor, Novo, Chave);
    if TABELA = 'Produtos_Faltantes' then gravaProdutoFaltante(Valor, Novo, Chave);
    if TABELA = 'Transportadoras' then gravaTransportadora(Valor, Novo, Chave);
    if TABELA = 'Usuarios'        then gravaUsuario       (Valor, Novo, Chave);
    if TABELA = 'Vendedores'      then Chave := gravaVendedor      (Valor, Novo);
    if TABELA = 'linha'           then gravaLinha         (Valor, Novo, Chave);
    if TABELA = 'tipo_cliente'    then gravaTipoCliente   (Valor, Novo, Chave);
    if TABELA = 'estado'          then gravaEstado        (Valor, Novo, Chave);

    if Novo = 255 then tipoAlteracao := 0
                  else TipoAlteracao := 1;

    gravaHistAlteracao(Tabela, Chave, tipoAlteracao, usuario, observacao);

    if not transacao then
    begin
      DBConn.Commit;
      DBConn.Close;
    end;
  except
    on E: Exception do
    begin
      Result := E.Message + ' ' + Query1.SQL.Text;
      DBConn.Rollback;
    end;
  end;
end;
}
function TServer.ApagaRegistro(Campos: OleVariant): WideString;
begin
  try
    Result := '';
    Query1.SQL.Clear;
    Query1.SQL.Add('DELETE FROM ' + Campos[0] + ' WHERE ' + Campos[1] + ' = ' + Campos[2]);
    Query1.ExecSQL;
//    gravaHistAlteracao(Campos[0], Campos[2], -1, Campos[3], 'Exclusão');
  except
    Result := 'Este Registro Não Pode ser Apagado!' + chr(13) + 'Verifique os vinculos deste registro com outras tabelas!';
  end;
end;
{
function TServer.VerificaIndice(const TABELA: WideString; const CAMPO: WideString; const VALOR: WideString): Integer;
var
  sq: String;
begin
  try
    Result := 0;
    qrVerIndice.Close;
    qrVerIndice.Sql.Text := 'select column_name from information_schema.columns where table_name=' + QuotedStr(tabela) + ' and column_key=''PRI''';
    qrVerIndice.Open;
    sq := qrVerIndice.Fields[0].AsString;

    qrVerIndice.Close;
    qrVerIndice.Sql.Text := 'SELECT ' + sq + ' FROM ' + TABELA + ' WHERE ' + CAMPO + ' = ' + QuotedStr(VALOR);
    qrVerIndice.Open;
    if not qrVerIndice.Eof then
      Result := qrVerIndice.Fields[0].AsInteger;
  finally
  end;
end;
}
{
function TServer.CancelaNFiscal(nfiscal_sq: Integer; useq: Integer): WideString;
var
  qr1, qr2: TQuery;
  ent_sai: string;
  chave: Integer;
begin
  Result := '';
  DBConn.Open;
  DBConn.StartTransaction;

  qr2 := TQuery.Create(self);
  qr2.DatabaseName := 'DBConn';

  qr1 := TQuery.Create(self);
  qr1.DatabaseName := 'DBConn';

  qr1.SQL.Clear;
  qr1.SQL.Add('UPDATE nfiscais SET');
  qr1.SQL.Add('CANCELADA = ''S''');
  qr1.SQL.Add('WHERE NFISCAL_SQ = ' + InttoStr (nfiscal_sq));
  qr1.ExecSQL;

  qr1.SQL.Clear;
  qr1.SQL.Add('DELETE FROM duplicatas');
  qr1.SQL.Add('WHERE NFISCAL_SQ = ' + InttoStr (nfiscal_sq));
  qr1.ExecSQL;

  qr1.SQL.Clear;
  qr1.SQL.Add('SELECT NI.*, N.DTEMISSAO_NFISCAL, N.NUMERO_NFISCAL, NA.ENT_SAI');
  qr1.SQL.Add('FROM nfiscais_itens NI');
  qr1.SQL.Add('LEFT OUTER JOIN nfiscais N ON (N.NFISCAL_SQ = NI.NFISCAL_SQ)');
  qr1.SQL.Add('LEFT OUTER JOIN naturezas NA ON (NA.NATUREZA_SQ = N.NATUREZA_SQ)');
  qr1.SQL.Add('WHERE NI.NFISCAL_SQ = ' + InttoStr (nfiscal_sq));
  qr1.Open;
  qr1.First;

  While not qr1.Eof do
  begin
    ent_sai := qr1.FieldByName('ENT_SAI').AsString;
    chave := 0;
    Result := CriaRegistro('Kardex', useq, 255, chave,
    VarArrayOf ([
      qr1.FieldByName('PRODUTO_SQ').Value,
      ent_sai,
      (qr1.FieldByName('QTDE_ITEM_LOJA').Value * -1),
      (qr1.FieldByName('QTDE_ITEM_ARMAZEM').Value * -1),
      (qr1.FieldByName('QTDE_ITEM_DEMO').Value * -1),
      qr1.FieldByName('DTEMISSAO_NFISCAL').Value,
      qr1.FieldByName('NUMERO_NFISCAL').Value,
      (qr1.FieldByName('VLR_TOTAL_ITEM').Value * -1),
      useq,
      qr1.FieldByName('NR_SERIE_ITEM').Value,
      Null]));
    if Result <> '' then
      raise Exception.Create(Result);
  qr1.Next;
  end;

  DBConn.Commit;
  DBConn.Close;
end;
}
{
function TServer.FinalizaNfiscal(Nfiscal: Integer; useq: Integer): WideString;
var
  chaveKardex: Integer;
  ent_sai: String;
begin
  try
    Result := '';
    DBConn.Open;
    DBConn.StartTransaction;
    qrListaProdutos.Open;

    qrListaNfiscais.Close;
    qrListaNfiscais.Filter   := 'NFISCAL_SQ = ' + IntToStr(Nfiscal);
    qrListaNFiscais.Filtered := True;
    qrListaNFiscais.Open;

    Query1.SQL.Clear;
    Query1.SQL.Add('select ent_sai from naturezas where natureza_sq = ' + IntToStr(qrListaNfiscais.FieldByName('NATUREZA_SQ').AsInteger));
    Query1.Open;

    if Query1.Eof then
      ent_sai := ''
    else
      ent_sai := Query1.FieldByName('ent_sai').AsString;

    Query1.SQL.Clear;
    Query1.SQL.Add('select baixou_estoque from pedidos where nfiscal_sq = ' + IntToStr(Nfiscal));
    Query1.Open;
    if (qrListaNfiscais.FieldByName('concluida').AsString <> 'S') and // significa que nao baixou pela nota.
       (Query1.FieldByName('baixou_estoque').AsString <> 'S') then //significa que nao baixou pelo pedido.
    begin
      qrListaNfiscaisItens.Close;
      qrListaNfiscaisItens.Params.ParamByName('NFISCAL_SQ').AsInteger := Nfiscal;
      qrListaNfiscaisItens.Open;

      if ent_sai <> '' then
      begin
        qrListaNfiscaisItens.First;
        While not qrListaNfiscaisItens.Eof do
        begin
          chaveKardex := 0;
          Result := Result + ' ' + CriaRegistro('Kardex', useq, 255, chaveKardex,
          VarArrayOf ([
                qrListaNfiscaisItens.FieldByName('PRODUTO_SQ').Value,
                ent_sai,
                qrListaNfiscaisItens.FieldByName('QTDE_ITEM_LOJA').Value,
                qrListaNfiscaisItens.FieldByName('QTDE_ITEM_ARMAZEM').Value,
                qrListaNfiscaisItens.FieldByName('QTDE_ITEM_DEMO').Value,
                qrListaNfiscais.FieldByName('DTEMISSAO_NFISCAL').Value,
                qrListaNfiscais.FieldByName('NUMERO_NFISCAL').AsInteger,
                qrListaNfiscaisItens.FieldByName('VLR_TOTAL_ITEM').Value,
                useq,
                qrListaNfiscaisItens.FieldByName('NR_SERIE_ITEM').Value,
                Null]));
          qrListaNfiscaisItens.Next;
        end;
      end;
    end;

    Query1.SQL.Clear;
    Query1.SQL.Add('UPDATE nfiscais SET');
    Query1.SQL.Add('CONCLUIDA = ''S'',');
    Query1.SQL.Add('CANCELADA = ''N''');
    Query1.SQL.Add('WHERE NFISCAL_SQ = ' + InttoStr (Nfiscal));
    Query1.ExecSQL;

    DBConn.Commit;
    DBConn.Close;
  except
    on E: Exception do
    begin
      DBConn.Rollback;
      Result := Result + ' ' + E.Message;
    end;
  end;
  Result := Trim(Result);
  qrListaProdutos.Close;
  qrListaNfiscaisItens.Close;
  qrListaNFiscais.Close;
  qrListaNfiscais.Filter   := '';
  qrListaNFiscais.Filtered := False;
end;
}
{
function TServer.FinalizaNFe(numero_nfiscal: Integer; numero_nfe: Integer;
  const chaveNFe: WideString; const motivo: WideString; const recibo_nfe: WideString): WideString;
begin
  try
    Result := '';
    DBConn.Open;
    DBConn.StartTransaction;

    Query1.SQL.Clear;
    Query1.SQL.Add('UPDATE nfiscais SET');
    if (chaveNFe <> '') and (Date >= StrToDate('01/09/2009')) then
      Query1.SQL.Add('numero_nfe = ' + QuotedStr(IntToStr(numero_nfe)) + ' ,');
    Query1.SQL.Add('nfe_chave = ' + QuotedStr(chaveNFe) + ' ,');
    Query1.SQL.Add('nfe_resposta = ' + QuotedStr(motivo) + ' ,');
    Query1.SQL.Add('recibo_nfe = ' + QuotedStr(recibo_nfe));
    Query1.SQL.Add('WHERE numero_nfiscal = ' + InttoStr (numero_nfiscal));
    Query1.ExecSQL;

    DBConn.Commit;
    DBConn.Close;
  except
    on E: Exception do
    begin
      DBConn.Rollback;
      Result := E.Message;
    end;
  end;
  Result := Trim(Result);
end;
}
{
function TServer.Classificacao(Cliente_sq: Integer; AnoMes: Integer): Integer;
var
  Faturamento: Real;
  i1, i2, aa, mm, Meses: Integer;
  Muda: Boolean;
  qr1, qr2: TQuery;
begin
  Muda := False;
  qr2 := TQuery.Create(self);
  qr2.DatabaseName := 'DBConn';

  qr1 := TQuery.Create(self);
  qr1.DatabaseName := 'DBConn';
  qr1.SQL.Clear;
  qr1.SQL.Add('select cliente_sq from clientes');
  if Cliente_sq <> 0 then
    qr1.SQL.Add('where cliente_sq = ' + InttoStr (Cliente_sq));
  qr1.Open;

  While not qr1.Eof do
  begin
    qr2.SQL.Clear;
    qr2.SQL.Add('select EXTRACT(YEAR_MONTH FROM n.dtemissao_nfiscal) as anomes, n.cliente_sq, sum(n.vlr_produtos) as faturamento, cl.limite_minimo, cl.limite_maximo, cl.meses_bonus');
    qr2.SQL.Add('from nfiscais n');
    qr2.SQL.Add('left outer join naturezas     na on (na.natureza_sq      = n.natureza_sq)');
    qr2.SQL.Add('left outer join clientes      c  on (c.cliente_sq        = n.cliente_sq)');
    qr2.SQL.Add('left outer join classificacao cl on (cl.classificacao_sq = c.classificacao_sq)');
    qr2.SQL.Add('where na.tipo_nfiscal = 0');
    qr2.SQL.Add('and n.cancelada <> ''S''');
    qr2.SQL.Add('and n.cliente_sq = ' + qr1.FieldByName ('CLIENTE_SQ').AsString);
    qr2.SQL.Add('group by anomes');
    qr2.Open;
    if qr2.Locate('anomes', AnoMes, []) then
      Faturamento := Int (qr2.FieldByName('FATURAMENTO').AsFloat) else
      Faturamento := 0;
    if qr2.FieldByName('LIMITE_MAXIMO').AsFloat < Faturamento then
      Muda := True
    else if qr2.FieldByName('LIMITE_MINIMO').AsFloat > Faturamento then
    begin
      Meses := qr2.FieldByName('MESES_BONUS').AsInteger;
      Muda := True;
      aa := StrtoInt (FloatToStr (Int (AnoMes/100)));
      mm := AnoMes - aa * 100;
      for i1 := 1 to Meses do
      begin
        i2 := mm - i1;
        if i2 <= 0 then
          i2 := (aa - 1) * 100 + i2 + 12
        else
          i2 := aa * 100 + i2;
        if qr2.Locate('ANOMES', i2, []) then
        begin
          if qr2.FieldByName('LIMITE_MINIMO').AsFloat < qr2.FieldByName('FATURAMENTO').AsFloat then
            Muda := False;
          if Faturamento < qr2.FieldByName('FATURAMENTO').AsFloat then
            Faturamento := Int (qr2.FieldByName('FATURAMENTO').AsFloat);
        end;
      end;
    end;
    if Muda then
    begin
      qr2.SQL.Clear;
      qr2.SQL.Add('update clientes, classificacao set');
      qr2.SQL.Add('clientes.classificacao_sq = classificacao.classificacao_sq');
      qr2.SQL.Add('where classificacao.limite_minimo <= ' + FloattoStr (Faturamento));
      qr2.SQL.Add('and classificacao.limite_maximo >= ' + FloattoStr (Faturamento));
      qr2.SQL.Add('and clientes.cliente_sq = ' + qr1.FieldByName ('cliente_sq').AsString);
      qr2.ExecSQL;
    end;
  qr1.Next;
  end;
  if Cliente_sq = 0 then
  begin
    qr2.SQL.Clear;
    qr2.SQL.Add('update empresas set');
    qr2.SQL.Add('ultima_classificacao = now()');
    qr2.ExecSQL;
  end;
end;
}
{
function TServer.RegistraLogin(Usuario: Integer; Data: TDateTime; const IP: WideString): WideString;
begin
  try
    Result := '';
    Query1.SQL.Clear;
    Query1.SQL.Add('INSERT INTO historico_login (' +
                         'USUARIO_SQ, DATA_LOGIN, ' +
                         'IP_LOGIN) ' +
                         'VALUES (' +
                         InttoStr (Usuario) + ', ' +
                         '''' + FormatDateTime  ('yyyy-mm-dd hh:nn:ss', Data) + ''', ' +
                         '''' + IP + ''') ');
    Query1.ExecSQL;
  except
    on E: Exception do
      Result := E.Message;
  end;
end;
}
{
function TServer.EntradaEstoque(NfEntrada_sq: Integer; useq: Integer): WideString;
var
  qr1, qr2, qr3: TQuery;
  chaveKardex: integer;
begin
  try
    Result := '';

    DBConn.Open;
    DBConn.StartTransaction;

    qr1 := TQuery.Create(self);
    qr1.DatabaseName := 'DBConn';

    qr2 := TQuery.Create(self);
    qr2.DatabaseName := 'DBConn';

    qr3 := TQuery.Create(self);
    qr3.DatabaseName := 'DBConn';

    qr1.SQL.Clear;
    qr1.SQL.Add('SELECT * FROM nf_entradas WHERE NF_ENTRADA_SQ = ' + InttoStr(NfEntrada_sq));
    qr1.Open;
    qr1.Last;

    if qr1.RecordCount = 1 then
    begin
      qr2.SQL.Clear;
      qr2.SQL.Add('SELECT * FROM nf_entradas_itens WHERE NF_ENTRADA_SQ = ' + InttoStr(NfEntrada_sq));
      qr2.Open;

      While not qr2.Eof do
      begin
        qr3.SQL.Clear;
        qr3.SQL.Add('SELECT * FROM kardex WHERE PRODUTO_SQ = ' + qr2.FieldByName('PRODUTO_SQ').AsString);
        qr3.SQL.Add('AND TIPO_MOV = ''E''');
        qr3.SQL.Add('AND NFISCAL = ' + qr1.FieldByName('NUMERO_NF_ENT').AsString);
        qr3.SQL.Add('AND DATA = ' + FormatDateTime  ('yyyy-mm-dd', Date));
        qr3.Open;
        qr3.Last;
        chaveKardex := 0;
        if qr3.RecordCount = 0 then
          Result := CriaRegistro('Kardex', useq, 255, chaveKardex,
          VarArrayOf ([
            qr2.FieldByName('PRODUTO_SQ').Value,
            'E',
            qr2.FieldByName('QTDE_ITEM').Value,
            0,
            0,
            Date + Time,
            qr1.FieldByName('NUMERO_NF_ENT').Value,
            qr2.FieldByName('VLR_TOTAL_ITEM').Value,
            useq,
            qr2.FieldByName('NR_SERIE_ITEM').Value,
            Null]));
          if Result <> '' then
            raise Exception.Create(Result);
        qr2.Next;
      end;

      qr1.SQL.Clear;
      qr1.SQL.Add('UPDATE nf_entradas SET TRANSFERIDA = ''S'', DT_ENTRADA = ''' + FormatDateTime  ('yyyy-mm-dd hh:nn:ss', Date + Time) + ''' WHERE NF_ENTRADA_SQ = ' + InttoStr(NfEntrada_sq));
      qr1.ExecSQL;
      DBConn.Commit;
      DBConn.Close;
    end
    else Result := 'Nota Fiscal nao encontrada!';
  except
    on E: Exception do
    begin
      Result := E.Message;
      DBConn.Rollback;
    end;
  end;
end;
}

{
function TServer.CancelaEntradaEstoque(nfEntrada_sq: Integer; useq: Integer): WideString;
var
  qr1, qr2, qr3: TQuery;
  chaveKardex : integer;
begin
  try
    Result := '';

    DBConn.Open;
    DBConn.StartTransaction;

    qr1 := TQuery.Create(self);
    qr1.DatabaseName := 'DBConn';

    qr2 := TQuery.Create(self);
    qr2.DatabaseName := 'DBConn';

    qr3 := TQuery.Create(self);
    qr3.DatabaseName := 'DBConn';

    qr1.SQL.Clear;
    qr1.SQL.Add('SELECT * FROM nf_entradas WHERE NF_ENTRADA_SQ = ' + InttoStr(NfEntrada_sq));
    qr1.Open;
    qr1.Last;

    if qr1.RecordCount = 1 then
    begin
      qr2.SQL.Clear;
      qr2.SQL.Add('SELECT * FROM nf_entradas_itens WHERE NF_ENTRADA_SQ = ' + InttoStr(NfEntrada_sq));
      qr2.Open;

      While not qr2.Eof do
      begin
        qr3.SQL.Clear;
        qr3.SQL.Add('SELECT * FROM kardex WHERE PRODUTO_SQ = ' + qr2.FieldByName('PRODUTO_SQ').AsString);
        qr3.SQL.Add('AND TIPO_MOV = ''E''');
        qr3.SQL.Add('AND NFISCAL = ' + qr1.FieldByName('NUMERO_NF_ENT').AsString);
        qr3.SQL.Add('AND DATA = ''' + FormatDateTime  ('yyyy-mm-dd hh:nn:ss', qr1.FieldByName('DT_ENTRADA').AsDateTime) + '''');
        qr3.Open;
        qr3.Last;
        chaveKardex := 0;
        if qr3.RecordCount = 1 then
          Result := CriaRegistro('Kardex', useq, 255, chaveKardex,
          VarArrayOf ([
            qr2.FieldByName('PRODUTO_SQ').Value,
            'E',
            (qr2.FieldByName('QTDE_ITEM').Value*-1),
            0,
            0,
            Date + Time,
            qr1.FieldByName('NUMERO_NF_ENT').Value,
            qr2.FieldByName('VLR_TOTAL_ITEM').Value,
            useq,
            qr2.FieldByName('NR_SERIE_ITEM').Value,
            Null]));
          if Result <> '' then
            raise Exception.Create(Result);
        qr2.Next;
      end;

      qr1.SQL.Clear;
      qr1.SQL.Add('UPDATE nf_entradas SET TRANSFERIDA = ''N'', DT_ENTRADA = Null WHERE NF_ENTRADA_SQ = ' + InttoStr(NfEntrada_sq));
      qr1.ExecSQL;
      DBConn.Commit;
      DBConn.Close;
    end
    else Result := 'Nota Fiscal nao encontrada!';
  except
    on E: Exception do
    begin
      Result := E.Message;
      DBConn.Rollback;
    end;
  end;
end;
}
{
function TServer.Diretorio: WideString;
begin
  Result := ExtractFilePath(ExpandFileName('PrHandy.exe'));
end;
}
{
function TServer.VerificaVersao(const versao: WideString): WideString;
var
  versao2: String;
begin
  Result := '';
  versao2 := PJVersionInfo1.FileVersion;
  if versao2 = '' then
    Result := '' else
  if versao <> versao2 then
    Result := 'Existe uma nova versão no servidor!' + chr(13) + 'Versão atual: ' + versao + chr(13) + 'Versão disponível: ' + versao2;
end;
}

{
function TServer.TrocaSenha(usuario_sq: Integer; const senha: WideString): WideString;
var
  qr1: TQuery;
begin
  try
    Result := '';

    DBConn.Open;
    DBConn.StartTransaction;

    qr1 := TQuery.Create(self);
    qr1.DatabaseName := 'DBConn';
    qr1.SQL.Clear;
    qr1.SQL.Add('UPDATE usuarios SET SENHA_USUARIO = ''' + senha + ''' WHERE USUARIO_SQ = ' + InttoStr(usuario_sq));
    qr1.ExecSQL;

    DBConn.Commit;
    DBConn.Close;
  except
    on E: Exception do
    begin
      Result := E.Message;
      DBConn.Rollback;
    end;
  end;
end;
}
{
function TServer.GravaNumeroSerie(nfiscal_item_sq: Integer; const nr_serie_item: WideString): WideString;
var
  qr1: TQuery;
begin
  try
    Result := '';

    DBConn.Open;
    DBConn.StartTransaction;

    qr1 := TQuery.Create(self);
    qr1.DatabaseName := 'DBConn';

    qr1.SQL.Clear;
    qr1.SQL.Add('UPDATE nfiscais_itens');
    qr1.SQL.Add('SET NR_SERIE_ITEM = ''' + nr_serie_item + '''');
    qr1.SQL.Add('WHERE NFISCAL_ITEM_SQ = ' + InttoStr(nfiscal_item_sq));
    qr1.ExecSQL;

    qr1.SQL.Clear;
    qr1.SQL.Add('SELECT NR_SERIE_ITEM FROM nfiscais_itens WHERE NFISCAL_ITEM_SQ = ' + InttoStr(nfiscal_item_sq));
    qr1.Open;

    if qr1.FieldByName('NR_SERIE_ITEM').AsString <> nr_serie_item then
      Exception.Create('Não foi possível gravar o número de série.');

    DBConn.Commit;
    DBConn.Close;
  except
    on E: Exception do
    begin
      Result := E.Message;
      DBConn.Rollback;
    end;
  end;
end;
}

procedure TServer.CriaLista(const Sql: WideString);
var
  S: String;
begin
  S := Sql;
  tag := Pos ('first 1', Sql);
  if tag <> 0 then
    Delete (S, 7, tag);

  qrLista.SQL.Clear;
  qrLista.SQL.Add(S);
  registraSelect(S);
end;

procedure TServer.RegistraSelect(sql: String);
{
var
  arquivo: String;
  f: TextFile;
}
begin
{
  arquivo := '/select.sql';
  AssignFile(f, arquivo);
  Append(f);
  Writeln(f, FormatDateTime('c', Date + Time) + '-' + sql);
  Flush(f);
  CloseFile(f);
}
end;

{
procedure TServer.BuscaProdutos(const Sql: WideString);
begin
  qrBuscaProdutos.SQL.Clear;
  qrBuscaProdutos.SQL.Add(Sql);
end;
}
{
procedure TServer.BuscaClientes(const Sql: WideString);
begin
  qrBuscaClientes.SQL.Clear;
  qrBuscaClientes.SQL.Add(Sql);
end;
}
{
function TServer.Maximo(const Tabela: WideString; const Campo: WideString): Integer;
begin
  Query1.SQL.Clear;
  Query1.SQL.Add('SELECT MAX(' + Campo + ') as MAXIMO FROM ' + TABELA);
  Query1.Open;
  Result := Query1.FieldByName ('MAXIMO').AsInteger;
end;
}

procedure TServer.RemoteDataModuleCreate(Sender: TObject);
var
  Reg: TRegistry;
  banco, bancocep: string;
begin
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    if Reg.OpenKey('\Software\MSystem', True) then
    begin
      banco    := Reg.ReadString ('FBBanco');
      bancocep := Reg.ReadString ('FBBancoCep');
    end;
  finally
    Reg.CloseKey;
    Reg.Free;
  end;
  try
    DBConn.Connected := True;
  except
//    Exception.Create('Nao foi possível conectar-se ao banco de dados!');
  end;
end;

procedure TServer.qrImprNfSerieBeforeOpen(DataSet: TDataSet);
begin
 qrImprNfSerie.ParamByName('NR_SERIE_ITEM').AsString := '%' + qrImprNfSerie.ParamByName('NR_SERIE_ITEM').AsString + '%';
end;

procedure TServer.qrImprHistClientes2BeforeOpen(DataSet: TDataSet);
begin
  qrImprHistClientes2.ParamByName('DT_INICIO').AsString  := FormatDateTime ('yyyy-mm-dd', qrImprHistClientes2.ParamByName('DT_INICIO').asDate);
  qrImprHistClientes2.ParamByName('DT_TERMINO').AsString := FormatDateTime ('yyyy-mm-dd', qrImprHistClientes2.ParamByName('DT_TERMINO').asDate);
end;

procedure TServer.qrImprDemPrevBeforeOpen(DataSet: TDataSet);
begin
  qrImprDemPrev.ParamByName('INICIO').AsString := FormatDateTime ('yyyy-mm-dd', qrImprDemPrev.ParamByName('INICIO').asDate);
  qrImprDemPrev.ParamByName('FIM').AsString    := FormatDateTime ('yyyy-mm-dd', qrImprDemPrev.ParamByName('FIM').asDate);
end;

procedure TServer.qrImprNfVendBeforeOpen(DataSet: TDataSet);
begin
  qrImprNfVend.ParamByName('DT_INICIO').AsString  := FormatDateTime ('yyyy-mm-dd', qrImprNfVend.ParamByName('DT_INICIO').asDate);
  qrImprNfVend.ParamByName('DT_TERMINO').AsString := FormatDateTime ('yyyy-mm-dd', qrImprNfVend.ParamByName('DT_TERMINO').asDate);
end;

procedure TServer.qrImprNfFechBeforeOpen(DataSet: TDataSet);
begin
  qrImprNfFech.ParamByName('DT_INICIO').AsString  := FormatDateTime ('yyyy-mm-dd', qrImprNfFech.ParamByName('DT_INICIO').asDate);
  qrImprNfFech.ParamByName('DT_TERMINO').AsString := FormatDateTime ('yyyy-mm-dd', qrImprNfFech.ParamByName('DT_TERMINO').asDate);
end;

procedure TServer.qrImprResVendBeforeOpen(DataSet: TDataSet);
begin
  qrImprResVend.ParamByName('DT_INICIO').AsString  := FormatDateTime ('yyyy-mm-dd', qrImprResVend.ParamByName('DT_INICIO').asDate);
  qrImprResVend.ParamByName('DT_TERMINO').AsString := FormatDateTime ('yyyy-mm-dd', qrImprResVend.ParamByName('DT_TERMINO').asDate);
end;

procedure TServer.qrImprResVendProdBeforeOpen(DataSet: TDataSet);
begin
  qrImprResVendProd.ParamByName('DT_INICIO').AsString  := FormatDateTime ('yyyy-mm-dd', qrImprResVendProd.ParamByName('DT_INICIO').asDate);
  qrImprResVendProd.ParamByName('DT_TERMINO').AsString := FormatDateTime ('yyyy-mm-dd', qrImprResVendProd.ParamByName('DT_TERMINO').asDate);
end;

procedure TServer.qrImprSugCompraBeforeOpen(DataSet: TDataSet);
begin
  qrImprSugCompra.ParamByName('dti1').AsString  := FormatDateTime ('yyyy-mm-dd', qrImprSugCompra.ParamByName('dti1').asDate);
  qrImprSugCompra.ParamByName('dtf1').AsString  := FormatDateTime ('yyyy-mm-dd', qrImprSugCompra.ParamByName('dtf1').asDate);
  qrImprSugCompra.ParamByName('dti2').AsString  := FormatDateTime ('yyyy-mm-dd', qrImprSugCompra.ParamByName('dti2').asDate);
  qrImprSugCompra.ParamByName('dtf2').AsString  := FormatDateTime ('yyyy-mm-dd', qrImprSugCompra.ParamByName('dtf2').asDate);
  qrImprSugCompra.ParamByName('dti3').AsString  := FormatDateTime ('yyyy-mm-dd', qrImprSugCompra.ParamByName('dti3').asDate);
  qrImprSugCompra.ParamByName('dtf3').AsString  := FormatDateTime ('yyyy-mm-dd', qrImprSugCompra.ParamByName('dtf3').asDate);
  qrImprSugCompra.ParamByName('dti4').AsString  := FormatDateTime ('yyyy-mm-dd', qrImprSugCompra.ParamByName('dti4').asDate);
  qrImprSugCompra.ParamByName('dtf4').AsString  := FormatDateTime ('yyyy-mm-dd', qrImprSugCompra.ParamByName('dtf4').asDate);
  qrImprSugCompra.ParamByName('dti5').AsString  := FormatDateTime ('yyyy-mm-dd', qrImprSugCompra.ParamByName('dti5').asDate);
  qrImprSugCompra.ParamByName('dtf5').AsString  := FormatDateTime ('yyyy-mm-dd', qrImprSugCompra.ParamByName('dtf5').asDate);
  qrImprSugCompra.ParamByName('dti6').AsString  := FormatDateTime ('yyyy-mm-dd', qrImprSugCompra.ParamByName('dti6').asDate);
  qrImprSugCompra.ParamByName('dtf6').AsString  := FormatDateTime ('yyyy-mm-dd', qrImprSugCompra.ParamByName('dtf6').asDate);
  qrImprSugCompra.ParamByName('dti7').AsString  := FormatDateTime ('yyyy-mm-dd', qrImprSugCompra.ParamByName('dti7').asDate);
  qrImprSugCompra.ParamByName('dtf7').AsString  := FormatDateTime ('yyyy-mm-dd', qrImprSugCompra.ParamByName('dtf7').asDate);
  qrImprSugCompra.ParamByName('dti8').AsString  := FormatDateTime ('yyyy-mm-dd', qrImprSugCompra.ParamByName('dti8').asDate);
  qrImprSugCompra.ParamByName('dtf8').AsString  := FormatDateTime ('yyyy-mm-dd', qrImprSugCompra.ParamByName('dtf8').asDate);
  qrImprSugCompra.ParamByName('dti9').AsString  := FormatDateTime ('yyyy-mm-dd', qrImprSugCompra.ParamByName('dti9').asDate);
  qrImprSugCompra.ParamByName('dtf9').AsString  := FormatDateTime ('yyyy-mm-dd', qrImprSugCompra.ParamByName('dtf9').asDate);
  qrImprSugCompra.ParamByName('dti10').AsString := FormatDateTime ('yyyy-mm-dd', qrImprSugCompra.ParamByName('dti10').asDate);
  qrImprSugCompra.ParamByName('dtf10').AsString := FormatDateTime ('yyyy-mm-dd', qrImprSugCompra.ParamByName('dtf10').asDate);
  qrImprSugCompra.ParamByName('dti11').AsString := FormatDateTime ('yyyy-mm-dd', qrImprSugCompra.ParamByName('dti11').asDate);
  qrImprSugCompra.ParamByName('dtf11').AsString := FormatDateTime ('yyyy-mm-dd', qrImprSugCompra.ParamByName('dtf11').asDate);
  qrImprSugCompra.ParamByName('dti12').AsString := FormatDateTime ('yyyy-mm-dd', qrImprSugCompra.ParamByName('dti12').asDate);
  qrImprSugCompra.ParamByName('dtf12').AsString := FormatDateTime ('yyyy-mm-dd', qrImprSugCompra.ParamByName('dtf12').asDate);
end;

procedure TServer.qrImprRMA1CalcFields(DataSet: TDataSet);
//var
//  s1, s2: String;
begin
{TODO
  qrListaAssistenciasItens.Close;
  qrListaAssistenciasItens.ParamByName('ASSISTENCIA_SQ').AsInteger := qrImprRMA1ASSISTENCIA_SQ.AsInteger;
  qrListaAssistenciasItens.Open;
  qrListaAssistenciasItens.Filter := 'ASSISTENCIA_EQUIP_SQ = ' + qrImprRMA1assistencia_equip_sq.AsString;
  qrListaAssistenciasItens.Filtered := True;
  qrListaAssistenciasItens.First;
  s1 := qrListaAssistenciasItens.FieldByName('DESCRICAO_PRODUTO').AsString;
  s2 := qrListaAssistenciasItens.FieldByName('CODIGO_PRODUTO').AsString;
  qrListaAssistenciasItens.Next;
  While not qrListaAssistenciasItens.Eof do
  begin
    s1 := s1 + ', ' + qrListaAssistenciasItens.FieldByName('DESCRICAO_PRODUTO').AsString;
    s2 := s2 + ', ' + qrListaAssistenciasItens.FieldByName('CODIGO_PRODUTO').AsString;
    qrListaAssistenciasItens.Next;
  end;
  qrListaAssistenciasItens.Close;
  qrListaAssistenciasItens.Filter := '';
  qrListaAssistenciasItens.Filtered := False;

  qrImprRMA1Changecomponent.AsString := s1;
  qrImprRMA1Partsnumber.AsString := s2;
}
end;

{
function TServer.FinalizaPedido(pedido, useq: Integer): WideString;
var
  chaveKardex : integer;
  qr1: TQuery;
begin
  try
    Result := '';
    DBConn.Open;
    DBConn.StartTransaction;
//    qrListaProdutos.Open;

    qr1 := TQuery.Create(self);
    qr1.DatabaseName := 'DBConn';

    qr1.SQL.Clear;
    qr1.SQL.Add('select * from pedidos_itens pi');
    qr1.SQL.Add('inner join pedidos p on (p.pedido_sq=pi.pedido_sq)');
    qr1.SQL.Add('where pi.pedido_sq = ' + IntToStr(pedido));
    qr1.Open;

    While not qr1.Eof do
    begin
      chaveKardex := 0;
      Result := Result + ' ' + CriaRegistro('Kardex', useq, 255, chaveKardex,
      VarArrayOf ([
            qr1.FieldByName('PRODUTO_SQ').AsInteger,
            'S',
            qr1.FieldByName('QTDE_PEDIDO_ITEM').Value,
            0,
            0,
            qr1.FieldByName('DATA_PEDIDO').Value,
            0,
            qr1.FieldByName('VLR_TOTAL_ITEM').Value,
            useq,
            '',
            qr1.FieldByName('PEDIDO_ITEM_SQ').AsInteger]));
      qr1.Next;
    end;
    FreeAndNil(qr1);

    Query1.SQL.Clear;
    Query1.SQL.Add('update pedidos set');
    Query1.SQL.Add('baixou_estoque = ''S''');
    Query1.SQL.Add('WHERE pedido_SQ = ' + InttoStr (pedido));
    Query1.ExecSQL;

    DBConn.Commit;
    DBConn.Close;
  except
    on E: Exception do
    begin
      DBConn.Rollback;
      Result := Result + ' ' + E.Message;
    end;
  end;
  Result := Trim(Result);
end;
}

procedure TServer.qrImprComissaoBeforeOpen(DataSet: TDataSet);
begin
  qrImprComissao.ParamByName('DT_INICIO').AsString  := FormatDateTime ('yyyy-mm-dd', qrImprComissao.ParamByName('DT_INICIO').asDate);
  qrImprComissao.ParamByName('DT_TERMINO').AsString := FormatDateTime ('yyyy-mm-dd', qrImprComissao.ParamByName('DT_TERMINO').asDate);
end;

procedure TServer.ExecSQL(const sql: WideString);
begin
  Query1.SQL.Text := sql;
  Query1.ExecSQL;
  registraSelect(sql);
end;

{
function TServer.StatusPedido(pedido, useq: Integer;
  const status: WideString): WideString;
begin
  try
    Query1.SQL.Text := 'select status from pedidos where pedido_sq = ' + IntToStr(pedido);
    Query1.Open;
    if Query1.FieldByName('status').AsString = 'F' then
      raise Exception.Create('Pedido já finalizado, impossível alterar o status.');

    if Query1.FieldByName('status').AsString = 'C' then
      raise Exception.Create('Pedido já cancelado, impossível alterar o status.');

    Result := '';
    DBConn.Open;
    DBConn.StartTransaction;

    Query1.SQL.Clear;
    Query1.SQL.Add('update pedidos set');
    Query1.SQL.Add('status = ' + QuotedStr(status));
    Query1.SQL.Add('where pedido_sq = ' + InttoStr (pedido));
    Query1.ExecSQL;

    DBConn.Commit;
    DBConn.Close;
  except
    on E: Exception do
    begin
      DBConn.Rollback;
      Result := Result + ' ' + E.Message;
    end;
  end;
  Result := Trim(Result);
end;
}

procedure TServer.ExecSQL2(const sql: WideString);
var
  qr1: TQuery;
begin
  DbNotif.Open;

  qr1 := TQuery.Create(self);
  qr1.DatabaseName := 'DbNotif';

  qr1.SQL.Text := sql;
  qr1.ExecSQL;

  FreeAndNil(qr1);
  registraSelect(sql);
end;

procedure TServer.BurcarImagemProduto(produto_sq: Integer);
begin
  tbProdutoImagem.Filter := 'produto_sq = ' + IntToStr(produto_sq);
  tbProdutoImagem.Filtered := True;
end;

initialization
  TComponentFactory.Create(ComServer, TServer,
    Class_Server, ciMultiInstance, tmApartment);
end.

