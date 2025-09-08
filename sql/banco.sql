-- Tabelas principais
CREATE TABLE ACCOUNT (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    createdAt TIMESTAMP DEFAULT NOW(),
    deletedAt TIMESTAMP
);

CREATE TABLE BENCHMARK (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    createdAt TIMESTAMP DEFAULT NOW(),
    deletedAt TIMESTAMP
);

CREATE TABLE ACCOUNT_BENCHMARK (
    account_id INT REFERENCES ACCOUNT(id),
    benchmark_id INT REFERENCES BENCHMARK(id),
    createdAt TIMESTAMP DEFAULT NOW(),
    deletedAt TIMESTAMP
);

CREATE TABLE control (
    id SERIAL PRIMARY KEY,
    benchmark_id INT REFERENCES BENCHMARK(id),
    name VARCHAR(100),
    description TEXT,
    state_atual VARCHAR(10),
    createdAt TIMESTAMP DEFAULT NOW(),
    deletedAt TIMESTAMP
);

CREATE TABLE control_HISTORICO (
    id SERIAL PRIMARY KEY,
    control_id INT REFERENCES control(id),
    account_id INT REFERENCES ACCOUNT(id),
    state VARCHAR(10),
    timestamp TIMESTAMP,
    createdAt TIMESTAMP DEFAULT NOW(),
    deletedAt TIMESTAMP
);
