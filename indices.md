
### Primeiro, eu criei um banco de dados para armazenar os dados que foram solicitados.
## O que eu fiz:
- Account:

    Armazena id e name dos usuários.
    Possui campos de criação (create) e inativação (delete) — lembrando que inativar não deleta do banco.


- Benchmark:

    Armazena id e name de um serviço.
    Também possui create e delete.


- Account_Benchmark (FK):

    Tabela de junção N:M, porque um account pode ter vários benchmarks e um benchmark pode ter vários accounts.
    Tem create e delete.


- Controle:

    Armazena id, name, descrição, benchmark_id e estado (ok ou alarm).
    Tem create e delete.


- Controle_Historico:

    Para registrar mudanças no controle.
    Campos: id, controle_id, account_id (quem realizou a mudança), state (Qual estado esta) e timestamp (quando foi realizada).Tem create e delete.



### Ideias para evoluir o banco e monitoramento:
- Criar um controle de produto, para registrar o valor ao longo do tempo, permitindo comparativos e analisar se subiu ou desceu.


- Criar um monitoramento de consumo, para acompanhar se o produto está sendo pesquisado ou requisitado mais ou menos se tá havendo muita saída dele.


- Captar dados dos clientes e criar uma base sobre o que eles pesquisam no site.
Isso permitiria fazer ofertas quando o preço estiver mais baixo ou relacionado a algum interesse detectado.

- Esses dados poderiam ser usados depois para gerar gráficos e análises de forma mais eficaz.

