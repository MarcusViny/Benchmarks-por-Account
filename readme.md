### Benchmarks por Account – Teste Rápido
## Pré-requisitos

### Docker e Docker Compose

1. Subir o ambiente
    docker compose up -d --build
- Isso cria o banco benchmarks já populado com contas, benchmarks, controles e histórico.

2. Acessar o PostgreSQL
    docker exec -it benchmarks-db psql -U user -d benchmarks

3. Executar os teste 
    (
    Q1 = 
    SELECT a.name AS account, b.name AS benchmark, c.name AS controle, c.state_atual
        FROM Account a
        JOIN Account_Benchmark ab ON ab.account_id = a.id
        JOIN Benchmark b ON b.id = ab.benchmark_id
        JOIN Controle c ON c.benchmark_id = b.id
        WHERE a.id = 1;

    Q2 =
    SELECT a.name AS account, b.name AS benchmark, c.name AS controle, h.state,timestamp
        FROM Account a
        JOIN Account_Benchmark ab ON ab.account_id = a.id
        JOIN Benchmark b ON b.id = ab.benchmark_id
        JOIN Controle c ON c.benchmark_id = b.id
        JOIN Controle_Historico h ON h.controle_id = c.id
        WHERE a.id = 1
        AND h.timestamp BETWEEN '2025-09-01' AND '2025-09-08'
        ORDER BY h.timestamp;

    Q3 = 
    SELECT a.name AS account, b.name AS benchmark, c.name AS controle, h.state,timestamp
        FROM Account a
        JOIN Account_Benchmark ab ON ab.account_id = a.id
        JOIN Benchmark b ON b.id = ab.benchmark_id
        JOIN Controle c ON c.benchmark_id = b.id
        JOIN Controle_Historico h ON h.id = (
            SELECT h2.id
            FROM Controle_Historico h2
            WHERE h2.controle_id = c.id
            AND h2.timestamp <= '2025-09-05 10:00:00'
            ORDER BY h2.timestamp DESC
            LIMIT 1
        )
            WHERE a.id = 1;)

4. Parar o ambiente
    docker compose down