-- ------------------------------------------------------------
-- SELECTs para Consultas (DML)
-- ------------------------------------------------------------

-- 1. Consulta simples: Listar todos os clientes com seus telefones.
SELECT Nome, Telefone FROM CLIENTE;

-- 2. Consulta com JOIN: Listar os veículos e o Nome da Categoria a que pertencem.
SELECT V.Placa, V.Ano, C.Nome AS Categoria
FROM VEICULO V
JOIN CATEGORIA C ON V.IDCategoria = C.IDCategoria
ORDER BY Categoria;

-- 3. Consulta com JOIN e WHERE: Quais clientes alugaram o veículo de placa 'ABC1234'?
SELECT CL.Nome, CO.DataRetirada
FROM CONTRATO CO
JOIN CLIENTE CL ON CO.CPF = CL.CPF
WHERE CO.Placa = 'ABC1234';

-- 4. Consulta com WHERE, ORDER BY e LIMIT: Listar os contratos com maior ValorTotal.
SELECT IDContrato, ValorTotal, DataRetirada
FROM CONTRATO
ORDER BY ValorTotal DESC
LIMIT 2;

-- 5. Consulta para verificar contratos em aberto (DataDevolucaoReal NULL):
SELECT T1.IDContrato, T2.Nome AS NomeCliente, T1.DataRetirada
FROM CONTRATO T1
JOIN CLIENTE T2 ON T1.CPF = T2.CPF
WHERE T1.DataDevolucaoReal IS NULL;
