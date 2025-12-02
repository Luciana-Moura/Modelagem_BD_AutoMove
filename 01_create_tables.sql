-- ------------------------------------------------------------
-- CRIAÇÃO DA ESTRUTURA (DDL) - Experiência Prática 4
-- ------------------------------------------------------------

-- Criação do Banco de Dados (Se necessário)
-- CREATE DATABASE automove_db;
-- USE automove_db;

-- 1. Tabela CATEGORIA (Entidade Forte)
CREATE TABLE CATEGORIA (
    IDCategoria INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(50) NOT NULL UNIQUE,
    ValorDiaria DECIMAL(8, 2) NOT NULL
);

-- 2. Tabela CLIENTE (Entidade Forte)
CREATE TABLE CLIENTE (
    CPF CHAR(11) PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Telefone VARCHAR(15),
    CNH VARCHAR(20) UNIQUE NOT NULL
);

-- 3. Tabela FUNCIONARIO (Entidade Forte)
CREATE TABLE FUNCIONARIO (
    Matricula INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100) NOT NULL,
    Cargo VARCHAR(50) NOT NULL
);

-- 4. Tabela VEICULO (Entidade Forte)
CREATE TABLE VEICULO (
    Placa CHAR(7) PRIMARY KEY,
    Chassi CHAR(17) UNIQUE NOT NULL,
    Ano INT NOT NULL,
    
    -- Chave Estrangeira
    IDCategoria INT NOT NULL,
    FOREIGN KEY (IDCategoria) REFERENCES CATEGORIA(IDCategoria)
);

-- 5. Tabela CONTRATO (Entidade Forte / Evento)
CREATE TABLE CONTRATO (
    IDContrato INT PRIMARY KEY AUTO_INCREMENT,
    DataRetirada DATE NOT NULL,
    DataDevolucaoReal DATE,
    ValorTotal DECIMAL(10, 2) NOT NULL,
    
    -- Chaves Estrangeiras
    CPF CHAR(11) NOT NULL,
    Placa CHAR(7) NOT NULL,
    Matricula INT NOT NULL,
    
    FOREIGN KEY (CPF) REFERENCES CLIENTE(CPF),
    FOREIGN KEY (Placa) REFERENCES VEICULO(Placa),
    FOREIGN KEY (Matricula) REFERENCES FUNCIONARIO(Matricula)
);
