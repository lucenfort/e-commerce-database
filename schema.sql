CREATE DATABASE e_commerce;

USE e_commerce;

CREATE TABLE cliente_pf (
  id INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(255) NOT NULL,
  cpf VARCHAR(11) NOT NULL,
  email VARCHAR(255) NOT NULL,
  data_nascimento DATE NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE cliente_pj (
  id INT NOT NULL AUTO_INCREMENT,
  razao_social VARCHAR(255) NOT NULL,
  cnpj VARCHAR(14) NOT NULL,
  inscricao_estadual VARCHAR(14) NOT NULL,
  email VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE endereco (
  id INT NOT NULL AUTO_INCREMENT,
  cliente_id INT NOT NULL,
  cep VARCHAR(9) NOT NULL,
  logradouro VARCHAR(255) NOT NULL,
  numero VARCHAR(10) NOT NULL,
  complemento VARCHAR(255),
  bairro VARCHAR(255) NOT NULL,
  cidade VARCHAR(255) NOT NULL,
  estado VARCHAR(2) NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (cliente_id) REFERENCES cliente_pf (id) ON DELETE CASCADE
);

CREATE TABLE fornecedor (
  id INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(255) NOT NULL,
  cnpj VARCHAR(14) NOT NULL,
  inscricao_estadual VARCHAR(14) NOT NULL,
  email VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE produto (
  id INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(255) NOT NULL,
  descricao VARCHAR(255) NOT NULL,
  preco_unitario DECIMAL(10,2) NOT NULL,
  quantidade_estoque INT NOT NULL,
  fornecedor_id INT NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (fornecedor_id) REFERENCES fornecedor (id) ON DELETE CASCADE
);

CREATE TABLE estoque (
  id INT NOT NULL AUTO_INCREMENT,
  produto_id INT NOT NULL,
  quantidade INT NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (produto_id) REFERENCES produto (id) ON DELETE CASCADE
);

CREATE TABLE pedido (
  id INT NOT NULL AUTO_INCREMENT,
  cliente_id INT NOT NULL,
  data_pedido DATETIME NOT NULL,
  valor_total DECIMAL(10,2) NOT NULL,
  status VARCHAR(20) NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (cliente_id) REFERENCES cliente_pf (id) ON DELETE CASCADE
);

CREATE TABLE item_pedido (
  id INT NOT NULL AUTO_INCREMENT,
  pedido_id INT NOT NULL,
  produto_id INT NOT NULL,
  quantidade INT NOT NULL,
  valor_unitario DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (pedido_id) REFERENCES pedido (id) ON DELETE CASCADE,
  FOREIGN KEY (produto_id) REFERENCES produto (id) ON DELETE CASCADE
);

CREATE TABLE pagamento (
  id INT NOT NULL AUTO_INCREMENT,
  pedido_id INT NOT NULL,
  forma_pagamento VARCHAR(20) NOT NULL,
  data_pagamento DATETIME NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (pedido_id) REFERENCES pedido (id) ON DELETE CASCADE
);

CREATE TABLE entrega (
  id INT NOT NULL AUTO_INCREMENT,
  pedido_id INT NOT NULL,
  status VARCHAR(20) NOT NULL,
  codigo_rastreio VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (pedido_id) REFERENCES pedido (id) ON DELETE CASCADE
);
