-- ------------------------------------------------------------
-- INSERTs para Povoar as Tabelas (DML)
-- ------------------------------------------------------------

-- Inserção em CATEGORIA
INSERT INTO CATEGORIA (Nome, ValorDiaria) VALUES 
('Economico', 80.00),
('Sedan', 120.00),
('SUV', 180.00);

-- Inserção em CLIENTE
INSERT INTO CLIENTE (CPF, Nome, Telefone, CNH) VALUES
('11122233344', 'Lucas Silva', '(11)98765-4321', '01234567890'),
('55566677788', 'Maria Oliveira', '(21)99887-7665', '11223344556'),
('99900011122', 'Pedro Rocha', '(31)97766-5544', '66778899001');

-- Inserção em FUNCIONARIO
INSERT INTO FUNCIONARIO (Nome, Cargo) VALUES
('Ana Souza', 'Atendente de Balcão'),
('Rafaela Gomes', 'Gerente de Frota');

-- Inserção em VEICULO (Depende de CATEGORIA)
INSERT INTO VEICULO (Placa, Chassi, Ano, IDCategoria) VALUES
('ABC1234', 'XYZ1234567890ABCD', 2022, 1), -- Economico
('EFG5678', 'WZY9876543210DCBA', 2023, 2), -- Sedan
('HIJ9012', 'QWE0123456789GFED', 2024, 3); -- SUV

-- Inserção em CONTRATO (Depende de CLIENTE, VEICULO e FUNCIONARIO)
INSERT INTO CONTRATO (DataRetirada, DataDevolucaoReal, ValorTotal, CPF, Placa, Matricula) VALUES
('2025-11-01', '2025-11-05', 400.00, '11122233344', 'ABC1234', 1), -- Lucas alugou Economico
('2025-11-10', '2025-11-15', 720.00, '55566677788', 'HIJ9012', 1), -- Maria alugou SUV
('2025-11-20', NULL, 120.00, '99900011122', 'EFG5678', 2); -- Contrato em aberto, alugado por Pedro
