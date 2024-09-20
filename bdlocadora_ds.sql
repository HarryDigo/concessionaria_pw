-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 20-Set-2024 às 17:04
-- Versão do servidor: 10.4.27-MariaDB
-- versão do PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `bdlocadora_ds`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `categoria`
--

CREATE TABLE `categoria` (
  `catCod` int(9) NOT NULL,
  `catNome` varchar(20) NOT NULL,
  `catValorKm` decimal(8,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `categoria`
--

INSERT INTO `categoria` (`catCod`, `catNome`, `catValorKm`) VALUES
(1, 'Basico', '0.49'),
(2, 'Utilitario', '0.51'),
(3, 'Luxo', '0.53'),
(4, 'Especial', '0.55');

-- --------------------------------------------------------

--
-- Estrutura da tabela `clientes`
--

CREATE TABLE `clientes` (
  `clienteCPF` int(9) NOT NULL,
  `clienteNome` varchar(40) NOT NULL,
  `clienteEnde` varchar(60) NOT NULL,
  `clienteTel` varchar(15) NOT NULL,
  `clienteCidade` varchar(60) NOT NULL,
  `clienteDataNasc` date NOT NULL,
  `clienteCNH` bigint(11) NOT NULL,
  `clienteCNHCat` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `clientes`
--

INSERT INTO `clientes` (`clienteCPF`, `clienteNome`, `clienteEnde`, `clienteTel`, `clienteCidade`, `clienteDataNasc`, `clienteCNH`, `clienteCNHCat`) VALUES
(111222333, 'Pedro Santos', 'Rua da Praia, 789', '(21) 98765-1234', 'Rio de Janeiro', '1978-11-30', 11122233344, 'AB'),
(123456789, 'Joao Silva', 'Rua das Flores, 123', '(11) 98765-4321', 'Sao Paulo', '1985-04-12', 12345678900, 'B'),
(222333444, 'Laura Mendes', 'Avenida Brasil, 303', '(41) 91234-5678', 'Curitiba', '1988-12-10', 22233344411, 'B'),
(333444555, 'Gustavo Rocha', 'Avenida Sete, 606', '(11) 93456-7890', 'Sao Paulo', '1980-01-20', 33344455544, 'C'),
(444555666, 'Ana Costa', 'Rua dos Jacarandas, 101', '(31) 92345-6789', 'Belo Horizonte', '1982-05-16', 44455566677, 'B'),
(555666777, 'Lucas Almeida', 'Rua das Palmeiras, 404', '(21) 99876-5432', 'Rio de Janeiro', '1993-03-05', 55566677722, 'A'),
(666777888, 'Juliana Campos', 'Rua dos Girassois, 707', '(31) 91567-8901', 'Belo Horizonte', '1991-06-12', 66677788855, 'B'),
(777888999, 'Carlos Pereira', 'Rua das Acacias, 202', '(61) 98765-4321', 'Brasi?lia', '1995-07-25', 77788899900, 'C'),
(888999000, 'Fernanda Lima', 'Rua das Orquideas, 505', '(71) 98765-6789', 'Salvador', '1987-09-17', 88899900033, 'AB'),
(987654321, 'Maria Oliveira', 'Avenida Paulista, 456', '(11) 91234-5678', 'Sao Paulo', '1990-08-22', 98765432101, 'A');

-- --------------------------------------------------------

--
-- Estrutura da tabela `combustivel`
--

CREATE TABLE `combustivel` (
  `combTipo` char(1) NOT NULL,
  `combNome` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `combustivel`
--

INSERT INTO `combustivel` (`combTipo`, `combNome`) VALUES
('A', 'Alcool'),
('D', 'Diesel'),
('F', 'Flex'),
('G', 'Gasolina');

-- --------------------------------------------------------

--
-- Estrutura da tabela `departamento`
--

CREATE TABLE `departamento` (
  `deptoCod` int(9) NOT NULL,
  `deptoNome` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `departamento`
--

INSERT INTO `departamento` (`deptoCod`, `deptoNome`) VALUES
(1, 'Atendimento'),
(2, 'Administrativo'),
(3, 'Financeiro'),
(4, 'Diretoria'),
(5, 'Copa');

-- --------------------------------------------------------

--
-- Estrutura da tabela `funcionarios`
--

CREATE TABLE `funcionarios` (
  `funcMatricula` smallint(4) NOT NULL,
  `funcNome` varchar(40) NOT NULL,
  `funcDepto` int(9) NOT NULL,
  `funcSalario` decimal(8,2) NOT NULL,
  `funcAdmissao` date NOT NULL,
  `funcFilho` tinyint(1) NOT NULL,
  `funcSexo` varchar(1) NOT NULL,
  `funcAtivo` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `funcionarios`
--

INSERT INTO `funcionarios` (`funcMatricula`, `funcNome`, `funcDepto`, `funcSalario`, `funcAdmissao`, `funcFilho`, `funcSexo`, `funcAtivo`) VALUES
(1001, 'Francisco de Oliveira', 1, '1800.00', '2001-11-20', 0, 'M', 1),
(1002, 'Ana Maria Andrade', 2, '3200.00', '1999-02-13', 1, 'F', 1),
(1003, 'Antonio Andrade de Oliveira', 3, '4800.00', '2007-11-05', 3, 'M', 1),
(1004, 'Maria Abelarda da Silva', 5, '937.00', '1997-03-01', 5, 'F', 1),
(1005, 'Manoel Trindade', 4, '7850.50', '1997-01-02', 3, 'M', 1),
(1006, 'Alexandre Barbosa', 1, '1800.00', '2000-06-08', 2, 'M', 1),
(1007, 'Rosana Campoy', 2, '3020.00', '2004-07-24', 3, 'F', 1),
(1008, 'Janaina Albuquerque', 3, '4500.00', '1999-03-25', 0, 'F', 1),
(1009, 'Roberto Silva Junior', 1, '1810.00', '2003-07-07', 0, 'M', 1),
(1010, 'Carlos Eduardo Siqueira', 4, '7890.00', '2009-08-04', 1, 'M', 1),
(1011, 'Heitor Sampaio', 1, '3450.00', '2011-03-05', 1, 'M', 1),
(1012, 'Celia Menezes', 1, '1980.00', '2008-07-18', 0, 'F', 1),
(1013, 'Jose Alves Costa', 1, '1650.00', '2000-09-11', 1, 'M', 1),
(1014, 'Arlinda Medeiros', 5, '937.00', '2000-05-03', 5, 'F', 1),
(1015, 'Josefina Sarmento', 4, '6789.00', '1997-01-02', 1, 'F', 1),
(1016, 'Wendell Navarro Perez', 3, '1212.00', '2004-04-15', 2, 'M', 1),
(1017, 'Rodolfo Rodrigues', 1, '8500.00', '2022-09-10', 2, 'M', 1);

--
-- Acionadores `funcionarios`
--
DELIMITER $$
CREATE TRIGGER `tr_func_user` AFTER INSERT ON `funcionarios` FOR EACH ROW INSERT INTO usuarios(usuarioLogin, usuarioSenha) VALUES
            (NEW.funcMatricula, REPLACE(NEW.funcAdmissao, '-', ''))
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `ordem_servico`
--

CREATE TABLE `ordem_servico` (
  `osNum` bigint(11) NOT NULL,
  `osFuncMat` smallint(4) NOT NULL,
  `osClienteCPF` int(9) NOT NULL,
  `osVeicPlaca` char(7) NOT NULL,
  `osDataRetirada` date NOT NULL,
  `osDataDevolucao` date DEFAULT NULL,
  `osKmRetirada` decimal(8,2) NOT NULL,
  `osKmDevolucao` decimal(8,2) NOT NULL,
  `osStatus` tinyint(1) NOT NULL,
  `osValorPgto` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `ordem_servico`
--

INSERT INTO `ordem_servico` (`osNum`, `osFuncMat`, `osClienteCPF`, `osVeicPlaca`, `osDataRetirada`, `osDataDevolucao`, `osKmRetirada`, `osKmDevolucao`, `osStatus`, `osValorPgto`) VALUES
(2024227685, 1016, 555666777, 'AWY4546', '2023-02-02', '2023-02-10', '840.00', '1010.00', 1, '1990.00'),
(2024573627, 1003, 123456789, 'AWS2365', '2023-10-30', '2023-11-20', '115.00', '550.00', 1, '1330.00'),
(2024645623, 1010, 666777888, 'AWY4546', '2019-10-30', '2019-11-25', '90.00', '900.00', 1, '1490.90'),
(2024867462, 1012, 888999000, 'AQW1234', '2020-11-30', '2020-12-10', '1550.00', '1910.00', 1, '2090.90'),
(2024900204, 1006, 222333444, 'AZX3273', '2022-01-03', '2022-01-09', '540.00', '690.00', 1, '590.90'),
(2024999883, 1007, 111222333, 'AWV1234', '2022-02-20', '2022-03-01', '155.00', '600.00', 1, '790.00'),
(2029887624, 1001, 987654321, 'AQX3451', '2024-09-30', '2024-10-01', '300.00', '900.00', 1, '990.90'),
(20240020492, 1008, 444555666, 'AQY2005', '2023-01-20', NULL, '6700.00', '0.00', 0, NULL),
(20240706043, 1011, 777888999, 'AQY2005', '2021-07-15', NULL, '1220.00', '0.00', 0, NULL),
(20241110222, 1002, 333444555, 'ADX1473', '2024-06-30', NULL, '1400.00', '0.00', 0, NULL);

--
-- Acionadores `ordem_servico`
--
DELIMITER $$
CREATE TRIGGER `tr_calc_pagamento` BEFORE UPDATE ON `ordem_servico` FOR EACH ROW BEGIN
            SET @id_cat = (SELECT veicCat FROM veiculos WHERE veicPlaca = NEW.osVeicPlaca);
            SET @valor_km = (SELECT catValorKm FROM categoria WHERE catCod = @id_cat);
            SET NEW.osValorPgto = @valor_km * NEW.osKmDevolucao;
        END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `tr_veic_status` AFTER INSERT ON `ordem_servico` FOR EACH ROW UPDATE veiculos 
            SET veicStatusAlocado = 1 
            WHERE veicPlaca = NEW.osVeicPlaca
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `tr_veic_status_off` AFTER UPDATE ON `ordem_servico` FOR EACH ROW UPDATE veiculos 
            SET veicStatusAlocado = 0 
            WHERE veicPlaca = NEW.osVeicPlaca
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `usuarioLogin` int(9) NOT NULL,
  `usuarioSenha` varchar(8) NOT NULL,
  `usuarioFuncMat` smallint(4) DEFAULT NULL,
  `usuarioSetor` int(9) NOT NULL,
  `usuarioStatus` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `usuarios`
--

INSERT INTO `usuarios` (`usuarioLogin`, `usuarioSenha`, `usuarioFuncMat`, `usuarioSetor`, `usuarioStatus`) VALUES
(1001, '20011120', NULL, 0, NULL),
(1002, '19990213', NULL, 0, NULL),
(1003, '20071105', NULL, 0, NULL),
(1004, '19970301', NULL, 0, NULL),
(1005, '19970102', NULL, 0, NULL),
(1006, '20000608', NULL, 0, NULL),
(1007, '20040724', NULL, 0, NULL),
(1008, '19990325', NULL, 0, NULL),
(1009, '20030707', NULL, 0, NULL),
(1010, '20090804', NULL, 0, NULL),
(1011, '20110305', NULL, 0, NULL),
(1012, '20080718', NULL, 0, NULL),
(1013, '20000911', NULL, 0, NULL),
(1014, '20000503', NULL, 0, NULL),
(1015, '19970102', NULL, 0, NULL),
(1016, '20040415', NULL, 0, NULL),
(1017, '20220910', NULL, 0, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `veiculos`
--

CREATE TABLE `veiculos` (
  `veicPlaca` char(7) NOT NULL,
  `veicMarca` varchar(15) NOT NULL,
  `veicModelo` varchar(15) NOT NULL,
  `veicCor` varchar(15) DEFAULT NULL,
  `veicAno` smallint(4) NOT NULL,
  `veicComb` char(1) DEFAULT NULL,
  `veicCat` int(9) DEFAULT NULL,
  `veicStatusAlocado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `veiculos`
--

INSERT INTO `veiculos` (`veicPlaca`, `veicMarca`, `veicModelo`, `veicCor`, `veicAno`, `veicComb`, `veicCat`, `veicStatusAlocado`) VALUES
('ABW4007', 'VW', 'Jetta', 'Preto', 2022, 'F', 3, 0),
('ACZ3243', 'VW', 'Fusca', 'Rosa', 1956, 'G', 4, 0),
('ADE3456', 'Chevrolet', 'Camaro', 'Amarelo', 2022, 'G', 4, 0),
('ADW2456', 'VW', 'Gol', 'Vermelho', 2021, 'A', 1, 0),
('ADX1473', 'Ford', 'Ka', 'Branco', 2021, 'A', 1, 1),
('AQW1234', 'Ford', 'Fusion', 'Preto', 2022, 'F', 3, 1),
('AQX3451', 'Porsche', 'Carrera', 'Preto', 2022, 'G', 4, 1),
('AQY2005', 'Chevrolet', 'S10', 'Branco', 2022, 'D', 2, 1),
('ASX3232', 'Ford', 'Ka', 'Marrom', 2022, 'F', 1, 0),
('AVX4003', 'VW', 'Amarok', 'Preto', 2022, 'D', 2, 0),
('AWQ3703', 'Chevrolet', 'Omega', 'Preto', 2022, 'G', 3, 0),
('AWS2365', 'Chevrolet', 'Cruze', 'Azul', 2022, 'F', 3, 1),
('AWV1234', 'Fiat', 'Palio', 'Branco', 2021, 'F', 1, 1),
('AWV1323', 'VW', 'Gol', 'Branco', 2022, 'F', 1, 0),
('AWY4546', 'Fiat', 'Fiorino', 'Branco', 2021, 'A', 2, 1),
('AZX3273', 'VW', 'Fox', 'Azul', 2021, 'F', 1, 1);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`catCod`);

--
-- Índices para tabela `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`clienteCPF`);

--
-- Índices para tabela `combustivel`
--
ALTER TABLE `combustivel`
  ADD PRIMARY KEY (`combTipo`);

--
-- Índices para tabela `departamento`
--
ALTER TABLE `departamento`
  ADD PRIMARY KEY (`deptoCod`);

--
-- Índices para tabela `funcionarios`
--
ALTER TABLE `funcionarios`
  ADD PRIMARY KEY (`funcMatricula`),
  ADD KEY `funcDepto` (`funcDepto`);

--
-- Índices para tabela `ordem_servico`
--
ALTER TABLE `ordem_servico`
  ADD PRIMARY KEY (`osNum`),
  ADD KEY `osVeicPlaca` (`osVeicPlaca`),
  ADD KEY `osClienteCPF` (`osClienteCPF`),
  ADD KEY `osFuncMat` (`osFuncMat`);

--
-- Índices para tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`usuarioLogin`),
  ADD KEY `usuarioFuncMat` (`usuarioFuncMat`);

--
-- Índices para tabela `veiculos`
--
ALTER TABLE `veiculos`
  ADD PRIMARY KEY (`veicPlaca`),
  ADD KEY `veicComb` (`veicComb`),
  ADD KEY `veicCat` (`veicCat`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `categoria`
--
ALTER TABLE `categoria`
  MODIFY `catCod` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `departamento`
--
ALTER TABLE `departamento`
  MODIFY `deptoCod` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `funcionarios`
--
ALTER TABLE `funcionarios`
  MODIFY `funcMatricula` smallint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1018;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `funcionarios`
--
ALTER TABLE `funcionarios`
  ADD CONSTRAINT `funcionarios_ibfk_1` FOREIGN KEY (`funcDepto`) REFERENCES `departamento` (`deptoCod`);

--
-- Limitadores para a tabela `ordem_servico`
--
ALTER TABLE `ordem_servico`
  ADD CONSTRAINT `ordem_servico_ibfk_1` FOREIGN KEY (`osVeicPlaca`) REFERENCES `veiculos` (`veicPlaca`),
  ADD CONSTRAINT `ordem_servico_ibfk_2` FOREIGN KEY (`osClienteCPF`) REFERENCES `clientes` (`clienteCPF`),
  ADD CONSTRAINT `ordem_servico_ibfk_3` FOREIGN KEY (`osFuncMat`) REFERENCES `funcionarios` (`funcMatricula`);

--
-- Limitadores para a tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`usuarioFuncMat`) REFERENCES `funcionarios` (`funcMatricula`);

--
-- Limitadores para a tabela `veiculos`
--
ALTER TABLE `veiculos`
  ADD CONSTRAINT `veiculos_ibfk_1` FOREIGN KEY (`veicComb`) REFERENCES `combustivel` (`combTipo`),
  ADD CONSTRAINT `veiculos_ibfk_2` FOREIGN KEY (`veicCat`) REFERENCES `categoria` (`catCod`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
