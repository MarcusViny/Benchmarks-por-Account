```mermaid
erDiagram
    Account {
        id
        name
    }

    Benchmark {
        id
        name
    }

    AccountBenchmark {
        accountId
        benchmarkId
    }

    Controle {
        id
        name
        description
        state
        benchmarkId
    }

    ControleHistorico {
        id
        accountId
        controleId
        state
        timestamp
    }

    Account ||--o{ AccountBenchmark : relaciona
    Benchmark ||--o{ AccountBenchmark : relaciona
    Benchmark ||--o{ Controle : possui
    Controle ||--o{ ControleHistorico : registra
    Account ||--o{ ControleHistorico : registra
