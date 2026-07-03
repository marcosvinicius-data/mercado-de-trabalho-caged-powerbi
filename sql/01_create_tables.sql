-- ====================================================================
-- SCRIPT DDL: Criação do Schema e Dicionário Embutido (Transact-SQL) - (Modelo Constelação de Estrelas)
-- PORTFOLIO: PROJETO mercado-de-trabalho-caged-powerbi (SQL Server)
-- ====================================================================


-- 1. Criando Dimensão Contexto
CREATE TABLE dim_contexto (
    id_contexto INT PRIMARY KEY,
    descricao VARCHAR(50) NOT NULL,
    tipo VARCHAR(20) NOT NULL,
    data_inicio DATE NOT NULL
);

-- Documentação da dim_contexto
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'Tabela de dimensão para cenários temporais e contextos analíticos', @level0type = N'SCHEMA', @level0name = 'dbo', @level1type = N'TABLE', @level1name = 'dim_contexto';
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'Identificador único do contexto (Chave Primária)', @level0type = N'SCHEMA', @level0name = 'dbo', @level1type = N'TABLE', @level1name = 'dim_contexto', @level2type = N'COLUMN', @level2name = 'id_contexto';
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'Descrição do período (ex: 2023, Nov/2023)', @level0type = N'SCHEMA', @level0name = 'dbo', @level1type = N'TABLE', @level1name = 'dim_contexto', @level2type = N'COLUMN', @level2name = 'descricao';
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'Tipo de agrupamento (ANO, MÊS, INTERVALO)', @level0type = N'SCHEMA', @level0name = 'dbo', @level1type = N'TABLE', @level1name = 'dim_contexto', @level2type = N'COLUMN', @level2name = 'tipo';
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'Data inicial do período de referência', @level0type = N'SCHEMA', @level0name = 'dbo', @level1type = N'TABLE', @level1name = 'dim_contexto', @level2type = N'COLUMN', @level2name = 'data_inicio';


-- 2. Criando Dimensão Município
CREATE TABLE dim_municipio (
    id_municipio INT PRIMARY KEY,
    municipio VARCHAR(150) NOT NULL,
    uf VARCHAR(2) NOT NULL
);

-- Documentação da dim_municipio
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'Tabela de dimensão com o cadastro geográfico por município', @level0type = N'SCHEMA', @level0name = 'dbo', @level1type = N'TABLE', @level1name = 'dim_municipio';
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'Identificador único do município (Chave Primária - Código IBGE)', @level0type = N'SCHEMA', @level0name = 'dbo', @level1type = N'TABLE', @level1name = 'dim_municipio', @level2type = N'COLUMN', @level2name = 'id_municipio';
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'Nome oficial do município', @level0type = N'SCHEMA', @level0name = 'dbo', @level1type = N'TABLE', @level1name = 'dim_municipio', @level2type = N'COLUMN', @level2name = 'municipio';
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'Unidade federativa (sigla do estado)', @level0type = N'SCHEMA', @level0name = 'dbo', @level1type = N'TABLE', @level1name = 'dim_municipio', @level2type = N'COLUMN', @level2name = 'uf';


-- 3. Criando Dimensão Geografia
CREATE TABLE dim_geografia (
    id_geografia INT PRIMARY KEY,
    regiao VARCHAR(50) NOT NULL,
    estado VARCHAR(50) NOT NULL
);

-- Documentação da dim_geografia
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'Tabela de dimensão para agrupamentos macro-geográficos estaduais', @level0type = N'SCHEMA', @level0name = 'dbo', @level1type = N'TABLE', @level1name = 'dim_geografia';
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'Identificador da região geográfica (Chave Primária)', @level0type = N'SCHEMA', @level0name = 'dbo', @level1type = N'TABLE', @level1name = 'dim_geografia', @level2type = N'COLUMN', @level2name = 'id_geografia';
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'Região macro (ex: Sudeste, Sul)', @level0type = N'SCHEMA', @level0name = 'dbo', @level1type = N'TABLE', @level1name = 'dim_geografia', @level2type = N'COLUMN', @level2name = 'regiao';
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'Nome por extenso do estado associado', @level0type = N'SCHEMA', @level0name = 'dbo', @level1type = N'TABLE', @level1name = 'dim_geografia', @level2type = N'COLUMN', @level2name = 'estado';


-- 4. Criando Tabela Fato Município
CREATE TABLE fato_municipio (
    id_municipio INT NOT NULL,
    id_contexto INT NOT NULL,
    admissoes INT NOT NULL DEFAULT 0,
    desligamentos INT NOT NULL DEFAULT 0,
    saldo INT NOT NULL DEFAULT 0,
    PRIMARY KEY (id_municipio, id_contexto),
    FOREIGN KEY (id_municipio) REFERENCES dim_municipio(id_municipio),
    FOREIGN KEY (id_contexto) REFERENCES dim_contexto(id_contexto)
);

-- Documentação da fato_municipio
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'Tabela fato com registros de movimentação de trabalho no grão de município', @level0type = N'SCHEMA', @level0name = 'dbo', @level1type = N'TABLE', @level1name = 'fato_municipio';
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'Métrica calculada: Diferença entre admissões e desligamentos', @level0type = N'SCHEMA', @level0name = 'dbo', @level1type = N'TABLE', @level1name = 'fato_municipio', @level2type = N'COLUMN', @level2name = 'saldo';


-- 5. Criando Tabela Fato Geografia
CREATE TABLE fato_geografia (
    id_geografia INT NOT NULL,
    id_contexto INT NOT NULL,
    admissoes INT NOT NULL DEFAULT 0,
    desligamentos INT NOT NULL DEFAULT 0,
    saldo INT NOT NULL DEFAULT 0,
    PRIMARY KEY (id_geografia, id_contexto),
    FOREIGN KEY (id_geografia) REFERENCES dim_geografia(id_geografia),
    FOREIGN KEY (id_contexto) REFERENCES dim_contexto(id_contexto)
);

-- Documentação da fato_geografia
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'Tabela fato com registros consolidados de movimentação no grão regional/estadual', @level0type = N'SCHEMA', @level0name = 'dbo', @level1type = N'TABLE', @level1name = 'fato_geografia';
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'Resultado líquido do emprego (Métrica de Saldo)', @level0type = N'SCHEMA', @level0name = 'dbo', @level1type = N'TABLE', @level1name = 'fato_geografia', @level2type = N'COLUMN', @level2name = 'saldo';
