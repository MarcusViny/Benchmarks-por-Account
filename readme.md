```mermaid
erDiagram
    ACCOUNT {
        int id PK
        string name
    }

    BENCHMARK {
        int id PK
        string name
    }

    ACCOUNT_BENCHMARK {
        int account_id PK, FK
        int benchmark_id PK, FK
    }

    CONTROLE {
        int id PK
        string name
        string description
        enum state  // ok | alarm
        int benchmark_id FK
    }

    CONTROLE_HISTORICO {
        int id PK
        int account_id FK
        int controle_id FK
        enum state
        datetime timestamp
    }

    ACCOUNT ||--o{ ACCOUNT_BENCHMARK : relaciona
    BENCHMARK ||--o{ ACCOUNT_BENCHMARK : relaciona
    BENCHMARK ||--o{ CONTROLE : possui
    CONTROLE ||--o{ CONTROLE_HISTORICO : registra
    ACCOUNT ||--o{ CONTROLE_HISTORICO : registra
