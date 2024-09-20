-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 20-Set-2024 às 17:02
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

-- --------------------------------------------------------

--
-- Estrutura da tabela `combustivel`
--

CREATE TABLE `combustivel` (
  `combTipo` char(1) NOT NULL,
  `combNome` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `departamento`
--

CREATE TABLE `departamento` (
  `deptoCod` int(9) NOT NULL,
  `deptoNome` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  MODIFY `catCod` int(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `departamento`
--
ALTER TABLE `departamento`
  MODIFY `deptoCod` int(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `funcionarios`
--
ALTER TABLE `funcionarios`
  MODIFY `funcMatricula` smallint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1001;

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
