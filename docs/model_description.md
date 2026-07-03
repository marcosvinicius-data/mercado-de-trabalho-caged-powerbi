# Model Description

## Visão Geral

Este projeto foi desenvolvido no Power BI utilizando dados do CAGED (Cadastro Geral de Empregados e Desempregados), com foco na análise da movimentação do emprego formal no Brasil.

O modelo foi estruturado seguindo os princípios da modelagem dimensional, adotando uma **constelação de fatos (Fact Constellation)**. Essa arquitetura é composta por duas tabelas fato que compartilham uma dimensão comum de contexto temporal, permitindo análises em diferentes níveis de granularidade.

---

## Arquitetura do Modelo

O modelo é composto por cinco tabelas:

### Dimensões

- **dim_contexto**
  - Armazena os períodos e contextos utilizados nas análises.
  - É compartilhada pelas duas tabelas fato.

- **dim_municipio**
  - Contém as informações dos municípios.
  - Utilizada exclusivamente pela tabela `fato_municipio`.

- **dim_geografia**
  - Contém as informações geográficas agregadas por estado e região.
  - Utilizada exclusivamente pela tabela `fato_geografia`.

### Tabelas Fato

- **fato_municipio**
  - Armazena os indicadores de admissões, desligamentos e saldo no nível de município.

- **fato_geografia**
  - Armazena os mesmos indicadores em nível regional e estadual.

---

## Relacionamentos

O modelo possui relacionamentos do tipo **1:N**, com direção de filtro única (Single).

```
dim_contexto (1) ────────< fato_municipio (N)

dim_contexto (1) ────────< fato_geografia (N)

dim_municipio (1) ───────< fato_municipio (N)

dim_geografia (1) ───────< fato_geografia (N)
```

Não existe relacionamento direto entre as tabelas fato.

---

## Granularidade

Cada tabela fato possui um nível de detalhamento específico:

### fato_municipio

Um registro representa:

> Um município em um determinado contexto temporal.

Chave composta:

- id_municipio
- id_contexto

### fato_geografia

Um registro representa:

> Uma região geográfica em um determinado contexto temporal.

Chave composta:

- id_geografia
- id_contexto

---

## Medidas Analisadas

O modelo permite calcular indicadores como:

- Total de admissões
- Total de desligamentos
- Saldo de empregos
- Evolução temporal
- Comparação entre municípios
- Comparação entre estados e regiões

As medidas analíticas foram desenvolvidas em DAX no Power BI.

---

## Objetivo da Modelagem

A estrutura foi projetada para:

- reduzir redundância de dados;
- facilitar a criação de medidas DAX;
- melhorar o desempenho das consultas;
- permitir análises em diferentes níveis geográficos;
- manter uma dimensão temporal compartilhada entre as tabelas fato.

---

## Tecnologias Utilizadas

- Power BI Desktop
- Power Query
- DAX
- SQL Server (DDL da modelagem dimensional)
- Git e GitHub

---

## Tipo de Modelo

Este projeto utiliza uma **Constelação de Fatos (Fact Constellation)**, composta por duas tabelas fato independentes que compartilham uma dimensão temporal comum.

Essa abordagem permite reutilizar dimensões e realizar análises distintas sem criar relacionamentos entre tabelas fato, seguindo boas práticas de modelagem dimensional.
