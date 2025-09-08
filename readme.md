## Diagrama ER

```mermaid
%%{init: {'theme': 'forest'}}%%
erDiagram
    ACCOUNT {
        int id PK "ID do usuário"
        string name "Nome do usuário"
        datetime createdAt
        datetime deletedAt
    }
    BENCHMARK {
        int id PK "ID do benchmark"
        string name "Nome do benchmark"
        datetime createdAt
        datetime deletedAt
    }
    ACCOUNT_BENCHMARK {
        int account_id FK "FK para Account.id"
        int benchmark_id FK "FK para Benchmark.id"
        datetime createdAt
        datetime deletedAt
    }
    CONTROLE {
        int id PK "ID do controle"
        int benchmark_id FK "FK para Benchmark.id"
        string name
        string description
        string state_atual "Estado atual (ok | alarm)"
        datetime createdAt
        datetime deletedAt
    }
    CONTROLE_HISTORICO {
        int id PK
        int controle_id FK "FK para Controle.id"
        int account_id FK "FK para Account.id"
        string state "ok | alarm"
        datetime timestamp
        datetime createdAt
        datetime deletedAt
    }
    ACCOUNT ||--o{ ACCOUNT_BENCHMARK : possui
    BENCHMARK ||--o{ ACCOUNT_BENCHMARK : é_acompanhado_por
    BENCHMARK ||--o{ CONTROLE : possui
    CONTROLE ||--o{ CONTROLE_HISTORICO : registra_alteracoes
    ACCOUNT ||--o{ CONTROLE_HISTORICO : realiza_alteracoes
