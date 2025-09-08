## Atributos das Tabelas

### Account
- id (PK)
- name

### Benchmark
- id (PK)
- name

### AccountBenchmark
- accountId (FK → Account.id)
- benchmarkId (FK → Benchmark.id)

### Controle
- id (PK)
- name
- description
- state (ok | alarm)
- benchmarkId (FK → Benchmark.id)

### ControleHistorico
- id (PK)
- accountId (FK → Account.id)
- controleId (FK → Controle.id)
- state
- timestamp (datetime)

---

## Q1 — Estado atual por Account
Listar Benchmark com seus Controles e o estado atual para uma Account

**Índices recomendados:**
- `account_benchmark(accountId)` → busca eficaz dos benchmarks da account
- `controle(benchmarkId)` → todos os controles de cada benchmark
- `controle_historico(accountId, controleId, timestamp DESC)` → obter o último estado de cada controle

---

## Q2 — Histórico em intervalo
Listar Benchmark com seus Controles e mudanças de estado por uma Account (filtro pelo usuário)

**Índices recomendados:**
- `controle_historico(accountId, timestamp)` ou `(accountId, controleId, timestamp)` → filtra por account e intervalo de tempo

---

## Q3 — Snapshot em data/hora X
Obter Benchmark com seus Controles e o estado em uma data/hora X para uma Account

**Índices recomendados:**
- `controle_historico(accountId, controleId, timestamp)` → busca o último registro ≤ data/hora X para cada controle
