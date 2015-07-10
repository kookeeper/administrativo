-- MySQL dump 10.11
--
-- Host: localhost    Database: handy
-- ------------------------------------------------------
-- Server version	5.0.41-community-nt

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `acessos`
--

DROP TABLE IF EXISTS `acessos`;
CREATE TABLE `acessos` (
  `ACESSO_SQ` int(11) NOT NULL auto_increment,
  `NOME_PROGRAMA` varchar(100) character set latin1 collate latin1_bin NOT NULL,
  `USUARIO_SQ` int(11) NOT NULL,
  `VISUALIZAR` varchar(1) default NULL,
  `CRIAR` varchar(1) default NULL,
  `EDITAR` varchar(1) default NULL,
  `APAGAR` varchar(1) default NULL,
  PRIMARY KEY  (`ACESSO_SQ`),
  UNIQUE KEY `ACESSOS_1` (`NOME_PROGRAMA`,`USUARIO_SQ`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `agenda`
--

DROP TABLE IF EXISTS `agenda`;
CREATE TABLE `agenda` (
  `AGENDA_SQ` int(11) NOT NULL auto_increment,
  `DATA_AGENDA` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `VENDEDOR_SQ` int(11) NOT NULL,
  `CLIENTE_SQ` int(11) NOT NULL,
  `OBSERVACAO` text,
  `REALIZADO` varchar(1) default 'N',
  `USUARIO_PAI_SQ` int(11) default NULL,
  PRIMARY KEY  (`AGENDA_SQ`),
  UNIQUE KEY `AGENDA_1` (`DATA_AGENDA`,`VENDEDOR_SQ`),
  KEY `AGENDA_X_CLIENTES` (`CLIENTE_SQ`),
  KEY `AGENDA_X_VENDEDORES` (`VENDEDOR_SQ`),
  CONSTRAINT `AGENDA_X_CLIENTES` FOREIGN KEY (`CLIENTE_SQ`) REFERENCES `clientes` (`CLIENTE_SQ`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `AGENDA_X_VENDEDORES` FOREIGN KEY (`VENDEDOR_SQ`) REFERENCES `vendedores` (`VENDEDOR_SQ`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `assistencias`
--

DROP TABLE IF EXISTS `assistencias`;
CREATE TABLE `assistencias` (
  `ASSISTENCIA_SQ` int(11) NOT NULL auto_increment,
  `NUMERO_ASSISTENCIA` int(11) NOT NULL,
  `DATA_CHAMADO` timestamp NOT NULL default '0000-00-00 00:00:00',
  `DATA_ASSISTENCIA` timestamp NOT NULL default '0000-00-00 00:00:00',
  `COTACAO_DOLAR` decimal(9,2) default NULL,
  `CLIENTE_SQ` int(11) NOT NULL,
  `COND_PAGTO_SQ` int(11) default NULL,
  `DESP_CHAMADO` decimal(9,2) default NULL,
  `DESP_HTEC_AD` decimal(9,2) default NULL,
  `DESP_DESLOC` decimal(9,2) default NULL,
  `VLR_PECAS` decimal(9,2) default NULL,
  `VLR_TOTAL` decimal(9,2) default NULL,
  `HORA_INICIO` time NOT NULL,
  `HORA_FIM` time default NULL,
  `GARANTIA` varchar(1) default NULL,
  `CONTRATO` varchar(1) default NULL,
  `vendedor_sq` int(11) NOT NULL,
  `FRETE` varchar(1) default NULL,
  PRIMARY KEY  (`ASSISTENCIA_SQ`),
  UNIQUE KEY `ASSISTENCIA_1` (`NUMERO_ASSISTENCIA`),
  KEY `ASSISTENCIAS_X_CLIENTES` (`CLIENTE_SQ`),
  KEY `ASSISTENCIAS_X_COND_PAGTO` (`COND_PAGTO_SQ`),
  KEY `ASSIST_ITENS_X_VENDEDORES` (`vendedor_sq`),
  CONSTRAINT `ASSISTENCIAS_X_CLIENTES` FOREIGN KEY (`CLIENTE_SQ`) REFERENCES `clientes` (`CLIENTE_SQ`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `ASSISTENCIAS_X_COND_PAGTO` FOREIGN KEY (`COND_PAGTO_SQ`) REFERENCES `cond_pagto` (`COND_PAGTO_SQ`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `ASSIST_ITENS_X_VENDEDORES` FOREIGN KEY (`vendedor_sq`) REFERENCES `vendedores` (`VENDEDOR_SQ`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `assistencias_equips`
--

DROP TABLE IF EXISTS `assistencias_equips`;
CREATE TABLE `assistencias_equips` (
  `ASSISTENCIA_EQUIP_SQ` int(11) NOT NULL auto_increment,
  `ASSISTENCIA_SQ` int(11) NOT NULL,
  `PRODUTO_SQ` int(11) NOT NULL,
  `NR_SERIE_EQUIP` text,
  `defeito` text,
  `servicos` text,
  PRIMARY KEY  (`ASSISTENCIA_EQUIP_SQ`),
  KEY `ASSIST_EQUIPS_X_ASSISTENCIAS` (`ASSISTENCIA_SQ`),
  KEY `ASSIST_EQUIPS_X_PRODUTOS` (`PRODUTO_SQ`),
  CONSTRAINT `ASSIST_EQUIPS_X_ASSISTENCIAS` FOREIGN KEY (`ASSISTENCIA_SQ`) REFERENCES `assistencias` (`ASSISTENCIA_SQ`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ASSIST_EQUIPS_X_PRODUTOS` FOREIGN KEY (`PRODUTO_SQ`) REFERENCES `produtos` (`PRODUTO_SQ`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `assistencias_itens`
--

DROP TABLE IF EXISTS `assistencias_itens`;
CREATE TABLE `assistencias_itens` (
  `ASSISTENCIA_ITEM_SQ` int(11) NOT NULL auto_increment,
  `PRODUTO_SQ` int(11) NOT NULL,
  `QTDE_ASSISTENCIA_ITEM` int(11) NOT NULL,
  `PRECO_UNIT` decimal(9,2) default NULL,
  `assistencia_equip_sq` int(11) NOT NULL,
  PRIMARY KEY  (`ASSISTENCIA_ITEM_SQ`),
  KEY `ASSIST_ITENS_X_PRODUTOS` (`PRODUTO_SQ`),
  KEY `ASSIST_ITENS_X_ASSIST_EQUIPS` (`assistencia_equip_sq`),
  CONSTRAINT `ASSIST_ITENS_X_ASSIST_EQUIPS` FOREIGN KEY (`assistencia_equip_sq`) REFERENCES `assistencias_equips` (`ASSISTENCIA_EQUIP_SQ`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ASSIST_ITENS_X_PRODUTOS` FOREIGN KEY (`PRODUTO_SQ`) REFERENCES `produtos` (`PRODUTO_SQ`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `carta_correcao`
--

DROP TABLE IF EXISTS `carta_correcao`;
CREATE TABLE `carta_correcao` (
  `carta_correcao_sq` int(11) NOT NULL auto_increment,
  `nfiscal_sq` int(11) NOT NULL,
  `chave` varchar(44) NOT NULL,
  `cod_orgao` char(2) NOT NULL,
  `cnpj` varchar(14) NOT NULL,
  `n_seq_evento` int(2) default NULL,
  `correcao` varchar(1000) NOT NULL,
  `dh_evento` timestamp NULL default NULL,
  PRIMARY KEY  (`carta_correcao_sq`),
  KEY `carta_correcao_x_nfiscal` (`nfiscal_sq`),
  CONSTRAINT `carta_correcao_x_nfiscal` FOREIGN KEY (`nfiscal_sq`) REFERENCES `nfiscais` (`NFISCAL_SQ`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `classificacao`
--

DROP TABLE IF EXISTS `classificacao`;
CREATE TABLE `classificacao` (
  `CLASSIFICACAO_SQ` int(11) NOT NULL auto_increment,
  `CODIGO_CLASSIFICACAO` varchar(50) character set latin1 collate latin1_bin NOT NULL,
  `LIMITE_MINIMO` decimal(9,2) NOT NULL,
  `LIMITE_MAXIMO` decimal(9,2) default NULL,
  `MESES_BONUS` int(2) default NULL,
  PRIMARY KEY  (`CLASSIFICACAO_SQ`),
  UNIQUE KEY `CLASSIFICACAO_1` (`CODIGO_CLASSIFICACAO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
CREATE TABLE `clientes` (
  `CLIENTE_SQ` int(11) NOT NULL auto_increment,
  `CODIGO_CLIENTE` varchar(15) character set latin1 collate latin1_bin NOT NULL,
  `NOME_CLIENTE` varchar(50) NOT NULL,
  `INSCR_ESTADUAL` varchar(20) default NULL,
  `ENDERECO` varchar(50) default NULL,
  `NUMERO` varchar(20) default NULL,
  `BAIRRO` varchar(30) default NULL,
  `COMPL_ENDERECO` varchar(50) default NULL,
  `CIDADE` varchar(30) default NULL,
  `ESTADO` varchar(2) default NULL,
  `CEP` varchar(8) default NULL,
  `DDD_FONE1` varchar(4) default NULL,
  `NUMERO_FONE1` varchar(15) default NULL,
  `COMPL_FONE1` varchar(10) default NULL,
  `DDD_FONE2` varchar(4) default NULL,
  `NUMERO_FONE2` varchar(15) default NULL,
  `COMPL_FONE2` varchar(10) default NULL,
  `DDD_FONE3` varchar(4) default NULL,
  `NUMERO_FONE3` varchar(15) default NULL,
  `COMPL_FONE3` varchar(10) default NULL,
  `DDD_CELULAR` varchar(4) default NULL,
  `NUMERO_CELULAR` varchar(15) default NULL,
  `COMPL_CELULAR` varchar(10) default NULL,
  `DDD_FAX` varchar(4) default NULL,
  `NUMERO_FAX` varchar(15) default NULL,
  `COMPL_FAX` varchar(10) default NULL,
  `E_MAIL` varchar(100) default NULL,
  `WEB_SITE` varchar(100) default NULL,
  `CONTATO` varchar(50) default NULL,
  `PAIS` varchar(20) default NULL,
  `OBSERVACAO` text,
  `REVENDA` varchar(1) default NULL,
  `BIRO` varchar(1) default NULL,
  `CAPITAL_ATUAL` decimal(9,2) default NULL,
  `NOME_FANTASIA` varchar(50) default NULL,
  `RAMO_ATIVIDADE_SQ` int(11) default NULL,
  `FATURAMENTO_MENSAL` decimal(9,2) default NULL,
  `DATA_FUNDACAO` timestamp NULL default NULL,
  `INSCR_MUNICIPAL` varchar(20) default NULL,
  `DATA_CADASTRO` timestamp NULL default NULL,
  `DATA_ALT` timestamp NULL default NULL,
  `USUARIO_SQ_ALT` int(11) default NULL,
  `TRANSPORTADORA_SQ` int(11) default NULL,
  `CLASSIFICACAO_SQ` int(11) default NULL,
  `tipo_cliente_sq` int(11) default NULL,
  `vendedor_sq` int(11) default NULL,
  `pct_comissao_propria` decimal(4,2) default NULL,
  `pct_comissao_parceria` decimal(4,2) default NULL,
  `base_comissao` varchar(1) default NULL,
  `pct_comissao_desconto` decimal(4,2) default NULL,
  `obs_comissao_desconto` varchar(100) default NULL,
  `cnae` varchar(7) default NULL,
  PRIMARY KEY  (`CLIENTE_SQ`),
  UNIQUE KEY `CLIENTES_1` (`CODIGO_CLIENTE`),
  KEY `CLIENTES_X_TRANSPORTADORAS` (`TRANSPORTADORA_SQ`),
  KEY `CLIENTES_X_CLASSIFICACAO` (`CLASSIFICACAO_SQ`),
  KEY `clientes_x_tipo_cliente` (`tipo_cliente_sq`),
  KEY `CLIENTES_X_VENDEDORES` (`vendedor_sq`),
  CONSTRAINT `CLIENTES_X_CLASSIFICACAO` FOREIGN KEY (`CLASSIFICACAO_SQ`) REFERENCES `classificacao` (`CLASSIFICACAO_SQ`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `clientes_x_tipo_cliente` FOREIGN KEY (`tipo_cliente_sq`) REFERENCES `tipo_cliente` (`tipo_cliente_sq`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `CLIENTES_X_TRANSPORTADORAS` FOREIGN KEY (`TRANSPORTADORA_SQ`) REFERENCES `transportadoras` (`TRANSPORTADORA_SQ`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `CLIENTES_X_VENDEDORES` FOREIGN KEY (`vendedor_sq`) REFERENCES `vendedores` (`VENDEDOR_SQ`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `cond_pagto`
--

DROP TABLE IF EXISTS `cond_pagto`;
CREATE TABLE `cond_pagto` (
  `COND_PAGTO_SQ` int(11) NOT NULL auto_increment,
  `CODIGO_COND_PAGTO` int(11) NOT NULL,
  `DESCRICAO_COND_PAGTO` varchar(50) NOT NULL,
  `PARCELAS` int(11) NOT NULL,
  `D00` int(11) default NULL,
  `D01` int(11) default NULL,
  `D02` int(11) default NULL,
  `D03` int(11) default NULL,
  `D04` int(11) default NULL,
  `D05` int(11) default NULL,
  `D06` int(11) default NULL,
  `D07` int(11) default NULL,
  `D08` int(11) default NULL,
  `D09` int(11) default NULL,
  `P00` int(3) default NULL,
  `P01` int(3) default NULL,
  `P02` int(3) default NULL,
  `P03` int(3) default NULL,
  `P04` int(3) default NULL,
  `P05` int(3) default NULL,
  `P06` int(3) default NULL,
  `P07` int(3) default NULL,
  `P08` int(3) default NULL,
  `P09` int(3) default NULL,
  PRIMARY KEY  (`COND_PAGTO_SQ`),
  UNIQUE KEY `COND_PAGTO_1` (`CODIGO_COND_PAGTO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `conta_banco`
--

DROP TABLE IF EXISTS `conta_banco`;
CREATE TABLE `conta_banco` (
  `conta_banco_sq` int(11) NOT NULL auto_increment,
  `nome_banco` varchar(50) NOT NULL,
  `nome_agencia` varchar(50) default NULL,
  `numero_conta` varchar(50) NOT NULL,
  PRIMARY KEY  (`conta_banco_sq`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `contas_pagar`
--

DROP TABLE IF EXISTS `contas_pagar`;
CREATE TABLE `contas_pagar` (
  `conta_pagar_sq` int(11) NOT NULL auto_increment,
  `fornecedor_sq` int(11) NOT NULL,
  `numero_duplicata` varchar(20) NOT NULL,
  `valor_duplicata` decimal(9,2) default NULL,
  `dtcadastro_duplicata` datetime NOT NULL,
  `dtvencimento_duplicata` datetime NOT NULL,
  `observacao` blob,
  `conta_pagar_auto_sq` int(11) default NULL,
  `referencia_auto` int(4) default NULL,
  `dt_pgto` datetime default NULL,
  `valor_pgto` decimal(9,2) default NULL,
  `valor_desconto` decimal(9,2) default NULL,
  `valor_juros` decimal(9,2) default NULL,
  `forma_pgto` varchar(20) default NULL,
  `conta_banco_sq` int(11) default NULL,
  PRIMARY KEY  (`conta_pagar_sq`),
  UNIQUE KEY `contas_pagar_1` (`fornecedor_sq`,`numero_duplicata`),
  KEY `contas_pagar_x_conta_banco` (`conta_banco_sq`),
  KEY `fornecedor_sq` (`fornecedor_sq`),
  CONSTRAINT `contas_pagar_x_conta_banco` FOREIGN KEY (`conta_banco_sq`) REFERENCES `conta_banco` (`conta_banco_sq`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `contas_pagar_x_fornecedor` FOREIGN KEY (`fornecedor_sq`) REFERENCES `fornecedor` (`fornecedor_sq`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `contas_pagar_auto`
--

DROP TABLE IF EXISTS `contas_pagar_auto`;
CREATE TABLE `contas_pagar_auto` (
  `conta_pagar_auto_sq` int(11) NOT NULL auto_increment,
  `fornecedor_sq` int(11) NOT NULL,
  `valor` decimal(9,2) NOT NULL,
  `data_inicial` datetime NOT NULL,
  `parcelas` int(11) NOT NULL,
  `observacao` blob,
  PRIMARY KEY  (`conta_pagar_auto_sq`),
  KEY `contas_pagar_auto_x_cliente` (`fornecedor_sq`),
  CONSTRAINT `contas_pagar_auto_x_cliente` FOREIGN KEY (`fornecedor_sq`) REFERENCES `clientes` (`CLIENTE_SQ`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `contas_pagar_pgto`
--

DROP TABLE IF EXISTS `contas_pagar_pgto`;
CREATE TABLE `contas_pagar_pgto` (
  `conta_pagar_pgto_sq` int(11) NOT NULL auto_increment,
  `conta_pagar_sq` int(11) NOT NULL,
  `dt_pgto` datetime NOT NULL,
  `valor_pgto` decimal(9,2) NOT NULL,
  `forma_pgto` varchar(20) default NULL,
  `observacao` varchar(100) default NULL,
  `banco` varchar(10) default NULL,
  `conta` varchar(20) default NULL,
  PRIMARY KEY  (`conta_pagar_pgto_sq`),
  KEY `contas_pagar_pgto_x_contas_pagar` (`conta_pagar_sq`),
  CONSTRAINT `contas_pagar_pgto_x_contas_pagar` FOREIGN KEY (`conta_pagar_sq`) REFERENCES `contas_pagar` (`conta_pagar_sq`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `contatos`
--

DROP TABLE IF EXISTS `contatos`;
CREATE TABLE `contatos` (
  `CONTATO_SQ` int(11) NOT NULL auto_increment,
  `DATA_CONTATO` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `CLIENTE_SQ` int(11) NOT NULL,
  `VENDEDOR_SQ` int(11) NOT NULL,
  `OBSERVACAO` text,
  `TIPO_CONTATO` varchar(1) default NULL,
  `FORMA_CONTATO` varchar(1) default NULL,
  `NFISCAL_ITEM_SQ` int(11) default NULL,
  `QTDE_PRODUTOS` int(11) default '0',
  `finalizado` char(1) default 'N',
  PRIMARY KEY  (`CONTATO_SQ`),
  UNIQUE KEY `CONTATOS_1` (`DATA_CONTATO`,`CLIENTE_SQ`),
  KEY `CONTATOS_X_CLIENTES` (`CLIENTE_SQ`),
  KEY `CONTATOS_X_VENDEDORES` (`VENDEDOR_SQ`),
  KEY `CONTATOS_X_NFISCAIS_ITENS` (`NFISCAL_ITEM_SQ`),
  CONSTRAINT `CONTATOS_X_CLIENTES` FOREIGN KEY (`CLIENTE_SQ`) REFERENCES `clientes` (`CLIENTE_SQ`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `CONTATOS_X_NFISCAIS_ITENS` FOREIGN KEY (`NFISCAL_ITEM_SQ`) REFERENCES `nfiscais_itens` (`NFISCAL_ITEM_SQ`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `CONTATOS_X_VENDEDORES` FOREIGN KEY (`VENDEDOR_SQ`) REFERENCES `vendedores` (`VENDEDOR_SQ`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `conteiner`
--

DROP TABLE IF EXISTS `conteiner`;
CREATE TABLE `conteiner` (
  `conteiner_sq` int(11) NOT NULL auto_increment,
  `invoice_number` varchar(20) NOT NULL,
  `data_remessa` timestamp NOT NULL default '0000-00-00 00:00:00',
  `data_chegada` timestamp NOT NULL default '0000-00-00 00:00:00',
  `tipo_envio` varchar(1) NOT NULL,
  `conhecimento` varchar(20) default NULL,
  `observacao` text,
  PRIMARY KEY  (`conteiner_sq`),
  UNIQUE KEY `invoice_number` (`invoice_number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `conteiner_itens`
--

DROP TABLE IF EXISTS `conteiner_itens`;
CREATE TABLE `conteiner_itens` (
  `conteiner_item_sq` int(11) NOT NULL auto_increment,
  `conteiner_sq` int(11) NOT NULL,
  `produto_sq` int(11) NOT NULL,
  `quantidade` int(11) NOT NULL,
  PRIMARY KEY  (`conteiner_item_sq`),
  KEY `conteiner_itens_x_produtos` (`produto_sq`),
  KEY `CONTEINER_ITENS_X_CONTEINER` (`conteiner_sq`),
  CONSTRAINT `CONTEINER_ITENS_X_CONTEINER` FOREIGN KEY (`conteiner_sq`) REFERENCES `conteiner` (`conteiner_sq`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `conteiner_itens_x_produtos` FOREIGN KEY (`produto_sq`) REFERENCES `produtos` (`PRODUTO_SQ`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `duplicatas`
--

DROP TABLE IF EXISTS `duplicatas`;
CREATE TABLE `duplicatas` (
  `DUPLICATA_SQ` int(11) NOT NULL auto_increment,
  `NUMERO_DUPLICATA` int(11) NOT NULL,
  `ITEM_DUPLICATA` int(11) NOT NULL,
  `SEQ_DUPLICATA` int(11) default NULL,
  `NFISCAL_SQ` int(11) default NULL,
  `VALOR_DUPLICATA` decimal(9,2) default NULL,
  `DTEMISSAO_DUPLICATA` datetime NOT NULL,
  `DTVENCTO_DUPLICATA` datetime NOT NULL,
  `juros_duplicata` decimal(10,2) default NULL,
  `desconto_duplicata` decimal(10,2) default NULL,
  PRIMARY KEY  (`DUPLICATA_SQ`),
  UNIQUE KEY `DUPLICATAS_1` (`NUMERO_DUPLICATA`,`ITEM_DUPLICATA`,`SEQ_DUPLICATA`),
  KEY `DUPLICATAS_X_NFISCAIS` (`NFISCAL_SQ`),
  CONSTRAINT `DUPLICATAS_X_NFISCAIS` FOREIGN KEY (`NFISCAL_SQ`) REFERENCES `nfiscais` (`NFISCAL_SQ`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `duplicatas_pgto`
--

DROP TABLE IF EXISTS `duplicatas_pgto`;
CREATE TABLE `duplicatas_pgto` (
  `duplicata_pgto_sq` int(11) NOT NULL auto_increment,
  `duplicata_sq` int(11) NOT NULL,
  `dt_pgto` datetime NOT NULL,
  `valor_pgto` decimal(9,2) NOT NULL,
  `forma_pgto` varchar(10) default NULL,
  `observacao` varchar(100) default NULL,
  PRIMARY KEY  (`duplicata_pgto_sq`),
  KEY `duplicatas_pgto_x_duplicatas` (`duplicata_sq`),
  CONSTRAINT `duplicatas_pgto_x_duplicatas` FOREIGN KEY (`duplicata_sq`) REFERENCES `duplicatas` (`DUPLICATA_SQ`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `empresas`
--

DROP TABLE IF EXISTS `empresas`;
CREATE TABLE `empresas` (
  `EMPRESA_SQ` int(11) NOT NULL auto_increment,
  `CODIGO_EMPRESA` varchar(15) NOT NULL,
  `NOME_EMPRESA` varchar(50) NOT NULL,
  `ACESSOS` int(11) default NULL,
  `SENHA` varchar(14) default NULL,
  `NUMERO_NFISCAL` int(11) default NULL,
  `ESTADO` varchar(2) default NULL,
  `NUMERO_PEDIDO` int(11) default NULL,
  `ALT_DATA_PEDIDO` varchar(1) default NULL,
  `ALT_DTEMISSAO_NFISCAL` varchar(1) default NULL,
  `ALIQ_ICMS_PROD1` decimal(9,2) default NULL,
  `ALIQ_ICMS_PEC1` decimal(9,2) default NULL,
  `STRIBUT` int(11) default NULL,
  `ALT_NR_PEDIDO` varchar(1) default NULL,
  `ALT_NR_NFISCAL` varchar(1) default NULL,
  `DIAS_DEMONSTRACAO` int(11) default NULL,
  `NUMERO_ASSISTENCIA` int(11) default NULL,
  `ALIQ_PIS` decimal(9,2) default NULL,
  `ALIQ_COFINS` decimal(9,2) default NULL,
  `ULTIMA_CLASSIFICACAO` timestamp NOT NULL default '0000-00-00 00:00:00',
  `AAMM_CLASSIFICACAO` int(6) default NULL,
  `ALIQ_ISS` decimal(9,2) default NULL,
  `MARGEM_ESQ_NF` decimal(4,2) default NULL,
  `MARGEM_SUP_NF` decimal(4,2) default NULL,
  `BANCO_IMAGENS` varchar(50) default NULL,
  `baixa_estoque_pedido` char(1) default 'N',
  `juros_receber` decimal(5,2) default NULL,
  `numero_rma` int(11) default '0',
  `estoque_negativo` varchar(1) default 'S',
  `descricao_estoque1` varchar(100) default 'Loja',
  `descricao_estoque2` varchar(100) default 'Armazem',
  `descricao_estoque3` varchar(100) default 'Demonstrao',
  `descricao_estoque4` varchar(100) default 'Defeito',
  `descricao_estoque5` varchar(100) default 'Em uso',
  `descricao_estoque6` varchar(100) default 'Backup',
  `descricao_estoque7` varchar(100) default 'Demonstrao em cliente',
  `descricao_estoque8` varchar(100) default 'HLC',
  `descricao_estoque9` varchar(100) default NULL,
  `descricao_estoque10` varchar(100) default NULL,
  PRIMARY KEY  (`EMPRESA_SQ`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `estado`
--

DROP TABLE IF EXISTS `estado`;
CREATE TABLE `estado` (
  `estado_sq` int(11) NOT NULL auto_increment,
  `codigo_estado` varchar(2) NOT NULL,
  `aliq_icms_intra` decimal(5,2) NOT NULL,
  `descricao_estado` varchar(50) NOT NULL,
  `codigo_ibge` int(11) NOT NULL,
  PRIMARY KEY  (`estado_sq`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `estado_iva`
--

DROP TABLE IF EXISTS `estado_iva`;
CREATE TABLE `estado_iva` (
  `estado_iva_sq` int(11) NOT NULL auto_increment,
  `estado_sq` int(11) NOT NULL,
  `nbm_sq` int(11) NOT NULL,
  `aliq_iva` decimal(5,2) default NULL,
  PRIMARY KEY  (`estado_iva_sq`),
  KEY `estado_iva_estado` (`estado_sq`),
  KEY `estado_iva_nbm` (`nbm_sq`),
  CONSTRAINT `estado_iva_estado` FOREIGN KEY (`estado_sq`) REFERENCES `estado` (`estado_sq`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `estado_iva_nbm` FOREIGN KEY (`nbm_sq`) REFERENCES `nbm` (`NBM_SQ`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `fornecedor`
--

DROP TABLE IF EXISTS `fornecedor`;
CREATE TABLE `fornecedor` (
  `fornecedor_sq` int(11) NOT NULL auto_increment,
  `cnpj_fornecedor` varchar(15) character set latin1 collate latin1_bin NOT NULL,
  `nome_fornecedor` varchar(50) NOT NULL,
  `inscr_municipal` varchar(20) default NULL,
  `inscr_estadual` varchar(20) default NULL,
  `logradouro` varchar(50) default NULL,
  `numero` varchar(20) default NULL,
  `bairro` varchar(30) default NULL,
  `complemento` varchar(50) default NULL,
  `cep` varchar(8) default NULL,
  `cidade` varchar(30) default NULL,
  `estado` varchar(2) default NULL,
  `pais` varchar(50) default NULL,
  `telefone` varchar(50) default NULL,
  `celular` varchar(50) default NULL,
  `e_mail` varchar(100) default NULL,
  `contato` varchar(50) default NULL,
  `observacao` text,
  PRIMARY KEY  (`fornecedor_sq`),
  UNIQUE KEY `fornecedor_1` (`cnpj_fornecedor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `hist_alteracoes`
--

DROP TABLE IF EXISTS `hist_alteracoes`;
CREATE TABLE `hist_alteracoes` (
  `HIST_ALTERACAO_SQ` int(11) NOT NULL auto_increment,
  `NOME_TABELA` varchar(50) NOT NULL,
  `chave_sq` int(11) NOT NULL,
  `TIPO_ALTERACAO` int(1) NOT NULL,
  `USUARIO_SQ` int(11) NOT NULL,
  `DATA_ALTERACAO` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `observacao` text,
  PRIMARY KEY  (`HIST_ALTERACAO_SQ`),
  KEY `hist_alteracao_fk1` (`USUARIO_SQ`),
  CONSTRAINT `hist_alteracao_fk1` FOREIGN KEY (`USUARIO_SQ`) REFERENCES `usuarios` (`USUARIO_SQ`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `historico_acesso`
--

DROP TABLE IF EXISTS `historico_acesso`;
CREATE TABLE `historico_acesso` (
  `historico_acesso_sq` int(11) NOT NULL auto_increment,
  `usuario_sq` int(11) NOT NULL,
  `data_acesso` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `nome_programa` varchar(250) default NULL,
  `empresa_sq` int(11) NOT NULL,
  PRIMARY KEY  (`historico_acesso_sq`),
  KEY `empresa_sq` (`empresa_sq`),
  CONSTRAINT `historico_acesso_ibfk_1` FOREIGN KEY (`empresa_sq`) REFERENCES `empresas` (`EMPRESA_SQ`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `historico_login`
--

DROP TABLE IF EXISTS `historico_login`;
CREATE TABLE `historico_login` (
  `HIST_LOGIN_SQ` int(11) NOT NULL auto_increment,
  `USUARIO_SQ` int(11) NOT NULL,
  `DATA_LOGIN` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `IP_LOGIN` varchar(15) default NULL,
  PRIMARY KEY  (`HIST_LOGIN_SQ`),
  KEY `HISTORICO_X_USUARIOS` (`USUARIO_SQ`),
  CONSTRAINT `HISTORICO_X_USUARIOS` FOREIGN KEY (`USUARIO_SQ`) REFERENCES `usuarios` (`USUARIO_SQ`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `kardex`
--

DROP TABLE IF EXISTS `kardex`;
CREATE TABLE `kardex` (
  `KARDEX_SQ` int(11) NOT NULL auto_increment,
  `PRODUTO_SQ` int(11) default NULL,
  `TIPO_MOV` varchar(1) default NULL,
  `QTDE` int(11) default NULL,
  `VALOR` decimal(9,2) default NULL,
  `DATA` timestamp NOT NULL default '0000-00-00 00:00:00',
  `NFISCAL` int(11) default NULL,
  `USUARIO_SQ` int(11) default NULL,
  `NR_SERIE` text,
  `pedido_item_sq` int(11) default NULL,
  `numero_estoque` int(11) default NULL,
  PRIMARY KEY  (`KARDEX_SQ`),
  KEY `KARDEX_X_PRODUTOS` (`PRODUTO_SQ`),
  KEY `KARDEX_X_USUARIOS` (`USUARIO_SQ`),
  KEY `kardex_pedido_item` (`pedido_item_sq`),
  CONSTRAINT `kardex_pedido_item` FOREIGN KEY (`pedido_item_sq`) REFERENCES `pedidos_itens` (`PEDIDO_ITEM_SQ`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `KARDEX_X_PRODUTOS` FOREIGN KEY (`PRODUTO_SQ`) REFERENCES `produtos` (`PRODUTO_SQ`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `KARDEX_X_USUARIOS` FOREIGN KEY (`USUARIO_SQ`) REFERENCES `usuarios` (`USUARIO_SQ`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `linha`
--

DROP TABLE IF EXISTS `linha`;
CREATE TABLE `linha` (
  `linha_sq` int(11) NOT NULL auto_increment,
  `descricao_linha` varchar(50) default NULL,
  `exclusiva` char(1) default 'N',
  PRIMARY KEY  (`linha_sq`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `modelos`
--

DROP TABLE IF EXISTS `modelos`;
CREATE TABLE `modelos` (
  `MODELO_SQ` int(11) NOT NULL auto_increment,
  `CODIGO_MODELO` varchar(30) character set latin1 collate latin1_bin NOT NULL,
  `DESCRICAO_MODELO` varchar(200) NOT NULL,
  PRIMARY KEY  (`MODELO_SQ`),
  UNIQUE KEY `MODELOS_1` (`CODIGO_MODELO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `naturezas`
--

DROP TABLE IF EXISTS `naturezas`;
CREATE TABLE `naturezas` (
  `NATUREZA_SQ` int(11) NOT NULL auto_increment,
  `CODIGO_NATUREZA` int(11) NOT NULL,
  `DESCRICAO_NATUREZA` varchar(50) NOT NULL,
  `CFO` varchar(4) NOT NULL,
  `ALIQ_ICMS` decimal(9,2) default NULL,
  `ALIQ_IPI` decimal(9,2) default NULL,
  `ENT_SAI` varchar(1) default NULL,
  `OBSERVACAO` text,
  `UF01` varchar(2) default NULL,
  `UF02` varchar(2) default NULL,
  `UF03` varchar(2) default NULL,
  `UF04` varchar(2) default NULL,
  `UF05` varchar(2) default NULL,
  `UF06` varchar(2) default NULL,
  `UF07` varchar(2) default NULL,
  `UF08` varchar(2) default NULL,
  `UF09` varchar(2) default NULL,
  `UF10` varchar(2) default NULL,
  `UF11` varchar(2) default NULL,
  `UF12` varchar(2) default NULL,
  `UF13` varchar(2) default NULL,
  `UF14` varchar(2) default NULL,
  `UF15` varchar(2) default NULL,
  `UF16` varchar(2) default NULL,
  `UF17` varchar(2) default NULL,
  `UF18` varchar(2) default NULL,
  `UF19` varchar(2) default NULL,
  `UF20` varchar(2) default NULL,
  `UF21` varchar(2) default NULL,
  `UF22` varchar(2) default NULL,
  `UF23` varchar(2) default NULL,
  `UF24` varchar(2) default NULL,
  `UF25` varchar(2) default NULL,
  `UF26` varchar(2) default NULL,
  `UF27` varchar(2) default NULL,
  `UF28` varchar(2) default NULL,
  `UF29` varchar(2) default NULL,
  `UF30` varchar(2) default NULL,
  `ISENCAO_IPI` varchar(1) default NULL,
  `ISENCAO_ICMS` varchar(1) default NULL,
  `DESCRICAO_NATUREZA_NFISCAL` varchar(50) default NULL,
  `TIPO_NFISCAL` int(11) default NULL,
  `icms_subst` varchar(1) default 'N',
  `cfo_subst` varchar(4) default NULL,
  `numero_estoque_saida` int(11) default '0',
  `numero_estoque_entrada` int(11) default '0',
  PRIMARY KEY  (`NATUREZA_SQ`),
  UNIQUE KEY `NATUREZAS_1` (`CODIGO_NATUREZA`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `nbm`
--

DROP TABLE IF EXISTS `nbm`;
CREATE TABLE `nbm` (
  `NBM_SQ` int(11) NOT NULL auto_increment,
  `CODIGO_NBM` varchar(10) character set latin1 collate latin1_bin NOT NULL,
  `ALIQ_ICMS` decimal(4,2) default NULL,
  `ALIQ_IPI` decimal(4,2) default NULL,
  `aliq_iva` decimal(5,2) NOT NULL,
  PRIMARY KEY  (`NBM_SQ`),
  UNIQUE KEY `NBM_1` (`CODIGO_NBM`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `nf_entradas`
--

DROP TABLE IF EXISTS `nf_entradas`;
CREATE TABLE `nf_entradas` (
  `NF_ENTRADA_SQ` int(11) NOT NULL auto_increment,
  `NUMERO_NF_ENT` int(11) NOT NULL,
  `DTEMISSAO_NF_ENT` timestamp NOT NULL default '0000-00-00 00:00:00',
  `CLIENTE_SQ` int(11) NOT NULL,
  `NATUREZA_SQ` int(11) default NULL,
  `BASE_ICMS` decimal(9,2) default NULL,
  `VLR_ICMS` decimal(9,2) default NULL,
  `BASE_ICMS_SUBST` decimal(9,2) default NULL,
  `VLR_ICMS_SUBST` decimal(9,2) default NULL,
  `VLR_PRODUTOS` decimal(9,2) default NULL,
  `VLR_FRETE` decimal(9,2) default NULL,
  `VLR_SEGURO` decimal(9,2) default NULL,
  `VLR_DESP_ACESS` decimal(9,2) default NULL,
  `VLR_IPI` decimal(9,2) default NULL,
  `VLR_TOTAL` decimal(9,2) default NULL,
  `OBSERVACAO` blob,
  `TRANSFERIDA` varchar(1) default 'N',
  `DT_ENTRADA` datetime default NULL,
  PRIMARY KEY  (`NF_ENTRADA_SQ`),
  UNIQUE KEY `NF_ENTRADAS_1` USING BTREE (`NUMERO_NF_ENT`,`CLIENTE_SQ`),
  KEY `NF_ENTRADAS_X_CLIENTES` (`CLIENTE_SQ`),
  KEY `NF_ENTRADAS_X_NATUREZAS` (`NATUREZA_SQ`),
  CONSTRAINT `NF_ENTRADAS_X_CLIENTES` FOREIGN KEY (`CLIENTE_SQ`) REFERENCES `clientes` (`CLIENTE_SQ`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `NF_ENTRADAS_X_NATUREZAS` FOREIGN KEY (`NATUREZA_SQ`) REFERENCES `naturezas` (`NATUREZA_SQ`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `nf_entradas_itens`
--

DROP TABLE IF EXISTS `nf_entradas_itens`;
CREATE TABLE `nf_entradas_itens` (
  `NF_ENTRADA_ITEM_SQ` int(11) NOT NULL auto_increment,
  `NF_ENTRADA_SQ` int(11) NOT NULL,
  `ITEM` int(11) NOT NULL,
  `PRODUTO_SQ` int(11) default NULL,
  `NR_SERIE_ITEM` blob,
  `QTDE_ITEM` int(11) default NULL,
  `VLR_UNIT_ITEM` decimal(9,2) default NULL,
  `VLR_TOTAL_ITEM` decimal(9,2) default NULL,
  `ALIQ_ICMS_ITEM` decimal(4,2) default NULL,
  `ALIQ_IPI_ITEM` decimal(4,2) default NULL,
  `VLR_ICMS_ITEM` decimal(9,2) default NULL,
  `VLR_IPI_ITEM` decimal(9,2) default NULL,
  `numero_estoque` int(11) default NULL,
  PRIMARY KEY  (`NF_ENTRADA_ITEM_SQ`),
  KEY `NF_ENTRADAS_ITENS_X_NFISCAIS` (`NF_ENTRADA_SQ`),
  KEY `NF_ENTRADAS_ITENS_X_PRODUTOS` (`PRODUTO_SQ`),
  CONSTRAINT `NF_ENTRADAS_ITENS_X_NF_ENTRADAS` FOREIGN KEY (`NF_ENTRADA_SQ`) REFERENCES `nf_entradas` (`NF_ENTRADA_SQ`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `NF_ENTRADAS_ITENS_X_PRODUTOS` FOREIGN KEY (`PRODUTO_SQ`) REFERENCES `produtos` (`PRODUTO_SQ`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `nf_servicos`
--

DROP TABLE IF EXISTS `nf_servicos`;
CREATE TABLE `nf_servicos` (
  `NF_SERVICO_SQ` int(11) NOT NULL auto_increment,
  `NUMERO_NF_SERVICO` int(11) NOT NULL,
  `DATA_NF_SERVICO` timestamp NOT NULL default '0000-00-00 00:00:00',
  `CLIENTE_SQ` int(11) NOT NULL,
  `TTL_NF_SERVICO` decimal(9,2) NOT NULL,
  `ALIQ_ISS_NF_SERVICO` decimal(4,2) NOT NULL,
  `VLR_ISS_NF_SERVICO` decimal(9,2) NOT NULL,
  PRIMARY KEY  (`NF_SERVICO_SQ`),
  UNIQUE KEY `NF_SERVICOS_1` (`NUMERO_NF_SERVICO`),
  KEY `NF_SERVICOS_X_CLIENTES` (`CLIENTE_SQ`),
  CONSTRAINT `NF_SERVICOS_X_CLIENTES` FOREIGN KEY (`CLIENTE_SQ`) REFERENCES `clientes` (`CLIENTE_SQ`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `nfiscais`
--

DROP TABLE IF EXISTS `nfiscais`;
CREATE TABLE `nfiscais` (
  `NFISCAL_SQ` int(11) NOT NULL auto_increment,
  `NUMERO_NFISCAL` int(11) NOT NULL,
  `DTEMISSAO_NFISCAL` timestamp NOT NULL default '0000-00-00 00:00:00',
  `DTSAIDA_NFISCAL` timestamp NULL default NULL,
  `PEDIDO_SQ` int(11) default NULL,
  `CLIENTE_SQ` int(11) NOT NULL,
  `COND_PAGTO_SQ` int(11) NOT NULL,
  `NATUREZA_SQ` int(11) NOT NULL,
  `TRANSPORTADORA_SQ` int(11) NOT NULL,
  `BASE_ICMS` decimal(9,2) default NULL,
  `VLR_ICMS` decimal(9,2) default NULL,
  `BASE_ICMS_SUBST` decimal(9,2) default NULL,
  `VLR_ICMS_SUBST` decimal(9,2) default NULL,
  `VLR_PRODUTOS` decimal(9,2) default NULL,
  `VLR_FRETE` decimal(9,2) default NULL,
  `VLR_SEGURO` decimal(9,2) default NULL,
  `VLR_DESP_ACESS` decimal(9,2) default NULL,
  `VLR_IPI` decimal(9,2) default NULL,
  `VLR_TOTAL` decimal(9,2) default NULL,
  `FRETE_TRANSP` varchar(1) default NULL,
  `PLACA_TRANSP` varchar(7) default NULL,
  `UF_PLACA_TRANSP` varchar(2) default NULL,
  `QTDE_TRANSP` int(11) default NULL,
  `ESPECIE_TRANSP` varchar(20) default NULL,
  `MARCA_TRANSP` varchar(30) default NULL,
  `NUMERO_TRANSP` varchar(10) default NULL,
  `PBRUTO_TRANSP` varchar(20) default NULL,
  `PLIQUIDO_TRANSP` varchar(20) default NULL,
  `CLASS_FISCAL1` int(11) default NULL,
  `CLASS_FISCAL2` int(11) default NULL,
  `CLASS_FISCAL3` int(11) default NULL,
  `CLASS_FISCAL4` int(11) default NULL,
  `CLASS_FISCAL5` int(11) default NULL,
  `CLASS_FISCAL6` int(11) default NULL,
  `CLASS_FISCAL7` int(11) default NULL,
  `MENSAGEM` text,
  `CANCELADA` varchar(1) NOT NULL,
  `DIAS_DEMONSTRACAO` int(11) default NULL,
  `COTACAO_DOLAR` decimal(9,4) default NULL,
  `NR_NFISCAL_RETORNO` int(11) default NULL,
  `DT_NFISCAL_RETORNO` timestamp NULL default NULL,
  `CONCLUIDA` varchar(1) default NULL,
  `VENDEDOR_SQ` int(11) NOT NULL,
  `NF_MANUAL` varchar(1) default NULL,
  `RETORNO_PRODUTO` varchar(1) default 'N',
  `RETORNO_OBSERVACAO` text,
  `NATUREZA_RET_DEM` int(11) default NULL,
  `linha_sq` int(11) default NULL,
  `class_fiscal8` int(11) default NULL,
  `class_fiscal9` int(11) default NULL,
  `class_fiscal10` int(11) default NULL,
  `class_fiscal11` int(11) default NULL,
  `class_fiscal12` int(11) default NULL,
  `class_fiscal13` int(11) default NULL,
  `class_fiscal14` int(11) default NULL,
  `class_fiscal15` int(11) default NULL,
  `class_fiscal16` int(11) default NULL,
  `class_fiscal17` int(11) default NULL,
  `class_fiscal18` int(11) default NULL,
  `class_fiscal19` int(11) default NULL,
  `class_fiscal20` int(11) default NULL,
  `class_fiscal21` int(11) default NULL,
  `class_fiscal22` int(11) default NULL,
  `class_fiscal23` int(11) default NULL,
  `class_fiscal24` int(11) default NULL,
  `inf_adicional` varchar(100) default NULL,
  `nfe_chave` varchar(47) default NULL,
  `nfe_resposta` blob,
  `numero_nfe` int(11) default NULL,
  `nfiscal_sq_referencia` int(11) default NULL,
  `recibo_nfe` varchar(15) default NULL,
  `motivo_cancelamento` varchar(45) default NULL,
  `vlr_ii` decimal(9,2) default NULL,
  `uf_embarque` varchar(2) default NULL,
  `local_embarque` varchar(60) default NULL,
  PRIMARY KEY  (`NFISCAL_SQ`),
  UNIQUE KEY `NFISCAIS_1` (`NUMERO_NFISCAL`),
  KEY `NFISCAIS_X_CLIENTES` (`CLIENTE_SQ`),
  KEY `NFISCAIS_X_COND_PAGTO` (`COND_PAGTO_SQ`),
  KEY `NFISCAIS_X_NATUREZAS` (`NATUREZA_SQ`),
  KEY `NFISCAIS_X_TRANSPORTADORA` (`TRANSPORTADORA_SQ`),
  KEY `NFISCAIS_X_VENDEDORES` (`VENDEDOR_SQ`),
  KEY `NFISCAIS_X_NATUREZAS2` (`NATUREZA_RET_DEM`),
  KEY `nfiscais_x_linha` (`linha_sq`),
  CONSTRAINT `NFISCAIS_X_CLIENTES` FOREIGN KEY (`CLIENTE_SQ`) REFERENCES `clientes` (`CLIENTE_SQ`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `NFISCAIS_X_COND_PAGTO` FOREIGN KEY (`COND_PAGTO_SQ`) REFERENCES `cond_pagto` (`COND_PAGTO_SQ`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `nfiscais_x_linha` FOREIGN KEY (`linha_sq`) REFERENCES `linha` (`linha_sq`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `NFISCAIS_X_NATUREZAS` FOREIGN KEY (`NATUREZA_SQ`) REFERENCES `naturezas` (`NATUREZA_SQ`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `NFISCAIS_X_NATUREZAS2` FOREIGN KEY (`NATUREZA_RET_DEM`) REFERENCES `naturezas` (`NATUREZA_SQ`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `NFISCAIS_X_TRANSPORTADORA` FOREIGN KEY (`TRANSPORTADORA_SQ`) REFERENCES `transportadoras` (`TRANSPORTADORA_SQ`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `NFISCAIS_X_VENDEDORES` FOREIGN KEY (`VENDEDOR_SQ`) REFERENCES `vendedores` (`VENDEDOR_SQ`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `nfiscais_itens`
--

DROP TABLE IF EXISTS `nfiscais_itens`;
CREATE TABLE `nfiscais_itens` (
  `NFISCAL_ITEM_SQ` int(11) NOT NULL auto_increment,
  `NFISCAL_SQ` int(11) NOT NULL,
  `ITEM` int(11) NOT NULL,
  `PRODUTO_SQ` int(11) default NULL,
  `NR_SERIE_ITEM` text,
  `CLASS_FISCAL` varchar(1) default NULL,
  `STRIBUT` int(11) default NULL,
  `qtde_item1_old` int(11) default NULL,
  `VLR_UNIT_ITEM` decimal(9,2) default NULL,
  `VLR_TOTAL_ITEM` decimal(9,2) default NULL,
  `ALIQ_ICMS_ITEM` decimal(4,2) default NULL,
  `ALIQ_IPI_ITEM` decimal(4,2) default NULL,
  `VLR_ICMS_ITEM` decimal(9,2) default NULL,
  `VLR_IPI_ITEM` decimal(9,2) default NULL,
  `PESO_BRUTO` decimal(9,2) default NULL,
  `PESO_LIQUIDO` decimal(9,2) default NULL,
  `qtde_item2_old` int(11) default NULL,
  `qtde_item3_old` int(11) default NULL,
  `VLR_DESC` decimal(9,2) default NULL,
  `PCT_DESC` decimal(5,2) default NULL,
  `VLR_JUROS` decimal(9,2) default NULL,
  `PCT_JUROS` decimal(5,2) default NULL,
  `base_icms_subst_item` decimal(9,2) default NULL,
  `vlr_icms_subst_item` decimal(9,2) default NULL,
  `origem_mercadoria` int(11) default NULL,
  `qtde_item4_old` int(11) default NULL,
  `qtde_item5_old` int(11) default NULL,
  `qtde_item6_old` int(11) default NULL,
  `qtde_item7_old` int(11) default NULL,
  `qtde_item8_old` int(11) default NULL,
  `qtde_item9_old` int(11) default NULL,
  `qtde_item10_old` int(11) default NULL,
  `qtde_item` int(11) default NULL,
  `vlr_frete_item` decimal(9,2) default NULL,
  `vlr_seguro_item` decimal(9,2) default NULL,
  `vlr_desp_acess_item` decimal(9,2) default NULL,
  `base_ii_item` decimal(9,2) default NULL,
  `vlr_ii_item` decimal(9,2) default NULL,
  `vlr_desp_adu_item` decimal(9,2) default NULL,
  `vlr_iof_item` decimal(9,2) default NULL,
  `numero_di` varchar(10) default NULL,
  `data_di` date default NULL,
  `local_desemb` varchar(60) default NULL,
  `uf_desemb` varchar(2) default NULL,
  `data_desemb` date default NULL,
  `codigo_exportador` varchar(60) default NULL,
  `base_icms_item` decimal(9,2) default NULL,
  `numero_estoque` int(11) default NULL,
  PRIMARY KEY  (`NFISCAL_ITEM_SQ`),
  KEY `NFISCAIS_ITENS_X_NFISCAIS` (`NFISCAL_SQ`),
  KEY `NFISCAIS_ITENS_X_PRODUTOS` (`PRODUTO_SQ`),
  CONSTRAINT `NFISCAIS_ITENS_X_NFISCAIS` FOREIGN KEY (`NFISCAL_SQ`) REFERENCES `nfiscais` (`NFISCAL_SQ`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `NFISCAIS_ITENS_X_PRODUTOS` FOREIGN KEY (`PRODUTO_SQ`) REFERENCES `produtos` (`PRODUTO_SQ`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `nfiscais_itens_adicao`
--

DROP TABLE IF EXISTS `nfiscais_itens_adicao`;
CREATE TABLE `nfiscais_itens_adicao` (
  `nfiscal_item_adicao_sq` int(11) NOT NULL auto_increment,
  `nfiscal_item_sq` int(11) NOT NULL,
  `numero_adicao` int(3) default NULL,
  `numero_sequencial_adicao` int(3) default NULL,
  `codigo_fabricante` varchar(60) default NULL,
  `vlr_desc_adicao` decimal(9,2) default NULL,
  PRIMARY KEY  (`nfiscal_item_adicao_sq`),
  KEY `nfiscal_item_sq` (`nfiscal_item_sq`),
  CONSTRAINT `nfiscais_itens_adicao_ibfk_1` FOREIGN KEY (`nfiscal_item_sq`) REFERENCES `nfiscais_itens` (`NFISCAL_ITEM_SQ`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `nfiscais_itens_serie`
--

DROP TABLE IF EXISTS `nfiscais_itens_serie`;
CREATE TABLE `nfiscais_itens_serie` (
  `nfiscal_item_serie_sq` int(11) NOT NULL auto_increment,
  `nfiscal_item_sq` int(11) NOT NULL,
  `produto_numero_serie_sq` int(11) NOT NULL,
  PRIMARY KEY  (`nfiscal_item_serie_sq`),
  KEY `nfiscal_item_serie_fk1` (`nfiscal_item_sq`),
  KEY `nfiscal_item_x_produto_numero_serie` (`produto_numero_serie_sq`),
  CONSTRAINT `nfiscal_item_serie_fk1` FOREIGN KEY (`nfiscal_item_sq`) REFERENCES `nfiscais_itens` (`NFISCAL_ITEM_SQ`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `nfiscal_item_x_produto_numero_serie` FOREIGN KEY (`produto_numero_serie_sq`) REFERENCES `produto_numero_serie` (`produto_numero_serie_sq`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `notificacao`
--

DROP TABLE IF EXISTS `notificacao`;
CREATE TABLE `notificacao` (
  `notificacao_sq` int(11) NOT NULL auto_increment,
  `data_notificacao` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `nome_usuario` varchar(50) character set utf8 default NULL,
  `ip_usuario` varchar(15) character set utf8 default NULL,
  `versao_software` varchar(10) character set utf8 default NULL,
  `nome_software` varchar(50) character set utf8 default NULL,
  `titulo_notificacao` varchar(100) default NULL,
  `mensagem` text character set utf8,
  `status` char(1) default NULL,
  PRIMARY KEY  (`notificacao_sq`),
  UNIQUE KEY `data_notificacao` (`data_notificacao`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
CREATE TABLE `pedidos` (
  `PEDIDO_SQ` int(11) NOT NULL auto_increment,
  `CLIENTE_SQ` int(11) NOT NULL,
  `DATA_PEDIDO` timestamp NOT NULL default '0000-00-00 00:00:00',
  `COND_PAGTO_SQ` int(11) NOT NULL,
  `NATUREZA_SQ` int(11) NOT NULL,
  `COTACAO_DOLAR` decimal(9,4) default NULL,
  `OBSERVACAO_PED` text,
  `OBSERVACAO_NF` text,
  `TRANSPORTADORA_SQ` int(11) NOT NULL,
  `VLR_FRETE` decimal(9,2) default NULL,
  `FRETE_TRANSP` varchar(1) default NULL,
  `NFISCAL_SQ` int(11) default NULL,
  `VLR_DESC` decimal(9,2) default NULL,
  `PCT_DESC` decimal(9,2) default NULL,
  `VLR_ICMS` decimal(9,2) default NULL,
  `VLR_IPI` decimal(9,2) default NULL,
  `VLR_PRODUTOS` decimal(9,2) default NULL,
  `BASE_ICMS` decimal(9,2) default NULL,
  `NUMERO_PEDIDO` int(11) default NULL,
  `DIAS_DEMONSTRACAO` int(11) default NULL,
  `pct_juros` decimal(4,2) default NULL,
  `VLR_JUROS` decimal(9,2) default NULL,
  `VENDEDOR_SQ` int(11) NOT NULL,
  `PESO_BRUTO` decimal(9,2) default NULL,
  `PESO_LIQUIDO` decimal(9,2) default NULL,
  `VLR_SEGURO` decimal(9,2) default NULL,
  `linha_sq` int(11) default NULL,
  `baixou_estoque` char(1) default NULL,
  `status` char(1) default NULL,
  `base_icms_subst` decimal(9,2) default NULL,
  `vlr_icms_subst` decimal(9,2) default NULL,
  `vlr_total` decimal(9,2) default NULL,
  PRIMARY KEY  (`PEDIDO_SQ`),
  UNIQUE KEY `PEDIDOS_1` (`NUMERO_PEDIDO`),
  KEY `PEDIDOS_X_CLIENTES` (`CLIENTE_SQ`),
  KEY `PEDIDOS_X_COND_PAGTO` (`COND_PAGTO_SQ`),
  KEY `PEDIDOS_X_NATUREZAS` (`NATUREZA_SQ`),
  KEY `PEDIDOS_X_TRANSPORTADORA` (`TRANSPORTADORA_SQ`),
  KEY `PEDIDOS_X_VENDEDORES` (`VENDEDOR_SQ`),
  KEY `pedidos_x_linha` (`linha_sq`),
  CONSTRAINT `PEDIDOS_X_CLIENTES` FOREIGN KEY (`CLIENTE_SQ`) REFERENCES `clientes` (`CLIENTE_SQ`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `PEDIDOS_X_COND_PAGTO` FOREIGN KEY (`COND_PAGTO_SQ`) REFERENCES `cond_pagto` (`COND_PAGTO_SQ`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `pedidos_x_linha` FOREIGN KEY (`linha_sq`) REFERENCES `linha` (`linha_sq`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `PEDIDOS_X_NATUREZAS` FOREIGN KEY (`NATUREZA_SQ`) REFERENCES `naturezas` (`NATUREZA_SQ`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `PEDIDOS_X_TRANSPORTADORA` FOREIGN KEY (`TRANSPORTADORA_SQ`) REFERENCES `transportadoras` (`TRANSPORTADORA_SQ`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `PEDIDOS_X_VENDEDORES` FOREIGN KEY (`VENDEDOR_SQ`) REFERENCES `vendedores` (`VENDEDOR_SQ`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `pedidos_itens`
--

DROP TABLE IF EXISTS `pedidos_itens`;
CREATE TABLE `pedidos_itens` (
  `PEDIDO_ITEM_SQ` int(11) NOT NULL auto_increment,
  `PEDIDO_SQ` int(11) NOT NULL,
  `PRODUTO_SQ` int(11) NOT NULL,
  `QTDE_PEDIDO_ITEM` int(11) NOT NULL,
  `NR_SERIE_ITEM` text,
  `PRECO_UNIT` decimal(9,2) default NULL,
  `VLR_DESC` decimal(9,2) default NULL,
  `PCT_DESC` decimal(9,2) default NULL,
  `ALIQ_ICMS_ITEM` decimal(4,2) default NULL,
  `ALIQ_IPI_ITEM` decimal(4,2) default NULL,
  `VLR_ICMS_ITEM` decimal(9,2) default NULL,
  `VLR_IPI_ITEM` decimal(9,2) default NULL,
  `VLR_TOTAL_ITEM` decimal(9,2) default NULL,
  `PESO_BRUTO` decimal(9,2) default NULL,
  `PESO_LIQUIDO` decimal(9,2) default NULL,
  `VLR_JUROS` decimal(9,2) default NULL,
  `PCT_JUROS` decimal(5,2) default NULL,
  `base_icms_subst_item` decimal(9,2) default NULL,
  `vlr_icms_subst_item` decimal(9,2) default NULL,
  `numero_estoque` int(11) default NULL,
  PRIMARY KEY  (`PEDIDO_ITEM_SQ`),
  KEY `PEDIDOS_ITENS_X_PEDIDOS` (`PEDIDO_SQ`),
  KEY `PEDIDOS_ITENS_X_PRODUTOS` (`PRODUTO_SQ`),
  CONSTRAINT `PEDIDOS_ITENS_X_PEDIDOS` FOREIGN KEY (`PEDIDO_SQ`) REFERENCES `pedidos` (`PEDIDO_SQ`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `PEDIDOS_ITENS_X_PRODUTOS` FOREIGN KEY (`PRODUTO_SQ`) REFERENCES `produtos` (`PRODUTO_SQ`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `pedidos_itens_serie`
--

DROP TABLE IF EXISTS `pedidos_itens_serie`;
CREATE TABLE `pedidos_itens_serie` (
  `pedido_item_serie_sq` int(11) NOT NULL auto_increment,
  `pedido_item_sq` int(11) NOT NULL,
  `produto_numero_serie_sq` int(11) NOT NULL,
  PRIMARY KEY  (`pedido_item_serie_sq`),
  KEY `pedido_item_serie_fk1` (`pedido_item_sq`),
  KEY `pedido_item_x_produto_numero_serie` (`produto_numero_serie_sq`),
  CONSTRAINT `pedido_item_serie_fk1` FOREIGN KEY (`pedido_item_sq`) REFERENCES `pedidos_itens` (`PEDIDO_ITEM_SQ`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pedido_item_x_produto_numero_serie` FOREIGN KEY (`produto_numero_serie_sq`) REFERENCES `produto_numero_serie` (`produto_numero_serie_sq`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `produto_numero_serie`
--

DROP TABLE IF EXISTS `produto_numero_serie`;
CREATE TABLE `produto_numero_serie` (
  `produto_numero_serie_sq` int(11) NOT NULL auto_increment,
  `produto_sq` int(11) NOT NULL,
  `numero_estoque` int(11) NOT NULL,
  `numero_serie` varchar(100) default NULL,
  `data_ultima_entrada` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `data_ultima_saida` timestamp NULL default NULL,
  `numero_nf_ent` int(11) default NULL,
  PRIMARY KEY  (`produto_numero_serie_sq`),
  UNIQUE KEY `produto_sq` (`produto_sq`,`numero_serie`),
  CONSTRAINT `produto_numero_serie_x_produto` FOREIGN KEY (`produto_sq`) REFERENCES `produtos` (`PRODUTO_SQ`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `produtos`
--

DROP TABLE IF EXISTS `produtos`;
CREATE TABLE `produtos` (
  `PRODUTO_SQ` int(11) NOT NULL auto_increment,
  `CODIGO_PRODUTO` varchar(20) character set latin1 collate latin1_bin NOT NULL,
  `DESCRICAO_PRODUTO` varchar(50) NOT NULL,
  `qtde_estoque1` int(11) default NULL,
  `qtde_estoque2` int(11) default NULL,
  `NBM_SQ` int(11) NOT NULL,
  `UN_PRODUTO` varchar(2) default NULL,
  `MARCA_PRODUTO` varchar(20) default NULL,
  `PRECO_UNIT` decimal(9,2) default NULL,
  `TIPO_PRODUTO` int(11) default NULL,
  `MODELO_SQ` int(11) NOT NULL,
  `qtde_estoque3` int(11) default NULL,
  `qtde_estoque4` int(11) default NULL,
  `qtde_estoque5` int(11) default NULL,
  `qtde_estoque6` int(11) default NULL,
  `qtde_estoque7` int(11) default NULL,
  `qtde_estoque8` int(11) default NULL,
  `PESO_BRUTO` decimal(8,2) default NULL,
  `PESO_LIQUIDO` decimal(8,2) default NULL,
  `linha_sq` int(11) default NULL,
  `aliq_icms_subst` decimal(9,2) default '38.58',
  `origem_mercadoria` int(11) default NULL,
  `descricao_completa` blob,
  `codigo_upc` varchar(12) default NULL,
  `codigo_dun` varchar(14) default NULL,
  `largura_liquida` decimal(10,2) default NULL,
  `altura_liquida` decimal(10,2) default NULL,
  `profundidade_liquida` decimal(10,2) default NULL,
  `largura_bruta` decimal(10,2) default NULL,
  `altura_bruta` decimal(10,2) default NULL,
  `profundidade_bruta` decimal(10,2) default NULL,
  `qtde_estoque9` int(11) default NULL,
  `qtde_estoque10` int(11) default NULL,
  `controle_numero_serie` int(1) default NULL,
  `mascara_numero_serie` varchar(50) default NULL,
  `produto_ativo` varchar(1) NOT NULL default 'S',
  PRIMARY KEY  (`PRODUTO_SQ`),
  UNIQUE KEY `PRODUTOS_1` (`CODIGO_PRODUTO`),
  KEY `PRODUTOS_X_MODELOS` (`MODELO_SQ`),
  KEY `PRODUTOS_X_NBM` (`NBM_SQ`),
  KEY `produtos_x_linha` (`linha_sq`),
  CONSTRAINT `produtos_x_linha` FOREIGN KEY (`linha_sq`) REFERENCES `linha` (`linha_sq`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `PRODUTOS_X_MODELOS` FOREIGN KEY (`MODELO_SQ`) REFERENCES `modelos` (`MODELO_SQ`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `PRODUTOS_X_NBM` FOREIGN KEY (`NBM_SQ`) REFERENCES `nbm` (`NBM_SQ`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `produtos_faltantes`
--

DROP TABLE IF EXISTS `produtos_faltantes`;
CREATE TABLE `produtos_faltantes` (
  `produto_faltante_sq` int(11) NOT NULL auto_increment,
  `produto_sq` int(11) NOT NULL,
  `qtde_produto_faltante` int(11) NOT NULL,
  `data_produto_faltante` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `nf_entrada_sq` int(11) default NULL,
  `cliente_sq` int(11) default NULL,
  PRIMARY KEY  (`produto_faltante_sq`),
  KEY `produtos_faltantes_x_produtos` (`produto_sq`),
  KEY `produtos_faltantes_x_clientes` (`cliente_sq`),
  KEY `produtos_faltantes_x_nf_entradas` (`nf_entrada_sq`),
  CONSTRAINT `produtos_faltantes_x_clientes` FOREIGN KEY (`cliente_sq`) REFERENCES `clientes` (`CLIENTE_SQ`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `produtos_faltantes_x_nf_entradas` FOREIGN KEY (`nf_entrada_sq`) REFERENCES `nf_entradas` (`NF_ENTRADA_SQ`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `produtos_faltantes_x_produtos` FOREIGN KEY (`produto_sq`) REFERENCES `produtos` (`PRODUTO_SQ`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `rma`
--

DROP TABLE IF EXISTS `rma`;
CREATE TABLE `rma` (
  `rma_sq` int(11) NOT NULL auto_increment,
  `numero_rma` int(11) NOT NULL,
  `data_entrada_nf` date NOT NULL,
  `data_emissao_nf` date default NULL,
  `numero_nf_cliente` int(11) default NULL,
  `nome_cliente` varchar(50) NOT NULL,
  `endereco_cliente` varchar(200) default NULL,
  `email_cliente` varchar(100) default NULL,
  `telefone_cliente` varchar(20) default NULL,
  `responsavel_cliente` varchar(50) default NULL,
  `nf_compra` int(11) default NULL,
  `data_compra` date default NULL,
  `loja_cliente` varchar(100) default NULL,
  `forma_envio` varchar(20) default NULL,
  PRIMARY KEY  (`rma_sq`),
  UNIQUE KEY `numero_rma` (`numero_rma`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `rma_item`
--

DROP TABLE IF EXISTS `rma_item`;
CREATE TABLE `rma_item` (
  `rma_item_sq` int(11) NOT NULL auto_increment,
  `rma_sq` int(11) NOT NULL,
  `produto_sq` int(11) NOT NULL,
  `nr_serie_produto` varchar(100) default NULL,
  `qtde_produto` int(11) NOT NULL,
  `acessorio_produto` varchar(100) default NULL,
  `vlr_unit_produto` decimal(9,2) default NULL,
  `defeito_produto` varchar(100) default NULL,
  `data_retorno_produto` timestamp NULL default NULL,
  `nf_devolucao_produto` int(11) default NULL,
  `finalizacao_produto` varchar(100) default NULL,
  PRIMARY KEY  (`rma_item_sq`),
  KEY `rma_item_x_rma` (`rma_sq`),
  KEY `rma_item_x_produtos` (`produto_sq`),
  CONSTRAINT `rma_item_x_produtos` FOREIGN KEY (`produto_sq`) REFERENCES `produtos` (`PRODUTO_SQ`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `rma_item_x_rma` FOREIGN KEY (`rma_sq`) REFERENCES `rma` (`rma_sq`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `tipo_cliente`
--

DROP TABLE IF EXISTS `tipo_cliente`;
CREATE TABLE `tipo_cliente` (
  `tipo_cliente_sq` int(11) NOT NULL auto_increment,
  `descricao_tipo` varchar(100) NOT NULL,
  PRIMARY KEY  (`tipo_cliente_sq`),
  UNIQUE KEY `Index_2` (`descricao_tipo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `transportadoras`
--

DROP TABLE IF EXISTS `transportadoras`;
CREATE TABLE `transportadoras` (
  `TRANSPORTADORA_SQ` int(11) NOT NULL auto_increment,
  `CODIGO_TRANSPORTADORA` varchar(15) character set latin1 collate latin1_bin NOT NULL,
  `NOME_TRANSPORTADORA` varchar(50) default NULL,
  `ENDERECO_TRANSPORTADORA` varchar(50) default NULL,
  `MUNICIPIO_TRANSPORTADORA` varchar(30) default NULL,
  `ESTADO_TRANSPORTADORA` varchar(2) default NULL,
  `INSCR_ESTADUAL` varchar(20) default NULL,
  `DDD_FONE` varchar(4) default NULL,
  `NUMERO_FONE` varchar(15) default NULL,
  `COMPL_FONE` varchar(10) default NULL,
  PRIMARY KEY  (`TRANSPORTADORA_SQ`),
  UNIQUE KEY `TRANSPORTADORA_1` (`CODIGO_TRANSPORTADORA`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE `usuarios` (
  `USUARIO_SQ` int(11) NOT NULL auto_increment,
  `CODIGO_USUARIO` varchar(20) character set latin1 collate latin1_bin NOT NULL,
  `NOME_USUARIO` varchar(50) NOT NULL,
  `SENHA_USUARIO` varchar(50) default NULL,
  `ERRO_EMAIL_FROM` varchar(50) default NULL,
  `ERRO_NOME_FROM` varchar(50) default NULL,
  `ERRO_EMAIL_TO` varchar(50) default NULL,
  `ERRO_NOME_TO` varchar(50) default NULL,
  `ERRO_SMTP` varchar(50) default NULL,
  `ERRO_USERNAME` varchar(50) default NULL,
  `ERRO_PASSWORD` varchar(50) default NULL,
  `foto` mediumblob,
  `foto_usuario` varchar(50) default NULL,
  `VENDEDOR_SQ` int(11) default NULL,
  PRIMARY KEY  (`USUARIO_SQ`),
  UNIQUE KEY `USUARIOS_1` (`CODIGO_USUARIO`),
  KEY `usuarios_x_vendedores` (`VENDEDOR_SQ`),
  CONSTRAINT `usuarios_x_vendedores` FOREIGN KEY (`VENDEDOR_SQ`) REFERENCES `vendedores` (`VENDEDOR_SQ`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `vendedores`
--

DROP TABLE IF EXISTS `vendedores`;
CREATE TABLE `vendedores` (
  `VENDEDOR_SQ` int(11) NOT NULL auto_increment,
  `CODIGO_VENDEDOR` int(11) NOT NULL,
  `NOME_VENDEDOR` varchar(100) NOT NULL,
  `pct_comissao_propria` decimal(4,2) default NULL,
  `pct_comissao_parceria` decimal(4,2) default NULL,
  `base_comissao` varchar(1) default NULL,
  `pct_comissao_desconto` decimal(4,2) default NULL,
  `obs_comissao_desconto` varchar(100) default NULL,
  `tipo_vendedor` char(1) default NULL,
  `data_cadastro` date default NULL,
  `data_inativacao` date default NULL,
  PRIMARY KEY  (`VENDEDOR_SQ`),
  UNIQUE KEY `VENDEDOR_1` (`CODIGO_VENDEDOR`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-06-27 18:43:06
