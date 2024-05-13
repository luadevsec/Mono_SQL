
-- SOLUÇÃO:
/*==============================================================*/
/* Table: CLIENTE */
/*==============================================================*/
DROP TABLE CLIENTE CASCADE CONSTRAINT;
create table CLIENTE (
CODIGO NUMBER not null,
NOME varchar2(60) not null,
RUA varchar2(80) not null,
NR NUMBER(4) not null,
BAIRRO varchar2(50) not null,
COMPLEMENTO varchar2(100),
CIDADE varchar2(50) not null,
UF varchar2(2) not null,
CEP varchar2(10) not null,
);
/*==============================================================*/
/* Table: VENDEDOR */
/*==============================================================*/
DROP TABLE VENDEDOR CASCADE CONSTRAINT;
create table VENDEDOR (
MATRICULA NUMBER not null,
NOME varchar2(60) not null,
CNPF varchar2(14) not null,
);
/*==============================================================*/
/* Table: FONE_CLIENTE */
/*==============================================================*/
DROP TABLE FONE_CLIENTE CASCADE CONSTRAINT;

create table FONE_CLIENTE (
NUMERO varchar2(14) not null,
CODIGO_CLI NUMBER not null,
);
/*==============================================================*/
/* Table: FONE_VENDEDOR */
/*==============================================================*/
DROP TABLE FONE_VENDEDOR CASCADE CONSTRAINT;
create table FONE_VENDEDOR (
NUMERO varchar2(14) not null,
MATRICULA_VEN NUMBER not null,
);
/*==============================================================*/
/* Table: PF */
/*==============================================================*/
DROP TABLE PF;
create table PF (
CODIGO_CLI NUMBER not null,
CNPF varchar2(14) not null,
RG varchar2(10) not null,
DATA_NASCIMENTO DATE not null,
);
/*==============================================================*/
/* Table: PJ */
/*==============================================================*/
DROP TABLE PJ;
create table PJ (
CODIGO_CLI NUMBER not null,
CNPJ varchar2(19) not null,
IE varchar2(10) not null,
NOME_FANTASIA varchar2(60) not null,
);

/*==============================================================*/
/* Table: PRATELEIRA */
/*==============================================================*/
DROP TABLE PRATELEIRA CASCADE CONSTRAINT;
create table PRATELEIRA (
CODIGO NUMBER(3) not null,
DESCRICAO varchar2(50) not null,
NUMERO_SECOES NUMBER(2) not null,
);
/*==============================================================*/
/* Table: PRODUTO */
/*==============================================================*/
DROP TABLE PRODUTO CASCADE CONSTRAINT;
create table PRODUTO (
CODIGO NUMBER not null,
DESCRICAO varchar2(80) not null,
UNID_MEDIDA varchar2(10) not null,
);
/*==============================================================*/
/* Table: PEDIDO */
/*==============================================================*/
DROP TABLE PEDIDO CASCADE CONSTRAINT;
create table PEDIDO (
    NUMERO NUMBER(6) NOT NULL,
    DATA DATE NOT NULL,
    PRAZO_ENTREGA DATE,
    RUA VARCHAR2(80),
    NR NUMBER(4),
    BAIRRO VARCHAR2(50),
    COMPLEMENTO VARCHAR2(100),
    CIDADE VARCHAR2(50),
    UF VARCHAR2(2),
    CEP VARCHAR2(10), 
    TOTAL_FATURA NUMBER(8,2),
    CODIGO_CLI INTEGER NOT NULL,
    MATRICULA_VEN INTEGER NOT NULL
);
/*==============================================================*/
/* Table: ESTOQUE */
/*==============================================================*/
DROP TABLE ESTOQUE CASCADE CONSTRAINT;
create table ESTOQUE (
    DATA_ENTRADA DATE NOT NULL,
    CODIGO_PRO INTEGER NOT NULL,
    CODIGO_PRA NUMBER(3) NOT NULL,
    QUANTIDADE NUMBER(5) NOT NULL,
    DATA_VALIDADE DATE
);
/*==============================================================*/
/* Table: CAPACIDADE_ESTOQUE */
/*==============================================================*/
DROP TABLE CAPACIDADE_ESTOQUE CASCADE CONSTRAINT;
create table CAPACIDADE_ESTOQUE (
    CODIGO_PRO INTEGER NOT NULL,
    CODIGO_PRA NUMBER(3) NOT NULL,
    QUANTIDADE NUMBER(5) NOT NULL
);
/*==============================================================*/
/* Table: ITEM_PRODUTO */
/*==============================================================*/
DROP TABLE ITEM_PRODUTO CASCADE CONSTRAINT;
create table ITEM_PRODUTO (
    CODIGO_PRO INTEGER NOT NULL,
    NUMERO_PED NUMBER(6) NOT NULL,
    QUANTIDADE NUMBER(5) NOT NULL,
    PRECO_UNITARIO NUMBER(5,2) NOT NULL,
    VALOR_ITEM NUMBER(7,2)
);




-- vincular pks
ALTER TABLE CLIENTE
ADD constraint PK_CLIENTE primary key (CODIGO);

ALTER TABLE VENDEDOR
ADD constraint PK_VENDEDOR primary key (MATRICULA);

ALTER TABLE FONE_CLIENTE
ADD constraint PK_FONE_CLIENTE primary key (NUMERO, CODIGO_CLI);

ALTER TABLE FONE_VENDEDOR
ADD constraint PK_FONE_VENDEDOR primary key (NUMERO, MATRICULA_VEN);

ALTER TABLE PF
ADD constraint PK_PF primary key (CODIGO_CLI);

ALTER TABLE PJ
ADD constraint PK_PJ primary key (CODIGO_CLI);

ALTER TABLE PRATELEIRA
ADD constraint PK_PRATELEIRA primary key (CODIGO);

ALTER TABLE PRODUTO
ADD constraint PK_PRODUTO primary key (CODIGO);

ALTER TABLE ITEM_PRODUTO
ADD CONSTRAINT PK_ITEM_PRODUTO PRIMARY KEY (CODIGO_PRO, NUMERO_PED);

ALTER TABLE PEDIDO
ADD CONSTRAINT PK_PEDIDO PRIMARY KEY (NUMERO);

ALTER TABLE ESTOQUE
ADD CONSTRAINT PK_ESTOQUE PRIMARY KEY (DATA_ENTRADA, CODIGO_PRO, CODIGO_PRA)

ALTER TABLE CAPACIDADE_ESTOQUE
ADD CONSTRAINT PK_CAPACIDADE_ESTOQUE PRIMARY KEY (CODIGO_PRO, CODIGO_PRA)

-- VINCULAR FKS

ALTER TABLE FONE_CLIENTE
ADD constraint FK_FONE_CLIENTE foreign key (CODIGO_CLI) references CLIENTE (CODIGO);

ALTER TABLE FONE_VENDEDOR 
ADD constraint FK_FONE_VENDEDOR foreign key (MATRICULA_VEN) references VENDEDOR
(MATRICULA);

ALTER TABLE PF
ADD constraint FK_PF_CLIENTE foreign key (CODIGO_CLI) references CLIENTE (CODIGO);

ALTER TABLE PJ
ADD constraint FK_PJ_CLIENTE foreign key (CODIGO_CLI) references CLIENTE (CODIGO);

ALTER TABLE PEDIDO
ADD CONSTRAINT FK_PED_CLIENTE FOREIGN KEY (CODIGO_CLI) REFERENCES CLIENTE (CODIGO)
ADD CONSTRAINT FK_PED_VENDEDOR FOREIGN KEY (MATRICULA_VEN) REFERENCES VENDEDOR (MATRICULA);

ALTER TABLE ESTOQUE
ADD CONSTRAINT FK_EST_PRETELEIRA FOREIGN KEY (CODIGO_PRA) REFERENCES PRATELEIRA (CODIGO)
ADD CONSTRAINT FK_EST_PRODUTO FOREIGN KEY (CODIGO_PRO) REFERENCES PRODUTO (CODIGO);

ALTER TABLE CAPACIDADE_ESTOQUE
ADD CONSTRAINT FK_CAP_EST_PRODUTO FOREIGN KEY (CODIGO_PRO) REFERENCES PRODUTO (CODIGO)
ADD CONSTRAINT FK_CAP_EST_PRATELEIRA FOREIGN KEY (CODIGO_PRA) REFERENCES PRATELEIRA (CODIGO);


