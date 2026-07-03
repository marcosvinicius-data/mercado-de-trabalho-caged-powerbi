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


## 🛠️ Como Replicar o Banco de Dados

Se você quiser testar a modelagem deste projeto no seu ambiente local:
1. Abra o seu gerenciador do **SQL Server (SSMS)**.
2. Crie um novo banco de dados (ex: `CREATE DATABASE caged;`).
4. Execute o script contido na pasta `/sql/create_schema.sql`.
5. O script criará automaticamente o **Modelo Estrela (Star Schema)** com todas as chaves, relacionamentos e a documentação nativa do dicionário de dados embutida nas tabelas.

1. Clone o repositório.
2. Abra o arquivo `.pbix` no Power BI Desktop.
