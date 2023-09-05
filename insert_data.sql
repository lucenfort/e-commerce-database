USE e_commerce;

-- Inserção de dados na tabela cliente_pf

INSERT INTO cliente_pf (nome, cpf, email, data_nascimento)
VALUES
  ('João da Silva', '123.456.789-00', 'joao.silva@email.com', '1990-01-01'),
  ('Maria da Silva', '987.654.321-00', 'maria.silva@email.com', '1991-02-02'),
  ('José da Silva', '098.765.432-10', 'jose.silva@email.com', '1992-03-03');

-- Inserção de dados na tabela cliente_pj

INSERT INTO cliente_pj (razao_social, cnpj, inscricao_estadual, email)
VALUES
  ('Empresa A', '12.345.678/9001-23', '123.456.789.000', 'empresaa@email.com'),
  ('Empresa B', '98.765.432/1002-34', '987.654.321.000', 'empresab@email.com'),
  ('Empresa C', '098.765.432/1003-45', '098.765.432.100', 'empresac@email.com');

-- Inserção de dados na tabela endereco

INSERT INTO endereco (cliente_id, cep, logradouro, numero, complemento, bairro, cidade, estado)
VALUES
  (1, '12345-678', 'Rua da Paz', '10', NULL, 'Bairro da Paz', 'Cidade da Paz', 'SP'),
  (2, '98765-432', 'Rua da Felicidade', '20', 'Apto. 200', 'Bairro da Felicidade', 'Cidade da Felicidade', 'RJ'),
  (3, '09876-543', 'Rua da Alegria', '30', NULL, 'Bairro da Alegria', 'Cidade da Alegria', 'MG');

-- Inserção de dados na tabela fornecedor

INSERT INTO fornecedor (nome, cnpj, inscricao_estadual, email)
VALUES
  ('Fornecedor A', '12.345.678/9001-23', '123.456.789.000', 'fornecedora@email.com'),
  ('Fornecedor B', '98.765.432/1002-34', '987.654.321.000', 'fornecedorb@email.com'),
  ('Fornecedor C', '098.765.432/1003-45', '098.765.432.100', 'fornecedorc@email.com');

-- Inserção de dados na tabela produto

INSERT INTO produto (nome, descricao, preco_unitario, quantidade_estoque, fornecedor_id)
VALUES
  ('Televisão', 'Televisão de 32 polegadas', 1.000, 10, 1),
  ('Celular', 'Celular de última geração', 2.000, 20, 2),
  ('Computador', 'Computador portátil', 3.000, 30, 3);

-- Inserção de dados na tabela estoque
INSERT INTO estoque (produto_id, quantidade)
VALUES
  (1, 10),
  (2, 20),
  (3, 30);

-- Inserção de dados na tabela pedido

INSERT INTO pedido (cliente_id, data_pedido, valor_total, status)
VALUES
  (1, '2023-03-08 10:00:00', 1.000, 'Aguardando Pagamento'),
  (2, '2023-03-09 12:00:00', 2.000, 'Pagamento Aprovado'),
  (3, '2023-03-10 14:00:00', 3.000, 'Pedido Enviado');

-- Inserção de dados na tabela item_pedido

INSERT INTO item_pedido (pedido_id, produto_id, quantidade, valor_unitario)
VALUES
  (1, 1, 1, 1.000),
  (2, 2, 1, 2.000),
  (3, 3, 1, 3.000);

-- Inserção de dados na tabela pagamento

INSERT INTO pagamento (pedido_id, forma_pagamento, data_pagamento)
VALUES
  (1, 'Cartão de Crédito', '2023-03-08 12:00:00'),
  (2, 'Boleto Bancário', '2023-03-09 14:00:00');

-- Inserção de dados na tabela entrega

INSERT INTO entrega (pedido_id, status, codigo_rastreio)
VALUES
  (1, 'Aguardando Pagamento', NULL),
  (2, 'Pagamento Aprovado', '1234567890123456');
