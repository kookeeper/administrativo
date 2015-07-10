// 250.4
alter table clientes add pct_comissao_propria decimal(4,2) default NULL;
alter table clientes add pct_comissao_parceria decimal(4,2) default NULL;
alter table clientes add base_comissao varchar(1) default NULL;
alter table clientes add pct_comissao_desconto decimal(4,2) default NULL;
alter table clientes add obs_comissao_desconto varchar(100) default NULL;

alter table produto_numero_serie add numero_nf_ent int(11);

alter table produtos add produto_ativo varchar(1) not null default 'S';

//250.6
alter table clientes add cnae varchar(7) null;

//251.0
alter table empresas add codigo_regime_tributario int(1) not null default 3;
alter table empresas add codigo_situacao_operacao int(3) null;


//251.5
alter table produtos add produto_imagem blob;

//252.2
alter table nfiscais_itens add qtde_produto_retorno decimal(4) default null;
alter table produtos add produto_sq_retorno int(11) default null;
alter table produtos add constraint produto_retorno_x_produto foreign key (produto_sq) references produtos (produto_sq) on delete no action on update cascade;

alter table produtos add descricao_completa_str varchar(1000);
update produtos set descricao_completa_str = substring(descricao_completa, 1);
alter table produtos change descricao_completa descricao_completa_blob blob;
alter table produtos change descricao_completa_str descricao_completa varchar(1000) after descricao_completa_blob;
update produtos set descricao_completa_blob = null;


//252.3
ALTER TABLE MODELOS ADD COLUMN MODELO_SQ_PAI INT(11) AFTER `DESCRICAO_MODELO`,
 ADD CONSTRAINT `FK_MODELOS_PAI` FOREIGN KEY `FK_MODELOS_PAI` (MODELO_SQ_PAI)
    REFERENCES `modelos` (`MODELO_SQ`)
    ON DELETE SET NULL
    ON UPDATE CASCADE;

//252.4
ALTER TABLE `handy`.`produtos` MODIFY COLUMN `produto_imagem` LONGBLOB DEFAULT NULL;

//252.7
CREATE TABLE produto_imagem (
  produto_imagem_sq int(11) NOT NULL auto_increment,
  produto_sq int(11) NOT NULL,
  produto_imagem longblob NOT NULL,
  primary key (produto_imagem_sq)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

ALTER TABLE produto_imagem ADD CONSTRAINT produto_imagem_fk1 FOREIGN KEY (produto_sq) REFERENCES produtos (produto_sq) ON DELETE CASCADE ON UPDATE CASCADE;

insert into produto_imagem (produto_sq, produto_imagem) (select produto_sq, produto_imagem from produtos where produto_imagem is not null);

alter table produtos drop column produto_imagem;

alter table nfiscais_itens drop column qtde_produto_retorno;
alter table pedidos_itens add qtde_produto_retorno decimal(4) default null;
alter table pedidos add numero_comprovante_cartao int(11) default null;

//253.2
DROP TABLE IF EXISTS `handy`.`balanco`;
CREATE TABLE  `handy`.`balanco` (
  `balanco_sq` int(10) unsigned NOT NULL auto_increment,
  `empresa_sq` int(11) NOT NULL,
  `data_inicio_balanco` datetime NOT NULL,
  `data_termino_balanco` datetime default NULL,
  `qtde_contagem` int(10) unsigned NOT NULL,
  `numero_estoque` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`balanco_sq`),
  KEY `FK_balanco_1` (`empresa_sq`),
  CONSTRAINT `FK_balanco_1` FOREIGN KEY (`empresa_sq`) REFERENCES `empresas` (`EMPRESA_SQ`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `handy`.`balanco_contagem`;
CREATE TABLE  `handy`.`balanco_contagem` (
  `balanco_contagem_sq` int(10) unsigned NOT NULL auto_increment,
  `balanco_sq` int(10) unsigned NOT NULL,
  `data_inicio_contagem` datetime default NULL,
  `data_termino_contagem` datetime default NULL,
  `numero_contagem` int(10) unsigned NOT NULL,
  `status_contagem` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`balanco_contagem_sq`),
  KEY `FK_balanco_contagem_1` (`balanco_sq`),
  CONSTRAINT `FK_balanco_contagem_1` FOREIGN KEY (`balanco_sq`) REFERENCES `balanco` (`balanco_sq`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `handy`.`balanco_contagem_produto`;
CREATE TABLE  `handy`.`balanco_contagem_produto` (
  `balanco_contagem_produto_sq` int(10) unsigned NOT NULL auto_increment,
  `balanco_contagem_sq` int(10) unsigned NOT NULL,
  `produto_sq` int(11) NOT NULL,
  `qtde_estoque` int(10) unsigned default NULL,
  PRIMARY KEY  (`balanco_contagem_produto_sq`),
  KEY `FK_balanco_contagem_produto_1` (`balanco_contagem_sq`),
  KEY `FK_balanco_contagem_produto_2` (`produto_sq`),
  CONSTRAINT `FK_balanco_contagem_produto_1` FOREIGN KEY (`balanco_contagem_sq`) REFERENCES `balanco_contagem` (`balanco_contagem_sq`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_balanco_contagem_produto_2` FOREIGN KEY (`produto_sq`) REFERENCES `produtos` (`PRODUTO_SQ`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

ALTER TABLE VENDEDORES ADD PCT_DESCONTO INT(3) NULL;


//253.4
DROP TABLE IF EXISTS `handy`.`balanco`;
CREATE TABLE  `handy`.`balanco` (
  `balanco_sq` int(10) unsigned NOT NULL auto_increment,
  `empresa_sq` int(11) NOT NULL,
  `data_inicio_balanco` datetime NOT NULL,
  `data_termino_balanco` datetime default NULL,
  `qtde_contagem` int(10) unsigned NOT NULL,
  `numero_estoque` int(10) unsigned NOT NULL,
  `grupo_balanco` int(2) unsigned NOT NULL,
  `status_balanco` char(1) NOT NULL default 'A' COMMENT 'Aberto, Transferido',
  PRIMARY KEY  (`balanco_sq`),
  KEY `FK_balanco_1` (`empresa_sq`),
  CONSTRAINT `FK_balanco_1` FOREIGN KEY (`empresa_sq`) REFERENCES `empresas` (`EMPRESA_SQ`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `handy`.`balanco_contagem`;
CREATE TABLE  `handy`.`balanco_contagem` (
  `balanco_contagem_sq` int(10) unsigned NOT NULL auto_increment,
  `balanco_sq` int(10) unsigned NOT NULL,
  `data_inicio_contagem` datetime default NULL,
  `data_termino_contagem` datetime default NULL,
  `numero_contagem` int(10) unsigned NOT NULL,
  `status_contagem` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`balanco_contagem_sq`),
  KEY `FK_balanco_contagem_1` (`balanco_sq`),
  CONSTRAINT `FK_balanco_contagem_1` FOREIGN KEY (`balanco_sq`) REFERENCES `balanco` (`balanco_sq`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `handy`.`balanco_contagem_produto`;
CREATE TABLE  `handy`.`balanco_contagem_produto` (
  `balanco_contagem_produto_sq` int(10) unsigned NOT NULL auto_increment,
  `balanco_contagem_sq` int(10) unsigned NOT NULL,
  `produto_sq` int(11) NOT NULL,
  `qtde_estoque` int(11) default NULL,
  `qtde_contada` int(10) unsigned default NULL,
  PRIMARY KEY  (`balanco_contagem_produto_sq`),
  KEY `FK_balanco_contagem_produto_1` (`balanco_contagem_sq`),
  KEY `FK_balanco_contagem_produto_2` (`produto_sq`),
  CONSTRAINT `FK_balanco_contagem_produto_1` FOREIGN KEY (`balanco_contagem_sq`) REFERENCES `balanco_contagem` (`balanco_contagem_sq`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_balanco_contagem_produto_2` FOREIGN KEY (`produto_sq`) REFERENCES `produtos` (`PRODUTO_SQ`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

ALTER TABLE `handy`.`produtos` ADD COLUMN `grupo_balanco` INT(2) UNSIGNED NOT NULL DEFAULT 1 AFTER `produto_sq_retorno`;


//253.5

ALTER TABLE `handy`.`vendedores` CHANGE COLUMN `PCT_DESCONTO` `pct_desconto` INT(3) UNSIGNED DEFAULT NULL,
 ADD COLUMN `pct_desconto_master` INT(3) UNSIGNED AFTER `pct_desconto`;

ALTER TABLE `handy`.`pedidos` ADD COLUMN `vendedor_sq_desconto` INTEGER AFTER `numero_comprovante_cartao`;

//253.6
ALTER TABLE `handy`.`produto_imagem` MODIFY COLUMN `produto_imagem` LONGBLOB,
 ADD COLUMN `produto_imagem_url` VARCHAR(500) AFTER `produto_imagem`;

//253.8
ALTER TABLE `handy`.`pedidos` ADD COLUMN `COND_PAGTO2_SQ` int(11) NULL AFTER `COND_PAGTO_SQ`;
ALTER TABLE `handy`.`pedidos` ADD COLUMN `COND_PAGTO3_SQ` int(11) NULL AFTER `COND_PAGTO2_SQ`;
ALTER TABLE `handy`.`pedidos` ADD CONSTRAINT `PEDIDOS_X_COND_PAGTO2` FOREIGN KEY (`COND_PAGTO2_SQ`) REFERENCES `cond_pagto` (`COND_PAGTO_SQ`) ON DELETE NO ACTION ON UPDATE CASCADE;
ALTER TABLE `handy`.`pedidos` ADD CONSTRAINT `PEDIDOS_X_COND_PAGTO3` FOREIGN KEY (`COND_PAGTO3_SQ`) REFERENCES `cond_pagto` (`COND_PAGTO_SQ`) ON DELETE NO ACTION ON UPDATE CASCADE;

ALTER TABLE `handy`.`pedidos` ADD COLUMN `VLR_COND_PAGTO` decimal(10,2) NULL AFTER `COND_PAGTO_SQ`;
ALTER TABLE `handy`.`pedidos` ADD COLUMN `VLR_COND_PAGTO2` decimal(10,2) NULL AFTER `COND_PAGTO2_SQ`;
ALTER TABLE `handy`.`pedidos` ADD COLUMN `VLR_COND_PAGTO3` decimal(10,2) NULL AFTER `COND_PAGTO3_SQ`;

ALTER TABLE `handy`.`nfiscais` MODIFY COLUMN `DTEMISSAO_NFISCAL` TIMESTAMP NULL;
