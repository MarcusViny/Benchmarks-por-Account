```mermaid
erDiagram
    Account ||--o{ AccountBenchmark : relaciona
    Benchmark ||--o{ AccountBenchmark : relaciona
    Benchmark ||--o{ Controle : possui
    Controle ||--o{ ControleHistorico : registra
    Account ||--o{ ControleHistorico : registra

