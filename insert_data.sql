-- Criação do banco de dados
CREATE DATABASE e_commerce;

-- Seleção do banco de dados
USE e_commerce;

-- Criação da tabela `cliente_pf`
CREATE TABLE cliente_pf (
  id INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(255) NOT NULL,
  cpf VARCHAR(11) NOT NULL,
  rg VARCHAR(12) NOT NULL,
  email VARCHAR(255) NOT NULL,
  senha VARCHAR(255) NOT NULL,
  data_nascimento DATE NOT NULL,
  tipo ENUM('Pessoa Física', 'Pessoa Jurídica') NOT NULL,
  PRIMARY KEY (id)
);

-- Criação da tabela `cliente_pj`
CREATE TABLE cliente_pj (
  id INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(255) NOT NULL,
  cnpj VARCHAR(14) NOT NULL,
  inscricao_estadual VARCHAR(14) NOT NULL,
  email VARCHAR(255) NOT NULL,
  senha VARCHAR(255) NOT NULL,
  data_fundacao DATE NOT NULL,
  PRIMARY KEY (id)
);

-- Criação da tabela `endereco`
CREATE TABLE endereco (
  id INT NOT NULL AUTO_INCREMENT,
  cep VARCHAR(9) NOT NULL,
  logradouro VARCHAR(255) NOT NULL,
  numero VARCHAR(10) NOT NULL,
  complemento VARCHAR(255) NOT NULL,
  bairro VARCHAR(255) NOT NULL,
  cidade VARCHAR(255) NOT NULL,
  estado VARCHAR(2) NOT NULL,
  pais VARCHAR(2) NOT NULL,
  PRIMARY KEY (id)
);

-- Criação da tabela `fornecedor`
CREATE TABLE fornecedor (
  id INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(255) NOT NULL,
  cnpj VARCHAR(14) NOT NULL,
  inscricao_estadual VARCHAR(14) NOT NULL,
  email VARCHAR(255) NOT NULL,
  senha VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
);

-- Criação da tabela `produto`
CREATE TABLE produto (
  id INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(255) NOT NULL,
  descricao TEXT NOT NULL,
  preco DECIMAL(10,2) NOT NULL,
  quantidade_estoque INT NOT NULL,
  fornecedor_id INT NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (fornecedor_id) REFERENCES fornecedor (id)
);

-- Criação da tabela `estoque`
CREATE TABLE estoque (
  id INT NOT NULL AUTO_INCREMENT,
  produto_id INT NOT NULL,
  quantidade INT NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (produto_id) REFERENCES produto (id)
);

-- Criação da tabela `pedido`
CREATE TABLE pedido (
  id INT NOT NULL AUTO_INCREMENT,
  cliente_id INT NOT NULL,
  data_criacao DATETIME NOT NULL,
  data_entrega DATETIME NOT NULL,
  status ENUM('Aguardando Pagamento', 'Pagamento Aprovado', 'Pedido Enviado', 'Entregue', 'Cancelado') NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (cliente_id) REFERENCES cliente_pf (id)
);

-- Criação da tabela `item_pedido`
CREATE TABLE item_pedido (
  id INT NOT NULL AUTO_INCREMENT,
  pedido_id INT NOT NULL,
  produto_id INT NOT NULL,
  quantidade INT NOT NULL,
  preco DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (pedido_id) REFERENCES pedido (id),
  FOREIGN KEY (produto_id) REFERENCES produto (id)
);

-- Criação da tabela `pagamento`
CREATE TABLE pagamento (
  id INT NOT NULL AUTO_INCREMENT,
  pedido_id INT NOT NULL,
  data_pagamento DATETIME NOT NULL,
  forma_pagamento ENUM('Cartão de Crédito', 'Cartão de Débito', 'Boleto Bancário', 'Transferência Bancária') NOT NULL

);

-- Criação da tabela `entrega`
CREATE TABLE entrega (
  id INT NOT NULL AUTO_INCREMENT,
  pedido_id INT NOT NULL,
  status ENUM('Aguardando Pagamento', 'Pagamento Aprovado', 'Pedido Enviado', 'Entregue', 'Cancelado') NOT NULL,
  codigo_rastreio VARCHAR(255) NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (pedido_id) REFERENCES pedido (id)
);

-- Alterações nas tabelas
ALTER TABLE cliente_pf
ADD COLUMN endereco_id INT;

ALTER TABLE cliente_pf
ADD FOREIGN KEY (endereco_id) REFERENCES endereco (id);

-- Constraints
ALTER TABLE produto
ADD CONSTRAINT estoque_quantidade_minima CHECK (quantidade_estoque >= 0);

ALTER TABLE pedido
ADD CONSTRAINT pedido_data_criacao_before_data_entrega CHECK (data_criacao <= data_entrega);

-- Incluindo dados de teste
INSERT INTO cliente_pf (nome, cpf, rg, email, senha, data_nascimento, tipo)
VALUES ('Fulano da Silva', '123.456.789-00', '12.345.678-9', 'fulano@email.com', '123456', '1990-01-01', 'Pessoa Física');

INSERT INTO cliente_pj (nome, cnpj, inscricao_estadual, email, senha, data_fundacao)
VALUES ('Empresa XPTO', '12.345.678/0001-00', '123.456.789-00', 'empresa@email.com', '123456', '2023-01-01');

INSERT INTO endereco (cep, logradouro, numero, complemento, bairro, cidade, estado, pais)
VALUES ('12345-678', 'Rua Principal', '100', 'Apto 101', 'Bairro da Paz', 'Cidade do Sol', 'SP', 'Brasil');

INSERT INTO fornecedor (nome, cnpj, inscricao_estadual, email, senha)
VALUES ('Fornecedor A', '12.345.678/0002-01', '123.456.789-01', 'fornecedor@email.com', '123456');

INSERT INTO produto (nome, descricao, preco, quantidade_estoque, fornecedor_id)
VALUES ('Produto A', 'Descrição do produto A', 100.00, 10, 1);

INSERT INTO estoque (produto_id, quantidade)
VALUES (1, 10);

INSERT INTO pedido (cliente_id, data_criacao, data_entrega, status)
VALUES (1, '2023-03-08 10:00:00', '2023-03-10 10:00:00', 'Aguardando Pagamento');

INSERT INTO item_pedido (pedido_id, produto_id, quantidade, preco)
VALUES (1, 1, 1, 100.00);

INSERT INTO pagamento (pedido_id, data_pagamento, forma_pagamento)
VALUES (1, '2023-03-08 12:00:00', 'Cartão de Crédito');

INSERT INTO entrega (pedido_id, status, codigo_rastreio)
VALUES (1, 'Pedido Enviado', '1234567890123456');
