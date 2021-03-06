create table restaurante(
	ident_r serial, --int auto increment
	nome varchar not null,
	dono int not null,
	endereco varchar not null,
	telefone varchar not null,
	categoria varchar,
	pontuacao float, --ideia: fazer um trigger que calcula a pontuacao toda vez q recebe um review da compra de um produto
	constraint pk_restaurante primary key(ident_r),
	constraint fk1_restaurante foreign key(dono) references usuario(ident_u),
	constraint fk2_restaurante foreign key(categoria) references categoria(nome)
);

create table usuario(
	ident_u serial,
	nome varchar not null,
	email varchar not null,
	endereco varchar not null,
	constraint pk_usuario primary key(ident_u)
);

create table categoria(
	nome varchar not null,
	constraint pk_categoria primary key(nome)
);

create table produto(
	ident_p serial,
	loja_id int not null,
	nome varchar not null,
	descricao varchar not null,
	preco float not null,
	pontuacao float, --ideia: uma trigger q calcule a pontuacao do produto a cada compra do mesmo
	constraint pk_produto primary key(ident_p),
	constraint fk1_produto foreign key(loja_id) references restaurante(ident_r)
);

create table compra(
	produto int not null,
	comprador int not null,
	quando timestamp not null,
	pagamento varchar not null,
	pontuacao float, --trigger pra permitir apenas de 0 a 5
	constraint pk_compra primary key(produto,comprador,quando),
	constraint fk1_compra foreign key(produto) references produto(ident_p),
	constraint fk2_compra foreign key(comprador) references usuario(ident_u),
	constraint fk3_compra foreign key(pagamento) references tipo_pagamento(nome)
);

create table tipo_pagamento(
	nome varchar not null,
	constraint pk_tipo_pagamento primary key(nome)
);
