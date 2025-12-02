-- ------------------------------------------------------------
-- UPDATEs e DELETEs (DML)
-- ------------------------------------------------------------

-- UPDATE 1: Atualizar o ValorTotal do último contrato (IDContrato 3), simulando o fechamento do aluguel.
UPDATE CONTRATO
SET DataDevolucaoReal = '2025-11-23', ValorTotal = 360.00 -- 3 dias * R$ 120.00
WHERE IDContrato = 3;

-- UPDATE 2: Promover o atendente 'Ana Souza' para 'Supervisor' (Matricula 1).
UPDATE FUNCIONARIO
SET Cargo = 'Supervisor'
WHERE Matricula = 1;

-- UPDATE 3: Corrigir o ValorDiaria da categoria 'Economico' (IDCategoria 1).
UPDATE CATEGORIA
SET ValorDiaria = 85.00
WHERE IDCategoria = 1;

-- DELETE 1: Deletar a categoria 'SUV' (IDCategoria 3)
-- Este comando FALHARÁ, pois a categoria está referenciada na tabela VEICULO (Integridade Referencial).
-- Para deletar, você deveria primeiro atualizar o VEICULO associado ou deletá-lo.
DELETE FROM CATEGORIA WHERE IDCategoria = 3;

-- DELETE 2: Deletar o cliente 'Pedro Rocha' (CPF '99900011122')
-- Este comando FALHARÁ, pois o cliente tem um CONTRATO associado (Integridade Referencial).
DELETE FROM CLIENTE WHERE CPF = '99900011122';

-- DELETE 3 (Ação Válida): Deletar um cliente sem contratos (se houvesse)
-- Vamos inserir um cliente temporário e deletá-lo:
INSERT INTO CLIENTE (CPF, Nome, Telefone, CNH) VALUES ('12345678900', 'Cliente Temp', '(00)00000-0000', '98765432100');
DELETE FROM CLIENTE WHERE CPF = '12345678900';
