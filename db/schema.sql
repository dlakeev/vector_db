CREATE EXTENSION IF NOT EXISTS vector;

CREATE TABLE IF NOT EXISTS vectors (
    id TEXT PRIMARY KEY,
    embedding VECTOR(1024)
);

CREATE INDEX IF NOT EXISTS vectors_hnsw_index 
ON vectors USING hnsw (embedding vector_cosine_ops) 
WITH (m = 32, ef_construction = 64);
