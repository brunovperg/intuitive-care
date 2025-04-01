const express = require('express');
const fs = require('fs');
const csvParser = require('csv-parser');
const bodyParser = require('body-parser');

const app = express();
const PORT = 3000;

app.use(bodyParser.json());

let operadoras = [];

// Carregar dados do CSV na memória
fs.createReadStream('./Relatorio_cadop.csv')
	.pipe(csvParser({ separator: ';' }))
	.on('data', (row) => {
		operadoras.push(row);
	})
	.on('end', () => {
		console.log('Dados do CSV carregados com sucesso.');
	});

// Rota de busca textual
app.get('/operadoras', (req, res) => {
	const { query } = req.query;

	if (!query) {
		return res
			.status(400)
			.json({ error: 'O parâmetro "query" é obrigatório.' });
	}

	// Filtrar operadoras com base na busca textual
	const resultados = operadoras.filter((operadora) =>
		Object.values(operadora).some((campo) =>
			campo.toLowerCase().includes(query.toLowerCase())
		)
	);

	res.json(resultados);
});

// Iniciar o servidor
app.listen(PORT, () => {
	console.log(`Servidor rodando em http://localhost:${PORT}`);
});
