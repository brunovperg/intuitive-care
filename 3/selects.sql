-- Select para consultar as 10 operadoras com mais despesas na categoria ""EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS DE ASSISTÊNCIA A SAÚDE MEDICO HOSPITALAR"" no ano de 2024

SELECT
    dc.registro_ans,
    oa.razao_social AS razao_social,
    SUM(
        dc.vl_saldo_inicial - dc.vl_saldo_final
    ) AS total_despesas
FROM
    demonstracoes_contabeis dc
    JOIN operadoras_ativas oa ON dc.registro_ans = oa.registro_ans
WHERE
    dc.descricao LIKE "%EVENTO%"
    AND dc.descricao LIKE "%SINISTRO%"
    AND dc.descricao LIKE "%SAUDE%"
    AND dc.descricao LIKE "%MEDICO%"
    AND dc.ano = 2024
    AND dc.trimestre_demonstracao = '4T' --Consultar apenas no último trimestre / remover essa linha para obter o resultado do último ano completo
    AND (
        dc.vl_saldo_final != 0
        OR dc.vl_saldo_inicial != 0
    )
GROUP BY
    dc.registro_ans,
    oa.razao_social
ORDER BY total_despesas DESC
LIMIT 10;