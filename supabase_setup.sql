-- Векторное расширение
create extension if not exists vector;

-- Таблица статей
create table if not exists arxiv_articles (
  id uuid primary key default gen_random_uuid(),
  arxiv_id text unique not null,
  title text,
  authors text,
  abstract text,
  summary text,
  url text,
  published_date date,
  keywords text[],
  created_at timestamptz default now()
);

create index if not exists idx_arxiv_id on arxiv_articles(arxiv_id);
create index if not exists idx_published on arxiv_articles(published_date desc);

-- Таблица векторного хранилища (LangChain формат)
create table if not exists documents (
  id uuid primary key default gen_random_uuid(),
  content text,
  metadata jsonb,
  embedding vector(1536)
);

create index if not exists idx_documents_embedding
  on documents using ivfflat (embedding vector_cosine_ops) with (lists = 100);

-- Функция поиска, которую использует LangChain Supabase Vector Store
drop function if exists match_documents(vector, int, jsonb);

create or replace function match_documents (
  query_embedding vector(1536),
  match_count int default null,
  filter jsonb default '{}'
) returns table (
  id uuid,
  content text,
  metadata jsonb,
  similarity float
)
language plpgsql as $$
#variable_conflict use_column
begin
  return query
  select
    id,
    content,
    metadata,
    1 - (documents.embedding <=> query_embedding) as similarity
  from documents
  where metadata @> filter
  order by documents.embedding <=> query_embedding
  limit match_count;
end;
$$;
