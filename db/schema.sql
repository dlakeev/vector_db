CREATE EXTENSION IF NOT EXISTS vector;

CREATE TABLE IF NOT EXISTS vectors_w_index_16_64 (
    id TEXT PRIMARY KEY,
    embedding VECTOR(1024)
);

CREATE INDEX IF NOT EXISTS hnsw_vector_index ON vectors_w_index_16_64 USING hnsw (embedding vector_ip_ops) WITH (m = 16, ef_construction = 64);

-- CREATE TABLE IF NOT EXISTS vectors_wot_index (
--     id TEXT PRIMARY KEY,
--     embedding VECTOR(1024)
-- );