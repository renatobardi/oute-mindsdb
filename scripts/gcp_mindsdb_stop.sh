#!/bin/bash

# Este script DESLIGA a VM do MindsDB no GCP (oute-mind) para não gerar cobranças.
# Ele NÃO deleta os dados (o disco continua existindo e terá um custo mínimo mensal por armazenamento).

echo "🛑 Desligando a infraestrutura do MindsDB no GCP (Projeto: oute-mind)..."

gcloud compute instances stop mindsdb \
    --project=oute-mind \
    --zone=us-central1-c

echo "✅ A máquina virtual do MindsDB está desligada e não consumirá mais CPU/RAM."
