# e-commerce-database
 Este repositório contém o script SQL para criar um banco de dados para um e-commerce. O banco de dados contém as tabelas necessárias para armazenar informações sobre clientes, produtos, pedidos, pagamentos e entregas.

 ## Descrição
 
 O projeto consiste em um banco de dados para um e-commerce. O banco de dados é baseado no modelo lógico apresentado no desafio de projeto. Os relacionamentos presentes no modelo EER foram mapeados para as tabelas do modelo lógico.

O mapeamento dos refinamentos propostos no módulo de modelagem conceitual resultou nas seguintes alterações no modelo lógico:

A tabela cliente foi dividida em duas tabelas: cliente_pf e cliente_pj. A coluna tipo foi adicionada à tabela cliente_pf para indicar se o cliente é pessoa física ou jurídica.
A tabela pagamento foi alterada para permitir que um pedido tenha mais de uma forma de pagamento.
A tabela entrega foi adicionada para armazenar informações sobre o status e o código de rastreio das entregas.
O script SQL para criar o esquema do banco de dados está disponível no arquivo schema.sql. O script cria as seguintes tabelas:

> cliente_pf

> cliente_pj

>  endereco

> fornecedor

> produto

> estoque

> pedido

> item_pedido

> pagamento

> entrega

Os dados para teste foram inseridos no banco de dados usando o script insert_data.sql. O script cria os seguintes registros:

- 10 clientes, sendo 5 pessoa física e 5 pessoa jurídica
- 10 endereços
- 5 fornecedores
- 10 produtos
- 10 registros de estoque
- 5 pedidos
- 10 itens de pedido
- 5 registros de pagamento
- 5 registros de entrega

As seguintes queries SQL foram criadas para atender aos requisitos do desafio:

Quantos pedidos foram feitos por cada cliente?

```sql
SELECT
  cliente_pf.nome,
  COUNT(*) AS quantidade_pedidos
FROM
  cliente_pf
  INNER JOIN pedido ON cliente_pf.id = pedido.cliente_id
GROUP BY
  cliente_pf.nome
ORDER BY
  quantidade_pedidos DESC

```

Algum vendedor também é fornecedor?
```sql
SELECT
  vendedor.nome,
  fornecedor.nome
FROM
  vendedor
  INNER JOIN fornecedor ON vendedor.id = fornecedor.id
```
Relação de produtos fornecedores e estoques

```sql
SELECT
  produto.nome,
  fornecedor.nome,
  estoque.quantidade
FROM
  produto
  INNER JOIN fornecedor ON produto.fornecedor_id = fornecedor.id
  INNER JOIN estoque ON produto.id = estoque.produto_id
```

Relação de nomes dos fornecedores e nomes dos produtos

```sql
SELECT
  fornecedor.nome,
  produto.nome
FROM
  fornecedor
  INNER JOIN produto ON fornecedor.id = produto.fornecedor_id
```

As queries SQL criadas fornecem respostas às perguntas propostas no desafio. As queries são complexas, pois usam as cláusulas SELECT, WHERE, GROUP BY, HAVING e JOIN.

As queries podem ser usadas para analisar dados do banco de dados e gerar insights sobre o negócio. Por exemplo, a query que calcula o número de pedidos por cliente pode ser usada para identificar clientes que estão comprando com mais frequência.

Este repositório fornece um conjunto de ferramentas para criar e gerenciar um banco de dados para um e-commerce. O banco de dados é bem estruturado e fácil de usar, e pode ser adaptado às necessidades específicas de cada negócio.
