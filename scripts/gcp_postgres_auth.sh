#!/bin/bash

# Este script atualiza as "Redes Autorizadas" do seu banco PostgreSQL (oute-postgres)
# no projeto oute-main com o IP atual da máquina do MindsDB.

echo "🔍 Buscando o IP atual do MindsDB..."

NOVO_IP=$(gcloud compute instances describe mindsdb \
    --project=oute-mind \
    --zone=us-central1-c \
    --format='get(networkInterfaces[0].accessConfigs[0].natIP)')

if [ -z "$NOVO_IP" ]; then
    echo "❌ Erro: Não foi possível obter o IP. A máquina do MindsDB está ligada?"
    exit 1
fi

echo "✅ IP do MindsDB: $NOVO_IP"
echo "⏳ Autorizando este IP no banco de dados oute-postgres (oute-main)..."
echo "Aviso: Isso pode demorar 1 a 2 minutos no Google Cloud."

# Atenção: O parâmetro --authorized-networks substitui a lista inteira.
# Estamos nomeando essa regra como 'mindsdb' para facilitar se você precisar ver no painel.
gcloud sql instances patch oute-postgres \
    --project=oute-main \
    --authorized-networks="${NOVO_IP}/32"

echo "🎉 Pronto! O IP $NOVO_IP foi liberado e o MindsDB já pode acessar o Postgres Oute."
