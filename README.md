# n8n Automations

A collection of n8n workflows for AI-powered research monitoring and document RAG pipelines.

---

## Workflows

### 1. arXiv Monitor — AI Research Tracker
**File:** `workflow_1_arxiv_monitor.json`

Automatically monitors arXiv daily for new papers on a given topic (e.g., gout prediction with ML). Summarizes each paper and stores embeddings in Supabase for later retrieval.

- Runs daily at 08:00
- Fetches up to 15 new papers per run
- Generates summaries via OpenAI
- Stores vectors in Supabase (`arxiv_articles` table)

---

### 2. RAG Chatbot — Q&A over Accumulated Papers
**File:** `workflow_2_qa_chat.json`

Chat assistant with full RAG over the arXiv paper database. Ask questions about the literature and get answers grounded in real papers.

- Retrieves relevant chunks via vector search
- Answers questions with source context via OpenAI
- Activate Chat Trigger URL to open the chat interface

**Setup:** See `supabase_setup.sql` for DB schema and vector search function.

---

### 3. RAG Pipeline — Nextcloud Document Sync
**File:** `rag_1-nextcloud.json`

Syncs documents from Nextcloud into a vector database for RAG queries. Chunks, embeds, and indexes files automatically on upload.

---

### 4. RAG Pipeline — Google Drive Document Sync
**File:** `rag_1_google drive.json`

Same as above but sources documents from Google Drive. Watches a folder and re-indexes on change.

---

### 5. RAG Query Pipeline
**File:** `rag_2.json`

Query workflow for the document RAG pipelines above. Takes a user question, retrieves relevant chunks, and returns a grounded answer.

---

## Setup

### Prerequisites
- [n8n](https://n8n.io) (self-hosted or cloud)
- [Supabase](https://supabase.com) project (free tier works)
- OpenAI API key

### 1. Supabase
Create a project on [supabase.com](https://supabase.com). Run `supabase_setup.sql` in the SQL Editor.

Copy from **Settings → API**:
- Project URL
- `service_role` key (for n8n credential)
- `anon public` key

### 2. n8n Credentials

| Name | Type | Value |
|------|------|-------|
| `OpenAI account` | OpenAI | Your API key |
| `Supabase account` | Supabase | Host URL + service_role key |

### 3. Import Workflows
In n8n → **Workflows → Import from File** → select the JSON.
Attach credentials to Supabase, OpenAI Chat Model, and OpenAI Embeddings nodes.

### 4. Activate
- Toggle on **Workflow 1** — runs daily at 08:00
- Toggle on **Workflow 2** — open Chat URL from the Chat Trigger node

---

## Customization

- Change `max_results` in Workflow 1 to fetch more papers per run
- Swap the Schedule trigger from daily to weekly
- Replace the `/tmp/` file save node with Google Drive / Telegram / Email
