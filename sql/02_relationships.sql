-- ==========================================
-- RELACIONAMENTOS DO MODELO ESTRELA
-- PROJETO mercado-de-trabalho-caged-powerbi
-- ==========================================

ALTER TABLE fato_municipio
ADD CONSTRAINT fk_fato_municipio_dim_municipio
FOREIGN KEY (id_municipio)
REFERENCES dim_municipio(id_municipio);

ALTER TABLE fato_municipio
ADD CONSTRAINT fk_fato_municipio_dim_contexto
FOREIGN KEY (id_contexto)
REFERENCES dim_contexto(id_contexto);

ALTER TABLE fato_geografia
ADD CONSTRAINT fk_fato_geografia_dim_geografia
FOREIGN KEY (id_geografia)
REFERENCES dim_geografia(id_geografia);

ALTER TABLE fato_geografia
ADD CONSTRAINT fk_fato_geografia_dim_contexto
FOREIGN KEY (id_contexto)
REFERENCES dim_contexto(id_contexto);
