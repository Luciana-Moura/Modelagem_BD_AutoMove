# 🚗 Projeto de Modelagem e Implementação SQL: Locadora AutoMove

Este repositório contém os scripts de Definição (DDL) e Manipulação (DML) de Dados para o **Sistema de Gerenciamento de Aluguel de Carros "AutoMove"**. O projeto foi desenvolvido como parte das Experiências Práticas da disciplina de Modelagem de Banco de Dados.

## 🎯 Modelo de Dados e Objetivo

O modelo lógico foi construído em 3ª Forma Normal (3FN) para evitar redundâncias e garantir a integridade dos dados, com as seguintes entidades principais:

* **CLIENTE:** Dados pessoais do locatário (PK: CPF).
* **VEICULO:** Detalhes da frota (PK: Placa), ligado à Categoria.
* **CATEGORIA:** Tabela de classificação de veículos e valores de diárias (PK: IDCategoria).
* **FUNCIONARIO:** Dados dos colaboradores (PK: Matricula).
* **CONTRATO:** Tabela de relacionamento central, registrando o aluguel e as chaves estrangeiras (FKs) para CLIENTE, VEICULO e FUNCIONARIO.

## ⚙️ Instruções de Execução

Para rodar o projeto, utilize um ambiente de SGBD (ex: MySQL, MariaDB, ou PostgreSQL com adaptações de sintaxe) e execute os scripts na ordem abaixo:

1.  **`01_create_tables.sql`**: Executa o DDL (Data Definition Language) para criar a estrutura das tabelas e definir todas as chaves primárias e estrangeiras.
2.  **`02_insert_data.sql`**: Executa o DML (Data Manipulation Language) para inserir os dados iniciais necessários para os testes.
3.  **`03_select_queries.sql`**: Executa os comandos de consulta (SELECT).
4.  **`04_update_delete.sql`**: Executa os comandos de UPDATE e DELETE com condições de integridade.

## 📑 Análise dos Scripts (Requisitos de Avaliação DML)

Os seguintes comandos demonstram a manipulação de dados conforme exigido na avaliação:

### **Consultas (SELECTs com JOIN, WHERE, ORDER BY)**

| Comando | Tipo | Objetivo da Consulta |
| :--- | :--- | :--- |
| **SELECT #2:** `SELECT V.Placa, V.Ano, C.Nome AS Categoria FROM VEICULO V JOIN CATEGORIA C...` | **JOIN** | Listar os veículos e o nome da Categoria a que pertencem, demonstrando a ligação 1:N. |
| **SELECT #3:** `SELECT CL.Nome, CO.DataRetirada FROM CONTRATO CO JOIN CLIENTE CL WHERE CO.Placa = 'ABC1234';` | **JOIN + WHERE** | Identificar qual cliente alugou um veículo específico, filtrando por uma condição. |
| **SELECT #5:** `SELECT T1.IDContrato, T2.Nome AS NomeCliente, T1.DataRetirada FROM CONTRATO T1 WHERE T1.DataDevolucaoReal IS NULL;` | **WHERE NULL** | Listar todos os contratos que estão em aberto (sem data de devolução registrada). |

### **Comandos de Alteração (UPDATEs e DELETEs)**

| Comando | Objetivo | Integridade/Condição |
| :--- | :--- | :--- |
| **UPDATE #1:** `UPDATE CONTRATO SET DataDevolucaoReal = '2025-11-23', ValorTotal = 360.00 WHERE IDContrato = 3;` | **Atualização de Estado** | Simula o fechamento de um contrato em aberto, atualizando a data real de devolução e o valor final. |
| **UPDATE #2:** `UPDATE FUNCIONARIO SET Cargo = 'Supervisor' WHERE Matricula = 1;` | **Atualização Simples** | Modifica o cargo de um funcionário específico, usando a Chave Primária (`Matricula`) como condição. |
| **DELETE #1:** `DELETE FROM CATEGORIA WHERE IDCategoria = 3;` | **Teste de Integridade** | **Este comando falha!** A exclusão é impedida porque a `IDCategoria = 3` está sendo referenciada por um veículo na tabela `VEICULO`, validando a regra de Chave Estrangeira. |
