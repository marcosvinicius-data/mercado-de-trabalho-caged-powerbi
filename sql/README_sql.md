# 🧱 Modelagem SQL — Projeto mercado-de-trabalho-caged-powerbi

## 📌 Visão Geral

Este diretório contém a implementação do modelo dimensional utilizado no projeto mercado-de-trabalho-caged-powerbi.

O banco foi estruturado seguindo o modelo:

> ⭐ Star Schema (Modelo Constelação de Estrelas)

---

## 🏗️ Estrutura do Modelo

O modelo é composto por:

### 🟦 Dimensões
- dim_contexto → contexto temporal
- dim_municipio → dados geográficos municipais
- dim_geografia → agregação regional/estadual

### 🟥 Fatos
- fato_municipio → movimentação de emprego por município
- fato_geografia → movimentação de emprego por região/estado

---

## 🔗 Relacionamentos

- dim_contexto (1) → fato_municipio (N)
- dim_contexto (1) → fato_geografia (N)
- dim_municipio (1) → fato_municipio (N)
- dim_geografia (1) → fato_geografia (N)

---

## 🧠 Regras de Modelagem

- Todas as dimensões possuem chave primária única
- As tabelas fato possuem chaves compostas
- Não existe relacionamento entre tabelas fato
- Modelo otimizado para análise em BI

---

## ⚙️ Tecnologias

- SQL Server (Transact-SQL)
- Modelagem Dimensional (Star Schema)

---

## 🛠️ Como Replicar o Banco de Dados

Se você quiser testar a modelagem deste projeto no seu ambiente local:
1. Abra o seu gerenciador do **SQL Server (SSMS)**.
2. Crie um novo banco de dados (ex: `CREATE DATABASE caged;`).
4. Execute o script contido na pasta `/sql/create_schema.sql`.
5. O script criará automaticamente o **Modelo Constelação de Fatos (fact constellation)** com todas as chaves,relacionamentos e a documentação nativa do dicionário de dados embutida nas tabelas.

## 📊 Objetivo

Este modelo foi criado para suportar análises de:

- Admissões
- Desligamentos
- Saldo de empregos
- Evolução temporal
- Comparação entre municípios e regiões

---

## 👤 Autor
Marcos Vinicius

Projeto desenvolvido para portfólio de Data Analytics e Business Intelligence.
