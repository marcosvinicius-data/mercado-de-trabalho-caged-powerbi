# Mercado de Trabalho Brasileiro - CAGED

## Objetivo

Desenvolver um dashboard analítico utilizando dados do Novo CAGED para acompanhar indicadores do mercado de trabalho brasileiro.

## Fonte dos dados

Novo CAGED – Ministério do Trabalho e Emprego.

## Tecnologias

- Power BI
- Power Query
- DAX
- Modelagem Dimensional

## Modelo de Dados

(inserir imagem do modelo estrela)

## Dashboard

(inserir imagens das páginas)

## Indicadores

- Admissões
- Desligamentos
- Saldo de Empregos
- Variação

## Estrutura do Modelo

- dim_contexto
- dim_geografia
- dim_municipio
- fato_geografia
- fato_municipio

  # 📖 Dicionário de Dados — Projeto CAGED BI

Este documento descreve a estrutura, os tipos de dados e os relacionamentos das tabelas que compõem o Data Warehouse do projeto.

---

### 📁 Tabela: `dim_contexto`
Armazena as lentes temporais e cenários analíticos utilizados no projeto.

| Campo | Tipo | Chave | Descrição | Exemplo |
| :--- | :--- | :---: | :--- | :--- |
| `id_contexto` | INT | PK | Identificador único do contexto | `1` |
| `descricao` | VARCHAR(50) | - | Descrição do período (ex: 2023, Nov/2023) | `Nov/2022 a Dez/2023` |
| `tipo` | VARCHAR(20) | - | Tipo de agrupamento (ANO, MÊS, INTERVALO) | `INTERVALO` |
| `data_inicio` | DATE | - | Data inicial do período de referência | `2022-11-01` |

---

### 📁 Tabela: `dim_municipio`
Cadastro e localização de grãos finos (municípios) do território nacional.

| Campo | Tipo | Chave | Descrição | Exemplo |
| :--- | :--- | :---: | :--- | :--- |
| `id_municipio` | INT | PK | Identificador único do município (Código IBGE) | `3550308` |
| `municipio` | VARCHAR(150) | - | Nome oficial do município | `São Paulo` |
| `uf` | VARCHAR(2) | - | Unidade federativa (sigla do estado) | `SP` |

---

### 📁 Tabela: `dim_geografia`
Cadastro de agrupamentos regionais e macro para análises consolidadas.

| Campo | Tipo | Chave | Descrição | Exemplo |
| :--- | :--- | :---: | :--- | :--- |
| `id_geografia` | INT | PK | Identificador da região geográfica | `10` |
| `regiao` | VARCHAR(50) | - | Região macro do Brasil | `Sudeste` |
| `estado` | VARCHAR(50) | - | Nome por extenso do estado associado | `São Paulo` |

---

### 📁 Tabela: `fato_municipio`
Tabela fato contendo as métricas de movimentação de empregos no nível de município.

| Campo | Tipo | Chave | Descrição | Exemplo |
| :--- | :--- | :---: | :--- | :--- |
| `id_municipio` | INT | FK | Chave estrangeira para `dim_municipio` | `3550308` |
| `id_contexto` | INT | FK | Chave estrangeira para `dim_contexto` | `1` |
| `admissoes` | INT | - | Número de admissões no período | `2450` |
| `desligamentos` | INT | - | Número de desligamentos no período | `2100` |
| `saldo` | INT | - | Diferença líquida (Admissões - Desligamentos) | `350` |

---

### 📁 Tabela: `fato_geografia`
Tabela fato contendo as métricas agregadas de movimentação de empregos no nível de estado/região.

| Campo | Tipo | Chave | Descrição | Exemplo |
| :--- | :--- | :---: | :--- | :--- |
| `id_geografia` | INT | FK | Chave estrangeira para `dim_geografia` | `10` |
| `id_contexto` | INT | FK | Chave estrangeira para `dim_contexto` | `1` |
| `admissoes` | INT | - | Total de admissões consolidadas | `85400` |
| `desligamentos` | INT | - | Total de desligamentos consolidados | `81200` |
| `saldo` | INT | - | Resultado líquido do emprego na região | `4200` |

## 🛠️ Como Replicar o Banco de Dados

Se você quiser testar a modelagem deste projeto no seu ambiente local:
1. Abra o seu gerenciador do **SQL Server (SSMS)**.
2. Crie um novo banco de dados (ex: `CREATE DATABASE caged_bi;`).
3. Execute o script contido na pasta `/sql/create_schema.sql`.
4. O script criará automaticamente o **Modelo Estrela (Star Schema)** com todas as chaves, relacionamentos e a documentação nativa do dicionário de dados embutida nas tabelas.

1. Clone o repositório.
2. Abra o arquivo `.pbix` no Power BI Desktop.
