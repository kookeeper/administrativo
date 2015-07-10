unit UDMServerTeste;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  Windows, Messages, SysUtils, Classes, ComServ, ComObj, VCLCom, DataBkr,
  DBClient, PrServer_TLB, StdVcl, PJVersionInfo, DB, Provider, DBTables,
  IdComponent, IdTCPConnection, IdTCPClient, IdMessageClient, IdSMTP,
  IdBaseComponent, IdMessage;

type
  TServerTeste = class(TRemoteDataModule, IServerTeste)
    Msg: TIdMessage;
    IdSMTP1: TIdSMTP;
    DBConn: TDatabase;
    Session1: TSession;
    qrVerIndice: TQuery;
    Query1: TQuery;
    dspLista: TDataSetProvider;
    dspCep: TDataSetProvider;
    dspBuscaProdutos: TDataSetProvider;
    dspBuscaClientes: TDataSetProvider;
    qrLista: TQuery;
    qrBuscaProdutos: TQuery;
    qrBuscaClientes: TQuery;
    DBCep: TDatabase;
    qrCep: TQuery;
    qrCepCEP: TStringField;
    qrCepLOGRADOURO: TStringField;
    qrCepBAIRRO: TStringField;
    qrCepCIDADE: TStringField;
    qrCepUF: TStringField;
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
    qrImprPedVLR_SEGURO: TBCDField;
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
    qrImprPedDESCRICAO_COND_PAGTO: TStringField;
    qrImprPedPARCELAS: TIntegerField;
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
    qrImprNfItemqtde_item: TIntegerField;
    qrImprNfItemUN_PRODUTO: TStringField;
    qrImprNfItemSTRIBUT: TIntegerField;
    qrImprNfItemVLR_IPI_ITEM: TBCDField;
    qrImprNfItemALIQ_IPI_ITEM: TBCDField;
    qrImprNfItemALIQ_ICMS_ITEM: TBCDField;
    qrImprNfItemNR_SERIE_ITEM: TMemoField;
    qrImprNfItemBASE_ICMS_SUBST_ITEM: TBCDField;
    qrImprNfItemVLR_ICMS_SUBST_ITEM: TBCDField;
    qrImprNfItemITEM: TIntegerField;
    qrImprNfItemVLR_ICMS_ITEM: TBCDField;
    qrImprNfItemORIGEM_MERCADORIA: TIntegerField;
    qrImprNf: TQuery;
    qrImprNfNFISCAL_SQ: TIntegerField;
    qrImprNfCLIENTE_SQ: TIntegerField;
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
    qrImprNfCFO_SUBST: TStringField;
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
    qrImprNfVLR_II: TBCDField;
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
    qrImprNfCOTACAO_DOLAR: TBCDField;
    qrImprNfNUMERO_PEDIDO: TIntegerField;
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
    qrImprNfCANCELADA: TStringField;
    qrImprNfNUMERO_NFE: TIntegerField;
    qrImprNfNFISCAL_SQ_REFERENCIA: TIntegerField;
    qrImprNfRECIBO_NFE: TStringField;
    qrImprNfuf_embarque: TStringField;
    qrImprNflocal_embarque: TStringField;
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
    qrImprNfVendnumero_nfe: TIntegerField;
    qrImprNfVendtipo_vendedor: TStringField;
    qrImprNfVenddata_cadastro: TDateField;
    qrImprNfVenddata_inativacao: TDateField;
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
    qrImprDemPrevVLR_TOTAL: TBCDField;
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
    qrImprAssistvendedor_sq: TIntegerField;
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
    qrImprAssistDESCRICAO_COND_PAGTO: TStringField;
    qrImprAssistPARCELAS: TIntegerField;
    qrImprAssistEquip: TQuery;
    qrImprAssistEquipASSISTENCIA_EQUIP_SQ: TIntegerField;
    qrImprAssistEquipASSISTENCIA_SQ: TIntegerField;
    qrImprAssistEquipPRODUTO_SQ: TIntegerField;
    qrImprAssistEquipNR_SERIE_EQUIP: TMemoField;
    qrImprAssistEquipDEFEITO: TBlobField;
    qrImprAssistEquipservicos: TMemoField;
    qrImprAssistEquipCODIGO_PRODUTO: TStringField;
    qrImprAssistEquipDESCRICAO_PRODUTO: TStringField;
    qrImprAssistEquipCODIGO_NBM: TStringField;
    qrAssistItem: TQuery;
    qrAssistItemASSISTENCIA_ITEM_SQ: TIntegerField;
    qrAssistItemassistencia_equip_sq: TIntegerField;
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
    qrImprNFClientesDTEMISSAO: TDateTimeField;
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
    dspImprClientesNovos: TDataSetProvider;
    qrImprClientesNovos: TQuery;
    dspImprRMA1: TDataSetProvider;
    qrImprRMA1: TQuery;
    qrImprRMA1assistencia_sq: TIntegerField;
    qrImprRMA1assistencia_equip_sq: TIntegerField;
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
    qrImprRMA1Technician: TStringField;
    qrImprRMA1Result: TStringField;
    qrImprRMA1Freight: TStringField;
    qrImprRMA1Warraty: TStringField;
    qrImprRMA1referencia: TStringField;
    PJVersionInfo1: TPJVersionInfo;
    dspBuscaCep: TDataSetProvider;
    qrBuscaCep: TQuery;
    qrBuscaCepCEP: TStringField;
    qrBuscaCepLOGRADOURO: TStringField;
    qrBuscaCepBAIRRO: TStringField;
    qrBuscaCepCIDADE: TStringField;
    qrBuscaCepUF: TStringField;
    dspImprResVendMes: TDataSetProvider;
    qrImprResVendMes: TQuery;
    qrImprResVendMesnome_vendedor: TStringField;
    qrImprResVendMestotal: TBCDField;
    qrImprResVendMesano_mes: TStringField;
    Query2: TQuery;
    qrImprComissao: TQuery;
    dspImprComissao: TDataSetProvider;
    dspImprRMA2: TDataSetProvider;
    qrImprRMA2: TQuery;
    dspImprRMA2Item: TDataSetProvider;
    qrImprRMA2Item: TQuery;
    DbNotif: TDatabase;
    procedure RemoteDataModuleCreate(Sender: TObject);
    procedure qrImprNfSerieBeforeOpen(DataSet: TDataSet);
    procedure qrImprHistClientes2BeforeOpen(DataSet: TDataSet);
    procedure qrImprDemPrevBeforeOpen(DataSet: TDataSet);
    procedure qrImprNfVendBeforeOpen(DataSet: TDataSet);
    procedure qrImprNfFechBeforeOpen(DataSet: TDataSet);
    procedure qrImprResVendBeforeOpen(DataSet: TDataSet);
    procedure qrImprResVendProdBeforeOpen(DataSet: TDataSet);
    procedure qrImprSugCompraBeforeOpen(DataSet: TDataSet);
    procedure qrImprComissaoBeforeOpen(DataSet: TDataSet);
  private
//    procedure RegistraSelect(sql: String);
    { Private declarations }
  protected
    class procedure UpdateRegistry(Register: Boolean; const ClassID, ProgID: string); override;
    function ApagaRegistro(CAMPOS: OleVariant): WideString; safecall;
    procedure CriaLista(const Sql: WideString); safecall;
    procedure ExecSQL(const Sql: WideString); safecall;
    procedure ExecSQL2(const Sql: WideString); safecall;
  public
    observacao: String;
    { Public declarations }
  end;

implementation

uses Registry;

{$R *.DFM}

class procedure TServerTeste.UpdateRegistry(Register: Boolean; const ClassID, ProgID: string);
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

function TServerTeste.ApagaRegistro(CAMPOS: OleVariant): WideString;
begin
  try
    Result := '';
    Query1.SQL.Clear;
    Query1.SQL.Add('DELETE FROM ' + Campos[0] + ' WHERE ' + Campos[1] + ' = ' + Campos[2]);
    Query1.ExecSQL;
  except
    Result := 'Este Registro Não Pode ser Apagado!' + chr(13) + 'Verifique os vinculos deste registro com outras tabelas!';
  end;
end;

procedure TServerTeste.CriaLista(const Sql: WideString);
var
  S: String;
begin
  S := Sql;
  tag := Pos ('first 1', Sql);
  if tag <> 0 then
    Delete (S, 7, tag);

  qrLista.SQL.Clear;
  qrLista.SQL.Add(S);
end;

procedure TServerTeste.ExecSQL(const Sql: WideString);
begin
  Query1.SQL.Text := sql;
  Query1.ExecSQL;
end;

procedure TServerTeste.ExecSQL2(const Sql: WideString);
var
  qr1: TQuery;
begin
  DbNotif.Open;

  qr1 := TQuery.Create(self);
  qr1.DatabaseName := 'DbNotif';

  qr1.SQL.Text := sql;
  qr1.ExecSQL;
  
  FreeAndNil(qr1);
end;

procedure TServerTeste.RemoteDataModuleCreate(Sender: TObject);
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
    DBCep.Connected  := True;
  except
//    Exception.Create('Nao foi possível conectar-se ao banco de dados!');
  end;
end;

procedure TServerTeste.qrImprNfSerieBeforeOpen(DataSet: TDataSet);
begin
 qrImprNfSerie.ParamByName('NR_SERIE_ITEM').AsString := '%' + qrImprNfSerie.ParamByName('NR_SERIE_ITEM').AsString + '%';
end;

procedure TServerTeste.qrImprHistClientes2BeforeOpen(DataSet: TDataSet);
begin
  qrImprHistClientes2.ParamByName('DT_INICIO').AsString  := FormatDateTime ('yyyy-mm-dd', qrImprHistClientes2.ParamByName('DT_INICIO').asDate);
  qrImprHistClientes2.ParamByName('DT_TERMINO').AsString := FormatDateTime ('yyyy-mm-dd', qrImprHistClientes2.ParamByName('DT_TERMINO').asDate);
end;

procedure TServerTeste.qrImprDemPrevBeforeOpen(DataSet: TDataSet);
begin
  qrImprDemPrev.ParamByName('INICIO').AsString := FormatDateTime ('yyyy-mm-dd', qrImprDemPrev.ParamByName('INICIO').asDate);
  qrImprDemPrev.ParamByName('FIM').AsString    := FormatDateTime ('yyyy-mm-dd', qrImprDemPrev.ParamByName('FIM').asDate);
end;

procedure TServerTeste.qrImprNfVendBeforeOpen(DataSet: TDataSet);
begin
  qrImprNfVend.ParamByName('DT_INICIO').AsString  := FormatDateTime ('yyyy-mm-dd', qrImprNfVend.ParamByName('DT_INICIO').asDate);
  qrImprNfVend.ParamByName('DT_TERMINO').AsString := FormatDateTime ('yyyy-mm-dd', qrImprNfVend.ParamByName('DT_TERMINO').asDate);
end;

procedure TServerTeste.qrImprNfFechBeforeOpen(DataSet: TDataSet);
begin
  qrImprNfFech.ParamByName('DT_INICIO').AsString  := FormatDateTime ('yyyy-mm-dd', qrImprNfFech.ParamByName('DT_INICIO').asDate);
  qrImprNfFech.ParamByName('DT_TERMINO').AsString := FormatDateTime ('yyyy-mm-dd', qrImprNfFech.ParamByName('DT_TERMINO').asDate);
end;

procedure TServerTeste.qrImprResVendBeforeOpen(DataSet: TDataSet);
begin
  qrImprResVend.ParamByName('DT_INICIO').AsString  := FormatDateTime ('yyyy-mm-dd', qrImprResVend.ParamByName('DT_INICIO').asDate);
  qrImprResVend.ParamByName('DT_TERMINO').AsString := FormatDateTime ('yyyy-mm-dd', qrImprResVend.ParamByName('DT_TERMINO').asDate);
end;

procedure TServerTeste.qrImprResVendProdBeforeOpen(DataSet: TDataSet);
begin
  qrImprResVendProd.ParamByName('DT_INICIO').AsString  := FormatDateTime ('yyyy-mm-dd', qrImprResVendProd.ParamByName('DT_INICIO').asDate);
  qrImprResVendProd.ParamByName('DT_TERMINO').AsString := FormatDateTime ('yyyy-mm-dd', qrImprResVendProd.ParamByName('DT_TERMINO').asDate);
end;

procedure TServerTeste.qrImprSugCompraBeforeOpen(DataSet: TDataSet);
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

procedure TServerTeste.qrImprComissaoBeforeOpen(DataSet: TDataSet);
begin
  qrImprComissao.ParamByName('DT_INICIO').AsString  := FormatDateTime ('yyyy-mm-dd', qrImprComissao.ParamByName('DT_INICIO').asDate);
  qrImprComissao.ParamByName('DT_TERMINO').AsString := FormatDateTime ('yyyy-mm-dd', qrImprComissao.ParamByName('DT_TERMINO').asDate);
end;
{
procedure TServerTeste.RegistraSelect(sql: String);
var
  arquivo: String;
  f: TextFile;
begin
  arquivo := '/select.sql';
  AssignFile(f, arquivo);
  Append(f);
  Writeln(f, sql);
  Flush(f);
  CloseFile(f);
end;
}
initialization
  TComponentFactory.Create(ComServer, TServerTeste,
    Class_ServerTeste, ciMultiInstance, tmApartment);
end.
