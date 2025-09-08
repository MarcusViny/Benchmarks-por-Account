```mermaid
erDiagram
    ACCOUNT {
        id
        name
    }

    BENCHMARK {
        id
        name
    }

    ACCOUNT_BENCHMARK {
        account_id
        benchmark_id
    }

    CONTROLE {
        id
        name
        description
        state
        benchmark_id
    }

    CONTROLE_HISTORICO {
        id
        account_id
        controle_id
        state
        timestamp
    }

    ACCOUNT ||--o{ ACCOUNT_BENCHMARK : relaciona
    BENCHMARK ||--o{ ACCOUNT_BENCHMARK : relaciona
    BENCHMARK ||--o{ CONTROLE : possui
    CONTROLE ||--o{ CONTROLE_HISTORICO : registra
    ACCOUNT ||--o{ CONTROLE_HISTORICO : registra
