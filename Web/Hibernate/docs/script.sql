create table historico_acesso (
    historico_acesso_sq int not null auto_increment primary key,
    usuario_sq int not null,
    data_acesso timestamp,
    nome_programa varchar(250)
);
alter table historico_acesso
add constraint foreign key (usuario_sq) references usuarios (usuario_sq);
