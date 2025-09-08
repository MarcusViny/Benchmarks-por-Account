### Q1 – Listar Benchmark com seus Controles e o estado atual para uma Account

- Aqui eu iria pegar os nomes fazer um select pelo name da conta, name do benchmark, name do controle e o status atual colocaria um from para account para a exemplificar e iria passar na tabela fznd um join de account_benchmark passando por id e tbm na benchmark e controle ONDE a conta fosse igual o id desejado ou name prefiro id mais eficaz 

SELECT 
    a.name AS account,
    b.name AS benchmark,
    c.name AS controle,
    c.state_atual
FROM Account a
JOIN Account_Benchmark ab ON ab.account_id = a.id
JOIN Benchmark b ON b.id = ab.benchmark_id
JOIN Controle c ON c.benchmark_id = b.id
WHERE a.id = 1; -- 🔹 Troque pelo ID da conta que quer consultar



### Q2 – Listar Benchmark com seus Controles e as mudanças de estado em um intervalo para uma Account

- Iria passar pelas tabelas account_benchmark, benchmark,controle,controle_historico ONDE a acount fosse igual o id desejado ou name, onde o tempo fosse por volta ali do dia 01 -09 a 08-09 e faria um order by pelo tempo

SELECT 
    a.name AS account,
    b.name AS benchmark,
    c.name AS controle,
    h.state,
    h.timestamp
FROM Account a
JOIN Account_Benchmark ab ON ab.account_id = a.id
JOIN Benchmark b ON b.id = ab.benchmark_id
JOIN Controle c ON c.benchmark_id = b.id
JOIN Controle_Historico h ON h.controle_id = c.id
WHERE a.id = 1  -- 🔹 Troque pelo ID da conta
AND h.timestamp BETWEEN '2025-09-01' AND '2025-09-08'
ORDER BY h.timestamp;


### Q3 – Obter Benchmark com seus Controles e o estado em uma data/hora X (snapshot)

- Aqui eu iria fazer o mesmo caminho de joins passando por account_Benchmark, Benchmark e Controle.
Mas, para o Controle_Historico, eu pegaria apenas o último estado registrado antes da data/hora  desejada, usando uma subconsulta ou um JOIN com max(timestamp).
Isso vendo o estado válido naquele momento (snapshot).


SELECT 
    a.name AS account,
    b.name AS benchmark,
    c.name AS controle,
    h.state,
    h.timestamp
FROM Account a
JOIN Account_Benchmark ab ON ab.account_id = a.id
JOIN Benchmark b ON b.id = ab.benchmark_id
JOIN Controle c ON c.benchmark_id = b.id
JOIN Controle_Historico h ON h.id = (
    SELECT h2.id
    FROM Controle_Historico h2
    WHERE h2.controle_id = c.id
    AND h2.timestamp <= '2025-09-05 10:00:00' -- 🔹 Data/hora do snapshot
    ORDER BY h2.timestamp DESC
    LIMIT 1
)
WHERE a.id = 1; -- 🔹 Troque pelo ID da conta

