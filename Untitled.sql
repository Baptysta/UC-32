CREATE TABLE `Clientes` (
  `id_cliente` integer PRIMARY KEY AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `telefone` varchar(255),
  `email` varchar(255) UNIQUE,
  `data_cadastro` datetime DEFAULT (now())
);

CREATE TABLE `Produtos` (
  `id_produto` integer PRIMARY KEY AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `descricao` text,
  `preco` decimal(10,2) NOT NULL,
  `categoria` varchar(255)
);

CREATE TABLE `Pedidos` (
  `id_pedido` integer PRIMARY KEY AUTO_INCREMENT,
  `id_cliente` integer,
  `data_pedido` datetime DEFAULT (now()),
  `status` varchar(255) COMMENT 'Pendente, Em Preparo, Entregue, Cancelado',
  `valor_total` decimal(10,2)
);

CREATE TABLE `Itens_Pedido` (
  `id_item` integer PRIMARY KEY AUTO_INCREMENT,
  `id_pedido` integer,
  `id_produto` integer,
  `quantidade` integer NOT NULL,
  `preco_unitario` decimal(10,2) NOT NULL
);

ALTER TABLE `Pedidos` ADD FOREIGN KEY (`id_cliente`) REFERENCES `Clientes` (`id_cliente`);

ALTER TABLE `Itens_Pedido` ADD FOREIGN KEY (`id_pedido`) REFERENCES `Pedidos` (`id_pedido`);

ALTER TABLE `Itens_Pedido` ADD FOREIGN KEY (`id_produto`) REFERENCES `Produtos` (`id_produto`);
