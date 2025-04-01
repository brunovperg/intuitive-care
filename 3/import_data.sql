-- Importar os dados dos arquivos CSV para as tabelas do banco de dados

-- Importar dados para a tabela operadoras_ativas
-- O caminho do arquivo CSV deve ser absoluto e o MySQL deve ter permissão para acessar esse caminho
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Relatorio_cadop.csv' INTO
TABLE operadoras_ativas FIELDS TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 ROWS (
    registro_ans,
    cnpj,
    razao_social,
    nome_fantasia,
    modalidade,
    logradouro,
    numero,
    complemento,
    bairro,
    cidade,
    uf,
    cep,
    ddd,
    telefone,
    fax,
    email,
    representante,
    cargo_representante,
    regiao_de_comercializacao,
    @data_registro
)
SET
    data_registro = STR_TO_DATE(@data_registro, '%Y-%m-%d');
;

-- Importar dados para a tabela demonstracoes_contabeis
-- O caminho do arquivo CSV deve ser absoluto e o MySQL deve ter permissão para acessar esse caminho
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/1T2023.csv' INTO
TABLE demonstracoes_contabeis FIELDS TERMINATED BY ';' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS (
    data,
    registro_ans,
    cd_conta_contabil,
    descricao,
    @vl_saldo_inicial,
    @vl_saldo_final
)
SET
    vl_saldo_inicial =
REPLACE (@vl_saldo_inicial, ',', '.'),
    vl_saldo_final =
REPLACE (@vl_saldo_final, ',', '.'),
    ano = 2023,
    trimestre_demonstracao = '1T';

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/2T2023.csv' INTO
TABLE demonstracoes_contabeis FIELDS TERMINATED BY ';' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS (
    data,
    registro_ans,
    cd_conta_contabil,
    descricao,
    @vl_saldo_inicial,
    @vl_saldo_final
)
SET
    vl_saldo_inicial =
REPLACE (@vl_saldo_inicial, ',', '.'),
    vl_saldo_final =
REPLACE (@vl_saldo_final, ',', '.'),
    ano = 2023,
    trimestre_demonstracao = '2T';

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/3T2023.csv' INTO
TABLE demonstracoes_contabeis FIELDS TERMINATED BY ';' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS (
    data,
    registro_ans,
    cd_conta_contabil,
    descricao,
    @vl_saldo_inicial,
    @vl_saldo_final
)
SET
    vl_saldo_inicial =
REPLACE (@vl_saldo_inicial, ',', '.'),
    vl_saldo_final =
REPLACE (@vl_saldo_final, ',', '.'),
    ano = 2023,
    trimestre_demonstracao = '3T';

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/4T2023.csv' INTO
TABLE demonstracoes_contabeis FIELDS TERMINATED BY ';' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS (
    @data,
    registro_ans,
    cd_conta_contabil,
    descricao,
    @vl_saldo_inicial,
    @vl_saldo_final
)
SET
    data = STR_TO_DATE(@data, '%d/%m/%Y'),
    vl_saldo_inicial =
REPLACE (@vl_saldo_inicial, ',', '.'),
    vl_saldo_final =
REPLACE (@vl_saldo_final, ',', '.'),
    ano = 2023,
    trimestre_demonstracao = '4T';

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/1T2024.csv' INTO
TABLE demonstracoes_contabeis FIELDS TERMINATED BY ';' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS (
    data,
    registro_ans,
    cd_conta_contabil,
    descricao,
    @vl_saldo_inicial,
    @vl_saldo_final
)
SET
    vl_saldo_inicial =
REPLACE (@vl_saldo_inicial, ',', '.'),
    vl_saldo_final =
REPLACE (@vl_saldo_final, ',', '.'),
    ano = 2024,
    trimestre_demonstracao = '1T';

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/2T2024.csv' INTO
TABLE demonstracoes_contabeis FIELDS TERMINATED BY ';' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS (
    data,
    registro_ans,
    cd_conta_contabil,
    descricao,
    @vl_saldo_inicial,
    @vl_saldo_final
)
SET
    vl_saldo_inicial =
REPLACE (@vl_saldo_inicial, ',', '.'),
    vl_saldo_final =
REPLACE (@vl_saldo_final, ',', '.'),
    ano = 2024,
    trimestre_demonstracao = '2T';

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/3T2024.csv' INTO
TABLE demonstracoes_contabeis FIELDS TERMINATED BY ';' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS (
    data,
    registro_ans,
    cd_conta_contabil,
    descricao,
    @vl_saldo_inicial,
    @vl_saldo_final
)
SET
    vl_saldo_inicial =
REPLACE (@vl_saldo_inicial, ',', '.'),
    vl_saldo_final =
REPLACE (@vl_saldo_final, ',', '.'),
    ano = 2024,
    trimestre_demonstracao = '3T';

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/4T2024.csv' INTO
TABLE demonstracoes_contabeis FIELDS TERMINATED BY ';' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS (
    data,
    registro_ans,
    cd_conta_contabil,
    descricao,
    @vl_saldo_inicial,
    @vl_saldo_final
)
SET
    vl_saldo_inicial =
REPLACE (@vl_saldo_inicial, ',', '.'),
    vl_saldo_final =
REPLACE (@vl_saldo_final, ',', '.'),
    ano = 2024,
    trimestre_demonstracao = '4T';