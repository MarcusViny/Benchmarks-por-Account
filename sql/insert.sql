INSERT INTO ACCOUNT (name) VALUES 
('Conta Marcus'), 
('Conta Vinycius'),
('Conta João');

INSERT INTO BENCHMARK (name) VALUES 
('Benchmark 1'), 
('Benchmark 2'),
('Benchmark 3'),
('Benchmark 4'),
('Benchmark 5');

INSERT INTO ACCOUNT_BENCHMARK (account_id, benchmark_id) VALUES
(1, 1), 
(1, 2),
(2, 1),
(3, 3),
(3, 4),
(3, 5);

INSERT INTO CONTROLE (benchmark_id, name, description, state_atual) VALUES
(1, 'Controle 1', 'Verifica X', 'ok'),
(1, 'Controle 2', 'Verifica Y', 'alarm'),
(2, 'Controle 3', 'Verifica Z', 'ok'),
(3, 'Controle 4', 'Verifica A', 'ok'),
(4, 'Controle 5', 'Verifica B', 'alarm'),
(5, 'Controle 6', 'Verifica C', 'ok');

INSERT INTO CONTROLE_HISTORICO (controle_id, account_id, state, timestamp) VALUES
(1, 1, 'alarm', '2025-09-01 10:00:00'),
(1, 1, 'ok',    '2025-09-02 09:00:00'),
(2, 1, 'ok',    '2025-09-01 10:05:00'),
(2, 1, 'alarm', '2025-09-01 12:00:00'),
(2, 1, 'ok',    '2025-09-03 14:00:00'),
(3, 1, 'ok',    '2025-09-01 11:00:00'),
(1, 2, 'ok',    '2025-09-01 10:00:00'),
(2, 2, 'alarm', '2025-09-01 10:00:00'),
(3, 2, 'ok',    '2025-09-01 11:00:00'),
(4, 3, 'ok', '2025-09-01 09:00:00'),
(5, 3, 'alarm', '2025-09-01 10:00:00'),
(6, 3, 'ok', '2025-09-02 12:00:00');

